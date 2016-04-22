#
# This is a simple model tester application, use it like:
#
# modeltester mymodel.mdl [myanimation.ani ...]
import parseopt2, strutils

import ui, urhomain, processutils, color, urstr, stringHash, variant, text,
  uielement, octree, staticmodel, renderer, component, urhomain, log,
  resourcecache, scene, node, vector3, quaternion, model, material, light,
  camera, view, input, animationcontroller, animatedModel, rigidbody,
  collisionshape, physicsworld, debugRenderer, drawable, file, vector

# For the stuff we copied from sample.nim
import xmlelement, engine, debughud, console, inputevents, graphicsdefs

import hashmap except Node
include urholink

from math import random

# enable auto-deref for this module:
{.experimental.}

const
  USAGE = """
Usage:
  modeltester [options] modelfile materialsfile [animationfile]

Arguments:
  modelfile           - A Urho3D .mdl (or prefab) file
  materialsfile       - A Urho3D .txt material list file
  animationfile       - An optional Urho3D .ani file

Options:
  -p,--prefab         - Use a prefab instead of a .mdl file
  -s,--static         - Use a StaticModel instead, no animation
  -c,--collision      - Add a rigidbody and a collisionshape
  -h,--help           - Shows this help
  
Keys:
  WASD + mouse
  F1  - Open console
  F2  - Show profiling
  1-8 - Turn on/off various things
  JKL - Rotate model in each axis
  NM  - Turn on/off animation
  ZX  - Scale model +/- 10%
"""


var
  usePrefab: bool = false
  useStaticModel: bool = false
  addCollisionShape: bool = false
  modelFn, animationFn, materialsFn: string
  sc: ptr Scene
  cameraNode: ptr Node
  objectNode: ptr Node
  obj: ptr AnimatedModel
  objStatic: ptr StaticModel
  animCtrl: ptr AnimationController
  scale: float32 = 1.0


proc startAnimation() =
  if not useStaticModel and not animationFn.isNil:
    discard animCtrl.playExclusive(animationFn, 0.cuchar, true, 0.2f32)

proc stopAnimation() =
  if not useStaticModel and not animationFn.isNil:
    discard animCtrl.stop(animationFn)

iterator items*[T](v: var PODVector[T]): T {.inline.} =
  for i in countup(0, size(v).int-1):
    yield v[i.cuint]

proc createCollisionOnNode(node: ptr Node): ptr RigidBody = 
  let obj = getComponentFromNode[StaticModel](node)
  if not obj.isNil:
    result = createComponent[RigidBody](node)
    result.setCollisionLayer(1)
    obj.setCastShadows(true)
    obj.setOccluder(true)
    obj.setOccludee(true)
    let shape = createComponent[CollisionShape](node)
    shape.setTriangleMesh(obj.getModel(), 0)

