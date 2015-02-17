
import ui, urhomain, processutils, color, urstr, stringHash, variant, text,
  uielement, octree, staticmodel, renderer, component, urhomain,
  resourcecache, scene, node, vector3, quaternion, model, material, light,
  camera, view, input, inputevents, controls, urobject, logiccomponent, context,
  memorybuffer, deserializer, rigidbody, animationcontroller, physicsworld,
  zone, boundingbox, drawable, collisionshape, animatedModel, skeleton, ptrs,
  unsigned, graphics, file, filesystem, ray, skybox, terrain, image, xmlelement,
  engine

import sample

import hashmap except Node
from math import random
from os import getAppDir, `/`

# enable auto-deref:
{.experimental.}

const
  CTRL_FORWARD: cuint = 1
  CTRL_BACK: cuint = 2
  CTRL_LEFT: cuint = 4
  CTRL_RIGHT: cuint = 8
  CTRL_JUMP: cuint = 16

  MOVE_FORCE = 0.8f32
  INAIR_MOVE_FORCE = 0.02f32
  BRAKE_FORCE = 0.2f32
  JUMP_FORCE = 7.0f32
  YAW_SENSITIVITY = 0.1f32
  INAIR_THRESHOLD_TIME = 0.1f32

  TOUCH_SENSITIVITY = 2.0f32

  CAMERA_MIN_DIST = 5.0f32
  CAMERA_INITIAL_DIST = 5.0f32
  CAMERA_MAX_DIST = 20.0f32

{.emit: """
using namespace Urho3D;
class Character : public LogicComponent
{
  OBJECT(Character)

public:
  /// Construct.
  Character(Context* context) : LogicComponent(context),
        onGround(false),
        okToJump(true),
        inAirTimer(0.0f)
  {
    SetUpdateEventMask(USE_FIXEDUPDATE);
  }

  /// Register object factory and attributes.
  static void RegisterObject(Context* context) {
    context->RegisterFactory<Character>();
    ATTRIBUTE(Character, VAR_FLOAT, "Controls Yaw", controls.yaw_, 0.0f, AM_DEFAULT);
    ATTRIBUTE(Character, VAR_FLOAT, "Controls Pitch", controls.pitch_, 0.0f, AM_DEFAULT);
    ATTRIBUTE(Character, VAR_BOOL, "On Ground", onGround, false, AM_DEFAULT);
    ATTRIBUTE(Character, VAR_BOOL, "OK To Jump", okToJump, true, AM_DEFAULT);
    ATTRIBUTE(Character, VAR_FLOAT, "In Air Timer", inAirTimer, 0.0f, AM_DEFAULT);
  }

  //virtual void Start();
  //virtual void FixedUpdate(float timeStep);
  
  /// Movement controls. Assigned by the main program each frame.
  Controls controls;
    
  //void HandleNodeCollision(StringHash eventType, VariantMap& eventData);
  bool onGround;
  bool okToJump;
  float inAirTimer;
};
""".}

type
  Character {.importcpp, nodecl.} = object of LogicComponent
    onGround: bool ## grounded flag for movement
    okToJump: bool ## jump flag
    inAirTimer: float32 ## In air timer. Due to possible physics inaccuracy,
                        ## character can be off ground for max. 1/10 second
                        ## and still be allowed to move.
    controls: Controls

  Touch = object
    sensitivity: float32
    cameraDistance: float32
    zoom: bool
    useGyroscope: bool

var
  chr: ptr Character
  touch: Touch
  touchEnabled: bool
  sc: ptr Scene
  cameraNode: ptr Node
  firstPerson: bool

