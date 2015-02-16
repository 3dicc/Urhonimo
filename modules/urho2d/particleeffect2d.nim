

import 
  resource, graphicsDefs, vector2, ptrs, sprite2d, color, urstr, stringHash,
  urobject, deserializer, serializer

discard "forward decl of XMLElement"
discard "forward decl of Sprite2D"
type 
  EmitterType2D* {.importcpp: "Urho3D::EmitterType2D".} = enum 
    EMITTER_TYPE_GRAVITY = 0, EMITTER_TYPE_RADIAL



type 
  ParticleEffect2D* {.importc: "Urho3D::ParticleEffect2D", 
                      header: "ParticleEffect2D.h".} = object of Resource
    sprite* {.importc: "sprite_".}: SharedPtr[Sprite2D]
    sourcePositionVariance* {.importc: "sourcePositionVariance_".}: Vector2
    speed* {.importc: "speed_".}: cfloat
    speedVariance* {.importc: "speedVariance_".}: cfloat
    particleLifeSpan* {.importc: "particleLifeSpan_".}: cfloat
    particleLifespanVariance* {.importc: "particleLifespanVariance_".}: cfloat
    angle* {.importc: "angle_".}: cfloat
    angleVariance* {.importc: "angleVariance_".}: cfloat
    gravity* {.importc: "gravity_".}: Vector2
    radialAcceleration* {.importc: "radialAcceleration_".}: cfloat
    tangentialAcceleration* {.importc: "tangentialAcceleration_".}: cfloat
    radialAccelVariance* {.importc: "radialAccelVariance_".}: cfloat
    tangentialAccelVariance* {.importc: "tangentialAccelVariance_".}: cfloat
    startColor* {.importc: "startColor_".}: Color
    startColorVariance* {.importc: "startColorVariance_".}: Color
    finishColor* {.importc: "finishColor_".}: Color
    finishColorVariance* {.importc: "finishColorVariance_".}: Color
    maxParticles* {.importc: "maxParticles_".}: cint
    startParticleSize* {.importc: "startParticleSize_".}: cfloat
    startParticleSizeVariance* {.importc: "startParticleSizeVariance_".}: cfloat
    finishParticleSize* {.importc: "finishParticleSize_".}: cfloat
    finishParticleSizeVariance* {.importc: "FinishParticleSizeVariance_".}: cfloat
    duration* {.importc: "duration_".}: cfloat
    emitterType* {.importc: "emitterType_".}: EmitterType2D
    maxRadius* {.importc: "maxRadius_".}: cfloat
    maxRadiusVariance* {.importc: "maxRadiusVariance_".}: cfloat
    minRadius* {.importc: "minRadius_".}: cfloat
    minRadiusVariance* {.importc: "minRadiusVariance_".}: cfloat
    rotatePerSecond* {.importc: "rotatePerSecond_".}: cfloat
    rotatePerSecondVariance* {.importc: "rotatePerSecondVariance_".}: cfloat
    blendMode* {.importc: "blendMode_".}: BlendMode
    rotationStart* {.importc: "rotationStart_".}: cfloat
    rotationStartVariance* {.importc: "rotationStartVariance_".}: cfloat
    rotationEnd* {.importc: "rotationEnd_".}: cfloat
    rotationEndVariance* {.importc: "rotationEndVariance_".}: cfloat
    loadSpriteName* {.importc: "loadSpriteName_".}: UrString


proc getType*(this: ParticleEffect2D): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ParticleEffect2D.h".}
proc getBaseType*(this: ParticleEffect2D): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ParticleEffect2D.h".}
proc getTypeName*(this: ParticleEffect2D): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ParticleEffect2D.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::ParticleEffect2D::GetTypeStatic(@)", 
    header: "ParticleEffect2D.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::ParticleEffect2D::GetTypeNameStatic(@)", 
    header: "ParticleEffect2D.h".}
proc constructParticleEffect2D*(context: ptr Context): ParticleEffect2D {.
    importcpp: "Urho3D::ParticleEffect2D(@)", header: "ParticleEffect2D.h".}
