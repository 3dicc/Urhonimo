

import 
  color, drawable, frustum, texture, material, matrix4, ptrs, urstr, urobject,
  stringHash, attribute, variant, octreequery, vector, debugrenderer,
  boundingbox, camera

discard "forward decl of Camera"
discard "forward decl of LightBatchQueue"
type 
  LightType* {.importcpp: "Urho3D::LightType".} = enum 
    LIGHT_DIRECTIONAL = 0, LIGHT_SPOT, LIGHT_POINT


var SHADOW_MIN_QUANTIZE* {.importc: "SHADOW_MIN_QUANTIZE", header: "Light.h".}: cfloat #= 0.1
var SHADOW_MIN_VIEW* {.importc: "SHADOW_MIN_VIEW", header: "Light.h".}: cfloat #= 1.0
var MAX_LIGHT_SPLITS* {.importc: "MAX_LIGHT_SPLITS", header: "Light.h".}: cint #= 6
var MAX_CASCADE_SPLITS* {.importc: "MAX_CASCADE_SPLITS", header: "Light.h".}: cint #= 4 or 1

proc constructBiasParameters*(): BiasParameters {.
    importcpp: "Urho3D::BiasParameters(@)", header: "Light.h".}
proc constructBiasParameters*(constantBias: cfloat; slopeScaledBias: cfloat): BiasParameters {.
    importcpp: "Urho3D::BiasParameters(@)", header: "Light.h".}
proc validate*(this: var BiasParameters) {.importcpp: "Validate", 
    header: "Light.h".}

type 
  CascadeParameters* {.importc: "Urho3D::CascadeParameters", header: "Light.h".} = object 
    splits* {.importc: "splits_".}: array[4, cfloat]
    fadeStart* {.importc: "fadeStart_".}: cfloat
    biasAutoAdjust* {.importc: "biasAutoAdjust_".}: cfloat


proc constructCascadeParameters*(): CascadeParameters {.
    importcpp: "Urho3D::CascadeParameters(@)", header: "Light.h".}
proc constructCascadeParameters*(split1: cfloat; split2: cfloat; split3: cfloat; 
                                 split4: cfloat; fadeStart: cfloat; 
                                 biasAutoAdjust: cfloat = 1.0): CascadeParameters {.
    importcpp: "Urho3D::CascadeParameters(@)", header: "Light.h".}
proc validate*(this: var CascadeParameters) {.importcpp: "Validate", 
    header: "Light.h".}
proc getShadowRange*(this: CascadeParameters): cfloat {.noSideEffect, 
    importcpp: "GetShadowRange", header: "Light.h".}

type 
  FocusParameters* {.importc: "Urho3D::FocusParameters", header: "Light.h".} = object 
    focus* {.importc: "focus_".}: bool
    nonUniform* {.importc: "nonUniform_".}: bool
    autoSize* {.importc: "autoSize_".}: bool
    quantize* {.importc: "quantize_".}: cfloat
    minView* {.importc: "minView_".}: cfloat


proc constructFocusParameters*(): FocusParameters {.
    importcpp: "Urho3D::FocusParameters(@)", header: "Light.h".}
proc constructFocusParameters*(focus: bool; nonUniform: bool; autoSize: bool; 
                               quantize: cfloat; minView: cfloat): FocusParameters {.
    importcpp: "Urho3D::FocusParameters(@)", header: "Light.h".}
proc validate*(this: var FocusParameters) {.importcpp: "Validate", 
    header: "Light.h".}

type 
  Light* {.importc: "Urho3D::Light", header: "Light.h".} = object of Drawable
    lightType* {.importc: "lightType_".}: LightType
    color* {.importc: "color_".}: Color
    shadowBias* {.importc: "shadowBias_".}: BiasParameters
    shadowCascade* {.importc: "shadowCascade_".}: CascadeParameters
    shadowFocus* {.importc: "shadowFocus_".}: FocusParameters
    volumeTransform* {.importc: "volumeTransform_".}: Matrix3x4
    rampTexture* {.importc: "rampTexture_".}: SharedPtr[Texture]
    shapeTexture* {.importc: "shapeTexture_".}: SharedPtr[Texture]
    #lightQueue* {.importc: "lightQueue_".}: ptr LightBatchQueue
    specularIntensity* {.importc: "specularIntensity_".}: cfloat
    brightness* {.importc: "brightness_".}: cfloat
    range* {.importc: "range_".}: cfloat
    fov* {.importc: "fov_".}: cfloat
    aspectRatio* {.importc: "aspectRatio_".}: cfloat
    fadeDistance* {.importc: "fadeDistance_".}: cfloat
    shadowFadeDistance* {.importc: "shadowFadeDistance_".}: cfloat
    shadowIntensity* {.importc: "shadowIntensity_".}: cfloat
    shadowResolution* {.importc: "shadowResolution_".}: cfloat
    shadowNearFarRatio* {.importc: "shadowNearFarRatio_".}: cfloat
    perVertex* {.importc: "perVertex_".}: bool