proc updateTouches(this: var Touch; controls: var Controls) =
  const GYROSCOPE_THRESHOLD = 0.1f32

  this.zoom = false
  let input = getSubsystemInput()

  # Zoom in/out
  if input.getNumTouches().int == 2:
    let touch1 = input.getTouch(0)
    let touch2 = input.getTouch(1)

    # Check for zoom pattern (touches moving in opposite
    # directions and on empty space)
    if touch1.touchedElement.isNil and touch2.touchedElement.isNil and
       ((touch1.delta.y > 0 and touch2.delta.y < 0) or 
        (touch1.delta.y < 0 and touch2.delta.y > 0)):
      this.zoom = true
    else:
      this.zoom = false

    if this.zoom:
      # Check for zoom direction (in/out)
      let sens = 
        if abs(touch1.position.y - touch2.position.y) > 
           abs(touch1.lastPosition.y - touch2.lastPosition.y):
          -1f32
        else:
          1f32
      this.cameraDistance += abs(touch1.delta.y - touch2.delta.y).float32 *
        sens * this.sensitivity / 50.0f32
      this.cameraDistance = clamp(this.cameraDistance,
                CAMERA_MIN_DIST, CAMERA_MAX_DIST)

  # Gyroscope (emulated by SDL through a virtual joystick)
  if this.useGyroscope and input.getNumJoysticks().int > 0:
    # numJoysticks = 1 on iOS & Android
    let joystick = input.getJoystickByIndex(0)
    if joystick.getNumAxes().int >= 2:
      if joystick.getAxisPosition(0) < -GYROSCOPE_THRESHOLD:
        controls.set(CTRL_LEFT.cuint, true)
      if joystick.getAxisPosition(0) > GYROSCOPE_THRESHOLD:
        controls.set(CTRL_RIGHT.cuint, true)
      if joystick.getAxisPosition(1) < -GYROSCOPE_THRESHOLD:
        controls.set(CTRL_FORWARD.cuint, true)
      if joystick.getAxisPosition(1) > GYROSCOPE_THRESHOLD:
        controls.set(CTRL_BACK.cuint, true)

proc offsetof(a, b: expr): int {.importcpp: "offsetof(@)".}

template attr(className, typ, name, variable, defaultValue, mode) {.
             immediate,dirty.} =
  ctx.registerAttribute[className](constructAttributeInfo(typ, name, 
    offsetof(className, className.variable), defaultValue, mode))

proc registerCharacterClass(ctx: ptr Context) {.
  importcpp: "Character::RegisterObject(@)", nodecl.}

#registerFactory(ctx, chr)
# These macros register the class attributes to the Context for automatic
# load / save handling.
# We specify the Default attribute mode which means it will be used both
# for saving into file, and network replication
when false:
  # XXX find a way to make this work
  attr(Character, VAR_FLOAT, "Controls Yaw", controls.yaw, 0.0f32, AM_DEFAULT)
  attr(Character, VAR_FLOAT, "Controls Pitch", controls.pitch, 0.0f32, AM_DEFAULT)
  attr(Character, VAR_BOOL, "On Ground", onGround, false, AM_DEFAULT)
  attr(Character, VAR_BOOL, "OK To Jump", okToJump, true, AM_DEFAULT)
  attr(Character, VAR_FLOAT, "In Air Timer", inAirTimer, 0.0f32, AM_DEFAULT)

proc handleNodeCollision(userData: pointer; eventType: StringHash;
                         eventData: var VariantMap) {.cdecl.} =
  # Check collision contacts and see if character is standing on
  # ground (look for a contact that has near vertical normal)
  var contacts = constructMemoryBuffer eventData["Contacts"].getBuffer()
  while not contacts.isEof():
    let contactPosition = contacts.readVector3()
    let contactNormal = contacts.readVector3()
    discard contacts.readFloat() # contactDistance
    discard contacts.readFloat() # contactImpulse
    
    # If contact is below node center and mostly vertical,
    # assume it's a ground contact
    if contactPosition.y < chr.getNode.getPosition().y + 1.0f32:
      let level = abs(contactNormal.y)
      if level > 0.75:
        chr.onGround = true

