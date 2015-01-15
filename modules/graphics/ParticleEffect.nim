

import 
  resource


type 
  EmitterType* = enum 
    EMITTER_SPHERE, EMITTER_BOX



type 
  ColorFrame* {.importc: "Urho3D::ColorFrame", header: "ParticleEffect.h".} = object 
    color* {.importc: "color_".}: Color
    time* {.importc: "time_".}: cfloat


proc constructColorFrame*(): ColorFrame {.importcpp: "Urho3D::ColorFrame(@)", 
    header: "ParticleEffect.h".}
proc constructColorFrame*(color: Color): ColorFrame {.
    importcpp: "Urho3D::ColorFrame(@)", header: "ParticleEffect.h".}
proc constructColorFrame*(color: Color; time: cfloat): ColorFrame {.
    importcpp: "Urho3D::ColorFrame(@)", header: "ParticleEffect.h".}
proc interpolate*(this: ColorFrame; next: ColorFrame; time: cfloat): Color {.
    noSideEffect, importcpp: "Interpolate", header: "ParticleEffect.h".}

type 
  TextureFrame* {.importc: "Urho3D::TextureFrame", header: "ParticleEffect.h".} = object 
    uv* {.importc: "uv_".}: Rect
    time* {.importc: "time_".}: cfloat


proc constructTextureFrame*(): TextureFrame {.
    importcpp: "Urho3D::TextureFrame(@)", header: "ParticleEffect.h".}
var DEFAULT_NUM_PARTICLES* {.importc: "DEFAULT_NUM_PARTICLES", 
                             header: "ParticleEffect.h".}: cuint = 10

discard "forward decl of Material"
discard "forward decl of XMLFile"
discard "forward decl of XMLElement"
type 
  ParticleEffect* {.importc: "Urho3D::ParticleEffect", 
                    header: "ParticleEffect.h".} = object of Resource
    material* {.importc: "material_".}: SharedPtr[Material]
    numParticles* {.importc: "numParticles_".}: cuint
    updateInvisible* {.importc: "updateInvisible_".}: bool
    relative* {.importc: "relative_".}: bool
    scaled* {.importc: "scaled_".}: bool
    sorted* {.importc: "sorted_".}: bool
    animationLodBias* {.importc: "animationLodBias_".}: cfloat
    emitterType* {.importc: "emitterType_".}: EmitterType
    emitterSize* {.importc: "emitterSize_".}: Vector3
    directionMin* {.importc: "directionMin_".}: Vector3
    directionMax* {.importc: "directionMax_".}: Vector3
    constantForce* {.importc: "constantForce_".}: Vector3
    dampingForce* {.importc: "dampingForce_".}: cfloat
    activeTime* {.importc: "activeTime_".}: cfloat
    inactiveTime* {.importc: "inactiveTime_".}: cfloat
    emissionRateMin* {.importc: "emissionRateMin_".}: cfloat
    emissionRateMax* {.importc: "emissionRateMax_".}: cfloat
    sizeMin* {.importc: "sizeMin_".}: Vector2
    sizeMax* {.importc: "sizeMax_".}: Vector2
    timeToLiveMin* {.importc: "timeToLiveMin_".}: cfloat
    timeToLiveMax* {.importc: "timeToLiveMax_".}: cfloat
    velocityMin* {.importc: "velocityMin_".}: cfloat
    velocityMax* {.importc: "velocityMax_".}: cfloat
    rotationMin* {.importc: "rotationMin_".}: cfloat
    rotationMax* {.importc: "rotationMax_".}: cfloat
    rotationSpeedMin* {.importc: "rotationSpeedMin_".}: cfloat
    rotationSpeedMax* {.importc: "rotationSpeedMax_".}: cfloat
    sizeAdd* {.importc: "sizeAdd_".}: cfloat
    sizeMul* {.importc: "sizeMul_".}: cfloat
    colorFrames* {.importc: "colorFrames_".}: Vector[ColorFrame]
    textureFrames* {.importc: "textureFrames_".}: Vector[TextureFrame]
    loadMaterialName* {.importc: "loadMaterialName_".}: UrString


