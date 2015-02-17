import urhomain, ui, stringHash, variant, octree, renderer, component, color, text, uielement,
  resourcecache, scene, node, vector3, camera, view, input, context, material, staticmodelgroup,
  ptrs, drawable2d, graphics, engine

import hashmap except Node

# enable auto-deref:
{.experimental.}

var
  cameraNode: ptr Node
  cam: ptr Camera
  sc: ptr Scene
  # Box scene nodes.
  boxNodes = newSeq[ptr Node]()
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
    boxNodes.setLen(0)

  # We just need to add the Octree. At the moment we can't write this as:
  #   sc.createComponent[Octree]()
  # But Andreas is fixing that.
  discard createComponent[Octree](sc)

  # Create a Zone for ambient light & fog control
  let zoneNode = sc.createChild("Zone")
  let zone = ceateComponent[Zone](zoneNode)
  zone.setBoundingBox(constructBoundingBox(-1000.0f32, 1000.0f32))
  zone.setFogColor(Color(0.2f32, 0.2f32, 0.2f32))
  zone.setFogStart(200.0)
  zone.setFogEnd(300.0)
  
  # Create a directional light
  let lightNode = sc.createChild("DirectionalLight");
  lightNode.setDirection(vec3(0.6f32, -1.0f32, -0.8f32))
  let light = createComponent[Light](lightNode)
  light.setLightType(LIGHT_DIRECTIONAL)

  if not useGroups:
    light.setColor(col(0.7f32, 0.35f32, 0.0f32))
    
    # Create individual box StaticModels in the scene
    for y in -125 .. < 125:
      for x in -125 .. < 125:
        let boxNode = sc.createChild("Box")
        boxNode.setPosition(vec3(x * 0.3f32, 0.0f32, y * 0.3f32))
        boxNode.setScale(0.25f32)
        let boxObject = createComponent[StaticModel](boxNode)
        boxObject.setModel(getResource[Model](cache, "Models/Box.mdl"))
        boxNodes.add(constructSharedPtr[Node](boxNode))
  else:
    light.setColor(col(0.6f32, 0.6f32, 0.6f32))
    light.setSpecularIntensity(1.5f32)
    
    # Create StaticModelGroups in the scene
    var lastGroup: ptr StaticModelGroup

    for y in -125 .. < 125:
      for x in -125 .. < 125:
        # Create new group if no group yet, or the group has already "enough" objects. The tradeoff is between culling
        # accuracy and the amount of CPU processing needed for all the objects. Note that the group's own transform
        # does not matter, and it does not render anything if instance nodes are not added to it
        if (not lastGroup or lastGroup.getNumInstanceNodes() >= 25 * 25):
          let boxGroupNode = sc.createChild("BoxGroup")
          lastGroup = createComponent[StaticModelGroup](boxGroupNode)
          lastGroup.setModel(getResource[Model](cache, "Models/Box.mdl"))
        
        let boxNode = sc.createChild("Box")
        boxNode.setPosition(vec3(x * 0.3f32, 0.0f32, y * 0.3f32))
        boxNode.setScale(0.25f32)
        boxNodes.add(constructSharedPtr[Node](boxNode))
        lastGroup.addInstanceNode(boxNode)

    # Create the camera. Create it outside the scene so that we can clear the whole scene without affecting it
    if not cam:
      cameraNode = cnew constructNode(getContext())
      cameraNode.setPosition(vec3(0.0f32, 10.0f32, -100.0f32))
      cam = createComponent[Camera](cameraNode)
      cam.setFarClip(300.0f32)
      
    # Construct a viewport and set it for the renderer
    var viewport = cnew constructViewport(getContext(), sc, cam)
    getSubsystemRenderer().setViewport(0, viewport)


    # Add some instruction text
    #let text = cnew constructText(getContext())
    #text.setText("Use mouse/touch to move the particle.")
    #text.setColor(color.WHITE)
    #text.setFont(getFont("Fonts/Anonymous Pro.ttf"), 15)
    #text.setHorizontalAlignment(HA_CENTER)
    #text.setVerticalAlignment(VA_CENTER)
    #let root = getSubsystemUI().getRoot()
    #text.setPosition(0, (root.getHeight() / 4).cint)
    #root.addChild(text)

proc moveCamera(timeStep: float32) =
  # Do not move if the UI has a focused element (the console)
  let ui = getSubsystemUI()
  if not ui.getFocusElement().isNil:
    return
  
  let input = getSubsystemInput()
  
  # Movement speed as world units per second
  const MOVE_SPEED = 20.0f32
  # Mouse sensitivity as degrees per pixel
  const MOUSE_SENSITIVITY = 0.1f32
  
  # Use this frame's mouse motion to adjust camera node yaw and pitch. Clamp the pitch between -90 and 90 degrees
  yaw += input.getMouseMoveX().float32 * MOUSE_SENSITIVITY
  pitch += input.getMouseMoveY().float32 * MOUSE_SENSITIVITY
  pitch = clamp(pitch, -90.0f32, 90.0f32)
  
  # Construct new orientation for the camera scene node from yaw and pitch. Roll is fixed to zero
  cameraNode.setRotation(constructQuaternion(pitch, yaw, 0.0f32))
  
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
  #PROFILE(AnimateObjects)
  const ROTATE_SPEED = 15.0f32
  # Rotate about the Z axis (roll)
  let rotateQuat = constructQuaternion(ROTATE_SPEED * timeStep, vector3.FORWARD)
  for box in boxNodes:
    box.rotate(rotateQuat)

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
  subscribeToEvent("Update", handleMouseMove)
  quit runMainLoop()

main()