proc createScene() =
  var cache = urhomain.getSubsystemResourceCache()
  sc = cnew constructScene(getContext())
  discard createComponent[Octree](sc)
  discard createComponent[PhysicsWorld](sc)
  discard createComponent[DebugRenderer](sc)
  # Create a child scene node (at world origin) and a StaticModel component
  # into it. Set the StaticModel to show a simple plane mesh with a "stone"
  # material. Note that naming the scene nodes is optional. Scale the scene
  # node larger (100 x 100 world units)
  var planeNode: ptr component.Node = sc.createChild("Plane")
  planeNode.setScale(constructVector3(100.0f32, 1.0f32, 100.0f32))
  var planeObject = createComponent[StaticModel](planeNode)
  planeObject.setModel(getResource[Model](cache, "Models/Plane.mdl"))
  planeObject.setMaterial(getResource[Material](cache, "Materials/StoneTiled.xml"))

  # Create a directional light to the world so that we can see something. The
  # light scene node's orientation controls the light direction; we will use
  # the setDirection() function which calculates the orientation from a forward
  # direction vector. The light will use default settings (white light, no shadows)
  var lightNode: ptr Node = sc.createChild("DirectionalLight")
  lightNode.setDirection(constructVector3(0.6f32, -1.0f32, 0.8f32)) 
  # The direction vector does not need to be normalized
  var light: ptr Light = createComponent[Light](lightNode)
  light.setLightType(LIGHT_DIRECTIONAL)

  # Create a scene node for the camera, which we will move around
  # The camera will use default settings (1000 far clip distance,
  # 45 degrees FOV, set aspect ratio automatically)
  cameraNode = sc.createChild("Camera")
  discard createComponent[Camera](cameraNode)

  # Set an initial position for the camera scene node above the plane
  cameraNode.setPosition(constructVector3(0.0f32, 5.0f32, -20.0f32))
  var position = constructVector3(0.0f32, 5.0f32, 0.0f32)

  if usePrefab:
    # Here we are not applying collision shapes or telling the StaticModels
    # to cast shadows or being occluders. That would need to be done
    # after having loaded the prefab by iterating all nodes and StaticModels
    # in it.
    var file = constructFile(getContext(), modelFn)
    objectNode = sc.instantiateXML(addr(file).toDeser()[], position, quaternion.Identity, REPLICATED)
    var vector: PODVector[ptr Node]
    objectNode.getChildren(vector, true)
    for node in vector:
      discard node.createCollisionOnNode()
  else:  
    objectNode = sc.createChild("object")
    objectNode.setPosition(position)
    # Create the rendering component + animation controller
    if useStaticModel:
      objStatic = createComponent[StaticModel](objectNode)
      objStatic.setOccluder(true)
      var model = getResource[Model](cache, modelFn)
      objStatic.setModel(model)
      objStatic.setCastShadows(true)
      if not materialsFn.isNil:
        objStatic.applyMaterialList(materialsFn)
      if addCollisionShape:
        let body = createComponent[RigidBody](objectNode)
        body.setCollisionLayer(1)
        let shape = createComponent[CollisionShape](objectNode)
        shape.setTriangleMesh(objStatic.getModel(), 0)
        #shape.setConvexHull(objStatic.getModel(), 0)
        log.write(LOG_INFO, "Collision shape set")
    else:
      obj = createComponent[AnimatedModel](objectNode)
      obj.setModel(getResource[Model](cache, modelFn))
      if not materialsFn.isNil:
        obj.applyMaterialList(materialsFn)
      animCtrl = createComponent[AnimationController](objectNode)
      startAnimation()

proc setupViewport() =
  var renderer = urhomain.getSubsystemRenderer()

  # Set up a viewport to the Renderer subsystem so that the 3D scene can be
  # seen. We need to define the scene and the camera
  # at minimum. Additionally we could configure the viewport screen size and
  # the rendering path (eg. forward / deferred) to
  # use, but now we just use full screen and default render path configured in
  # the engine command line options
  var viewport = cnew constructViewport(getContext(), sc,
    getComponentFromNode[Camera](cameraNode))
  renderer.setViewport(0, viewport)

# Movement speed as world units per second
const MOVE_SPEED = 20.0f32
# Mouse sensitivity as degrees per pixel
const MOUSE_SENSITIVITY = 0.1f32

var
  yaw: float32
  pitch: float32

proc moveCamera(timeStep: float32) =
  # Do not move if the UI has a focused element (the console)
  #if (GetSubsystem<UI>()->GetFocusElement())
  #    return;

  var input = urhomain.getSubsystemInput()
  # Use this frame's mouse motion to adjust camera node yaw and pitch.
  # Clamp the pitch between -90 and 90 degrees
  let mouseMove = input.getMouseMove()
  yaw += MOUSE_SENSITIVITY * mouseMove.x.float32
  pitch += MOUSE_SENSITIVITY * mouseMove.y.float32
  pitch = clamp(pitch, -90.0f32, 90.0f32)

  # Construct new orientation for the camera scene node from yaw and pitch.
  # Roll is fixed to zero
  cameraNode.setRotation(constructQuaternion(pitch, yaw, 0.0f32))

  # Read WASD keys and move the camera scene node to the corresponding
  # direction if they are pressed
  # Use the Translate() function (default local space) to move relative
  # to the node's orientation.
  if input.getKeyDown('W'):
    cameraNode.translate(vector3.FORWARD * MOVE_SPEED * timeStep)
  if input.getKeyDown('S'):
    cameraNode.translate(vector3.BACK * MOVE_SPEED * timeStep)
  if input.getKeyDown('A'):
    cameraNode.translate(vector3.LEFT * MOVE_SPEED * timeStep)
  if input.getKeyDown('D'):
    cameraNode.translate(vector3.RIGHT * MOVE_SPEED * timeStep)


proc handleUpdate(userData: pointer; eventType: StringHash;
                  eventData: var VariantMap) {.cdecl.} =
  moveCamera(eventData["TimeStep"].getFloat())