proc destroyParticleEffect2D*(this: var ParticleEffect2D) {.
    importcpp: "#.~ParticleEffect2D()", header: "ParticleEffect2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ParticleEffect2D::RegisterObject(@)", 
    header: "ParticleEffect2D.h".}
proc beginLoad*(this: var ParticleEffect2D; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "ParticleEffect2D.h".}
proc endLoad*(this: var ParticleEffect2D): bool {.importcpp: "EndLoad", 
    header: "ParticleEffect2D.h".}
proc save*(this: ParticleEffect2D; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "ParticleEffect2D.h".}
proc setSprite*(this: var ParticleEffect2D; sprite: ptr Sprite2D) {.
    importcpp: "SetSprite", header: "ParticleEffect2D.h".}
proc setSourcePositionVariance*(this: var ParticleEffect2D; 
                                sourcePositionVariance: Vector2) {.
    importcpp: "SetSourcePositionVariance", header: "ParticleEffect2D.h".}
proc setSpeed*(this: var ParticleEffect2D; speed: cfloat) {.
    importcpp: "SetSpeed", header: "ParticleEffect2D.h".}
proc setSpeedVariance*(this: var ParticleEffect2D; speedVariance: cfloat) {.
    importcpp: "SetSpeedVariance", header: "ParticleEffect2D.h".}
proc setParticleLifeSpan*(this: var ParticleEffect2D; particleLifeSpan: cfloat) {.
    importcpp: "SetParticleLifeSpan", header: "ParticleEffect2D.h".}
proc setParticleLifespanVariance*(this: var ParticleEffect2D; 
                                  particleLifespanVariance: cfloat) {.
    importcpp: "SetParticleLifespanVariance", header: "ParticleEffect2D.h".}
proc setAngle*(this: var ParticleEffect2D; angle: cfloat) {.
    importcpp: "SetAngle", header: "ParticleEffect2D.h".}
proc setAngleVariance*(this: var ParticleEffect2D; angleVariance: cfloat) {.
    importcpp: "SetAngleVariance", header: "ParticleEffect2D.h".}
proc setGravity*(this: var ParticleEffect2D; gravity: Vector2) {.
    importcpp: "SetGravity", header: "ParticleEffect2D.h".}
proc setRadialAcceleration*(this: var ParticleEffect2D; 
                            radialAcceleration: cfloat) {.
    importcpp: "SetRadialAcceleration", header: "ParticleEffect2D.h".}
proc setTangentialAcceleration*(this: var ParticleEffect2D; 
                                tangentialAcceleration: cfloat) {.
    importcpp: "SetTangentialAcceleration", header: "ParticleEffect2D.h".}
proc setRadialAccelVariance*(this: var ParticleEffect2D; 
                             radialAccelVariance: cfloat) {.
    importcpp: "SetRadialAccelVariance", header: "ParticleEffect2D.h".}
proc setTangentialAccelVariance*(this: var ParticleEffect2D; 
                                 tangentialAccelVariance: cfloat) {.
    importcpp: "SetTangentialAccelVariance", header: "ParticleEffect2D.h".}
proc setStartColor*(this: var ParticleEffect2D; startColor: Color) {.
    importcpp: "SetStartColor", header: "ParticleEffect2D.h".}
proc setStartColorVariance*(this: var ParticleEffect2D; 
                            startColorVariance: Color) {.
    importcpp: "SetStartColorVariance", header: "ParticleEffect2D.h".}
proc setFinishColor*(this: var ParticleEffect2D; finishColor: Color) {.
    importcpp: "SetFinishColor", header: "ParticleEffect2D.h".}
proc setFinishColorVariance*(this: var ParticleEffect2D; 
                             finishColorVariance: Color) {.
    importcpp: "SetFinishColorVariance", header: "ParticleEffect2D.h".}
