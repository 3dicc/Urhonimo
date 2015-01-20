

import 
  arrayPtr, boundingBox, graphicsDefs, skeleton, resource, ptrs, urstr,
  stringHash, hashMap, vector, vertexBuffer, indexbuffer, graphics.geometry,
  vector3, urobject, deserializer, serializer

discard "forward decl of Geometry"
discard "forward decl of IndexBuffer"
discard "forward decl of Graphics"
discard "forward decl of VertexBuffer"
type 
  VertexBufferMorph* {.importc: "Urho3D::VertexBufferMorph", header: "Model.h".} = object 
    elementMask* {.importc: "elementMask_".}: cuint
    vertexCount* {.importc: "vertexCount_".}: cuint
    dataSize* {.importc: "dataSize_".}: cuint
    morphData* {.importc: "morphData_".}: SharedArrayPtr[cuchar]



type 
  ModelMorph* {.importc: "Urho3D::ModelMorph", header: "Model.h".} = object 
    name* {.importc: "name_".}: UrString
    nameHash* {.importc: "nameHash_".}: StringHash
    weight* {.importc: "weight_".}: cfloat
    buffers* {.importc: "buffers_".}: HashMap[cuint, VertexBufferMorph]



type 
  VertexBufferDesc* {.importc: "Urho3D::VertexBufferDesc", header: "Model.h".} = object 
    vertexCount* {.importc: "vertexCount_".}: cuint
    elementMask* {.importc: "elementMask_".}: cuint
    dataSize* {.importc: "dataSize_".}: cuint
    data* {.importc: "data_".}: SharedArrayPtr[cuchar]



type 
  IndexBufferDesc* {.importc: "Urho3D::IndexBufferDesc", header: "Model.h".} = object 
    indexCount* {.importc: "indexCount_".}: cuint
    indexSize* {.importc: "indexSize_".}: cuint
    dataSize* {.importc: "dataSize_".}: cuint
    data* {.importc: "data_".}: SharedArrayPtr[cuchar]



type 
  GeometryDesc* {.importc: "Urho3D::GeometryDesc", header: "Model.h".} = object 
    `type`* {.importc: "type_".}: PrimitiveType
    vbRef* {.importc: "vbRef_".}: cuint
    ibRef* {.importc: "ibRef_".}: cuint
    indexStart* {.importc: "indexStart_".}: cuint
    indexCount* {.importc: "indexCount_".}: cuint



type 
  Model* {.importc: "Urho3D::Model", header: "Model.h".} = object of Resource
    boundingBox* {.importc: "boundingBox_".}: BoundingBox
    skeleton* {.importc: "skeleton_".}: Skeleton
    vertexBuffers* {.importc: "vertexBuffers_".}: Vector[SharedPtr[VertexBuffer]]
    indexBuffers* {.importc: "indexBuffers_".}: Vector[SharedPtr[IndexBuffer]]
    geometries* {.importc: "geometries_".}: Vector[Vector[SharedPtr[Geometry]]]
    geometryBoneMappings* {.importc: "geometryBoneMappings_".}: Vector[
        PODVector[cuint]]
    geometryCenters* {.importc: "geometryCenters_".}: PODVector[Vector3]
    morphs* {.importc: "morphs_".}: Vector[ModelMorph]
    morphRangeStarts* {.importc: "morphRangeStarts_".}: PODVector[cuint]
    morphRangeCounts* {.importc: "morphRangeCounts_".}: PODVector[cuint]
    loadVBData* {.importc: "loadVBData_".}: Vector[VertexBufferDesc]
    loadIBData* {.importc: "loadIBData_".}: Vector[IndexBufferDesc]
    loadGeometries* {.importc: "loadGeometries_".}: Vector[
        PODVector[GeometryDesc]]


proc getType*(this: Model): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Model.h".}
proc getBaseType*(this: Model): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Model.h".}
proc getTypeName*(this: Model): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Model.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Model::GetTypeStatic(@)", header: "Model.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Model::GetTypeNameStatic(@)", header: "Model.h".}
proc constructModel*(context: ptr Context): Model {.
    importcpp: "Urho3D::Model(@)", header: "Model.h".}
