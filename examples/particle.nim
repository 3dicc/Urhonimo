import ui, urhomain, processutils, color, urstr, stringHash, variant, text,
  uielement, octree, staticmodel, renderer, component, urhomain, 
  resourcecache, scene, node, vector3, quaternion, model, material, light,
  camera, view, input, inputevents, controls, urobject, logiccomponent, context,
  zone, boundingbox, drawable, ptrs,drawable2d,
  unsigned, graphics, file, filesystem, image, xmlelement,
  particleemitter2d, particleeffect2d, engine

#import ui, urhomain, processutils, color, urstr, stringHash, variant, text,
#  uielement, octree, renderer, component, vector3, 
#  resourcecache, scene, node, quaternion, 
#  camera, view, input, inputevents, urobject, logiccomponent,
#  boundingbox, drawable, ptrs, unsigned, graphics, file, filesystem, engine,
#  urho2d, particleemitter2d, particleeffect2d


#include <Urho3D/Graphics/Camera.h>
#include <Urho3D/Core/CoreEvents.h>
#include <Urho3D/Engine/Engine.h>
#include <Urho3D/UI/Font.h>
#include <Urho3D/Graphics/Graphics.h>
#include <Urho3D/Input/Input.h>
#include <Urho3D/Input/InputEvents.h>
#include <Urho3D/Graphics/Octree.h>
#include <Urho3D/Urho2D/ParticleEmitter2D.h>
#include <Urho3D/Urho2D/ParticleEffect2D.h>
#include <Urho3D/Graphics/Renderer.h>
#include <Urho3D/Resource/ResourceCache.h>
#include <Urho3D/Scene/Scene.h>
#include <Urho3D/UI/Text.h>
#include <Urho3D/Graphics/Zone.h>


# enable auto-deref:
{.experimental.}

const
  PIXEL_SIZE = 0.01f32

var
  cam: ptr Camera
  particleNode: ptr Node
  sc: ptr Scene
  
proc createScene() =
  var cache = urhomain.getSubsystemResourceCache()
  sc = cnew constructScene(getContext())
  discard createComponent[Octree](sc[])

  var cameraNode = sc.createChild("Camera")
  cameraNode.setPosition(vec3(0.0f32, 0.0f32, -10.0f32))

  cam = createComponent[Camera](cameraNode)
  cam.setOrthographic(true)

  var graphics = getSubsystem[Graphics]()
  cam.setOrthoSize(graphics.getHeight().float * PIXEL_SIZE)

  var particleEffect = getResource[ParticleEffect2D](cache, "Urho3D/sun.pex")
  if not particleEffect: return

  particleNode = sc.createChild("ParticleEmitter2D")
  var particleEmitter = createComponent[ParticleEmitter2D](particleNode)
  particleEmitter.setEffect(particleEffect)

  var greenSpiralEffect = getResource[ParticleEffect2D](cache, "Urho2D/greenspiral.pex")
  if not greenSpiralEffect: return

  var greenSpiralNode = sc.createChild("GreenSpiral")
  var greenSpiralEmitter = createComponent[ParticleEmitter2D](greenSpiralNode)
  greenSpiralEmitter.setEffect(greenSpiralEffect)

  var renderer = urhomain.getSubsystemRenderer()
  var viewport = cnew constructViewport(getContext(), sc, camera)
  renderer[].setViewport(0, viewport)

#void Urho2DParticle::CreateInstructions()
#{
#    ResourceCache* cache = GetSubsystem<ResourceCache>();
#    UI* ui = GetSubsystem<UI>();
#
#    // Construct new Text object, set string to display and font to use
#    Text* instructionText = ui->GetRoot()->CreateChild<Text>();
#    instructionText->SetText("Use mouse/touch to move the particle.");
#    instructionText->SetFont(cache->GetResource<Font>("Fonts/Anonymous Pro.ttf"), 15);
#
#    // Position the text relative to the screen center
#    instructionText->SetHorizontalAlignment(HA_CENTER);
#    instructionText->SetVerticalAlignment(VA_CENTER);
#    instructionText->SetPosition(0, ui->GetRoot()->GetHeight() / 4);
#}

proc handleMouseMove(userData: pointer; eventType: StringHash;
                  eventData: var VariantMap) {.cdecl.} =
  if not particleNode isNil:
    let x = eventData["P_X"].getInt().float
    let y = eventData["P_Y"].getInt().float
    var graphics = urhomain.getSubsystemGraphics();
    #var camera = getComponent[Camera](cameraNode)
    particleNode.setPosition(cam.screenToWorldPoint(vec3(x / graphics.getWidth(), y / graphics.getHeight(), 10.0f)))


proc main =
  parseArguments()

  openUrho3D(false)

  #registerParticleClass(getContext())

  urhomain.getSubsystemInput().setMouseVisible(true)

  createScene()

  subscribeToEvent("MouseMove", handleMouseMove)

  let exitCode = runMainLoop()
  quit exitCode

main()
