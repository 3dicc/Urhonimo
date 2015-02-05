

import 
  batch, color, drawable, hashSet, mutex, viewport, urobject, ptrs, urstr,
  stringHash, graphics, renderpath, zone, graphics.geometry, vertexbuffer,
  material, texture2d, texturecube, vector, occlusionbuffer, hashmap,
  component, light, pair, camera, rect, view, rendersurface, octree, technique,
  graphicsdefs, xmlelement

discard "forward decl of Geometry"
discard "forward decl of Drawable"
discard "forward decl of Light"
discard "forward decl of Material"
discard "forward decl of Pass"
discard "forward decl of Technique"
discard "forward decl of Octree"
discard "forward decl of Graphics"
discard "forward decl of RenderPath"
discard "forward decl of RenderSurface"
discard "forward decl of ResourceCache"
discard "forward decl of Skeleton"
discard "forward decl of OcclusionBuffer"
discard "forward decl of Texture2D"
discard "forward decl of TextureCube"
discard "forward decl of View"
discard "forward decl of Zone"
var SHADOW_MIN_PIXELS* {.importc: "SHADOW_MIN_PIXELS", header: "Renderer.h".}: cint #= 64

var INSTANCING_BUFFER_DEFAULT_SIZE* {.importc: "INSTANCING_BUFFER_DEFAULT_SIZE", 
                                      header: "Renderer.h".}: cint #= 1024


type 
  LightVSVariation* {.importcpp: "Urho3D::LightVSVariation".} = enum 
    LVS_DIR = 0, LVS_SPOT, LVS_POINT, LVS_SHADOW, LVS_SPOTSHADOW, 
    LVS_POINTSHADOW, MAX_LIGHT_VS_VARIATIONS



type 
  VertexLightVSVariation* {.importcpp: "Urho3D::VertexLightVSVariation".} = enum 
    VLVS_NOLIGHTS = 0, VLVS_1LIGHT, VLVS_2LIGHTS, VLVS_3LIGHTS, VLVS_4LIGHTS, 
    MAX_VERTEXLIGHT_VS_VARIATIONS



type 
  LightPSVariation* {.importcpp: "Urho3D::LightPSVariation".} = enum 
    LPS_NONE = 0, LPS_SPOT, LPS_POINT, LPS_POINTMASK, LPS_SPEC, LPS_SPOTSPEC, 
    LPS_POINTSPEC, LPS_POINTMASKSPEC, LPS_SHADOW, LPS_SPOTSHADOW, 
    LPS_POINTSHADOW, LPS_POINTMASKSHADOW, LPS_SHADOWSPEC, LPS_SPOTSHADOWSPEC, 
    LPS_POINTSHADOWSPEC, LPS_POINTMASKSHADOWSPEC, MAX_LIGHT_PS_VARIATIONS



type 
  DeferredLightVSVariation* {.importcpp: "Urho3D::DeferredLightVSVariation".} = enum 
    DLVS_NONE = 0, DLVS_DIR, DLVS_ORTHO, DLVS_ORTHODIR, 
    MAX_DEFERRED_LIGHT_VS_VARIATIONS



type 
  DeferredLightPSVariation* {.importcpp: "Urho3D::DeferredLightPSVariation".} = enum 
    DLPS_NONE = 0, DLPS_SPOT, DLPS_POINT, DLPS_POINTMASK, DLPS_SPEC, 
    DLPS_SPOTSPEC, DLPS_POINTSPEC, DLPS_POINTMASKSPEC, DLPS_SHADOW, 
    DLPS_SPOTSHADOW, DLPS_POINTSHADOW, DLPS_POINTMASKSHADOW, DLPS_SHADOWSPEC, 
    DLPS_SPOTSHADOWSPEC, DLPS_POINTSHADOWSPEC, DLPS_POINTMASKSHADOWSPEC, 
    DLPS_ORTHO, DLPS_ORTHOSPOT, DLPS_ORTHOPOINT, DLPS_ORTHOPOINTMASK, 
    DLPS_ORTHOSPEC, DLPS_ORTHOSPOTSPEC, DLPS_ORTHOPOINTSPEC, 
    DLPS_ORTHOPOINTMASKSPEC, DLPS_ORTHOSHADOW, DLPS_ORTHOSPOTSHADOW, 
    DLPS_ORTHOPOINTSHADOW, DLPS_ORTHOPOINTMASKSHADOW, DLPS_ORTHOSHADOWSPEC, 
    DLPS_ORTHOSPOTSHADOWSPEC, DLPS_ORTHOPOINTSHADOWSPEC, 
    DLPS_ORTHOPOINTMASKSHADOWSPEC, MAX_DEFERRED_LIGHT_PS_VARIATIONS



