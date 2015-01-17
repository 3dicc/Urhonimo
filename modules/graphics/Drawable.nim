

import 
  boundingBox, component, graphicsDefs, hashSet

var DRAWABLE_GEOMETRY* {.importc: "DRAWABLE_GEOMETRY", header: "Drawable.h".}: cuint = 0x00000001

var DRAWABLE_LIGHT* {.importc: "DRAWABLE_LIGHT", header: "Drawable.h".}: cuint = 0x00000002

var DRAWABLE_ZONE* {.importc: "DRAWABLE_ZONE", header: "Drawable.h".}: cuint = 0x00000004

var DRAWABLE_PROXYGEOMETRY* {.importc: "DRAWABLE_PROXYGEOMETRY", 
                              header: "Drawable.h".}: cuint = 0x00000008

var DRAWABLE_ANY* {.importc: "DRAWABLE_ANY", header: "Drawable.h".}: cuint = 0x000000FF

var DEFAULT_VIEWMASK* {.importc: "DEFAULT_VIEWMASK", header: "Drawable.h".}: cuint = m_Max_Unsigned

var DEFAULT_LIGHTMASK* {.importc: "DEFAULT_LIGHTMASK", header: "Drawable.h".}: cuint = m_Max_Unsigned

var DEFAULT_SHADOWMASK* {.importc: "DEFAULT_SHADOWMASK", header: "Drawable.h".}: cuint = m_Max_Unsigned

var DEFAULT_ZONEMASK* {.importc: "DEFAULT_ZONEMASK", header: "Drawable.h".}: cuint = m_Max_Unsigned

var MAX_VERTEX_LIGHTS* {.importc: "MAX_VERTEX_LIGHTS", header: "Drawable.h".}: cint = 4

var ANIMATION_LOD_BASESCALE* {.importc: "ANIMATION_LOD_BASESCALE", 
                               header: "Drawable.h".}: cfloat = 2500.0

discard "forward decl of Camera"
discard "forward decl of Geometry"
discard "forward decl of Light"
discard "forward decl of Material"
discard "forward decl of OcclusionBuffer"
discard "forward decl of Octant"
discard "forward decl of RayOctreeQuery"
discard "forward decl of Zone"
discard "forward decl of RayQueryResult"
discard "forward decl of WorkItem"
type 
  UpdateGeometryType* {.importcpp: "Urho3D::UpdateGeometryType".} = enum 
    UPDATE_NONE = 0, UPDATE_MAIN_THREAD, UPDATE_WORKER_THREAD



type 
  FrameInfo* {.importc: "Urho3D::FrameInfo", header: "Drawable.h".} = object 
    frameNumber* {.importc: "frameNumber_".}: cuint
    timeStep* {.importc: "timeStep_".}: cfloat
    viewSize* {.importc: "viewSize_".}: IntVector2
    camera* {.importc: "camera_".}: ptr Camera



type 
  SourceBatch* {.importc: "Urho3D::SourceBatch", header: "Drawable.h".} = object 
    distance* {.importc: "distance_".}: cfloat
    geometry* {.importc: "geometry_".}: ptr Geometry
    material* {.importc: "material_".}: SharedPtr[Material]
    worldTransform* {.importc: "worldTransform_".}: ptr Matrix3x4
    numWorldTransforms* {.importc: "numWorldTransforms_".}: cuint
    geometryType* {.importc: "geometryType_".}: GeometryType
    overrideView* {.importc: "overrideView_".}: bool


proc constructSourceBatch*(): SourceBatch {.importcpp: "Urho3D::SourceBatch(@)", 
    header: "Drawable.h".}
proc destroySourceBatch*(this: var SourceBatch) {.importcpp: "#.~SourceBatch()", 
    header: "Drawable.h".}

