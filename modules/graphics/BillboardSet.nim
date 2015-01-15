

import 
  color, drawable, matrix3x4, rect, vectorBuffer

discard "forward decl of IndexBuffer"
discard "forward decl of VertexBuffer"
type 
  Billboard* {.importc: "Urho3D::Billboard", header: "BillboardSet.h".} = object 
    position* {.importc: "position_".}: Vector3
    size* {.importc: "size_".}: Vector2
    uv* {.importc: "uv_".}: Rect
    color* {.importc: "color_".}: Color
    rotation* {.importc: "rotation_".}: cfloat
    enabled* {.importc: "enabled_".}: bool
    sortDistance* {.importc: "sortDistance_".}: cfloat


var MAX_BILLBOARDS* {.importc: "MAX_BILLBOARDS", header: "BillboardSet.h".}: cuint = 65536 div
    4


type 
  BillboardSet* {.importc: "Urho3D::BillboardSet", header: "BillboardSet.h".} = object of Drawable
    billboards* {.importc: "billboards_".}: PODVector[Billboard]
    faceCameraAxes* {.importc: "faceCameraAxes_".}: Vector3
    animationLodBias* {.importc: "animationLodBias_".}: cfloat
    animationLodTimer* {.importc: "animationLodTimer_".}: cfloat
    relative* {.importc: "relative_".}: bool
    scaled* {.importc: "scaled_".}: bool
    sorted* {.importc: "sorted_".}: bool
    faceCameraMode* {.importc: "faceCameraMode_".}: FaceCameraMode
    geometry* {.importc: "geometry_".}: SharedPtr[Geometry]
    vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]
    indexBuffer* {.importc: "indexBuffer_".}: SharedPtr[IndexBuffer]
    transforms* {.importc: "transforms_".}: array[2, Matrix3x4]
    bufferSizeDirty* {.importc: "bufferSizeDirty_".}: bool
    bufferDirty* {.importc: "bufferDirty_".}: bool
    forceUpdate* {.importc: "forceUpdate_".}: bool
    sortFrameNumber* {.importc: "sortFrameNumber_".}: cuint
    previousOffset* {.importc: "previousOffset_".}: Vector3
    sortedBillboards* {.importc: "sortedBillboards_".}: Vector[ptr Billboard]
    attrBuffer* {.importc: "attrBuffer_".}: VectorBuffer


proc getType*(this: BillboardSet): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "BillboardSet.h".}
proc getBaseType*(this: BillboardSet): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "BillboardSet.h".}
proc getTypeName*(this: BillboardSet): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "BillboardSet.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::BillboardSet::GetTypeStatic(@)", 
    header: "BillboardSet.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::BillboardSet::GetTypeNameStatic(@)", 
    header: "BillboardSet.h".}
proc constructBillboardSet*(context: ptr Context): BillboardSet {.
    importcpp: "Urho3D::BillboardSet(@)", header: "BillboardSet.h".}
proc destroyBillboardSet*(this: var BillboardSet) {.
    importcpp: "#.~BillboardSet()", header: "BillboardSet.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::BillboardSet::RegisterObject(@)", 
    header: "BillboardSet.h".}
proc processRayQuery*(this: var BillboardSet; query: RayOctreeQuery; 
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "BillboardSet.h".}
proc updateBatches*(this: var BillboardSet; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "BillboardSet.h".}
proc updateGeometry*(this: var BillboardSet; frame: FrameInfo) {.
    importcpp: "UpdateGeometry", header: "BillboardSet.h".}
proc getUpdateGeometryType*(this: var BillboardSet): UpdateGeometryType {.
    importcpp: "GetUpdateGeometryType", header: "BillboardSet.h".}
proc setMaterial*(this: var BillboardSet; material: ptr Material) {.
    importcpp: "SetMaterial", header: "BillboardSet.h".}
proc setNumBillboards*(this: var BillboardSet; num: cuint) {.
    importcpp: "SetNumBillboards", header: "BillboardSet.h".}
proc setRelative*(this: var BillboardSet; enable: bool) {.
    importcpp: "SetRelative", header: "BillboardSet.h".}
proc setScaled*(this: var BillboardSet; enable: bool) {.importcpp: "SetScaled", 
    header: "BillboardSet.h".}
proc setSorted*(this: var BillboardSet; enable: bool) {.importcpp: "SetSorted", 
    header: "BillboardSet.h".}
proc setFaceCameraMode*(this: var BillboardSet; mode: FaceCameraMode) {.
    importcpp: "SetFaceCameraMode", header: "BillboardSet.h".}
proc setAnimationLodBias*(this: var BillboardSet; bias: cfloat) {.
    importcpp: "SetAnimationLodBias", header: "BillboardSet.h".}
proc commit*(this: var BillboardSet) {.importcpp: "Commit", 
                                       header: "BillboardSet.h".}
proc getMaterial*(this: BillboardSet): ptr Material {.noSideEffect, 
    importcpp: "GetMaterial", header: "BillboardSet.h".}
proc getNumBillboards*(this: BillboardSet): cuint {.noSideEffect, 
    importcpp: "GetNumBillboards", header: "BillboardSet.h".}
proc getBillboards*(this: var BillboardSet): var PODVector[Billboard] {.
    importcpp: "GetBillboards", header: "BillboardSet.h".}
proc getBillboard*(this: var BillboardSet; index: cuint): ptr Billboard {.
    importcpp: "GetBillboard", header: "BillboardSet.h".}
proc isRelative*(this: BillboardSet): bool {.noSideEffect, 
    importcpp: "IsRelative", header: "BillboardSet.h".}
proc isScaled*(this: BillboardSet): bool {.noSideEffect, importcpp: "IsScaled", 
    header: "BillboardSet.h".}
proc isSorted*(this: BillboardSet): bool {.noSideEffect, importcpp: "IsSorted", 
    header: "BillboardSet.h".}
proc getFaceCameraMode*(this: BillboardSet): FaceCameraMode {.noSideEffect, 
    importcpp: "GetFaceCameraMode", header: "BillboardSet.h".}
proc getAnimationLodBias*(this: BillboardSet): cfloat {.noSideEffect, 
    importcpp: "GetAnimationLodBias", header: "BillboardSet.h".}
proc setMaterialAttr*(this: var BillboardSet; value: ResourceRef) {.
    importcpp: "SetMaterialAttr", header: "BillboardSet.h".}
proc setBillboardsAttr*(this: var BillboardSet; value: VariantVector) {.
    importcpp: "SetBillboardsAttr", header: "BillboardSet.h".}
proc setNetBillboardsAttr*(this: var BillboardSet; value: PODVector[cuchar]) {.
    importcpp: "SetNetBillboardsAttr", header: "BillboardSet.h".}
proc getMaterialAttr*(this: BillboardSet): ResourceRef {.noSideEffect, 
    importcpp: "GetMaterialAttr", header: "BillboardSet.h".}
proc getBillboardsAttr*(this: BillboardSet): VariantVector {.noSideEffect, 
    importcpp: "GetBillboardsAttr", header: "BillboardSet.h".}
proc getNetBillboardsAttr*(this: BillboardSet): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetNetBillboardsAttr", header: "BillboardSet.h".}