proc getType*(this: ParticleEffect): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ParticleEffect.h".}
proc getBaseType*(this: ParticleEffect): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ParticleEffect.h".}
proc getTypeName*(this: ParticleEffect): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ParticleEffect.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ParticleEffect::GetTypeStatic(@)", 
    header: "ParticleEffect.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ParticleEffect::GetTypeNameStatic(@)", 
    header: "ParticleEffect.h".}
proc constructParticleEffect*(context: ptr Context): ParticleEffect {.
    importcpp: "Urho3D::ParticleEffect(@)", header: "ParticleEffect.h".}
proc destroyParticleEffect*(this: var ParticleEffect) {.
    importcpp: "#.~ParticleEffect()", header: "ParticleEffect.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ParticleEffect::RegisterObject(@)", 
    header: "ParticleEffect.h".}
proc beginLoad*(this: var ParticleEffect; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "ParticleEffect.h".}
proc endLoad*(this: var ParticleEffect): bool {.importcpp: "EndLoad", 
    header: "ParticleEffect.h".}
proc save*(this: ParticleEffect; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "ParticleEffect.h".}
proc setMaterial*(this: var ParticleEffect; material: ptr Material) {.
    importcpp: "SetMaterial", header: "ParticleEffect.h".}
proc setNumParticles*(this: var ParticleEffect; num: cuint) {.
    importcpp: "SetNumParticles", header: "ParticleEffect.h".}
proc setUpdateInvisible*(this: var ParticleEffect; enable: bool) {.
    importcpp: "SetUpdateInvisible", header: "ParticleEffect.h".}
proc setRelative*(this: var ParticleEffect; enable: bool) {.
    importcpp: "SetRelative", header: "ParticleEffect.h".}
proc setScaled*(this: var ParticleEffect; enable: bool) {.
    importcpp: "SetScaled", header: "ParticleEffect.h".}
proc setSorted*(this: var ParticleEffect; enable: bool) {.
    importcpp: "SetSorted", header: "ParticleEffect.h".}
proc setAnimationLodBias*(this: var ParticleEffect; lodBias: cfloat) {.
    importcpp: "SetAnimationLodBias", header: "ParticleEffect.h".}
proc setEmitterType*(this: var ParticleEffect; `type`: EmitterType) {.
    importcpp: "SetEmitterType", header: "ParticleEffect.h".}
proc setEmitterSize*(this: var ParticleEffect; size: Vector3) {.
    importcpp: "SetEmitterSize", header: "ParticleEffect.h".}
proc setMinDirection*(this: var ParticleEffect; direction: Vector3) {.
    importcpp: "SetMinDirection", header: "ParticleEffect.h".}
proc setMaxDirection*(this: var ParticleEffect; direction: Vector3) {.
    importcpp: "SetMaxDirection", header: "ParticleEffect.h".}
proc setConstantForce*(this: var ParticleEffect; force: Vector3) {.
    importcpp: "SetConstantForce", header: "ParticleEffect.h".}
proc setDampingForce*(this: var ParticleEffect; force: cfloat) {.
    importcpp: "SetDampingForce", header: "ParticleEffect.h".}
proc setActiveTime*(this: var ParticleEffect; time: cfloat) {.
    importcpp: "SetActiveTime", header: "ParticleEffect.h".}
proc setInactiveTime*(this: var ParticleEffect; time: cfloat) {.
    importcpp: "SetInactiveTime", header: "ParticleEffect.h".}
proc setMinEmissionRate*(this: var ParticleEffect; rate: cfloat) {.
    importcpp: "SetMinEmissionRate", header: "ParticleEffect.h".}
proc setMaxEmissionRate*(this: var ParticleEffect; rate: cfloat) {.
    importcpp: "SetMaxEmissionRate", header: "ParticleEffect.h".}
proc setMinParticleSize*(this: var ParticleEffect; size: Vector2) {.
    importcpp: "SetMinParticleSize", header: "ParticleEffect.h".}