proc handleFixedUpdate(userData: pointer; eventType: StringHash;
                       eventData: var VariantMap) {.cdecl.} =
  let this = chr
  let timeStep = eventData["TimeStep"].getFloat()
  # XXX Could cache the components for faster access instead of
  # finding them each frame
  let body = getComponentFromComponent[RigidBody](this[])
  let animCtrl = getComponentFromComponent[AnimationController](this[])
  
  # Update the in air timer. Reset if grounded
  if not this.onGround:
    this.inAirTimer += timeStep
  else:
    this.inAirTimer = 0.0f32
  # When character has been in air less than 1/10 second,
  # it's still interpreted as being on ground
  let softGrounded = this.inAirTimer < INAIR_THRESHOLD_TIME
  
  # Update movement & animation
  let rot = this.getNode.getRotation()
  var moveDir = vector3.ZERO
  let velocity = body.getLinearVelocity()
  # Velocity on the XZ plane
  let planeVelocity = vec3(velocity.x, 0.0f32, velocity.z)
  
  if this.controls.isDown(CTRL_FORWARD):
    moveDir += vector3.FORWARD
  if this.controls.isDown(CTRL_BACK):
    moveDir += vector3.BACK
  if this.controls.isDown(CTRL_LEFT):
    moveDir += vector3.LEFT
  if this.controls.isDown(CTRL_RIGHT):
    moveDir += vector3.RIGHT
  
  # Normalize move vector so that diagonal strafing is not faster
  if moveDir.lengthSquared() > 0.0f32: moveDir.normalize()
  
  # If in air, allow control, but slower than when on ground
  body.applyImpulse(rot * moveDir * (if softGrounded: MOVE_FORCE else: INAIR_MOVE_FORCE))
  
  if softGrounded:
    # When on ground, apply a braking force to limit maximum ground velocity
    let brakeForce: Vector3 = -planeVelocity * BRAKE_FORCE
    body.applyImpulse(brakeForce)
    
    # Jump. Must release jump control inbetween jumps
    if this.controls.isDown(CTRL_JUMP):
      if this.okToJump:
        body.applyImpulse(vector3.UP * JUMP_FORCE)
        this.okToJump = false
    else:
      this.okToJump = true
  
  # Play walk animation if moving on ground, otherwise fade it out
  if softGrounded and not moveDir.equals(vector3.ZERO):
    discard animCtrl.playExclusive("Models/Jack_Walk.ani", 0.cuchar, true, 0.2f32)
  else:
    discard animCtrl.stop("Models/Jack_Walk.ani", 0.2f32)
  # Set walk animation speed proportional to velocity
  discard animCtrl.setSpeed("Models/Jack_Walk.ani", planeVelocity.length() * 0.3f32)
  # Reset grounded flag for next frame
  this.onGround = false


