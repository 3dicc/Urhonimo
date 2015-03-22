

import
  drawable, urstr, stringHash, vector3, vector2, vector4, ptrs, vector,
  variant, geometry, vertexbuffer, graphicsdefs, urobject, octreequery,
  occlusionbuffer, color, material


type
  CustomGeometryVertex* {.importcpp: "Urho3D::CustomGeometryVertex",
                          header: "CustomGeometry.h".} = object
    position* {.importc: "position_".}: Vector3
    normal* {.importc: "normal_".}: Vector3
    color* {.importc: "color_".}: cuint
    texCoord* {.importc: "texCoord_".}: Vector2
    tangent* {.importc: "tangent_".}: Vector4


discard "forward decl of VertexBuffer"
type
  CustomGeometry* {.importcpp: "Urho3D::CustomGeometry",
                    header: "CustomGeometry.h".} = object of Drawable
    primitiveTypes* {.importc: "primitiveTypes_".}: PODVector[PrimitiveType]
    vertices* {.importc: "vertices_".}: Vector[PODVector[CustomGeometryVertex]]
    geometries* {.importc: "geometries_".}: Vector[SharedPtr[Geometry]]
    vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]
    elementMask* {.importc: "elementMask_".}: cuint
    geometryIndex* {.importc: "geometryIndex_".}: cuint
    materialsAttr* {.importc: "materialsAttr_".}: ResourceRefList
    dynamic* {.importc: "dynamic_".}: bool


proc getType*(this: CustomGeometry): StringHash {.noSideEffect,
    importcpp: "GetType", header: "CustomGeometry.h".}
proc getBaseType*(this: CustomGeometry): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "CustomGeometry.h".}
proc getTypeName*(this: CustomGeometry): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "CustomGeometry.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::CustomGeometry::GetTypeStatic(@)",
    header: "CustomGeometry.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::CustomGeometry::GetTypeNameStatic(@)",
    header: "CustomGeometry.h".}
proc constructCustomGeometry*(context: ptr Context): CustomGeometry {.
    importcpp: "Urho3D::CustomGeometry(@)", header: "CustomGeometry.h",
    constructor.}
proc destroyCustomGeometry*(this: var CustomGeometry) {.
    importcpp: "#.~CustomGeometry()", header: "CustomGeometry.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CustomGeometry::RegisterObject(@)",
    header: "CustomGeometry.h".}
proc processRayQuery*(this: var CustomGeometry; query: RayOctreeQuery;
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "CustomGeometry.h".}
proc getLodGeometry*(this: var CustomGeometry; batchIndex: cuint; level: cuint): ptr Geometry {.
    importcpp: "GetLodGeometry", header: "CustomGeometry.h".}
proc getNumOccluderTriangles*(this: var CustomGeometry): cuint {.
    importcpp: "GetNumOccluderTriangles", header: "CustomGeometry.h".}
proc drawOcclusion*(this: var CustomGeometry; buffer: ptr OcclusionBuffer): bool {.
    importcpp: "DrawOcclusion", header: "CustomGeometry.h".}
proc clear*(this: var CustomGeometry) {.importcpp: "Clear",
                                        header: "CustomGeometry.h".}
proc setNumGeometries*(this: var CustomGeometry; num: cuint) {.
    importcpp: "SetNumGeometries", header: "CustomGeometry.h".}
proc setDynamic*(this: var CustomGeometry; enable: bool) {.
    importcpp: "SetDynamic", header: "CustomGeometry.h".}
proc beginGeometry*(this: var CustomGeometry; index: cuint;
                    `type`: PrimitiveType) {.importcpp: "BeginGeometry",
    header: "CustomGeometry.h".}
proc defineVertex*(this: var CustomGeometry; position: Vector3) {.
    importcpp: "DefineVertex", header: "CustomGeometry.h".}
proc defineNormal*(this: var CustomGeometry; normal: Vector3) {.
    importcpp: "DefineNormal", header: "CustomGeometry.h".}
proc defineColor*(this: var CustomGeometry; color: Color) {.
    importcpp: "DefineColor", header: "CustomGeometry.h".}
proc defineTexCoord*(this: var CustomGeometry; texCoord: Vector2) {.
    importcpp: "DefineTexCoord", header: "CustomGeometry.h".}
proc defineTangent*(this: var CustomGeometry; tangent: Vector4) {.
    importcpp: "DefineTangent", header: "CustomGeometry.h".}
proc defineGeometry*(this: var CustomGeometry; index: cuint;
                     `type`: PrimitiveType; numVertices: cuint;
                     hasNormals: bool; hasColors: bool; hasTexCoords: bool;
                     hasTangents: bool) {.importcpp: "DefineGeometry",
    header: "CustomGeometry.h".}
proc commit*(this: var CustomGeometry) {.importcpp: "Commit",
    header: "CustomGeometry.h".}
proc setMaterial*(this: var CustomGeometry; material: ptr Material) {.
    importcpp: "SetMaterial", header: "CustomGeometry.h".}
proc setMaterial*(this: var CustomGeometry; index: cuint; material: ptr Material): bool {.
    importcpp: "SetMaterial", header: "CustomGeometry.h".}
proc getNumGeometries*(this: CustomGeometry): cuint {.noSideEffect,
    importcpp: "GetNumGeometries", header: "CustomGeometry.h".}
proc getNumVertices*(this: CustomGeometry; index: cuint): cuint {.noSideEffect,
    importcpp: "GetNumVertices", header: "CustomGeometry.h".}
proc isDynamic*(this: CustomGeometry): bool {.noSideEffect,
    importcpp: "IsDynamic", header: "CustomGeometry.h".}
proc getMaterial*(this: CustomGeometry; index: cuint = 0): ptr Material {.
    noSideEffect, importcpp: "GetMaterial", header: "CustomGeometry.h".}
proc getVertices*(this: var CustomGeometry): var Vector[
    PODVector[CustomGeometryVertex]] {.importcpp: "GetVertices",
                                       header: "CustomGeometry.h".}
proc getVertex*(this: var CustomGeometry; geometryIndex: cuint; vertexNum: cuint): ptr CustomGeometryVertex {.
    importcpp: "GetVertex", header: "CustomGeometry.h".}
proc setGeometryDataAttr*(this: var CustomGeometry; value: PODVector[cuchar]) {.
    importcpp: "SetGeometryDataAttr", header: "CustomGeometry.h".}
proc setMaterialsAttr*(this: var CustomGeometry; value: ResourceRefList) {.
    importcpp: "SetMaterialsAttr", header: "CustomGeometry.h".}
proc getGeometryDataAttr*(this: CustomGeometry): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetGeometryDataAttr", header: "CustomGeometry.h".}
proc getMaterialsAttr*(this: CustomGeometry): ResourceRefList {.noSideEffect,
    importcpp: "GetMaterialsAttr", header: "CustomGeometry.h".}