proc setMaxParticleSize*(this: var ParticleEffect; size: Vector2) {.
    importcpp: "SetMaxParticleSize", header: "ParticleEffect.h".}
proc setMinTimeToLive*(this: var ParticleEffect; time: cfloat) {.
    importcpp: "SetMinTimeToLive", header: "ParticleEffect.h".}
proc setMaxTimeToLive*(this: var ParticleEffect; time: cfloat) {.
    importcpp: "SetMaxTimeToLive", header: "ParticleEffect.h".}
proc setMinVelocity*(this: var ParticleEffect; velocity: cfloat) {.
    importcpp: "SetMinVelocity", header: "ParticleEffect.h".}
proc setMaxVelocity*(this: var ParticleEffect; velocity: cfloat) {.
    importcpp: "SetMaxVelocity", header: "ParticleEffect.h".}
proc setMinRotation*(this: var ParticleEffect; rotation: cfloat) {.
    importcpp: "SetMinRotation", header: "ParticleEffect.h".}
proc setMaxRotation*(this: var ParticleEffect; rotation: cfloat) {.
    importcpp: "SetMaxRotation", header: "ParticleEffect.h".}
proc setMinRotationSpeed*(this: var ParticleEffect; speed: cfloat) {.
    importcpp: "SetMinRotationSpeed", header: "ParticleEffect.h".}
proc setMaxRotationSpeed*(this: var ParticleEffect; speed: cfloat) {.
    importcpp: "SetMaxRotationSpeed", header: "ParticleEffect.h".}
proc setSizeAdd*(this: var ParticleEffect; sizeAdd: cfloat) {.
    importcpp: "SetSizeAdd", header: "ParticleEffect.h".}
proc setSizeMul*(this: var ParticleEffect; sizeMul: cfloat) {.
    importcpp: "SetSizeMul", header: "ParticleEffect.h".}
proc setColorFrames*(this: var ParticleEffect; colorFrames: Vector[ColorFrame]) {.
    importcpp: "SetColorFrames", header: "ParticleEffect.h".}
proc setColorFrame*(this: var ParticleEffect; index: cuint; 
                    colorFrame: ColorFrame) {.importcpp: "SetColorFrame", 
    header: "ParticleEffect.h".}
proc setTextureFrames*(this: var ParticleEffect; animation: Vector[TextureFrame]) {.
    importcpp: "SetTextureFrames", header: "ParticleEffect.h".}
proc setTextureFrame*(this: var ParticleEffect; index: cuint; 
                      textureFrame: TextureFrame) {.
    importcpp: "SetTextureFrame", header: "ParticleEffect.h".}
proc getMaterial*(this: ParticleEffect): ptr Material {.noSideEffect, 
    importcpp: "GetMaterial", header: "ParticleEffect.h".}
proc getNumParticles*(this: ParticleEffect): cuint {.noSideEffect, 
    importcpp: "GetNumParticles", header: "ParticleEffect.h".}
proc getUpdateInvisible*(this: ParticleEffect): bool {.noSideEffect, 
    importcpp: "GetUpdateInvisible", header: "ParticleEffect.h".}
proc isRelative*(this: ParticleEffect): bool {.noSideEffect, 
    importcpp: "IsRelative", header: "ParticleEffect.h".}
proc isScaled*(this: ParticleEffect): bool {.noSideEffect, 
    importcpp: "IsScaled", header: "ParticleEffect.h".}
proc isSorted*(this: ParticleEffect): bool {.noSideEffect, 
    importcpp: "IsSorted", header: "ParticleEffect.h".}
proc getAnimationLodBias*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetAnimationLodBias", header: "ParticleEffect.h".}
proc getEmitterType*(this: ParticleEffect): EmitterType {.noSideEffect, 
    importcpp: "GetEmitterType", header: "ParticleEffect.h".}
proc getEmitterSize*(this: ParticleEffect): Vector3 {.noSideEffect, 
    importcpp: "GetEmitterSize", header: "ParticleEffect.h".}