proc createScene() =
  var cache = urhomain.getSubsystemResourceCache()

  sc = cnew constructScene(getContext())

  # Create the Octree component to the scene. This is required before adding
  # any drawable components, or else nothing will show up. The default octree
  # volume will be from (-1000, -1000, -1000) to (1000, 1000, 1000) in world
  # coordinates; it is also legal to place objects outside the volume but their
  # visibility can then not be checked in a hierarchically optimizing manner
  discard createComponent[Octree](sc[])
  discard createComponent[PhysicsWorld](sc[])

  # Create camera and define viewport. We will be doing load / save, so it's
  # convenient to create the camera outside the scene,
  # so that it won't be destroyed and recreated, and we don't have to redefine
  # the viewport on load
  cameraNode = cnew constructNode(getContext())
  let camera = createComponent[Camera](cameraNode)
  camera.setFarClip(300.0f32)

  var renderer = urhomain.getSubsystemRenderer()
  var viewport = cnew constructViewport(getContext(), sc, camera)
  renderer[].setViewport(0, viewport)

  #urhomain.getSubsystemRenderer().setViewport(0,
  #  cnew(constructViewport(getContext(), sc, camera)))

  # Create static scene content. First create a zone for ambient lighting and fog control
  let zoneNode = sc.createChild("Zone")
  let zone = createComponent[Zone](zoneNode)
  zone.setAmbientColor(col(0.15f32, 0.15f32, 0.15f32))
  zone.setFogColor(col(0.5f32, 0.5f32, 0.7f32))
  zone.setFogStart(100.0f32)
  zone.setFogEnd(300.0f32)
  zone.setBoundingBox(constructBoundingBox(-1000.0f32, 1000.0f32))

  # Create a directional light with cascaded shadow mapping
  let lightNode = sc.createChild("DirectionalLight");
  lightNode.setDirection(vec3(0.3f32, -0.5f32, 0.425f32))
  let light = createComponent[Light](lightNode)
  light.setLightType(LIGHT_DIRECTIONAL)
  light.setCastShadows(true)
  light.setShadowBias(constructBiasParameters(0.00025f32, 0.5f32))
  light.setShadowCascade(constructCascadeParameters(
    10.0f32, 50.0f32, 200.0f32, 0.0f32, 0.8f32))
  light.setSpecularIntensity(0.5f32)

  when true:
    # Create heightmap terrain
    let terrainNode = sc.createChild("Terrain")
    terrainNode.setPosition(vec3(0.0, 0.0, 0.0))
    let terrain = createComponent[Terrain](terrainNode)
    terrain.setPatchSize(64)
    # Spacing between vertices and vertical resolution of the height map
    terrain.setSpacing(vec3(2.0, 0.5, 2.0))
    terrain.setSmoothing(true)
    terrain.setHeightMap(getResource[Image](cache, "Textures/HeightMap.png"))
    terrain.setMaterial(getResource[Material](cache, "Materials/Terrain.xml"))
    # The terrain consists of large triangles, which fits well for occlusion
    # rendering, as a hill can occlude all terrain patches and other objects
    # behind it
    terrain.setOccluder(true)
    let floorNode = terrainNode
  else:
    # Create the floor object
    let floorNode = sc.createChild("Floor")
    floorNode.setPosition(vec3(0.0f32, -0.5f32, 0.0f32))
    floorNode.setScale(vec3(200.0f32, 1.0f32, 200.0f32))
    let obj = createComponent[StaticModel](floorNode)
    obj.setModel(getResource[Model](cache, "Models/Box.mdl"))
    obj.setMaterial(getResource[Material](cache, "Materials/Stone.xml"))

  # Create a water plane object that is as large as the terrain
  let waterNode = sc.createChild("Water")
  waterNode.setScale(vec3(2048.0, 1.0, 2048.0))
  waterNode.setPosition(vec3(0.0, 5.0, 0.0))
  let water = createComponent[StaticModel](waterNode)
  water.setModel(getResource[Model](cache, "Models/Plane.mdl"))
  water.setMaterial(getResource[Material](cache, "Materials/Water.xml"))
  # Set a different viewmask on the water plane to be able to hide it
  # from the reflection camera
  water.setViewMask(cuint(0x80000000))

  let skyNode = sc.createChild("Sky")
  skyNode.setScale(500.0f32)
  let skybox = createComponent[Skybox](skyNode)
  skybox.setModel(getResource[Model](cache, "Models/Box.mdl"))
  skybox.setMaterial(getResource[Material](cache, "Materials/Skybox.xml"))

  let body = createComponent[RigidBody](floorNode)
  # Use collision layer bit 2 to mark world scenery. This is what we will
  # raycast against to prevent camera from going inside geometry
  body.setCollisionLayer(2)
  let shape = createComponent[CollisionShape](floorNode)
  #shape.setBox(vector3.ONE)
  shape.setTerrain()

  # Create mushrooms of varying sizes
  for i in 0 .. < 60:
    let objectNode = sc.createChild("Mushroom")
    var pos = vec3(random(180.0f32) - 90.0f32, 0.0f32, random(180.0f32) - 90.0f32)
    pos.y = terrain.getHeight(pos)

    objectNode.setPosition(pos)
    objectNode.setRotation(quat(0.0f32, random(360.0f32), 0.0f32))
    objectNode.setScale(2.0f32 + random(5.0f32))
    let obj = createComponent[StaticModel](objectNode)
    obj.setModel(getResource[Model](cache, "Models/Mushroom.mdl"))
    obj.setMaterial(getResource[Material](cache, "Materials/Mushroom.xml"))
    obj.setCastShadows(true)

    let body = createComponent[RigidBody](objectNode)
    body.setCollisionLayer(2)
    let shape = createComponent[CollisionShape](objectNode)
    shape.setTriangleMesh(obj.getModel(), 0)

  # Create movable boxes. Let them fall from the sky at first
  for i in 0.. < 100:
    let scale = random(2.0f32) + 0.5f32

    let objectNode = sc.createChild("Box")

    var pos = vec3(random(180.0f32) - 90.0f32, 0.0f32, random(180.0f32) - 90.0f32)
    pos.y = terrain.getHeight(pos) + 10.0f32

    #objectNode.setPosition(vec3(random(180.0f32) - 90.0f32, random(10.0f32) + 10.0f32, random(180.0f32) - 90.0f32))
    objectNode.setPosition(pos)
    objectNode.setRotation(quat(random(360.0f32), random(360.0f32), random(360.0f32)))
    objectNode.setScale(scale)
    let obj = createComponent[StaticModel](objectNode)
    obj.setModel(getResource[Model](cache, "Models/Box.mdl"))
    obj.setMaterial(getResource[Material](cache, "Materials/Stone.xml"))
    obj.setCastShadows(true)

    let body = createComponent[RigidBody](objectNode)
    body.setCollisionLayer(2)
    # Bigger boxes will be heavier and harder to move
    body.setMass(scale * 2.0f32)
    let shape = createComponent[CollisionShape](objectNode)
    shape.setBox(vector3.ONE)

