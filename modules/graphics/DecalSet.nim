

import 
  drawable, frustum, list, skeleton

discard "forward decl of IndexBuffer"
discard "forward decl of VertexBuffer"
type 
  DecalVertex* {.importc: "Urho3D::DecalVertex", header: "DecalSet.h".} = object 
    position* {.importc: "position_".}: Vector3
    normal* {.importc: "normal_".}: Vector3
    texCoord* {.importc: "texCoord_".}: Vector2
    tangent* {.importc: "tangent_".}: Vector4
    blendWeights* {.importc: "blendWeights_".}: array[4, cfloat]
    blendIndices* {.importc: "blendIndices_".}: array[4, cuchar]


proc constructDecalVertex*(): DecalVertex {.importcpp: "Urho3D::DecalVertex(@)", 
    header: "DecalSet.h".}
proc constructDecalVertex*(position: Vector3; normal: Vector3): DecalVertex {.
    importcpp: "Urho3D::DecalVertex(@)", header: "DecalSet.h".}
proc constructDecalVertex*(position: Vector3; normal: Vector3; 
                           blendWeights: ptr cfloat; blendIndices: ptr cuchar): DecalVertex {.
    importcpp: "Urho3D::DecalVertex(@)", header: "DecalSet.h".}

type 
  Decal* {.importc: "Urho3D::Decal", header: "DecalSet.h".} = object 
    timer* {.importc: "timer_".}: cfloat
    timeToLive* {.importc: "timeToLive_".}: cfloat
    boundingBox* {.importc: "boundingBox_".}: BoundingBox
    vertices* {.importc: "vertices_".}: PODVector[DecalVertex]
    indices* {.importc: "indices_".}: PODVector[cushort]


proc constructDecal*(): Decal {.importcpp: "Urho3D::Decal(@)", 
                                header: "DecalSet.h".}
proc addVertex*(this: var Decal; vertex: DecalVertex) {.importcpp: "AddVertex", 
    header: "DecalSet.h".}
proc calculateBoundingBox*(this: var Decal) {.importcpp: "CalculateBoundingBox", 
    header: "DecalSet.h".}

type 
  DecalSet* {.importc: "Urho3D::DecalSet", header: "DecalSet.h".} = object of Drawable
    geometry* {.importc: "geometry_".}: SharedPtr[Geometry]
    vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]
    indexBuffer* {.importc: "indexBuffer_".}: SharedPtr[IndexBuffer]
    decals* {.importc: "decals_".}: List[Decal]
    bones* {.importc: "bones_".}: Vector[Bone]
    skinMatrices* {.importc: "skinMatrices_".}: PODVector[Matrix3x4]
    numVertices* {.importc: "numVertices_".}: cuint
    numIndices* {.importc: "numIndices_".}: cuint
    maxVertices* {.importc: "maxVertices_".}: cuint
    maxIndices* {.importc: "maxIndices_".}: cuint
    skinned* {.importc: "skinned_".}: bool
    bufferSizeDirty* {.importc: "bufferSizeDirty_".}: bool
    bufferDirty* {.importc: "bufferDirty_".}: bool
    boundingBoxDirty* {.importc: "boundingBoxDirty_".}: bool
    skinningDirty* {.importc: "skinningDirty_".}: bool
    assignBonesPending* {.importc: "assignBonesPending_".}: bool
    subscribed* {.importc: "subscribed_".}: bool


proc getType*(this: DecalSet): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "DecalSet.h".}
proc getBaseType*(this: DecalSet): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "DecalSet.h".}
proc getTypeName*(this: DecalSet): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "DecalSet.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::DecalSet::GetTypeStatic(@)", header: "DecalSet.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::DecalSet::GetTypeNameStatic(@)", header: "DecalSet.h".}
proc constructDecalSet*(context: ptr Context): DecalSet {.
    importcpp: "Urho3D::DecalSet(@)", header: "DecalSet.h".}
proc destroyDecalSet*(this: var DecalSet) {.importcpp: "#.~DecalSet()", 
    header: "DecalSet.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::DecalSet::RegisterObject(@)", header: "DecalSet.h".}
proc applyAttributes*(this: var DecalSet) {.importcpp: "ApplyAttributes", 
    header: "DecalSet.h".}
proc onSetEnabled*(this: var DecalSet) {.importcpp: "OnSetEnabled", 
    header: "DecalSet.h".}
proc processRayQuery*(this: var DecalSet; query: RayOctreeQuery; 
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "DecalSet.h".}
proc updateBatches*(this: var DecalSet; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "DecalSet.h".}
proc updateGeometry*(this: var DecalSet; frame: FrameInfo) {.
    importcpp: "UpdateGeometry", header: "DecalSet.h".}
proc getUpdateGeometryType*(this: var DecalSet): UpdateGeometryType {.
    importcpp: "GetUpdateGeometryType", header: "DecalSet.h".}
proc setMaterial*(this: var DecalSet; material: ptr Material) {.
    importcpp: "SetMaterial", header: "DecalSet.h".}
proc setMaxVertices*(this: var DecalSet; num: cuint) {.
    importcpp: "SetMaxVertices", header: "DecalSet.h".}
proc setMaxIndices*(this: var DecalSet; num: cuint) {.
    importcpp: "SetMaxIndices", header: "DecalSet.h".}
proc addDecal*(this: var DecalSet; target: ptr Drawable; worldPosition: Vector3; 
               worldRotation: Quaternion; size: cfloat; aspectRatio: cfloat; 
               depth: cfloat; topLeftUV: Vector2; bottomRightUV: Vector2; 
               timeToLive: cfloat = 0.0; normalCutoff: cfloat = 0.1; 
               subGeometry: cuint = m_Max_Unsigned): bool {.
    importcpp: "AddDecal", header: "DecalSet.h".}
proc removeDecals*(this: var DecalSet; num: cuint) {.importcpp: "RemoveDecals", 
    header: "DecalSet.h".}
proc removeAllDecals*(this: var DecalSet) {.importcpp: "RemoveAllDecals", 
    header: "DecalSet.h".}
proc getMaterial*(this: DecalSet): ptr Material {.noSideEffect, 
    importcpp: "GetMaterial", header: "DecalSet.h".}
proc getNumDecals*(this: DecalSet): cuint {.noSideEffect, 
    importcpp: "GetNumDecals", header: "DecalSet.h".}
proc getNumVertices*(this: DecalSet): cuint {.noSideEffect, 
    importcpp: "GetNumVertices", header: "DecalSet.h".}
proc getNumIndices*(this: DecalSet): cuint {.noSideEffect, 
    importcpp: "GetNumIndices", header: "DecalSet.h".}
proc getMaxVertices*(this: DecalSet): cuint {.noSideEffect, 
    importcpp: "GetMaxVertices", header: "DecalSet.h".}
proc getMaxIndices*(this: DecalSet): cuint {.noSideEffect, 
    importcpp: "GetMaxIndices", header: "DecalSet.h".}
proc setMaterialAttr*(this: var DecalSet; value: ResourceRef) {.
    importcpp: "SetMaterialAttr", header: "DecalSet.h".}
proc setDecalsAttr*(this: var DecalSet; value: PODVector[cuchar]) {.
    importcpp: "SetDecalsAttr", header: "DecalSet.h".}
proc getMaterialAttr*(this: DecalSet): ResourceRef {.noSideEffect, 
    importcpp: "GetMaterialAttr", header: "DecalSet.h".}
proc getDecalsAttr*(this: DecalSet): PODVector[cuchar] {.noSideEffect, 
    importcpp: "GetDecalsAttr", header: "DecalSet.h".}