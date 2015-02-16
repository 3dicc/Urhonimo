import urhomain, stringHash, variant, octree, renderer, component,
  resourcecache, scene, node, vector3, camera, view, input, context,
  ptrs, drawable2d, graphics, particleemitter2d, particleeffect2d, engine

import hashmap except Node

# enable auto-deref:
{.experimental.}

var
  cam: ptr Camera
  particleNode: ptr Node
  sc: ptr Scene
  
proc createScene() =
  # Get it so we can load resources
  var cache = getSubsystemResourceCache()

  # Create a Scene, cnew is a special proc we use to call wrapped C++ constructors.
  sc = cnew constructScene(getContext())
  
  # We just need to add the Octree. At the moment we can't write this as:
  #   sc.createComponent[Octree]()
  # But Andreas is fixing that.
  discard createComponent[Octree](sc)

  # Urho uses this style to instantiate specific types of Nodes 
  var cameraNode = sc.createChild("Camera")
  # vec3 is Vector3 in Urho3D
  cameraNode.setPosition(vec3(0.0f32, 0.0f32, -10.0f32))

  # Attaching a Camera component (behavior) to the node
  cam = createComponent[Camera](cameraNode)
  cam.setOrthographic(true)

  # Another style of getting a subsystem, not sure why we use generics sometimes
  var graphics = getSubsystem[Graphics]()
  cam.setOrthoSize(graphics.getHeight().float * PIXEL_SIZE)

  # Again, since we use generics we must pass cache as first param instead
  # of writing it in OOP style
  var particleEffect = getResource[ParticleEffect2D](cache, "Urho2D/sun.pex")
  if particleEffect.isNil: return

  particleNode = sc.createChild("ParticleEmitter2D")
  var particleEmitter = createComponent[ParticleEmitter2D](particleNode)
  particleEmitter.setEffect(particleEffect)

  var greenSpiralEffect = getResource[ParticleEffect2D](cache, "Urho2D/greenspiral.pex")
  if greenSpiralEffect.isNil: return

  var greenSpiralNode = sc.createChild("GreenSpiral")
  var greenSpiralEmitter = createComponent[ParticleEmitter2D](greenSpiralNode)
  greenSpiralEmitter.setEffect(greenSpiralEffect)

  # Construc a viewport and set it for the renderer
  var viewport = cnew constructViewport(getContext(), sc, cam)
  getSubsystemRenderer().setViewport(0, viewport)

# A handler for MouseMove that we subscribe to
proc handleMouseMove(userData: pointer; eventType: StringHash;
                  eventData: var VariantMap) {.cdecl.} =
  if not particleNode.isNil:
    let x = eventData["x"].getInt().float
    let y = eventData["y"].getInt().float
    var graphics = getSubsystem[Graphics]()
    particleNode.setPosition(cam.screenToWorldPoint(
      vec3(x / graphics.getWidth().float, y / graphics.getHeight().float, 10.0f32)))

proc main =
  parseArguments()
  openUrho3D(false)
  getSubsystemInput().setMouseVisible(true)
  createScene()
  subscribeToEvent("MouseMove", handleMouseMove)
  quit runMainLoop()

main()