proc createConsole*() =
  var cache = urhomain.getSubsystemResourceCache()
  let xmlFile = getResource[XMLFile](cache, "UI/DefaultStyle.xml")
  let console = getEngine().createConsole()
  console.setCommandInterpreter("MainApplication")
  console.setDefaultStyle(xmlFile)
  console.getBackground().setOpacity(0.8f32)
  # Create debug HUD.
  let debugHud = getEngine().createDebugHud()
  debugHud.setDefaultStyle(xmlFile)

# Keys and stuff, F1, F2, ESC, 1-8, WASD, JK
proc handleConsole*(userData: pointer; eventType: StringHash;
                      eventData: var VariantMap) {.cdecl.} =
  let key = eventData["Key"].getInt()
  if key == KEY_ESC:
    let console = getSubsystem[Console]()
    if console.isVisible():
      console.setVisible(false)
    else:
      closeUrho3D()
  elif key == KEY_F1:
    getSubsystem[Console]().toggle()
  elif key == KEY_F2:
    getSubsystem[DebugHud]().toggleAll()
  elif getSubsystemUI().getFocusElement().isNil:
    # Common rendering quality controls, only when UI has no focused element
    let renderer = getSubsystem[Renderer]()

    # Texture quality
    if key == '1'.int:
      var quality = renderer.getTextureQuality() + 1
      if quality > QUALITY_HIGH:
        quality = QUALITY_LOW
      renderer.setTextureQuality(quality)

    # Material quality
    elif key == '2'.int:
      var quality = renderer.getMaterialQuality() + 1
      if quality > QUALITY_HIGH:
        quality = QUALITY_LOW
      renderer.setMaterialQuality(quality)

    # Specular lighting
    elif key == '3'.int:
      renderer.setSpecularLighting(not renderer.getSpecularLighting())

    # Shadow rendering
    elif key == '4'.int:
      renderer.setDrawShadows(not renderer.getDrawShadows())

    # Shadow map resolution
    elif key == '5'.int:
      var shadowMapSize = renderer.getShadowMapSize() * 2
      if shadowMapSize > 2048:
        shadowMapSize = 512
      renderer.setShadowMapSize(shadowMapSize)

    # Shadow depth and filtering quality
    elif key == '6'.int:
      var quality = renderer.getShadowQuality() + 1
      if quality > SHADOWQUALITY_HIGH_24BIT:
          quality = SHADOWQUALITY_LOW_16BIT
      renderer.setShadowQuality(quality)

    # Occlusion culling
    elif key == '7'.int:
      var triangles = renderer.getMaxOccluderTriangles()
      if triangles > 0:
        triangles = 0
      else:
        triangles = 5000
      renderer.setMaxOccluderTriangles(triangles)

    # Instancing
    elif key == '8'.int:
      renderer.setDynamicInstancing(not renderer.getDynamicInstancing())

    # Rotate model
    elif key == 'J'.int:
      objectNode.rotate(quat(90.0, 0.0, 0.0))
    elif key == 'K'.int:
      objectNode.rotate(quat(0.0, 90.0, 0.0))
    elif key == 'L'.int:
      objectNode.rotate(quat(0.0, 0.0, 90.0))

    # Control animation
    elif key == 'N'.int:
      startAnimation()
    elif key == 'M'.int:
      stopAnimation()
      
    # Scale model
    elif key == 'Z'.int:
      scale *= 0.9
      objectNode.setScale(scale)
    elif key == 'X'.int:
      scale *= 1.1
      objectNode.setScale(scale)

proc parseCommandLine() =
  var
    p = initOptParser()
    key, val: TaintedString
  try:
    while true:
      next p
      key = p.key
      val = p.val
      case p.kind
      of cmdArgument:
        if modelFn.isNil:
          modelFn = key
        else:
          if materialsFn.isNil:
            materialsFn = key
          else:
            animationFn = key
      of cmdLongOption, cmdShortOption:
        case key.normalize
        of "help", "h":
          stdout.write USAGE
          quit 0
        of "prefab", "p":
          usePrefab = true
        of "static", "s":
          useStaticModel = true
        of "collision", "c":
          addCollisionShape = true
        else:
          stdout.write USAGE
          quit "Unexpected option: " & key, 2
      of cmdEnd: break
  except ValueError:
    stdout.write USAGE
    quit "Invalid value " & val &  " for parameter " & key, 3
  if modelFn.isNil:
    stdout.write USAGE
    quit 0

proc main =
  parseCommandLine()

  openUrho3D(false)

  createScene()
  
  createConsole()
  subscribeToEvent("KeyDown", handleConsole)
  setupViewport()
  subscribeToEvent("SceneUpdate", handleUpdate)
  let exitCode = runMainLoop()
  quit exitCode

main()