type 
  Renderer* {.importc: "Urho3D::Renderer", header: "Renderer.h".} = object of UrObject
    graphics* {.importc: "graphics_".}: WeakPtr[Graphics]
    defaultRenderPath* {.importc: "defaultRenderPath_".}: SharedPtr[RenderPath]
    defaultZone* {.importc: "defaultZone_".}: SharedPtr[Zone]
    dirLightGeometry* {.importc: "dirLightGeometry_".}: SharedPtr[Geometry]
    spotLightGeometry* {.importc: "spotLightGeometry_".}: SharedPtr[Geometry]
    pointLightGeometry* {.importc: "pointLightGeometry_".}: SharedPtr[Geometry]
    instancingBuffer* {.importc: "instancingBuffer_".}: SharedPtr[VertexBuffer]
    defaultMaterial* {.importc: "defaultMaterial_".}: SharedPtr[Material]
    defaultLightRamp* {.importc: "defaultLightRamp_".}: SharedPtr[Texture2D]
    defaultLightSpot* {.importc: "defaultLightSpot_".}: SharedPtr[Texture2D]
    faceSelectCubeMap* {.importc: "faceSelectCubeMap_".}: SharedPtr[TextureCube]
    indirectionCubeMap* {.importc: "indirectionCubeMap_".}: SharedPtr[
        TextureCube]
    shadowCameraNodes* {.importc: "shadowCameraNodes_".}: Vector[SharedPtr[component.Node]]
    occlusionBuffers* {.importc: "occlusionBuffers_".}: Vector[
        SharedPtr[OcclusionBuffer]]
    shadowMaps* {.importc: "shadowMaps_".}: HashMap[cint, 
        Vector[SharedPtr[Texture2D]]]
    colorShadowMaps* {.importc: "colorShadowMaps_".}: HashMap[cint, 
        SharedPtr[Texture2D]]
    shadowMapAllocations* {.importc: "shadowMapAllocations_".}: HashMap[cint, 
        PODVector[ptr Light]]
    screenBuffers* {.importc: "screenBuffers_".}: HashMap[clonglong, 
        Vector[SharedPtr[Texture2D]]]
    screenBufferAllocations* {.importc: "screenBufferAllocations_".}: HashMap[
        clonglong, cuint]
    savedScreenBufferAllocations* {.importc: "savedScreenBufferAllocations_".}: HashMap[
        clonglong, cuint]
    lightScissorCache* {.importc: "lightScissorCache_".}: HashMap[
        Pair[ptr Light, ptr Camera], Rect]
    viewports* {.importc: "viewports_".}: Vector[SharedPtr[Viewport]]
    queuedViewports* {.importc: "queuedViewports_".}: Vector[
        Pair[WeakPtr[RenderSurface], WeakPtr[Viewport]]]
    views* {.importc: "views_".}: Vector[WeakPtr[View]]
    updatedOctrees* {.importc: "updatedOctrees_".}: HashSet[ptr Octree]
    shaderErrorDisplayed* {.importc: "shaderErrorDisplayed_".}: HashSet[
        ptr Technique]
    rendererMutex* {.importc: "rendererMutex_".}: Mutex
    deferredLightPSVariations* {.importc: "deferredLightPSVariations_".}: Vector[
        UrString]
    frame* {.importc: "frame_".}: FrameInfo
    textureAnisotropy* {.importc: "textureAnisotropy_".}: cint
    textureFilterMode* {.importc: "textureFilterMode_".}: TextureFilterMode
    textureQuality* {.importc: "textureQuality_".}: cint
    materialQuality* {.importc: "materialQuality_".}: cint
    shadowMapSize* {.importc: "shadowMapSize_".}: cint
    shadowQuality* {.importc: "shadowQuality_".}: cint
    maxShadowMaps* {.importc: "maxShadowMaps_".}: cint
    minInstances* {.importc: "minInstances_".}: cint
    maxInstanceTriangles* {.importc: "maxInstanceTriangles_".}: cint
    maxSortedInstances* {.importc: "maxSortedInstances_".}: cint
    maxOccluderTriangles* {.importc: "maxOccluderTriangles_".}: cint
    occlusionBufferSize* {.importc: "occlusionBufferSize_".}: cint
    occluderSizeThreshold* {.importc: "occluderSizeThreshold_".}: cfloat
    mobileShadowBiasMul* {.importc: "mobileShadowBiasMul_".}: cfloat
    mobileShadowBiasAdd* {.importc: "mobileShadowBiasAdd_".}: cfloat
    numOcclusionBuffers* {.importc: "numOcclusionBuffers_".}: cuint
    numShadowCameras* {.importc: "numShadowCameras_".}: cuint
    numPrimitives* {.importc: "numPrimitives_".}: cuint
    numBatches* {.importc: "numBatches_".}: cuint
    shadersChangedFrameNumber* {.importc: "shadersChangedFrameNumber_".}: cuint
    lightStencilValue* {.importc: "lightStencilValue_".}: cuchar
    hdrRendering* {.importc: "hdrRendering_".}: bool
    specularLighting* {.importc: "specularLighting_".}: bool
    drawShadows* {.importc: "drawShadows_".}: bool
    reuseShadowMaps* {.importc: "reuseShadowMaps_".}: bool
    dynamicInstancing* {.importc: "dynamicInstancing_".}: bool
    shadersDirty* {.importc: "shadersDirty_".}: bool
    initialized* {.importc: "initialized_".}: bool
    resetViews* {.importc: "resetViews_".}: bool