proc getType*(this: Light): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Light.h".}
proc getBaseType*(this: Light): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Light.h".}
proc getTypeName*(this: Light): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Light.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Light::GetTypeStatic(@)", header: "Light.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Light::GetTypeNameStatic(@)", header: "Light.h".}
proc constructLight*(context: ptr Context): Light {.
    importcpp: "Urho3D::Light(@)", header: "Light.h".}
proc destroyLight*(this: var Light) {.importcpp: "#.~Light()", header: "Light.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Light::RegisterObject(@)", header: "Light.h".}
proc onSetAttribute*(this: var Light; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "Light.h".}
proc processRayQuery*(this: var Light; query: RayOctreeQuery; 
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "Light.h".}
proc updateBatches*(this: var Light; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "Light.h".}
proc drawDebugGeometry*(this: var Light; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Light.h".}
proc setLightType*(this: var Light; `type`: LightType) {.
    importcpp: "SetLightType", header: "Light.h".}
proc setPerVertex*(this: var Light; enable: bool) {.importcpp: "SetPerVertex", 
    header: "Light.h".}
proc setColor*(this: var Light; color: Color) {.importcpp: "SetColor", 
    header: "Light.h".}
proc setSpecularIntensity*(this: var Light; intensity: cfloat) {.
    importcpp: "SetSpecularIntensity", header: "Light.h".}
proc setBrightness*(this: var Light; brightness: cfloat) {.
    importcpp: "SetBrightness", header: "Light.h".}
proc setRange*(this: var Light; range: cfloat) {.importcpp: "SetRange", 
    header: "Light.h".}
proc setFov*(this: var Light; fov: cfloat) {.importcpp: "SetFov", 
    header: "Light.h".}
proc setAspectRatio*(this: var Light; aspectRatio: cfloat) {.
    importcpp: "SetAspectRatio", header: "Light.h".}
proc setFadeDistance*(this: var Light; distance: cfloat) {.
    importcpp: "SetFadeDistance", header: "Light.h".}
proc setShadowFadeDistance*(this: var Light; distance: cfloat) {.
    importcpp: "SetShadowFadeDistance", header: "Light.h".}
proc setShadowBias*(this: var Light; parameters: BiasParameters) {.
    importcpp: "SetShadowBias", header: "Light.h".}
proc setShadowCascade*(this: var Light; parameters: CascadeParameters) {.
    importcpp: "SetShadowCascade", header: "Light.h".}
proc setShadowFocus*(this: var Light; parameters: FocusParameters) {.
    importcpp: "SetShadowFocus", header: "Light.h".}
proc setShadowIntensity*(this: var Light; intensity: cfloat) {.
    importcpp: "SetShadowIntensity", header: "Light.h".}
proc setShadowResolution*(this: var Light; resolution: cfloat) {.
    importcpp: "SetShadowResolution", header: "Light.h".}
proc setShadowNearFarRatio*(this: var Light; nearFarRatio: cfloat) {.
    importcpp: "SetShadowNearFarRatio", header: "Light.h".}
proc setRampTexture*(this: var Light; texture: ptr Texture) {.
    importcpp: "SetRampTexture", header: "Light.h".}
proc setShapeTexture*(this: var Light; texture: ptr Texture) {.
    importcpp: "SetShapeTexture", header: "Light.h".}
proc getLightType*(this: Light): LightType {.noSideEffect, 
    importcpp: "GetLightType", header: "Light.h".}
proc getPerVertex*(this: Light): bool {.noSideEffect, importcpp: "GetPerVertex", 
                                        header: "Light.h".}
proc getColor*(this: Light): Color {.noSideEffect, importcpp: "GetColor", 
                                     header: "Light.h".}
proc getSpecularIntensity*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetSpecularIntensity", header: "Light.h".}
proc getBrightness*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetBrightness", header: "Light.h".}
proc getEffectiveColor*(this: Light): Color {.noSideEffect, 
    importcpp: "GetEffectiveColor", header: "Light.h".}
proc getEffectiveSpecularIntensity*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetEffectiveSpecularIntensity", header: "Light.h".}
proc getRange*(this: Light): cfloat {.noSideEffect, importcpp: "GetRange", 
                                      header: "Light.h".}
proc getFov*(this: Light): cfloat {.noSideEffect, importcpp: "GetFov", 
                                    header: "Light.h".}
proc getAspectRatio*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetAspectRatio", header: "Light.h".}
proc getFadeDistance*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetFadeDistance", header: "Light.h".}
proc getShadowFadeDistance*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetShadowFadeDistance", header: "Light.h".}
proc getShadowBias*(this: Light): BiasParameters {.noSideEffect, 
    importcpp: "GetShadowBias", header: "Light.h".}
proc getShadowCascade*(this: Light): CascadeParameters {.noSideEffect, 
    importcpp: "GetShadowCascade", header: "Light.h".}
proc getShadowFocus*(this: Light): FocusParameters {.noSideEffect, 
    importcpp: "GetShadowFocus", header: "Light.h".}
proc getShadowIntensity*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetShadowIntensity", header: "Light.h".}
proc getShadowResolution*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetShadowResolution", header: "Light.h".}
proc getShadowNearFarRatio*(this: Light): cfloat {.noSideEffect, 
    importcpp: "GetShadowNearFarRatio", header: "Light.h".}
proc getRampTexture*(this: Light): ptr Texture {.noSideEffect, 
    importcpp: "GetRampTexture", header: "Light.h".}
proc getShapeTexture*(this: Light): ptr Texture {.noSideEffect, 
    importcpp: "GetShapeTexture", header: "Light.h".}
proc getFrustum*(this: Light): Frustum {.noSideEffect, importcpp: "GetFrustum", 
    header: "Light.h".}
proc getNumShadowSplits*(this: Light): cint {.noSideEffect, 
    importcpp: "GetNumShadowSplits", header: "Light.h".}
proc isNegative*(this: Light): bool {.noSideEffect, importcpp: "IsNegative", 
                                      header: "Light.h".}
proc setIntensitySortValue*(this: var Light; distance: cfloat) {.
    importcpp: "SetIntensitySortValue", header: "Light.h".}
proc setIntensitySortValue*(this: var Light; box: BoundingBox) {.
    importcpp: "SetIntensitySortValue", header: "Light.h".}
proc getDirLightTransform*(this: var Light; camera: ptr Camera; 
                           getNearQuad: bool = false): Matrix3x4 {.
    importcpp: "GetDirLightTransform", header: "Light.h".}
proc getVolumeTransform*(this: var Light; camera: ptr Camera): Matrix3x4 {.
    importcpp: "GetVolumeTransform", header: "Light.h".}
proc getIntensityDivisor*(this: Light; attenuation: cfloat = 1.0): cfloat {.
    noSideEffect, importcpp: "GetIntensityDivisor", header: "Light.h".}
proc setRampTextureAttr*(this: var Light; value: ResourceRef) {.
    importcpp: "SetRampTextureAttr", header: "Light.h".}
proc setShapeTextureAttr*(this: var Light; value: ResourceRef) {.
    importcpp: "SetShapeTextureAttr", header: "Light.h".}
proc getRampTextureAttr*(this: Light): ResourceRef {.noSideEffect, 
    importcpp: "GetRampTextureAttr", header: "Light.h".}
proc getShapeTextureAttr*(this: Light): ResourceRef {.noSideEffect, 
    importcpp: "GetShapeTextureAttr", header: "Light.h".}
proc compareLights*(lhs: ptr Light; rhs: ptr Light): bool {.noSideEffect, 
    importcpp: "Urho3D::CompareLights(@)", header: "Light.h".}

proc getLights*(this: Drawable): PODVector[ptr Light] {.noSideEffect, 
    importcpp: "GetLights", header: "Drawable.h".}
proc getVertexLights*(this: Drawable): PODVector[ptr Light] {.noSideEffect, 
    importcpp: "GetVertexLights", header: "Drawable.h".}
proc getFirstLight*(this: Drawable): ptr Light {.noSideEffect, 
    importcpp: "GetFirstLight", header: "Drawable.h".}

proc addLight*(this: var Drawable; light: ptr Light) {.importcpp: "AddLight", 
    header: "Drawable.h".}
proc addVertexLight*(this: var Drawable; light: ptr Light) {.
    importcpp: "AddVertexLight", header: "Drawable.h".}