proc getMinDirection*(this: ParticleEffect): Vector3 {.noSideEffect, 
    importcpp: "GetMinDirection", header: "ParticleEffect.h".}
proc getMaxDirection*(this: ParticleEffect): Vector3 {.noSideEffect, 
    importcpp: "GetMaxDirection", header: "ParticleEffect.h".}
proc getConstantForce*(this: ParticleEffect): Vector3 {.noSideEffect, 
    importcpp: "GetConstantForce", header: "ParticleEffect.h".}
proc getDampingForce*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetDampingForce", header: "ParticleEffect.h".}
proc getActiveTime*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetActiveTime", header: "ParticleEffect.h".}
proc getInactiveTime*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetInactiveTime", header: "ParticleEffect.h".}
proc getMinEmissionRate*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMinEmissionRate", header: "ParticleEffect.h".}
proc getMaxEmissionRate*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMaxEmissionRate", header: "ParticleEffect.h".}
proc getMinParticleSize*(this: ParticleEffect): Vector2 {.noSideEffect, 
    importcpp: "GetMinParticleSize", header: "ParticleEffect.h".}
proc getMaxParticleSize*(this: ParticleEffect): Vector2 {.noSideEffect, 
    importcpp: "GetMaxParticleSize", header: "ParticleEffect.h".}
proc getMinTimeToLive*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMinTimeToLive", header: "ParticleEffect.h".}
proc getMaxTimeToLive*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMaxTimeToLive", header: "ParticleEffect.h".}
proc getMinVelocity*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMinVelocity", header: "ParticleEffect.h".}
proc getMaxVelocity*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMaxVelocity", header: "ParticleEffect.h".}
proc getMinRotation*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMinRotation", header: "ParticleEffect.h".}
proc getMaxRotation*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMaxRotation", header: "ParticleEffect.h".}
proc getMinRotationSpeed*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMinRotationSpeed", header: "ParticleEffect.h".}
proc getMaxRotationSpeed*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetMaxRotationSpeed", header: "ParticleEffect.h".}
proc getSizeAdd*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetSizeAdd", header: "ParticleEffect.h".}
proc getSizeMul*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetSizeMul", header: "ParticleEffect.h".}
proc getColorFrames*(this: ParticleEffect): Vector[ColorFrame] {.noSideEffect, 
    importcpp: "GetColorFrames", header: "ParticleEffect.h".}
proc getNumColorFrames*(this: ParticleEffect): cuint {.noSideEffect, 
    importcpp: "GetNumColorFrames", header: "ParticleEffect.h".}
proc getColorFrame*(this: ParticleEffect; index: cuint): ptr ColorFrame {.
    noSideEffect, importcpp: "GetColorFrame", header: "ParticleEffect.h".}
proc getTextureFrames*(this: ParticleEffect): Vector[TextureFrame] {.
    noSideEffect, importcpp: "GetTextureFrames", header: "ParticleEffect.h".}
proc getNumTextureFrames*(this: ParticleEffect): cuint {.noSideEffect, 
    importcpp: "GetNumTextureFrames", header: "ParticleEffect.h".}
proc getTextureFrame*(this: ParticleEffect; index: cuint): ptr TextureFrame {.
    noSideEffect, importcpp: "GetTextureFrame", header: "ParticleEffect.h".}
proc getRandomDirection*(this: ParticleEffect): Vector3 {.noSideEffect, 
    importcpp: "GetRandomDirection", header: "ParticleEffect.h".}
proc getRandomSize*(this: ParticleEffect): Vector2 {.noSideEffect, 
    importcpp: "GetRandomSize", header: "ParticleEffect.h".}
proc getRandomVelocity*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetRandomVelocity", header: "ParticleEffect.h".}
proc getRandomTimeToLive*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetRandomTimeToLive", header: "ParticleEffect.h".}
proc getRandomRotationSpeed*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetRandomRotationSpeed", header: "ParticleEffect.h".}
proc getRandomRotation*(this: ParticleEffect): cfloat {.noSideEffect, 
    importcpp: "GetRandomRotation", header: "ParticleEffect.h".}