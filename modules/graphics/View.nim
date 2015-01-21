

import 
  batch, light, list, UrObject, polyhedron, zone, vector, camera,
  light, drawable, boundingbox, stringHash, ptrs, graphics, component, octree,
  occlusionbuffer, renderSurface, texture2d, rect, vector2, renderpath, hashmap,
  urstr, xmlelement, ray, vector3

import hashSet except Node

discard "forward decl of Camera"
discard "forward decl of DebugRenderer"
discard "forward decl of Light"
discard "forward decl of Drawable"
discard "forward decl of OcclusionBuffer"
discard "forward decl of Octree"
discard "forward decl of RenderPath"
discard "forward decl of RenderSurface"
discard "forward decl of Technique"
discard "forward decl of Texture2D"
discard "forward decl of Viewport"
discard "forward decl of Zone"
discard "forward decl of RenderPathCommand"
discard "forward decl of WorkItem"
type 
  LightQueryResult* {.importc: "Urho3D::LightQueryResult", header: "View.h".} = object 
    light* {.importc: "light_".}: ptr Light
    litGeometries* {.importc: "litGeometries_".}: PODVector[ptr Drawable]
    shadowCasters* {.importc: "shadowCasters_".}: PODVector[ptr Drawable]
    shadowCameras* {.importc: "shadowCameras_".}: array[Max_Light_Splits, 
        ptr Camera]
    shadowCasterBegin* {.importc: "shadowCasterBegin_".}: array[
        Max_Light_Splits, cuint]
    shadowCasterEnd* {.importc: "shadowCasterEnd_".}: array[Max_Light_Splits, 
        cuint]
    shadowCasterBox* {.importc: "shadowCasterBox_".}: array[Max_Light_Splits, 
        BoundingBox]
    shadowNearSplits* {.importc: "shadowNearSplits_".}: array[Max_Light_Splits, 
        cfloat]
    shadowFarSplits* {.importc: "shadowFarSplits_".}: array[Max_Light_Splits, 
        cfloat]
    numSplits* {.importc: "numSplits_".}: cuint


type 
  ScenePassInfo* {.importc: "Urho3D::ScenePassInfo", header: "View.h".} = object 
    pass* {.importc: "pass_".}: StringHash
    allowInstancing* {.importc: "allowInstancing_".}: bool
    markToStencil* {.importc: "markToStencil_".}: bool
    useScissor* {.importc: "useScissor_".}: bool
    vertexLights* {.importc: "vertexLights_".}: bool
    #batchQueue* {.importc: "batchQueue_".}: ptr BatchQueue



type 
  PerThreadSceneResult* {.importc: "Urho3D::PerThreadSceneResult", 
                          header: "View.h".} = object 
    geometries* {.importc: "geometries_".}: PODVector[ptr Drawable]
    lights* {.importc: "lights_".}: PODVector[ptr Light]
    minZ* {.importc: "minZ_".}: cfloat
    maxZ* {.importc: "maxZ_".}: cfloat


const MAX_VIEWPORT_TEXTURES*: cuint = 2