proc setMaxParticles*(this: var ParticleEffect2D; maxParticles: cint) {.
    importcpp: "SetMaxParticles", header: "ParticleEffect2D.h".}
proc setStartParticleSize*(this: var ParticleEffect2D; startParticleSize: cfloat) {.
    importcpp: "SetStartParticleSize", header: "ParticleEffect2D.h".}
proc setStartParticleSizeVariance*(this: var ParticleEffect2D; 
                                   startParticleSizeVariance: cfloat) {.
    importcpp: "SetStartParticleSizeVariance", header: "ParticleEffect2D.h".}
proc setFinishParticleSize*(this: var ParticleEffect2D; 
                            finishParticleSize: cfloat) {.
    importcpp: "SetFinishParticleSize", header: "ParticleEffect2D.h".}
proc setFinishParticleSizeVariance*(this: var ParticleEffect2D; 
                                    finishParticleSizeVariance: cfloat) {.
    importcpp: "SetFinishParticleSizeVariance", header: "ParticleEffect2D.h".}
proc setDuration*(this: var ParticleEffect2D; duration: cfloat) {.
    importcpp: "SetDuration", header: "ParticleEffect2D.h".}
proc setEmitterType*(this: var ParticleEffect2D; emitterType: EmitterType2D) {.
    importcpp: "SetEmitterType", header: "ParticleEffect2D.h".}
proc setMaxRadius*(this: var ParticleEffect2D; maxRadius: cfloat) {.
    importcpp: "SetMaxRadius", header: "ParticleEffect2D.h".}
proc setMaxRadiusVariance*(this: var ParticleEffect2D; maxRadiusVariance: cfloat) {.
    importcpp: "SetMaxRadiusVariance", header: "ParticleEffect2D.h".}
proc setMinRadius*(this: var ParticleEffect2D; minRadius: cfloat) {.
    importcpp: "SetMinRadius", header: "ParticleEffect2D.h".}
proc setMinRadiusVariance*(this: var ParticleEffect2D; minRadiusVariance: cfloat) {.
    importcpp: "SetMinRadiusVariance", header: "ParticleEffect2D.h".}
proc setRotatePerSecond*(this: var ParticleEffect2D; rotatePerSecond: cfloat) {.
    importcpp: "SetRotatePerSecond", header: "ParticleEffect2D.h".}
proc setRotatePerSecondVariance*(this: var ParticleEffect2D; 
                                 rotatePerSecondVariance: cfloat) {.
    importcpp: "SetRotatePerSecondVariance", header: "ParticleEffect2D.h".}
proc setBlendMode*(this: var ParticleEffect2D; blendMode: BlendMode) {.
    importcpp: "SetBlendMode", header: "ParticleEffect2D.h".}
proc setRotationStart*(this: var ParticleEffect2D; rotationStart: cfloat) {.
    importcpp: "SetRotationStart", header: "ParticleEffect2D.h".}
proc setRotationStartVariance*(this: var ParticleEffect2D; 
                               rotationStartVariance: cfloat) {.
    importcpp: "SetRotationStartVariance", header: "ParticleEffect2D.h".}
proc setRotationEnd*(this: var ParticleEffect2D; rotationEnd: cfloat) {.
    importcpp: "SetRotationEnd", header: "ParticleEffect2D.h".}
proc setRotationEndVariance*(this: var ParticleEffect2D; 
                             rotationEndVariance: cfloat) {.
    importcpp: "SetRotationEndVariance", header: "ParticleEffect2D.h".}
proc getSprite*(this: ParticleEffect2D): ptr Sprite2D {.noSideEffect, 
    importcpp: "GetSprite", header: "ParticleEffect2D.h".}
proc getSourcePositionVariance*(this: ParticleEffect2D): Vector2 {.noSideEffect, 
    importcpp: "GetSourcePositionVariance", header: "ParticleEffect2D.h".}