type 
  Drawable* {.importc: "Urho3D::Drawable", header: "Drawable.h".} = object of Component
    worldBoundingBox* {.importc: "worldBoundingBox_".}: BoundingBox
    boundingBox* {.importc: "boundingBox_".}: BoundingBox
    batches* {.importc: "batches_".}: Vector[SourceBatch]
    drawableFlags* {.importc: "drawableFlags_".}: cuchar
    worldBoundingBoxDirty* {.importc: "worldBoundingBoxDirty_".}: bool
    castShadows* {.importc: "castShadows_".}: bool
    occluder* {.importc: "occluder_".}: bool
    occludee* {.importc: "occludee_".}: bool
    updateQueued* {.importc: "updateQueued_".}: bool
    viewMask* {.importc: "viewMask_".}: cuint
    lightMask* {.importc: "lightMask_".}: cuint
    shadowMask* {.importc: "shadowMask_".}: cuint
    zoneMask* {.importc: "zoneMask_".}: cuint
    viewFrameNumber* {.importc: "viewFrameNumber_".}: cuint
    distance* {.importc: "distance_".}: cfloat
    lodDistance* {.importc: "lodDistance_".}: cfloat
    drawDistance* {.importc: "drawDistance_".}: cfloat
    shadowDistance* {.importc: "shadowDistance_".}: cfloat
    sortValue* {.importc: "sortValue_".}: cfloat
    minZ* {.importc: "minZ_".}: cfloat
    maxZ* {.importc: "maxZ_".}: cfloat
    lodBias* {.importc: "lodBias_".}: cfloat
    basePassFlags* {.importc: "basePassFlags_".}: cuint
    maxLights* {.importc: "maxLights_".}: cuint
    octant* {.importc: "octant_".}: ptr Octant
    firstLight* {.importc: "firstLight_".}: ptr Light
    lights* {.importc: "lights_".}: PODVector[ptr Light]
    vertexLights* {.importc: "vertexLights_".}: PODVector[ptr Light]
    zone* {.importc: "zone_".}: ptr Zone
    zoneDirty* {.importc: "zoneDirty_".}: bool
    viewCameras* {.importc: "viewCameras_".}: HashSet[ptr Camera]


proc getType*(this: Drawable): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Drawable.h".}
proc getBaseType*(this: Drawable): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Drawable.h".}
proc getTypeName*(this: Drawable): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Drawable.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Drawable::GetTypeStatic(@)", header: "Drawable.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Drawable::GetTypeNameStatic(@)", header: "Drawable.h".}
proc constructDrawable*(context: ptr Context; drawableFlags: cuchar): Drawable {.
    importcpp: "Urho3D::Drawable(@)", header: "Drawable.h".}
proc destroyDrawable*(this: var Drawable) {.importcpp: "#.~Drawable()", 
    header: "Drawable.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Drawable::RegisterObject(@)", header: "Drawable.h".}
proc onSetEnabled*(this: var Drawable) {.importcpp: "OnSetEnabled", 
    header: "Drawable.h".}
proc processRayQuery*(this: var Drawable; query: RayOctreeQuery; 
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "Drawable.h".}
proc update*(this: var Drawable; frame: FrameInfo) {.importcpp: "Update", 
    header: "Drawable.h".}
proc updateBatches*(this: var Drawable; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "Drawable.h".}
proc updateGeometry*(this: var Drawable; frame: FrameInfo) {.
    importcpp: "UpdateGeometry", header: "Drawable.h".}
proc getUpdateGeometryType*(this: var Drawable): UpdateGeometryType {.
    importcpp: "GetUpdateGeometryType", header: "Drawable.h".}
proc getLodGeometry*(this: var Drawable; batchIndex: cuint; level: cuint): ptr Geometry {.
    importcpp: "GetLodGeometry", header: "Drawable.h".}
proc getNumOccluderTriangles*(this: var Drawable): cuint {.
    importcpp: "GetNumOccluderTriangles", header: "Drawable.h".}
proc drawOcclusion*(this: var Drawable; buffer: ptr OcclusionBuffer): bool {.
    importcpp: "DrawOcclusion", header: "Drawable.h".}