proc createCharacter() =
  var cache = urhomain.getSubsystemResourceCache()

  let objectNode = sc.createChild("Jack")
  objectNode.setPosition(vec3(0.0, 1.0, 0.0))

  # Create the rendering component + animation controller
  var obj = createComponent[AnimatedModel](objectNode)
  obj.setModel(getResource[Model](cache, "Models/Jack.mdl"))
  obj.setMaterial(getResource[Material](cache, "Materials/Jack.xml"))
  obj.setCastShadows(true)
  discard createComponent[AnimationController](objectNode)

  # Set the head bone for manual control
  obj.getSkeleton().getBone("Bip01_Head".cstring).animated = false

  # Create rigidbody, and set non-zero mass so that the body becomes dynamic
  let body = createComponent[RigidBody](objectNode)
  body.setCollisionLayer(1)
  body.setMass(1.0f32)

  # Set zero angular factor so that physics doesn't turn the character
  # on its own. Instead we will control the character yaw manually
  body.setAngularFactor(vector3.ZERO)

  # Set the rigidbody to signal collision also when in rest, so that we get
  # ground collisions properly
  body.setCollisionEventMode(COLLISION_ALWAYS)

  # Set a capsule shape for collision
  let shape = createComponent[CollisionShape](objectNode)
  shape.setCapsule(0.7f32, 1.8f32, vec3(0.0, 0.9, 0.0))

  # Create the character logic component, which takes care of steering the
  # rigidbody. Remember it so that we can set the controls. Use a WeakPtr
  # because the scene hierarchy already owns it
  # and keeps it alive as long as it's not removed from the hierarchy
  chr = createComponent[Character](objectNode)
  chr.okToJump = true
  # invoke LogicComponent(context) constructor?

  # Only the physics update event is needed: unsubscribe
  # from the rest for optimization:
  #chr.setUpdateEventMask(USE_FIXEDUPDATE)


proc handleUpdate(userData: pointer; eventType: StringHash;
                  eventData: var VariantMap) {.cdecl.} =
  let input = getSubsystemInput()
  #if input.getKeyDown(KEY_ESC): closeUrho3D()

  if chr != nil:
    # Clear previous controls
    chr.controls.set(CTRL_FORWARD or CTRL_BACK or CTRL_LEFT or
                     CTRL_RIGHT or CTRL_JUMP, false)

    # Update controls using touch utility class
    touch.updateTouches(chr.controls)

    # Update controls using keys
    let ui = getSubsystemUI()
    if ui.getFocusElement() == nil:
      if not touch.useGyroscope:
        chr.controls.set(CTRL_FORWARD, input.getKeyDown('W'))
        chr.controls.set(CTRL_BACK, input.getKeyDown('S'))
        chr.controls.set(CTRL_LEFT, input.getKeyDown('A'))
        chr.controls.set(CTRL_RIGHT, input.getKeyDown('D'))
      chr.controls.set(CTRL_JUMP, input.getKeyDown(' '))

      # Add character yaw & pitch from the mouse motion or touch input
      if touchEnabled:
        for i in 0 .. < input.getNumTouches().int:
          let state = input.getTouch(i)
          if state.touchedElement.isNil:    # Touch on empty space
            let camera = getComponentFromNode[Camera](cameraNode)
            if camera == nil: return

            let h = getSubsystem[Graphics]().getHeight().float32
            chr.controls.yaw += TOUCH_SENSITIVITY * camera.getFov() / h *
              state.delta.x.float32
            chr.controls.pitch += TOUCH_SENSITIVITY * camera.getFov() / h *
              state.delta.y.float32
      else:
        chr.controls.yaw += input.getMouseMoveX().float32 * YAW_SENSITIVITY
        chr.controls.pitch += input.getMouseMoveY().float32 * YAW_SENSITIVITY
      # Limit pitch
      chr.controls.pitch = clamp(chr.controls.pitch, -80.0f32, 80.0f32)

      # Switch between 1st and 3rd person
      if input.getKeyPress('F'):
        firstPerson = not firstPerson

      # Turn on/off gyroscope on mobile platform
      if input.getKeyPress('G'):
        touch.useGyroscope = not touch.useGyroscope

      # Check for loading / saving the scene
      if input.getKeyPress(KEY_F5):
        let saveFile = constructFile(getContext(), 
          os.getAppDir() / "MySave.xml", FILE_WRITE)
        sc.saveXML(saveFile)
      if input.getKeyPress(KEY_F7):
        let loadFile = constructFile(getContext(), 
          os.getAppDir() / "MySave.xml", FILE_READ)
        sc.loadXML(loadFile)
        # After loading we have to reacquire the weak pointer to the
        # Character component, as it has been recreated
        # Simply find the character's scene node by name as
        # there's only one of them:
        let chrNode = sc.getChild("Jack", true)
        if chrNode != nil:
          chr = getComponentFromNode[Character](chrNode)
    # Set rotation already here so that it's updated every
    # rendering frame instead of every physics frame
    chr.getNode().setRotation(constructQuaternion(chr.controls.yaw, vector3.UP))

