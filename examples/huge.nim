import urhomain, ui, stringHash, variant, octree, renderer, component, color, text, uielement,
  resourcecache, scene, node, boundingbox, vector, vector3, camera, view, input, context, material, staticmodelgroup,
  ptrs, drawable2d, graphics, zone, light, model, staticmodel, quaternion, engine, unsigned

import hashmap except Node

# enable auto-deref:
{.experimental.}

var
  cameraNode: ptr Node
  cam: ptr Camera
  sc: ptr Scene
  boxNodes = constructVector[SharedPtr[Node]]()
  animate: bool
  useGroups: bool
  pitch: float32
  yaw: float32

proc createScene() =
  # Get it so we can load resources
  var cache = getSubsystemResourceCache()

  if sc.isNil:
    # Create a Scene, cnew is a special proc we use to call wrapped C++ constructors.
    sc = cnew constructScene(getContext())
  else:
    sc.clear()
    boxNodes.clear()

  # We just need to add the Octree. At the moment we can't write this as:
  #   sc.createComponent[Octree]()
  # But Andreas is fixing that.
  discard createComponent[Octree](sc)

  # Create a Zone for ambient light & fog control
  let zoneNode = sc.createChild("Zone")
  let zone = createComponent[Zone](zoneNode)
  zone.setBoundingBox(constructBoundingBox(-1000.0, 1000.0))
  zone.setFogColor(col(0.2, 0.2, 0.2))
  zone.setFogStart(200.0)
  zone.setFogEnd(300.0)
  
  # Create a directional light
  let lightNode = sc.createChild("DirectionalLight");
  lightNode.setDirection(vec3(0.6, -1.0, -0.8))
  let light = createComponent[Light](lightNode)
  light.setLightType(LIGHT_DIRECTIONAL)

  if not useGroups:
    light.setColor(col(0.7, 0.35, 0.0))
    
    # Create individual box StaticModels in the scene
    for y in -125 .. < 125:
      for x in -125 .. < 125:
        let boxNode = sc.createChild("Box")
        boxNode.setPosition(vec3(x.float * 0.3, 0.0, y.float * 0.3))
        boxNode.setScale(0.25)
        let boxObject = createComponent[StaticModel](boxNode)
        boxObject.setModel(getResource[Model](cache, "Models/Box.mdl"))
        boxNodes.push(constructSharedPtr[Node](boxNode))
  else:
    light.setColor(col(0.6, 0.6, 0.6))
    light.setSpecularIntensity(1.5)
    
    # Create StaticModelGroups in the scene
    var lastGroup: ptr StaticModelGroup

    for y in -125 .. < 125:
      for x in -125 .. < 125:
        # Create new group if no group yet, or the group has already "enough" objects. The tradeoff is between culling
        # accuracy and the amount of CPU processing needed for all the objects. Note that the group's own transform
        # does not matter, and it does not render anything if instance nodes are not added to it
        if (lastGroup.isNil or lastGroup.getNumInstanceNodes().int >= 25 * 25):
          let boxGroupNode = sc.createChild("BoxGroup")
          lastGroup = createComponent[StaticModelGroup](boxGroupNode)
          lastGroup.setModel(getResource[Model](cache, "Models/Box.mdl"))
        
        let boxNode = sc.createChild("Box")
        boxNode.setPosition(vec3(x.float * 0.3, 0.0, y.float * 0.3))
        boxNode.setScale(0.25)
        boxNodes.push(constructSharedPtr[Node](boxNode))
        lastGroup.addInstanceNode(boxNode)

  # Create the camera. Create it outside the scene so that we can clear the whole scene without affecting it
  if cameraNode.isNil:
    cameraNode = cnew constructNode(getContext())
    cameraNode.setPosition(vec3(0.0, 10.0, -100.0))
    cam = createComponent[Camera](cameraNode)
    cam.setFarClip(300.0)

  # Construct a viewport and set it for the renderer
  var viewport = cnew constructViewport(getContext(), sc, cam)
  getSubsystemRenderer().setViewport(0, viewport)

  # Add some instruction text
  let text = cnew constructText(getContext())
  text.setText(
        "Use WASD keys and mouse/touch to move\nSpace to toggle animation\nG to toggle object group optimization")
  text.setColor(color.WHITE)
  text.setFont(getFont("Fonts/Anonymous Pro.ttf"), 15)
  text.setTextAlignment(HA_CENTER)
  text.setHorizontalAlignment(HA_CENTER)
  text.setVerticalAlignment(VA_CENTER)
  let root = getSubsystemUI().getRoot()
  text.setPosition(0, (root.getHeight() / 4).cint)
  root.addChild(text)

proc moveCamera(timeStep: float32) =
  # Do not move if the UI has a focused element (the console)
  let ui = getSubsystemUI()
  if not ui.getFocusElement().isNil:
    return
  
  let input = getSubsystemInput()
  
  # Movement speed as world units per second
  const MOVE_SPEED = 20.0
  # Mouse sensitivity as degrees per pixel
  const MOUSE_SENSITIVITY = 0.1
  
  # Use this frame's mouse motion to adjust camera node yaw and pitch.
  # Clamp the pitch between -90 and 90 degrees
  # Original code was slightly different
  yaw += input.getMouseMoveX().float32 * MOUSE_SENSITIVITY
  pitch += input.getMouseMoveY().float32 * MOUSE_SENSITIVITY
  pitch = clamp(pitch, -90.0, 90.0)
  
  # Construct new orientation for the camera scene node from yaw and pitch. Roll is fixed to zero
  cameraNode.setRotation(quat(pitch, yaw, 0.0))
  
  # Read WASD keys and move the camera scene node to the corresponding direction if they are pressed
  if input.getKeyDown('W'):
    cameraNode.translate(vector3.FORWARD * MOVE_SPEED * timeStep)
  if input.getKeyDown('S'):
    cameraNode.translate(vector3.BACK * MOVE_SPEED * timeStep)
  if input.getKeyDown('A'):
    cameraNode.translate(vector3.LEFT * MOVE_SPEED * timeStep)
  if input.getKeyDown('D'):
    cameraNode.translate(vector3.RIGHT * MOVE_SPEED * timeStep)

proc animateObjects(timeStep: float32) =
  const ROTATE_SPEED = 15.0
  # Rotate about the Z axis (roll)
  let rotateQuat = constructQuaternion(ROTATE_SPEED * timeStep, vector3.FORWARD)
  # Unfortunately this is a Vector from Urho3D so we can not do
  #  for box in boxNodes:
  #    box.rotate(rotateQuat)
  for i in 0.cuint .. < size(boxNodes):
    # The boxNode is wrapped in a SharedPtr so need to use get()
    boxNodes[i].get().rotate(rotateQuat)

proc handleUpdate(userData: pointer; eventType: StringHash;
                  eventData: var VariantMap) {.cdecl.} =
  let input = getSubsystemInput()

  # Take the frame time step, which is stored as a float
  let timeStep = eventData["TimeStep"].getFloat()
  
  # Toggle animation with space
  if input.getKeyPress(' '):
    animate = not animate

  # Toggle grouped / ungrouped mode
  if input.getKeyPress('G'):
      useGroups = not useGroups
      createScene()

  # Move the camera, scale movement with time step
  moveCamera(timeStep)
  
  # Animate scene if enabled
  if animate:
    animateObjects(timeStep)


proc main =
  parseArguments()
  openUrho3D(false)
  createScene()
  subscribeToEvent("Update", handleUpdate)
  quit runMainLoop()

main()
