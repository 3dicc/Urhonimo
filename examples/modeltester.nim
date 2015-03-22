#
# This is a simple model tester application, use it like:
#
# modeltester mymodel.mdl mymodel.txt [myanimation.ani]

# Nim modules
import parseopt2, strutils
#import hashmap except Node

# Urhonimo modules
import ui, urhomain, processutils, color, urstr, stringHash, variant, text,
  uielement, octree, staticmodel, renderer, component, urhomain,
  resourcecache, scene, node, vector3, quaternion, model, material, light,
  camera, view, input, animationcontroller, animatedModel, rigidbody, collisionshape

# More Urhonimo modules, the stuff we copied from sample.nim
import xmlelement, engine, debughud, console, inputevents, graphicsdefs

# Needs to be included for proper linking
include urholink

# Enables auto-deref for this module, needed for simpler use of Urhonimo modules
{.experimental.}

const
  USAGE = """
Usage:
  modeltester [options] modelfile materialsfile [animationfile]

Arguments:
  modelfile      - A Urho3D .mdl file
  materialsfile  - A Urho3D .txt material list file
  animationfile  - An optional Urho3D .ani file

Options:
  -s,--static                  - Use a StaticModel instead, no animation
  -h,--help                    - Shows this help
  
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
  useStaticModel: bool = false
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


proc createScene() =
  var cache = urhomain.getSubsystemResourceCache()
  sc = cnew constructScene(getContext())
  discard createComponent[Octree](sc)
  var planeNode: ptr component.Node = sc.createChild("Plane")
  planeNode.setScale(constructVector3(100.0f32, 1.0f32, 100.0f32))
  var planeObject = createComponent[StaticModel](planeNode)
  planeObject.setModel(getResource[Model](cache, "Models/Plane.mdl"))
  planeObject.setMaterial(getResource[Material](cache, "Materials/StoneTiled.xml"))
  var lightNode: ptr Node = sc.createChild("DirectionalLight")
  lightNode.setDirection(constructVector3(0.6f32, -1.0f32, 0.8f32)) 
  var light: ptr Light = createComponent[Light](lightNode)
  light.setLightType(LIGHT_DIRECTIONAL)
  cameraNode = sc.createChild("Camera")
  discard createComponent[Camera](cameraNode)
  cameraNode.setPosition(constructVector3(0.0f32, 5.0f32, -20.0f32))

  # Create the node for our model to test
  objectNode = sc.createChild("object")
  objectNode.setPosition(constructVector3(0.0f32, 5.0f32, 0.0f32))

  # Create the rendering component + animation controller
  if useStaticModel:
    objStatic = createComponent[StaticModel](objectNode)
    objStatic.setModel(getResource[Model](cache, modelFn))
    if not materialsFn.isNil:
      obj.applyMaterialList(materialsFn)
  else:
    obj = createComponent[AnimatedModel](objectNode)
    obj.setModel(getResource[Model](cache, modelFn))
    if not materialsFn.isNil:
      obj.applyMaterialList(materialsFn)
    animCtrl = createComponent[AnimationController](objectNode)
    startAnimation()
  
proc setupViewport() =
  var renderer = urhomain.getSubsystemRenderer()
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
  var input = urhomain.getSubsystemInput()
  let mouseMove = input.getMouseMove()
  yaw += MOUSE_SENSITIVITY * mouseMove.x.float32
  pitch += MOUSE_SENSITIVITY * mouseMove.y.float32
  pitch = clamp(pitch, -90.0f32, 90.0f32)
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
        of "static", "s":
          useStaticModel = true
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