proc getType*(this: Renderer): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Renderer.h".}
proc getBaseType*(this: Renderer): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Renderer.h".}
proc getTypeName*(this: Renderer): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Renderer.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Renderer::GetTypeStatic(@)", header: "Renderer.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Renderer::GetTypeNameStatic(@)", header: "Renderer.h".}
proc constructRenderer*(context: ptr Context): Renderer {.
    importcpp: "Urho3D::Renderer(@)", header: "Renderer.h".}
proc destroyRenderer*(this: var Renderer) {.importcpp: "#.~Renderer()", 
    header: "Renderer.h".}
proc setNumViewports*(this: var Renderer; num: cuint) {.
    importcpp: "SetNumViewports", header: "Renderer.h".}
proc setViewport*(this: var Renderer; index: cuint; viewport: ptr Viewport) {.
    importcpp: "SetViewport", header: "Renderer.h".}
proc setDefaultRenderPath*(this: var Renderer; renderPath: ptr RenderPath) {.
    importcpp: "SetDefaultRenderPath", header: "Renderer.h".}
proc setDefaultRenderPath*(this: var Renderer; file: ptr XMLFile) {.
    importcpp: "SetDefaultRenderPath", header: "Renderer.h".}
proc setHDRRendering*(this: var Renderer; enable: bool) {.
    importcpp: "SetHDRRendering", header: "Renderer.h".}
proc setSpecularLighting*(this: var Renderer; enable: bool) {.
    importcpp: "SetSpecularLighting", header: "Renderer.h".}
proc setTextureAnisotropy*(this: var Renderer; level: cint) {.
    importcpp: "SetTextureAnisotropy", header: "Renderer.h".}
