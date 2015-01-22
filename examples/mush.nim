
import ui, urhomain, processutils, color, urstr, stringHash, variant, text,
  uielement, octree, staticmodel, renderer, component, urhomain,
  resourcecache, scene, node, vector3, quaternion, model, material, light,
  camera, view, input

from math import random
from inputevents import KEY_ESC

var
  sc: ptr Scene
  cameraNode: ptr Node

proc createScene() =
  var cache = urhomain.getSubsystemResourceCache()

  sc = cnew constructScene(getContext())

  # Create the Octree component to the scene. This is required before adding
  # any drawable components, or else nothing will show up. The default octree
  # volume will be from (-1000, -1000, -1000) to (1000, 1000, 1000) in world
  # coordinates; it is also legal to place objects outside the volume but their
  # visibility can then not be checked in a hierarchically optimizing manner
  discard createComponent[Octree](sc[])

  # Create a child scene node (at world origin) and a StaticModel component
  # into it. Set the StaticModel to show a simple plane mesh with a "stone"
  # material. Note that naming the scene nodes is optional. Scale the scene
  # node larger (100 x 100 world units)
  var planeNode: ptr component.Node = sc[].createChild("Plane")
  planeNode[].setScale(constructVector3(100.0f32, 1.0f32, 100.0f32))
  var planeObject = createComponent[StaticModel](planeNode[])
  planeObject[].setModel(getResource[Model](cache[], "Models/Plane.mdl"))
  planeObject[].setMaterial(getResource[Material](cache[], "Materials/StoneTiled.xml"))

  # Create a directional light to the world so that we can see something. The
  # light scene node's orientation controls the light direction; we will use
  # the setDirection() function which calculates the orientation from a forward
  # direction vector.
  # The light will use default settings (white light, no shadows)
  var lightNode: ptr Node = sc[].createChild("DirectionalLight")
  lightNode[].setDirection(constructVector3(0.6f32, -1.0f32, 0.8f32)) 
  # The direction vector does not need to be normalized
  var light: ptr Light = createComponent[Light](lightNode[])
  light[].setLightType(LIGHT_DIRECTIONAL)

  # Create more StaticModel objects to the scene, randomly positioned,
  # rotated and scaled. For rotation, we construct a
  # quaternion from Euler angles where the Y angle (rotation about the Y axis)
  # is randomized. The mushroom model contains LOD levels, so the StaticModel
  # component will automatically select the LOD level according to the view
  # distance (you'll see the model get simpler as it moves further away).
  # Finally, rendering a large number of the same object with the
  # same material allows instancing to be used, if the GPU supports it.
  # This reduces the amount of CPU work in rendering the scene.
  for i in 0.. <200:
    var mushroomNode = sc[].createChild("Mushroom")
    mushroomNode[].setPosition(constructVector3(random(90.0) - 45.0f32, 0.0f32,
                                                random(90.0) - 45.0f32))
    mushroomNode[].setRotation(constructQuaternion(0.0f32, random(360.0f32), 0.0f32))
    mushroomNode[].setScale(0.5f32 + random(2.0f32))

    var mushroomObject = createComponent[StaticModel](mushroomNode[])
    mushroomObject[].setModel(getResource[Model](cache[], "Models/Mushroom.mdl"))
    mushroomObject[].setMaterial(getResource[Material](cache[], "Materials/Mushroom.xml"))
  # Create a scene node for the camera, which we will move around
  # The camera will use default settings (1000 far clip distance,
  # 45 degrees FOV, set aspect ratio automatically)
  cameraNode = sc[].createChild("Camera")
  discard createComponent[Camera](cameraNode[])

  # Set an initial position for the camera scene node above the plane
  cameraNode[].setPosition(constructVector3(0.0f32, 5.0f32, 0.0f32))

proc setupViewport() =
  var renderer = urhomain.getSubsystemRenderer()

  # Set up a viewport to the Renderer subsystem so that the 3D scene can be
  # seen. We need to define the scene and the camera
  # at minimum. Additionally we could configure the viewport screen size and
  # the rendering path (eg. forward / deferred) to
  # use, but now we just use full screen and default render path configured in
  # the engine command line options
  var viewport = cnew constructViewport(getContext(), sc,
    getComponent[Camera](cameraNode[]))
  renderer[].setViewport(0, viewport)

# Movement speed as world units per second
const MOVE_SPEED = 20.0f32
# Mouse sensitivity as degrees per pixel
const MOUSE_SENSITIVITY = 0.1f32

var
  yaw: float32
  pitch: float32
  touchEnabled: bool

proc moveCamera(timeStep: float32) =
  # Do not move if the UI has a focused element (the console)
  #if (GetSubsystem<UI>()->GetFocusElement())
  #    return;

  var input = urhomain.getSubsystemInput()
  # Use this frame's mouse motion to adjust camera node yaw and pitch.
  # Clamp the pitch between -90 and 90 degrees
  let mouseMove = input[].getMouseMove()
  yaw += MOUSE_SENSITIVITY * mouseMove.x.float32
  pitch += MOUSE_SENSITIVITY * mouseMove.y.float32
  pitch = clamp(pitch, -90.0f32, 90.0f32)

  # Construct new orientation for the camera scene node from yaw and pitch.
  # Roll is fixed to zero
  cameraNode[].setRotation(constructQuaternion(pitch, yaw, 0.0f32))

  # Read WASD keys and move the camera scene node to the corresponding
  # direction if they are pressed
  # Use the Translate() function (default local space) to move relative
  # to the node's orientation.
  if input[].getKeyDown('W'):
    cameraNode[].translate(vector3.FORWARD * MOVE_SPEED * timeStep)
  if input[].getKeyDown('S'):
    cameraNode[].translate(vector3.BACK * MOVE_SPEED * timeStep)
  if input[].getKeyDown('A'):
    cameraNode[].translate(vector3.LEFT * MOVE_SPEED * timeStep)
  if input[].getKeyDown('D'):
    cameraNode[].translate(vector3.RIGHT * MOVE_SPEED * timeStep)
  if input[].getKeyDown(KEY_ESC):
    closeUrho3D()


proc handleUpdate(userData: pointer; eventType: StringHash;
                  eventData: pointer) {.cdecl.} =
  moveCamera(getTimeStep(eventData))

proc main =
  parseArguments()

  openUrho3D(true)

  createScene()
  setupViewport()
  registerEvent(handleUpdate, nil, "SceneUpdate")
  let exitCode = runMainLoop()
  quit exitCode

main()
