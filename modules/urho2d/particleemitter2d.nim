

import 
  drawable2D, urobject, urstr, vector, vector2, vector3, color, ptrs,
  particleeffect2d, stringhash, drawable, variant

discard "forward decl of ParticleEffect2D"
type 
  Particle2D* {.importc: "Urho3D::Particle2D", header: "ParticleEmitter2D.h".} = object 
    timeToLive* {.importc: "timeToLive_".}: cfloat
    position* {.importc: "position_".}: Vector2
    size* {.importc: "size_".}: cfloat
    sizeDelta* {.importc: "sizeDelta_".}: cfloat
    rotation* {.importc: "rotation_".}: cfloat
    rotationDelta* {.importc: "rotationDelta_".}: cfloat
    color* {.importc: "color_".}: Color
    colorDelta* {.importc: "colorDelta_".}: Color
    startPos* {.importc: "startPos_".}: Vector2
    velocity* {.importc: "velocity_".}: Vector2
    radialAcceleration* {.importc: "radialAcceleration_".}: cfloat
    tangentialAcceleration* {.importc: "tangentialAcceleration_".}: cfloat
    emitRadius* {.importc: "emitRadius_".}: cfloat
    emitRadiusDelta* {.importc: "emitRadiusDelta_".}: cfloat
    emitRotation* {.importc: "emitRotation_".}: cfloat
    emitRotationDelta* {.importc: "emitRotationDelta_".}: cfloat



type 
  ParticleEmitter2D* {.importc: "Urho3D::ParticleEmitter2D", 
                       header: "ParticleEmitter2D.h".} = object of Drawable2D
    effect* {.importc: "effect_".}: SharedPtr[ParticleEffect2D]
    numParticles* {.importc: "numParticles_".}: cint
    emissionTime* {.importc: "emissionTime_".}: cfloat
    emitParticleTime* {.importc: "emitParticleTime_".}: cfloat
    particles* {.importc: "particles_".}: Vector[Particle2D]
    boundingBoxMinPoint* {.importc: "boundingBoxMinPoint_".}: Vector3
    boundingBoxMaxPoint* {.importc: "boundingBoxMaxPoint_".}: Vector3


proc getType*(this: ParticleEmitter2D): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ParticleEmitter2D.h".}
proc getBaseType*(this: ParticleEmitter2D): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ParticleEmitter2D.h".}
proc getTypeName*(this: ParticleEmitter2D): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ParticleEmitter2D.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::ParticleEmitter2D::GetTypeStatic(@)", 
    header: "ParticleEmitter2D.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::ParticleEmitter2D::GetTypeNameStatic(@)", 
    header: "ParticleEmitter2D.h".}
proc constructParticleEmitter2D*(context: ptr Context): ParticleEmitter2D {.
    importcpp: "Urho3D::ParticleEmitter2D(@)", header: "ParticleEmitter2D.h".}
proc destroyParticleEmitter2D*(this: var ParticleEmitter2D) {.
    importcpp: "#.~ParticleEmitter2D()", header: "ParticleEmitter2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ParticleEmitter2D::RegisterObject(@)", 
    header: "ParticleEmitter2D.h".}
proc onSetEnabled*(this: var ParticleEmitter2D) {.importcpp: "OnSetEnabled", 
    header: "ParticleEmitter2D.h".}
proc update*(this: var ParticleEmitter2D; frame: FrameInfo) {.
    importcpp: "Update", header: "ParticleEmitter2D.h".}
proc setEffect*(this: var ParticleEmitter2D; effect: ptr ParticleEffect2D) {.
    importcpp: "SetEffect", header: "ParticleEmitter2D.h".}
proc setMaxParticles*(this: var ParticleEmitter2D; maxParticles: cuint) {.
    importcpp: "SetMaxParticles", header: "ParticleEmitter2D.h".}
proc getEffect*(this: ParticleEmitter2D): ptr ParticleEffect2D {.noSideEffect, 
    importcpp: "GetEffect", header: "ParticleEmitter2D.h".}
proc getMaxParticles*(this: ParticleEmitter2D): cuint {.noSideEffect, 
    importcpp: "GetMaxParticles", header: "ParticleEmitter2D.h".}
proc setParticleEffectAttr*(this: var ParticleEmitter2D; value: ResourceRef) {.
    importcpp: "SetParticleEffectAttr", header: "ParticleEmitter2D.h".}
proc getParticleEffectAttr*(this: ParticleEmitter2D): ResourceRef {.
    noSideEffect, importcpp: "GetParticleEffectAttr", 
    header: "ParticleEmitter2D.h".}