proc handlePostUpdate(userData: pointer; eventType: StringHash;
                      eventData: var VariantMap) {.cdecl.} =
  if chr == nil: return

  let chrNode = chr.getNode()

  # Get camera lookat dir from character yaw + pitch
  let rot = chrNode.getRotation()
  let dir = rot * constructQuaternion(chr.controls.pitch, vector3.RIGHT)

  # Turn head to camera pitch, but limit to avoid unnatural animation
  let headNode = chrNode.getChild("Bip01_Head", true)
  let limitPitch = clamp(chr.controls.pitch, -45.0f32, 45.0f32)
  let headDir = rot * constructQuaternion(limitPitch, vec3(1.0, 0.0, 0.0))
  # This could be expanded to look at an arbitrary target, now just look
  # at a point in front
  let headWorldTarget = headNode.getWorldPosition() + headDir * vec3(0.0, 0.0, 1.0)
  discard headNode.lookAt(headWorldTarget, vec3(0.0, 1.0, 0.0))
  # Correct head orientation because LookAt assumes Z = forward, but
  # the bone has been authored differently (Y = forward)
  headNode.rotate(quat(0.0, 90.0, 90.0))

  if firstPerson:
    cameraNode.setPosition(headNode.getWorldPosition() + rot * vec3(0.0, 0.15, 0.2))
    cameraNode.setRotation(dir)
  else:
    # Third person camera: position behind the character
    let aimPoint = chrNode.getPosition() + rot * vec3(0.0, 1.7, 0.0)

    # Collide camera ray with static physics objects (layer bitmask 2) to
    # ensure we see the character properly
    let rayDir = dir * vector3.BACK
    var rayDistance = if touchEnabled: touch.cameraDistance else: CAMERA_INITIAL_DIST
    var result: PhysicsRaycastResult
    getComponentFromScene[PhysicsWorld](sc).raycastSingle(
      result, constructRay(aimPoint, rayDir), rayDistance, 2)
    if result.body != nil:
        rayDistance = min(rayDistance, result.distance)
    rayDistance = clamp(rayDistance, CAMERA_MIN_DIST, CAMERA_MAX_DIST)

    cameraNode.setPosition(aimPoint + rayDir * rayDistance)
    cameraNode.setRotation(dir)


proc onConsoleCommand(userData: pointer; eventType: StringHash;
                     eventData: var VariantMap) {.cdecl.} =
  let x = $eventData["Command"].getString()
  echo x

proc main =
  parseArguments()

  openUrho3D(false)

  touch.cameraDistance = CAMERA_INITIAL_DIST

  registerCharacterClass(getContext())
  createScene()
  createCharacter()
  createConsole()

  # Subscribe to Update event for setting the character controls
  # before physics simulation
  subscribeToEvent("Update", handleUpdate)

  subscribeToEvent("KeyDown", handleConsole)
  subscribeToEvent("ConsoleCommand", onConsoleCommand)


  # Subscribe to PostUpdate event for updating the camera position
  # after physics simulation
  subscribeToEvent("PostUpdate", handlePostUpdate)

  # Unsubscribe the SceneUpdate event from base class as the camera node is
  # being controlled in HandlePostUpdate() in this sample
  unsubscribeFromEvent("SceneUpdate")

  subscribeToEvent("NodeCollision", handleNodeCollision)
  subscribeToEvent("PhysicsPreStep", handleFixedUpdate)

  let exitCode = runMainLoop()
  quit exitCode

main()
