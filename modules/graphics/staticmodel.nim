

import
  drawable, vector3, model, vector, stringhash, urobject, urstr, ptrs,
  graphics.geometry, variant, octreequery, occlusionbuffer, material

discard "forward decl of Model"
type
  StaticModelGeometryData* {.importcpp: "Urho3D::StaticModelGeometryData",
                             header: "StaticModel.h".} = object
    center* {.importc: "center_".}: Vector3
    lodLevel* {.importc: "lodLevel_".}: cuint



type
  StaticModel* {.importcpp: "Urho3D::StaticModel", header: "StaticModel.h".} = object of Drawable
    geometryData* {.importc: "geometryData_".}: PODVector[
        StaticModelGeometryData]
    geometries* {.importc: "geometries_".}: Vector[Vector[SharedPtr[Geometry]]]
    model* {.importc: "model_".}: SharedPtr[Model]
    occlusionLodLevel* {.importc: "occlusionLodLevel_".}: cuint
    materialsAttr* {.importc: "materialsAttr_".}: ResourceRefList


proc getType*(this: StaticModel): StringHash {.noSideEffect,
    importcpp: "GetType", header: "StaticModel.h".}
proc getBaseType*(this: StaticModel): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "StaticModel.h".}
proc getTypeName*(this: StaticModel): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "StaticModel.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::StaticModel::GetTypeStatic(@)", header: "StaticModel.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::StaticModel::GetTypeNameStatic(@)",
    header: "StaticModel.h".}
proc constructStaticModel*(context: ptr Context): StaticModel {.
    importcpp: "Urho3D::StaticModel(@)", header: "StaticModel.h", constructor.}
proc destroyStaticModel*(this: var StaticModel) {.importcpp: "#.~StaticModel()",
    header: "StaticModel.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::StaticModel::RegisterObject(@)", header: "StaticModel.h".}
proc processRayQuery*(this: var StaticModel; query: RayOctreeQuery;
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "StaticModel.h".}
proc updateBatches*(this: var StaticModel; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "StaticModel.h".}
proc getLodGeometry*(this: var StaticModel; batchIndex: cuint; level: cuint): ptr Geometry {.
    importcpp: "GetLodGeometry", header: "StaticModel.h".}
proc getNumOccluderTriangles*(this: var StaticModel): cuint {.
    importcpp: "GetNumOccluderTriangles", header: "StaticModel.h".}
proc drawOcclusion*(this: var StaticModel; buffer: ptr OcclusionBuffer): bool {.
    importcpp: "DrawOcclusion", header: "StaticModel.h".}
proc setModel*(this: var StaticModel; model: ptr Model) {.importcpp: "SetModel",
    header: "StaticModel.h".}
proc setMaterial*(this: var StaticModel; material: ptr Material) {.
    importcpp: "SetMaterial", header: "StaticModel.h".}
proc setMaterial*(this: var StaticModel; index: cuint; material: ptr Material): bool {.
    importcpp: "SetMaterial", header: "StaticModel.h".}
proc setOcclusionLodLevel*(this: var StaticModel; level: cuint) {.
    importcpp: "SetOcclusionLodLevel", header: "StaticModel.h".}
proc applyMaterialList*(this: var StaticModel;
                        fileName: UrString) {.
    importcpp: "ApplyMaterialList", header: "StaticModel.h".}
proc getModel*(this: StaticModel): ptr Model {.noSideEffect,
    importcpp: "GetModel", header: "StaticModel.h".}
proc getNumGeometries*(this: StaticModel): cuint {.noSideEffect,
    importcpp: "GetNumGeometries", header: "StaticModel.h".}
proc getMaterial*(this: StaticModel; index: cuint = 0): ptr Material {.
    noSideEffect, importcpp: "GetMaterial", header: "StaticModel.h".}
proc getOcclusionLodLevel*(this: StaticModel): cuint {.noSideEffect,
    importcpp: "GetOcclusionLodLevel", header: "StaticModel.h".}
proc isInside*(this: StaticModel; point: Vector3): bool {.noSideEffect,
    importcpp: "IsInside", header: "StaticModel.h".}
proc isInsideLocal*(this: StaticModel; point: Vector3): bool {.noSideEffect,
    importcpp: "IsInsideLocal", header: "StaticModel.h".}
proc setModelAttr*(this: var StaticModel; value: ResourceRef) {.
    importcpp: "SetModelAttr", header: "StaticModel.h".}
proc setMaterialsAttr*(this: var StaticModel; value: ResourceRefList) {.
    importcpp: "SetMaterialsAttr", header: "StaticModel.h".}
proc getModelAttr*(this: StaticModel): ResourceRef {.noSideEffect,
    importcpp: "GetModelAttr", header: "StaticModel.h".}
proc getMaterialsAttr*(this: StaticModel): ResourceRefList {.noSideEffect,
    importcpp: "GetMaterialsAttr", header: "StaticModel.h".}