type 
  View* {.importc: "Urho3D::View", header: "View.h".} = object of UrObject
    graphics* {.importc: "graphics_".}: WeakPtr[Graphics]
    #renderer* {.importc: "renderer_".}: WeakPtr[Renderer]
    scene* {.importc: "scene_".}: ptr Scene
    octree* {.importc: "octree_".}: ptr Octree
    camera* {.importc: "camera_".}: ptr Camera
    cameraNode* {.importc: "cameraNode_".}: ptr component.Node
    cameraZone* {.importc: "cameraZone_".}: ptr Zone
    farClipZone* {.importc: "farClipZone_".}: ptr Zone
    occlusionBuffer* {.importc: "occlusionBuffer_".}: ptr OcclusionBuffer
    renderTarget* {.importc: "renderTarget_".}: ptr RenderSurface
    substituteRenderTarget* {.importc: "substituteRenderTarget_".}: ptr RenderSurface
    viewportTextures* {.importc: "viewportTextures_".}: array[
        Max_Viewport_Textures, ptr Texture2D]
    currentRenderTarget* {.importc: "currentRenderTarget_".}: ptr RenderSurface
    currentViewportTexture* {.importc: "currentViewportTexture_".}: ptr Texture2D
    viewRect* {.importc: "viewRect_".}: IntRect
    viewSize* {.importc: "viewSize_".}: IntVector2
    rtSize* {.importc: "rtSize_".}: IntVector2
    frame* {.importc: "frame_".}: FrameInfo
    minZ* {.importc: "minZ_".}: cfloat
    maxZ* {.importc: "maxZ_".}: cfloat
    materialQuality* {.importc: "materialQuality_".}: cint
    maxOccluderTriangles* {.importc: "maxOccluderTriangles_".}: cint
    minInstances* {.importc: "minInstances_".}: cint
    highestZonePriority* {.importc: "highestZonePriority_".}: cint
    cameraZoneOverride* {.importc: "cameraZoneOverride_".}: bool
    drawShadows* {.importc: "drawShadows_".}: bool
    deferred* {.importc: "deferred_".}: bool
    deferredAmbient* {.importc: "deferredAmbient_".}: bool
    useLitBase* {.importc: "useLitBase_".}: bool
    hasScenePasses* {.importc: "hasScenePasses_".}: bool
    drawDebug* {.importc: "drawDebug_".}: bool
    renderPath* {.importc: "renderPath_".}: ptr RenderPath
    tempDrawables* {.importc: "tempDrawables_".}: Vector[PODVector[ptr Drawable]]
    sceneResults* {.importc: "sceneResults_".}: Vector[PerThreadSceneResult]
    zones* {.importc: "zones_".}: PODVector[ptr Zone]
    geometries* {.importc: "geometries_".}: PODVector[ptr Drawable]
    nonThreadedGeometries* {.importc: "nonThreadedGeometries_".}: PODVector[
        ptr Drawable]
    threadedGeometries* {.importc: "threadedGeometries_".}: PODVector[
        ptr Drawable]
    occluders* {.importc: "occluders_".}: PODVector[ptr Drawable]
    lights* {.importc: "lights_".}: PODVector[ptr Light]
    maxLightsDrawables* {.importc: "maxLightsDrawables_".}: HashSet[ptr Drawable]
    renderTargets* {.importc: "renderTargets_".}: HashMap[StringHash, 
        ptr Texture2D]
    lightQueryResults* {.importc: "lightQueryResults_".}: Vector[
        LightQueryResult]
    scenePasses* {.importc: "scenePasses_".}: Vector[ScenePassInfo]
    #lightQueues* {.importc: "lightQueues_".}: Vector[LightBatchQueue]
    #vertexLightQueues* {.importc: "vertexLightQueues_".}: HashMap[culonglong, 
    #    LightBatchQueue]
    #batchQueues* {.importc: "batchQueues_".}: HashMap[StringHash, BatchQueue]
    gBufferPassName* {.importc: "gBufferPassName_".}: StringHash
    basePassName* {.importc: "basePassName_".}: StringHash
    alphaPassName* {.importc: "alphaPassName_".}: StringHash
    lightPassName* {.importc: "lightPassName_".}: StringHash
    litBasePassName* {.importc: "litBasePassName_".}: StringHash
    litAlphaPassName* {.importc: "litAlphaPassName_".}: StringHash
    lightVolumeVSName* {.importc: "lightVolumeVSName_".}: UrString
    lightVolumePSName* {.importc: "lightVolumePSName_".}: UrString

  Viewport* {.importc: "Urho3D::Viewport", header: "Viewport.h".} = object of UrObject
    scene* {.importc: "scene_".}: WeakPtr[Scene]
    camera* {.importc: "camera_".}: WeakPtr[Camera]
    rect* {.importc: "rect_".}: IntRect
    renderPath* {.importc: "renderPath_".}: SharedPtr[RenderPath]
    view* {.importc: "view_".}: SharedPtr[View]
    drawDebug* {.importc: "drawDebug_".}: bool


proc getType*(this: View): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "View.h".}
proc getBaseType*(this: View): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "View.h".}
proc getTypeName*(this: View): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "View.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::View::GetTypeStatic(@)", header: "View.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::View::GetTypeNameStatic(@)", header: "View.h".}
proc constructView*(context: ptr Context): View {.importcpp: "Urho3D::View(@)", 
    header: "View.h".}
proc destroyView*(this: var View) {.importcpp: "#.~View()", header: "View.h".}
proc define*(this: var View; renderTarget: ptr RenderSurface; 
             viewport: ptr Viewport): bool {.importcpp: "Define", 
    header: "View.h".}
proc update*(this: var View; frame: FrameInfo) {.importcpp: "Update", 
    header: "View.h".}
proc render*(this: var View) {.importcpp: "Render", header: "View.h".}
proc getGraphics*(this: View): ptr Graphics {.noSideEffect, 
    importcpp: "GetGraphics", header: "View.h".}
#proc getRenderer*(this: View): ptr Renderer {.noSideEffect, 
#    importcpp: "GetRenderer", header: "View.h".}
proc getScene*(this: View): ptr Scene {.noSideEffect, importcpp: "GetScene", 
                                        header: "View.h".}
proc getOctree*(this: View): ptr Octree {.noSideEffect, importcpp: "GetOctree", 
    header: "View.h".}
proc getCamera*(this: View): ptr Camera {.noSideEffect, importcpp: "GetCamera", 
    header: "View.h".}
proc getFrameInfo*(this: View): FrameInfo {.noSideEffect, 
    importcpp: "GetFrameInfo", header: "View.h".}
