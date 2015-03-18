

import
  billboardSet

discard "forward decl of ParticleEffect"
type
  Particle* {.importcpp: "Urho3D::Particle", header: "ParticleEmitter.h".} = object
    velocity* {.importc: "velocity_".}: Vector3
    size* {.importc: "size_".}: Vector2
    timer* {.importc: "timer_".}: cfloat
    timeToLive* {.importc: "timeToLive_".}: cfloat
    scale* {.importc: "scale_".}: cfloat
    rotationSpeed* {.importc: "rotationSpeed_".}: cfloat
    colorIndex* {.importc: "colorIndex_".}: cuint
    texIndex* {.importc: "texIndex_".}: cuint



type
  ParticleEmitter* {.importcpp: "Urho3D::ParticleEmitter",
                     header: "ParticleEmitter.h".} = object of BillboardSet
    effect* {.importc: "effect_".}: SharedPtr[ParticleEffect]
    particles* {.importc: "particles_".}: PODVector[Particle]
    periodTimer* {.importc: "periodTimer_".}: cfloat
    emissionTimer* {.importc: "emissionTimer_".}: cfloat
    lastTimeStep* {.importc: "lastTimeStep_".}: cfloat
    lastUpdateFrameNumber* {.importc: "lastUpdateFrameNumber_".}: cuint
    emitting* {.importc: "emitting_".}: bool
    needUpdate* {.importc: "needUpdate_".}: bool
    serializeParticles* {.importc: "serializeParticles_".}: bool


proc getType*(this: ParticleEmitter): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "ParticleEmitter.h".}
proc getBaseType*(this: ParticleEmitter): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ParticleEmitter.h".}
proc getTypeName*(this: ParticleEmitter): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ParticleEmitter.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ParticleEmitter::GetTypeStatic(@)",
    header: "ParticleEmitter.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ParticleEmitter::GetTypeNameStatic(@)",
    header: "ParticleEmitter.h".}
proc constructParticleEmitter*(context: ptr Context): ParticleEmitter {.
    importcpp: "Urho3D::ParticleEmitter(@)", header: "ParticleEmitter.h",
    constructor.}
proc destroyParticleEmitter*(this: var ParticleEmitter) {.
    importcpp: "#.~ParticleEmitter()", header: "ParticleEmitter.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ParticleEmitter::RegisterObject(@)",
    header: "ParticleEmitter.h".}
proc onSetEnabled*(this: var ParticleEmitter) {.importcpp: "OnSetEnabled",
    header: "ParticleEmitter.h".}
proc update*(this: var ParticleEmitter; frame: FrameInfo) {.importcpp: "Update",
    header: "ParticleEmitter.h".}
proc setEffect*(this: var ParticleEmitter; effect: ptr ParticleEffect) {.
    importcpp: "SetEffect", header: "ParticleEmitter.h".}
proc setNumParticles*(this: var ParticleEmitter; num: cuint) {.
    importcpp: "SetNumParticles", header: "ParticleEmitter.h".}
proc setEmitting*(this: var ParticleEmitter; enable: bool) {.
    importcpp: "SetEmitting", header: "ParticleEmitter.h".}
proc setSerializeParticles*(this: var ParticleEmitter; enable: bool) {.
    importcpp: "SetSerializeParticles", header: "ParticleEmitter.h".}
proc resetEmissionTimer*(this: var ParticleEmitter) {.
    importcpp: "ResetEmissionTimer", header: "ParticleEmitter.h".}
proc removeAllParticles*(this: var ParticleEmitter) {.
    importcpp: "RemoveAllParticles", header: "ParticleEmitter.h".}
proc reset*(this: var ParticleEmitter) {.importcpp: "Reset",
    header: "ParticleEmitter.h".}
proc applyEffect*(this: var ParticleEmitter) {.importcpp: "ApplyEffect",
    header: "ParticleEmitter.h".}
proc getEffect*(this: ParticleEmitter): ptr ParticleEffect {.noSideEffect,
    importcpp: "GetEffect", header: "ParticleEmitter.h".}
proc getNumParticles*(this: ParticleEmitter): cuint {.noSideEffect,
    importcpp: "GetNumParticles", header: "ParticleEmitter.h".}
proc isEmitting*(this: ParticleEmitter): bool {.noSideEffect,
    importcpp: "IsEmitting", header: "ParticleEmitter.h".}
proc getSerializeParticles*(this: ParticleEmitter): bool {.noSideEffect,
    importcpp: "GetSerializeParticles", header: "ParticleEmitter.h".}
proc setEffectAttr*(this: var ParticleEmitter; value: ResourceRef) {.
    importcpp: "SetEffectAttr", header: "ParticleEmitter.h".}
proc getEffectAttr*(this: ParticleEmitter): ResourceRef {.noSideEffect,
    importcpp: "GetEffectAttr", header: "ParticleEmitter.h".}
proc setParticlesAttr*(this: var ParticleEmitter; value: VariantVector) {.
    importcpp: "SetParticlesAttr", header: "ParticleEmitter.h".}
proc getParticlesAttr*(this: ParticleEmitter): VariantVector {.noSideEffect,
    importcpp: "GetParticlesAttr", header: "ParticleEmitter.h".}
proc getParticleBillboardsAttr*(this: ParticleEmitter): VariantVector {.
    noSideEffect, importcpp: "GetParticleBillboardsAttr",
    header: "ParticleEmitter.h".}