proc setTextureFilterMode*(this: var Renderer; mode: TextureFilterMode) {.
    importcpp: "SetTextureFilterMode", header: "Renderer.h".}
proc setTextureQuality*(this: var Renderer; quality: cint) {.
    importcpp: "SetTextureQuality", header: "Renderer.h".}
proc setMaterialQuality*(this: var Renderer; quality: cint) {.
    importcpp: "SetMaterialQuality", header: "Renderer.h".}
proc setDrawShadows*(this: var Renderer; enable: bool) {.
    importcpp: "SetDrawShadows", header: "Renderer.h".}
proc setShadowMapSize*(this: var Renderer; size: cint) {.
    importcpp: "SetShadowMapSize", header: "Renderer.h".}
proc setShadowQuality*(this: var Renderer; quality: cint) {.
    importcpp: "SetShadowQuality", header: "Renderer.h".}
proc setReuseShadowMaps*(this: var Renderer; enable: bool) {.
    importcpp: "SetReuseShadowMaps", header: "Renderer.h".}
proc setMaxShadowMaps*(this: var Renderer; shadowMaps: cint) {.
    importcpp: "SetMaxShadowMaps", header: "Renderer.h".}
proc setDynamicInstancing*(this: var Renderer; enable: bool) {.
    importcpp: "SetDynamicInstancing", header: "Renderer.h".}
proc setMinInstances*(this: var Renderer; instances: cint) {.
    importcpp: "SetMinInstances", header: "Renderer.h".}
proc setMaxInstanceTriangles*(this: var Renderer; triangles: cint) {.
    importcpp: "SetMaxInstanceTriangles", header: "Renderer.h".}
proc setMaxSortedInstances*(this: var Renderer; instances: cint) {.
    importcpp: "SetMaxSortedInstances", header: "Renderer.h".}
proc setMaxOccluderTriangles*(this: var Renderer; triangles: cint) {.
    importcpp: "SetMaxOccluderTriangles", header: "Renderer.h".}
proc setOcclusionBufferSize*(this: var Renderer; size: cint) {.
    importcpp: "SetOcclusionBufferSize", header: "Renderer.h".}
proc setOccluderSizeThreshold*(this: var Renderer; screenSize: cfloat) {.
    importcpp: "SetOccluderSizeThreshold", header: "Renderer.h".}
proc setMobileShadowBiasMul*(this: var Renderer; mul: cfloat) {.
    importcpp: "SetMobileShadowBiasMul", header: "Renderer.h".}
proc setMobileShadowBiasAdd*(this: var Renderer; add: cfloat) {.
    importcpp: "SetMobileShadowBiasAdd", header: "Renderer.h".}
proc reloadShaders*(this: var Renderer) {.importcpp: "ReloadShaders", 
    header: "Renderer.h".}
proc getNumViewports*(this: Renderer): cuint {.noSideEffect, 
    importcpp: "GetNumViewports", header: "Renderer.h".}
proc getViewport*(this: Renderer; index: cuint): ptr Viewport {.noSideEffect, 
    importcpp: "GetViewport", header: "Renderer.h".}
proc getDefaultRenderPath*(this: Renderer): ptr RenderPath {.noSideEffect, 
    importcpp: "GetDefaultRenderPath", header: "Renderer.h".}
proc getHDRRendering*(this: Renderer): bool {.noSideEffect, 
    importcpp: "GetHDRRendering", header: "Renderer.h".}
proc getSpecularLighting*(this: Renderer): bool {.noSideEffect, 
    importcpp: "GetSpecularLighting", header: "Renderer.h".}
proc getDrawShadows*(this: Renderer): bool {.noSideEffect, 
    importcpp: "GetDrawShadows", header: "Renderer.h".}
proc getTextureAnisotropy*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetTextureAnisotropy", header: "Renderer.h".}
proc getTextureFilterMode*(this: Renderer): TextureFilterMode {.noSideEffect, 
    importcpp: "GetTextureFilterMode", header: "Renderer.h".}