proc destroyModel*(this: var Model) {.importcpp: "#.~Model()", header: "Model.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Model::RegisterObject(@)", header: "Model.h".}
proc beginLoad*(this: var Model; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Model.h".}
proc endLoad*(this: var Model): bool {.importcpp: "EndLoad", header: "Model.h".}
proc save*(this: Model; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Model.h".}
proc setBoundingBox*(this: var Model; box: BoundingBox) {.
    importcpp: "SetBoundingBox", header: "Model.h".}
proc setVertexBuffers*(this: var Model; 
                       buffers: Vector[SharedPtr[VertexBuffer]]; 
                       morphRangeStarts: PODVector[cuint]; 
                       morphRangeCounts: PODVector[cuint]): bool {.
    importcpp: "SetVertexBuffers", header: "Model.h".}
proc setIndexBuffers*(this: var Model; buffers: Vector[SharedPtr[IndexBuffer]]): bool {.
    importcpp: "SetIndexBuffers", header: "Model.h".}
proc setNumGeometries*(this: var Model; num: cuint) {.
    importcpp: "SetNumGeometries", header: "Model.h".}
proc setNumGeometryLodLevels*(this: var Model; index: cuint; num: cuint): bool {.
    importcpp: "SetNumGeometryLodLevels", header: "Model.h".}
proc setGeometry*(this: var Model; index: cuint; lodLevel: cuint; 
                  geometry: ptr Geometry): bool {.importcpp: "SetGeometry", 
    header: "Model.h".}
proc setGeometryCenter*(this: var Model; index: cuint; center: Vector3): bool {.
    importcpp: "SetGeometryCenter", header: "Model.h".}
proc setSkeleton*(this: var Model; skeleton: Skeleton) {.
    importcpp: "SetSkeleton", header: "Model.h".}
proc setGeometryBoneMappings*(this: var Model; 
                              mappings: Vector[PODVector[cuint]]) {.
    importcpp: "SetGeometryBoneMappings", header: "Model.h".}
proc setMorphs*(this: var Model; morphs: Vector[ModelMorph]) {.
    importcpp: "SetMorphs", header: "Model.h".}
proc clone*(this: Model; cloneName: UrString): SharedPtr[Model] {.
    noSideEffect, importcpp: "Clone", header: "Model.h".}
proc getBoundingBox*(this: Model): BoundingBox {.noSideEffect, 
    importcpp: "GetBoundingBox", header: "Model.h".}
proc getSkeleton*(this: var Model): var Skeleton {.importcpp: "GetSkeleton", 
    header: "Model.h".}
proc getVertexBuffers*(this: Model): Vector[SharedPtr[VertexBuffer]] {.
    noSideEffect, importcpp: "GetVertexBuffers", header: "Model.h".}
proc getIndexBuffers*(this: Model): Vector[SharedPtr[IndexBuffer]] {.
    noSideEffect, importcpp: "GetIndexBuffers", header: "Model.h".}
proc getNumGeometries*(this: Model): cuint {.noSideEffect, 
    importcpp: "GetNumGeometries", header: "Model.h".}
proc getNumGeometryLodLevels*(this: Model; index: cuint): cuint {.noSideEffect, 
    importcpp: "GetNumGeometryLodLevels", header: "Model.h".}
proc getGeometries*(this: Model): Vector[Vector[SharedPtr[Geometry]]] {.
    noSideEffect, importcpp: "GetGeometries", header: "Model.h".}
proc getGeometryCenters*(this: Model): PODVector[Vector3] {.noSideEffect, 
    importcpp: "GetGeometryCenters", header: "Model.h".}
proc getGeometry*(this: Model; index: cuint; lodLevel: cuint): ptr Geometry {.
    noSideEffect, importcpp: "GetGeometry", header: "Model.h".}
proc getGeometryBoneMappings*(this: Model): Vector[PODVector[cuint]] {.
    noSideEffect, importcpp: "GetGeometryBoneMappings", header: "Model.h".}
proc getMorphs*(this: Model): Vector[ModelMorph] {.noSideEffect, 
    importcpp: "GetMorphs", header: "Model.h".}
proc getNumMorphs*(this: Model): cuint {.noSideEffect, 
    importcpp: "GetNumMorphs", header: "Model.h".}
proc getMorph*(this: Model; index: cuint): ptr ModelMorph {.noSideEffect, 
    importcpp: "GetMorph", header: "Model.h".}
proc getMorph*(this: Model; name: UrString): ptr ModelMorph {.noSideEffect, 
    importcpp: "GetMorph", header: "Model.h".}
proc getMorph*(this: Model; nameHash: StringHash): ptr ModelMorph {.
    noSideEffect, importcpp: "GetMorph", header: "Model.h".}
proc getMorphRangeStart*(this: Model; bufferIndex: cuint): cuint {.noSideEffect, 
    importcpp: "GetMorphRangeStart", header: "Model.h".}
proc getMorphRangeCount*(this: Model; bufferIndex: cuint): cuint {.noSideEffect, 
    importcpp: "GetMorphRangeCount", header: "Model.h".}