proc drawDebugGeometry*(this: var Drawable; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Drawable.h".}
proc setDrawDistance*(this: var Drawable; distance: cfloat) {.
    importcpp: "SetDrawDistance", header: "Drawable.h".}
proc setShadowDistance*(this: var Drawable; distance: cfloat) {.
    importcpp: "SetShadowDistance", header: "Drawable.h".}
proc setLodBias*(this: var Drawable; bias: cfloat) {.importcpp: "SetLodBias", 
    header: "Drawable.h".}
proc setViewMask*(this: var Drawable; mask: cuint) {.importcpp: "SetViewMask", 
    header: "Drawable.h".}
proc setLightMask*(this: var Drawable; mask: cuint) {.importcpp: "SetLightMask", 
    header: "Drawable.h".}
proc setShadowMask*(this: var Drawable; mask: cuint) {.
    importcpp: "SetShadowMask", header: "Drawable.h".}
proc setZoneMask*(this: var Drawable; mask: cuint) {.importcpp: "SetZoneMask", 
    header: "Drawable.h".}
proc setMaxLights*(this: var Drawable; num: cuint) {.importcpp: "SetMaxLights", 
    header: "Drawable.h".}
proc setCastShadows*(this: var Drawable; enable: bool) {.
    importcpp: "SetCastShadows", header: "Drawable.h".}
proc setOccluder*(this: var Drawable; enable: bool) {.importcpp: "SetOccluder", 
    header: "Drawable.h".}
proc setOccludee*(this: var Drawable; enable: bool) {.importcpp: "SetOccludee", 
    header: "Drawable.h".}
proc markForUpdate*(this: var Drawable) {.importcpp: "MarkForUpdate", 
    header: "Drawable.h".}
proc getBoundingBox*(this: Drawable): BoundingBox {.noSideEffect, 
    importcpp: "GetBoundingBox", header: "Drawable.h".}
proc getWorldBoundingBox*(this: var Drawable): BoundingBox {.
    importcpp: "GetWorldBoundingBox", header: "Drawable.h".}
proc getDrawableFlags*(this: Drawable): cuchar {.noSideEffect, 
    importcpp: "GetDrawableFlags", header: "Drawable.h".}
proc getDrawDistance*(this: Drawable): cfloat {.noSideEffect, 
    importcpp: "GetDrawDistance", header: "Drawable.h".}
proc getShadowDistance*(this: Drawable): cfloat {.noSideEffect, 
    importcpp: "GetShadowDistance", header: "Drawable.h".}
proc getLodBias*(this: Drawable): cfloat {.noSideEffect, 
    importcpp: "GetLodBias", header: "Drawable.h".}
proc getViewMask*(this: Drawable): cuint {.noSideEffect, 
    importcpp: "GetViewMask", header: "Drawable.h".}
proc getLightMask*(this: Drawable): cuint {.noSideEffect, 
    importcpp: "GetLightMask", header: "Drawable.h".}
proc getShadowMask*(this: Drawable): cuint {.noSideEffect, 
    importcpp: "GetShadowMask", header: "Drawable.h".}
proc getZoneMask*(this: Drawable): cuint {.noSideEffect, 
    importcpp: "GetZoneMask", header: "Drawable.h".}
proc getMaxLights*(this: Drawable): cuint {.noSideEffect, 
    importcpp: "GetMaxLights", header: "Drawable.h".}
proc getCastShadows*(this: Drawable): bool {.noSideEffect, 
    importcpp: "GetCastShadows", header: "Drawable.h".}
proc isOccluder*(this: Drawable): bool {.noSideEffect, importcpp: "IsOccluder", 
    header: "Drawable.h".}
proc isOccludee*(this: Drawable): bool {.noSideEffect, importcpp: "IsOccludee", 
    header: "Drawable.h".}
proc isInView*(this: Drawable): bool {.noSideEffect, importcpp: "IsInView", 
                                       header: "Drawable.h".}
proc isInView*(this: Drawable; camera: ptr Camera): bool {.noSideEffect, 
    importcpp: "IsInView", header: "Drawable.h".}
proc getBatches*(this: Drawable): Vector[SourceBatch] {.noSideEffect, 
    importcpp: "GetBatches", header: "Drawable.h".}
proc setZone*(this: var Drawable; zone: ptr Zone; temporary: bool = false) {.
    importcpp: "SetZone", header: "Drawable.h".}
proc setSortValue*(this: var Drawable; value: cfloat) {.
    importcpp: "SetSortValue", header: "Drawable.h".}
proc setMinMaxZ*(this: var Drawable; minZ: cfloat; maxZ: cfloat) {.
    importcpp: "SetMinMaxZ", header: "Drawable.h".}
proc markInView*(this: var Drawable; frame: FrameInfo) {.
    importcpp: "MarkInView", header: "Drawable.h".}
proc markInView*(this: var Drawable; frameNumber: cuint; camera: ptr Camera) {.
    importcpp: "MarkInView", header: "Drawable.h".}
proc limitLights*(this: var Drawable) {.importcpp: "LimitLights", 
                                        header: "Drawable.h".}
proc limitVertexLights*(this: var Drawable) {.importcpp: "LimitVertexLights", 
    header: "Drawable.h".}
proc setBasePass*(this: var Drawable; batchIndex: cuint) {.
    importcpp: "SetBasePass", header: "Drawable.h".}
proc getOctant*(this: Drawable): ptr Octant {.noSideEffect, 
    importcpp: "GetOctant", header: "Drawable.h".}
proc getZone*(this: Drawable): ptr Zone {.noSideEffect, importcpp: "GetZone", 
    header: "Drawable.h".}
proc isZoneDirty*(this: Drawable): bool {.noSideEffect, 
    importcpp: "IsZoneDirty", header: "Drawable.h".}
proc getDistance*(this: Drawable): cfloat {.noSideEffect, 
    importcpp: "GetDistance", header: "Drawable.h".}
proc getLodDistance*(this: Drawable): cfloat {.noSideEffect, 
    importcpp: "GetLodDistance", header: "Drawable.h".}
proc getSortValue*(this: Drawable): cfloat {.noSideEffect, 
    importcpp: "GetSortValue", header: "Drawable.h".}
proc isInView*(this: Drawable; frame: FrameInfo; anyCamera: bool = false): bool {.
    noSideEffect, importcpp: "IsInView", header: "Drawable.h".}
proc hasBasePass*(this: Drawable; batchIndex: cuint): bool {.noSideEffect, 
    importcpp: "HasBasePass", header: "Drawable.h".}
proc getLights*(this: Drawable): PODVector[ptr Light] {.noSideEffect, 
    importcpp: "GetLights", header: "Drawable.h".}
proc getVertexLights*(this: Drawable): PODVector[ptr Light] {.noSideEffect, 
    importcpp: "GetVertexLights", header: "Drawable.h".}
proc getFirstLight*(this: Drawable): ptr Light {.noSideEffect, 
    importcpp: "GetFirstLight", header: "Drawable.h".}
proc getMinZ*(this: Drawable): cfloat {.noSideEffect, importcpp: "GetMinZ", 
                                        header: "Drawable.h".}
proc getMaxZ*(this: Drawable): cfloat {.noSideEffect, importcpp: "GetMaxZ", 
                                        header: "Drawable.h".}
proc clearLights*(this: var Drawable) {.importcpp: "ClearLights", 
                                        header: "Drawable.h".}
proc addLight*(this: var Drawable; light: ptr Light) {.importcpp: "AddLight", 
    header: "Drawable.h".}
proc addVertexLight*(this: var Drawable; light: ptr Light) {.
    importcpp: "AddVertexLight", header: "Drawable.h".}
proc compareDrawables*(lhs: ptr Drawable; rhs: ptr Drawable): bool {.inline.}