proc getSpeed*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetSpeed", header: "ParticleEffect2D.h".}
proc getSpeedVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetSpeedVariance", header: "ParticleEffect2D.h".}
proc getParticleLifeSpan*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetParticleLifeSpan", header: "ParticleEffect2D.h".}
proc getParticleLifespanVariance*(this: ParticleEffect2D): cfloat {.
    noSideEffect, importcpp: "GetParticleLifespanVariance", 
    header: "ParticleEffect2D.h".}
proc getAngle*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetAngle", header: "ParticleEffect2D.h".}
proc getAngleVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetAngleVariance", header: "ParticleEffect2D.h".}
proc getGravity*(this: ParticleEffect2D): Vector2 {.noSideEffect, 
    importcpp: "GetGravity", header: "ParticleEffect2D.h".}
proc getRadialAcceleration*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRadialAcceleration", header: "ParticleEffect2D.h".}
proc getTangentialAcceleration*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetTangentialAcceleration", header: "ParticleEffect2D.h".}
proc getRadialAccelVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRadialAccelVariance", header: "ParticleEffect2D.h".}
proc getTangentialAccelVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetTangentialAccelVariance", header: "ParticleEffect2D.h".}
proc getStartColor*(this: ParticleEffect2D): Color {.noSideEffect, 
    importcpp: "GetStartColor", header: "ParticleEffect2D.h".}
proc getStartColorVariance*(this: ParticleEffect2D): Color {.noSideEffect, 
    importcpp: "GetStartColorVariance", header: "ParticleEffect2D.h".}
proc getFinishColor*(this: ParticleEffect2D): Color {.noSideEffect, 
    importcpp: "GetFinishColor", header: "ParticleEffect2D.h".}
proc getFinishColorVariance*(this: ParticleEffect2D): Color {.noSideEffect, 
    importcpp: "GetFinishColorVariance", header: "ParticleEffect2D.h".}
proc getMaxParticles*(this: ParticleEffect2D): cint {.noSideEffect, 
    importcpp: "GetMaxParticles", header: "ParticleEffect2D.h".}
proc getStartParticleSize*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetStartParticleSize", header: "ParticleEffect2D.h".}
proc getStartParticleSizeVariance*(this: ParticleEffect2D): cfloat {.
    noSideEffect, importcpp: "GetStartParticleSizeVariance", 
    header: "ParticleEffect2D.h".}
proc getFinishParticleSize*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetFinishParticleSize", header: "ParticleEffect2D.h".}
proc getFinishParticleSizeVariance*(this: ParticleEffect2D): cfloat {.
    noSideEffect, importcpp: "GetFinishParticleSizeVariance", 
    header: "ParticleEffect2D.h".}
proc getDuration*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetDuration", header: "ParticleEffect2D.h".}
proc getEmitterType*(this: ParticleEffect2D): EmitterType2D {.noSideEffect, 
    importcpp: "GetEmitterType", header: "ParticleEffect2D.h".}
proc getMaxRadius*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxRadius", header: "ParticleEffect2D.h".}
proc getMaxRadiusVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxRadiusVariance", header: "ParticleEffect2D.h".}
proc getMinRadius*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetMinRadius", header: "ParticleEffect2D.h".}
proc getMinRadiusVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetMinRadiusVariance", header: "ParticleEffect2D.h".}
proc getRotatePerSecond*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRotatePerSecond", header: "ParticleEffect2D.h".}
proc getRotatePerSecondVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRotatePerSecondVariance", header: "ParticleEffect2D.h".}
proc getBlendMode*(this: ParticleEffect2D): BlendMode {.noSideEffect, 
    importcpp: "GetBlendMode", header: "ParticleEffect2D.h".}
proc getRotationStart*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRotationStart", header: "ParticleEffect2D.h".}
proc getRotationStartVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRotationStartVariance", header: "ParticleEffect2D.h".}
proc getRotationEnd*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRotationEnd", header: "ParticleEffect2D.h".}
proc getRotationEndVariance*(this: ParticleEffect2D): cfloat {.noSideEffect, 
    importcpp: "GetRotationEndVariance", header: "ParticleEffect2D.h".}