proc getTextureQuality*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetTextureQuality", header: "Renderer.h".}
proc getMaterialQuality*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetMaterialQuality", header: "Renderer.h".}
proc getShadowMapSize*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetShadowMapSize", header: "Renderer.h".}
proc getShadowQuality*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetShadowQuality", header: "Renderer.h".}
proc getReuseShadowMaps*(this: Renderer): bool {.noSideEffect, 
    importcpp: "GetReuseShadowMaps", header: "Renderer.h".}
proc getMaxShadowMaps*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetMaxShadowMaps", header: "Renderer.h".}
proc getDynamicInstancing*(this: Renderer): bool {.noSideEffect, 
    importcpp: "GetDynamicInstancing", header: "Renderer.h".}
proc getMinInstances*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetMinInstances", header: "Renderer.h".}
proc getMaxInstanceTriangles*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetMaxInstanceTriangles", header: "Renderer.h".}
proc getMaxSortedInstances*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetMaxSortedInstances", header: "Renderer.h".}
proc getMaxOccluderTriangles*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetMaxOccluderTriangles", header: "Renderer.h".}
proc getOcclusionBufferSize*(this: Renderer): cint {.noSideEffect, 
    importcpp: "GetOcclusionBufferSize", header: "Renderer.h".}
proc getOccluderSizeThreshold*(this: Renderer): cfloat {.noSideEffect, 
    importcpp: "GetOccluderSizeThreshold", header: "Renderer.h".}
proc getMobileShadowBiasMul*(this: Renderer): cfloat {.noSideEffect, 
    importcpp: "GetMobileShadowBiasMul", header: "Renderer.h".}
proc getMobileShadowBiasAdd*(this: Renderer): cfloat {.noSideEffect, 
    importcpp: "GetMobileShadowBiasAdd", header: "Renderer.h".}
proc getNumViews*(this: Renderer): cuint {.noSideEffect, 
    importcpp: "GetNumViews", header: "Renderer.h".}
proc getNumPrimitives*(this: Renderer): cuint {.noSideEffect, 
    importcpp: "GetNumPrimitives", header: "Renderer.h".}
proc getNumBatches*(this: Renderer): cuint {.noSideEffect, 
    importcpp: "GetNumBatches", header: "Renderer.h".}
proc getNumGeometries*(this: Renderer; allViews: bool = false): cuint {.
    noSideEffect, importcpp: "GetNumGeometries", header: "Renderer.h".}
proc getNumLights*(this: Renderer; allViews: bool = false): cuint {.
    noSideEffect, importcpp: "GetNumLights", header: "Renderer.h".}
proc getNumShadowMaps*(this: Renderer; allViews: bool = false): cuint {.
    noSideEffect, importcpp: "GetNumShadowMaps", header: "Renderer.h".}
proc getNumOccluders*(this: Renderer; allViews: bool = false): cuint {.
    noSideEffect, importcpp: "GetNumOccluders", header: "Renderer.h".}
proc getDefaultZone*(this: Renderer): ptr Zone {.noSideEffect, 
    importcpp: "GetDefaultZone", header: "Renderer.h".}
proc getDefaultMaterial*(this: Renderer): ptr Material {.noSideEffect, 
    importcpp: "GetDefaultMaterial", header: "Renderer.h".}
proc getDefaultLightRamp*(this: Renderer): ptr Texture2D {.noSideEffect, 
    importcpp: "GetDefaultLightRamp", header: "Renderer.h".}
proc getDefaultLightSpot*(this: Renderer): ptr Texture2D {.noSideEffect, 
    importcpp: "GetDefaultLightSpot", header: "Renderer.h".}
proc getFaceSelectCubeMap*(this: Renderer): ptr TextureCube {.noSideEffect, 
    importcpp: "GetFaceSelectCubeMap", header: "Renderer.h".}
proc getIndirectionCubeMap*(this: Renderer): ptr TextureCube {.noSideEffect, 
    importcpp: "GetIndirectionCubeMap", header: "Renderer.h".}