proc getRenderTarget*(this: View): ptr RenderSurface {.noSideEffect, 
    importcpp: "GetRenderTarget", header: "View.h".}
proc getDrawDebug*(this: View): bool {.noSideEffect, importcpp: "GetDrawDebug", 
                                       header: "View.h".}
proc getGeometries*(this: View): PODVector[ptr Drawable] {.noSideEffect, 
    importcpp: "GetGeometries", header: "View.h".}
proc getOccluders*(this: View): PODVector[ptr Drawable] {.noSideEffect, 
    importcpp: "GetOccluders", header: "View.h".}
proc getLights*(this: View): PODVector[ptr Light] {.noSideEffect, 
    importcpp: "GetLights", header: "View.h".}

proc setGlobalShaderParameters*(this: var View) {.
    importcpp: "SetGlobalShaderParameters", header: "View.h".}
proc setCameraShaderParameters*(this: var View; camera: ptr Camera; 
                                setProjectionMatrix: bool; overrideView: bool) {.
    importcpp: "SetCameraShaderParameters", header: "View.h".}
proc setGBufferShaderParameters*(this: var View; texSize: IntVector2; 
                                 viewRect: IntRect) {.
    importcpp: "SetGBufferShaderParameters", header: "View.h".}

proc getType*(this: Viewport): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Viewport.h".}
proc getBaseType*(this: Viewport): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Viewport.h".}
proc getTypeName*(this: Viewport): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Viewport.h".}
#proc getTypeStatic*(): StringHash {.
#    importcpp: "Urho3D::Viewport::GetTypeStatic(@)", header: "Viewport.h".}
#proc getTypeNameStatic*(): UrString {.
#    importcpp: "Urho3D::Viewport::GetTypeNameStatic(@)", header: "Viewport.h".}

proc constructViewport*(context: ptr Context): Viewport {.
    importcpp: "Urho3D::Viewport(@)", header: "Viewport.h".}
proc constructViewport*(context: ptr Context; scene: ptr Scene; 
                        camera: ptr Camera; renderPath: ptr RenderPath = nil): Viewport {.
    importcpp: "Urho3D::Viewport(@)", header: "Viewport.h".}
proc constructViewport*(context: ptr Context; scene: ptr Scene; 
                        camera: ptr Camera; rect: IntRect; 
                        renderPath: ptr RenderPath = nil): Viewport {.
    importcpp: "Urho3D::Viewport(@)", header: "Viewport.h".}
proc destroyViewport*(this: var Viewport) {.importcpp: "#.~Viewport()", 
    header: "Viewport.h".}
proc setScene*(this: var Viewport; scene: ptr Scene) {.importcpp: "SetScene", 
    header: "Viewport.h".}
proc setCamera*(this: var Viewport; camera: ptr Camera) {.
    importcpp: "SetCamera", header: "Viewport.h".}
proc setRect*(this: var Viewport; rect: IntRect) {.importcpp: "SetRect", 
    header: "Viewport.h".}
proc setRenderPath*(this: var Viewport; path: ptr RenderPath) {.
    importcpp: "SetRenderPath", header: "Viewport.h".}
proc setRenderPath*(this: var Viewport; file: ptr XMLFile) {.
    importcpp: "SetRenderPath", header: "Viewport.h".}
proc setDrawDebug*(this: var Viewport; enable: bool) {.
    importcpp: "SetDrawDebug", header: "Viewport.h".}
proc getScene*(this: Viewport): ptr Scene {.noSideEffect, importcpp: "GetScene", 
    header: "Viewport.h".}
proc getCamera*(this: Viewport): ptr Camera {.noSideEffect, 
    importcpp: "GetCamera", header: "Viewport.h".}
proc getView*(this: Viewport): ptr View {.noSideEffect, importcpp: "GetView", 
    header: "Viewport.h".}
proc getRect*(this: Viewport): IntRect {.noSideEffect, importcpp: "GetRect", 
    header: "Viewport.h".}
proc getRenderPath*(this: Viewport): ptr RenderPath {.noSideEffect, 
    importcpp: "GetRenderPath", header: "Viewport.h".}
proc getDrawDebug*(this: Viewport): bool {.noSideEffect, 
    importcpp: "GetDrawDebug", header: "Viewport.h".}
proc getScreenRay*(this: Viewport; x: cint; y: cint): Ray {.noSideEffect, 
    importcpp: "GetScreenRay", header: "Viewport.h".}
proc worldToScreenPoint*(this: Viewport; worldPos: Vector3): IntVector2 {.
    noSideEffect, importcpp: "WorldToScreenPoint", header: "Viewport.h".}
proc screenToWorldPoint*(this: Viewport; x: cint; y: cint; depth: cfloat): Vector3 {.
    noSideEffect, importcpp: "ScreenToWorldPoint", header: "Viewport.h".}
proc allocateView*(this: var Viewport) {.importcpp: "AllocateView", 
    header: "Viewport.h".}