proc getInstancingBuffer*(this: Renderer): ptr VertexBuffer {.noSideEffect, 
    importcpp: "GetInstancingBuffer", header: "Renderer.h".}
proc getFrameInfo*(this: Renderer): FrameInfo {.noSideEffect, 
    importcpp: "GetFrameInfo", header: "Renderer.h".}
proc update*(this: var Renderer; timeStep: cfloat) {.importcpp: "Update", 
    header: "Renderer.h".}
proc render*(this: var Renderer) {.importcpp: "Render", header: "Renderer.h".}
proc drawDebugGeometry*(this: var Renderer; depthTest: bool) {.
    importcpp: "DrawDebugGeometry", header: "Renderer.h".}
proc queueRenderSurface*(this: var Renderer; renderTarget: ptr RenderSurface) {.
    importcpp: "QueueRenderSurface", header: "Renderer.h".}
proc queueViewport*(this: var Renderer; renderTarget: ptr RenderSurface; 
                    viewport: ptr Viewport) {.importcpp: "QueueViewport", 
    header: "Renderer.h".}
proc getLightGeometry*(this: var Renderer; light: ptr Light): ptr Geometry {.
    importcpp: "GetLightGeometry", header: "Renderer.h".}
proc getQuadGeometry*(this: var Renderer): ptr Geometry {.
    importcpp: "GetQuadGeometry", header: "Renderer.h".}
proc getShadowMap*(this: var Renderer; light: ptr Light; camera: ptr Camera; 
                   viewWidth: cuint; viewHeight: cuint): ptr Texture2D {.
    importcpp: "GetShadowMap", header: "Renderer.h".}
proc getScreenBuffer*(this: var Renderer; width: cint; height: cint; 
                      format: cuint; filtered: bool; srgb: bool; 
                      persistentKey: cuint = 0): ptr Texture2D {.
    importcpp: "GetScreenBuffer", header: "Renderer.h".}
proc getDepthStencil*(this: var Renderer; width: cint; height: cint): ptr RenderSurface {.
    importcpp: "GetDepthStencil", header: "Renderer.h".}
proc getOcclusionBuffer*(this: var Renderer; camera: ptr Camera): ptr OcclusionBuffer {.
    importcpp: "GetOcclusionBuffer", header: "Renderer.h".}
proc getShadowCamera*(this: var Renderer): ptr Camera {.
    importcpp: "GetShadowCamera", header: "Renderer.h".}
proc setBatchShaders*(this: var Renderer; batch: var Batch; tech: ptr Technique; 
                      allowShadows: bool = true) {.importcpp: "SetBatchShaders", 
    header: "Renderer.h".}
proc setLightVolumeBatchShaders*(this: var Renderer; batch: var Batch; 
                                 vsName: UrString; psName: UrString) {.
    importcpp: "SetLightVolumeBatchShaders", header: "Renderer.h".}
proc setCullMode*(this: var Renderer; mode: CullMode; camera: ptr Camera) {.
    importcpp: "SetCullMode", header: "Renderer.h".}
proc resizeInstancingBuffer*(this: var Renderer; numInstances: cuint): bool {.
    importcpp: "ResizeInstancingBuffer", header: "Renderer.h".}
proc saveScreenBufferAllocations*(this: var Renderer) {.
    importcpp: "SaveScreenBufferAllocations", header: "Renderer.h".}
proc restoreScreenBufferAllocations*(this: var Renderer) {.
    importcpp: "RestoreScreenBufferAllocations", header: "Renderer.h".}
proc optimizeLightByScissor*(this: var Renderer; light: ptr Light; 
                             camera: ptr Camera) {.
    importcpp: "OptimizeLightByScissor", header: "Renderer.h".}
proc optimizeLightByStencil*(this: var Renderer; light: ptr Light; 
                             camera: ptr Camera) {.
    importcpp: "OptimizeLightByStencil", header: "Renderer.h".}
proc getLightScissor*(this: var Renderer; light: ptr Light; camera: ptr Camera): Rect {.
    importcpp: "GetLightScissor", header: "Renderer.h".}