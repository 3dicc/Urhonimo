

import
  drawable, geometry, vertexbuffer, vector2, ptrs, vector, stringHash, urstr,
  urobject, octreequery, occlusionbuffer, material, boundingbox

discard "forward decl of Geometry"
discard "forward decl of Terrain"
discard "forward decl of VertexBuffer"
type
  TerrainPatch* {.importcpp: "Urho3D::TerrainPatch", header: "TerrainPatch.h".} = object of Drawable
    geometry* {.importc: "geometry_".}: SharedPtr[Geometry]
    maxLodGeometry* {.importc: "maxLodGeometry_".}: SharedPtr[Geometry]
    minLodGeometry* {.importc: "minLodGeometry_".}: SharedPtr[Geometry]
    vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]
    #owner* {.importc: "owner_".}: WeakPtr[Terrain]
    north* {.importc: "north_".}: WeakPtr[TerrainPatch]
    south* {.importc: "south_".}: WeakPtr[TerrainPatch]
    west* {.importc: "west_".}: WeakPtr[TerrainPatch]
    east* {.importc: "east_".}: WeakPtr[TerrainPatch]
    lodErrors* {.importc: "lodErrors_".}: PODVector[cfloat]
    coordinates* {.importc: "coordinates_".}: IntVector2
    lodLevel* {.importc: "lodLevel_".}: cuint
    occlusionOffset* {.importc: "occlusionOffset_".}: cfloat


proc getType*(this: TerrainPatch): StringHash {.noSideEffect,
    importcpp: "GetType", header: "TerrainPatch.h".}
proc getBaseType*(this: TerrainPatch): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "TerrainPatch.h".}
proc getTypeName*(this: TerrainPatch): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "TerrainPatch.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::TerrainPatch::GetTypeStatic(@)",
    header: "TerrainPatch.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::TerrainPatch::GetTypeNameStatic(@)",
    header: "TerrainPatch.h".}
proc constructTerrainPatch*(context: ptr Context): TerrainPatch {.
    importcpp: "Urho3D::TerrainPatch(@)", header: "TerrainPatch.h", constructor.}
proc destroyTerrainPatch*(this: var TerrainPatch) {.
    importcpp: "#.~TerrainPatch()", header: "TerrainPatch.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::TerrainPatch::RegisterObject(@)",
    header: "TerrainPatch.h".}
proc processRayQuery*(this: var TerrainPatch; query: RayOctreeQuery;
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "TerrainPatch.h".}
proc updateBatches*(this: var TerrainPatch; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "TerrainPatch.h".}
proc updateGeometry*(this: var TerrainPatch; frame: FrameInfo) {.
    importcpp: "UpdateGeometry", header: "TerrainPatch.h".}
proc getUpdateGeometryType*(this: var TerrainPatch): UpdateGeometryType {.
    importcpp: "GetUpdateGeometryType", header: "TerrainPatch.h".}
proc getLodGeometry*(this: var TerrainPatch; batchIndex: cuint; level: cuint): ptr Geometry {.
    importcpp: "GetLodGeometry", header: "TerrainPatch.h".}
proc getNumOccluderTriangles*(this: var TerrainPatch): cuint {.
    importcpp: "GetNumOccluderTriangles", header: "TerrainPatch.h".}
proc drawOcclusion*(this: var TerrainPatch; buffer: ptr OcclusionBuffer): bool {.
    importcpp: "DrawOcclusion", header: "TerrainPatch.h".}
#proc setOwner*(this: var TerrainPatch; terrain: ptr Terrain) {.
#    importcpp: "SetOwner", header: "TerrainPatch.h".}
proc setNeighbors*(this: var TerrainPatch; north: ptr TerrainPatch;
                   south: ptr TerrainPatch; west: ptr TerrainPatch;
                   east: ptr TerrainPatch) {.importcpp: "SetNeighbors",
    header: "TerrainPatch.h".}
proc setMaterial*(this: var TerrainPatch; material: ptr Material) {.
    importcpp: "SetMaterial", header: "TerrainPatch.h".}
proc setBoundingBox*(this: var TerrainPatch; box: BoundingBox) {.
    importcpp: "SetBoundingBox", header: "TerrainPatch.h".}
proc setCoordinates*(this: var TerrainPatch; coordinates: IntVector2) {.
    importcpp: "SetCoordinates", header: "TerrainPatch.h".}
proc setOcclusionOffset*(this: var TerrainPatch; offset: cfloat) {.
    importcpp: "SetOcclusionOffset", header: "TerrainPatch.h".}
proc resetLod*(this: var TerrainPatch) {.importcpp: "ResetLod",
    header: "TerrainPatch.h".}
proc getGeometry*(this: TerrainPatch): ptr Geometry {.noSideEffect,
    importcpp: "GetGeometry", header: "TerrainPatch.h".}
proc getMaxLodGeometry*(this: TerrainPatch): ptr Geometry {.noSideEffect,
    importcpp: "GetMaxLodGeometry", header: "TerrainPatch.h".}
proc getMinLodGeometry*(this: TerrainPatch): ptr Geometry {.noSideEffect,
    importcpp: "GetMinLodGeometry", header: "TerrainPatch.h".}
proc getVertexBuffer*(this: TerrainPatch): ptr VertexBuffer {.noSideEffect,
    importcpp: "GetVertexBuffer", header: "TerrainPatch.h".}
#proc getOwner*(this: TerrainPatch): ptr Terrain {.noSideEffect,
#    importcpp: "GetOwner", header: "TerrainPatch.h".}
proc getNorthPatch*(this: TerrainPatch): ptr TerrainPatch {.noSideEffect,
    importcpp: "GetNorthPatch", header: "TerrainPatch.h".}
proc getSouthPatch*(this: TerrainPatch): ptr TerrainPatch {.noSideEffect,
    importcpp: "GetSouthPatch", header: "TerrainPatch.h".}
proc getWestPatch*(this: TerrainPatch): ptr TerrainPatch {.noSideEffect,
    importcpp: "GetWestPatch", header: "TerrainPatch.h".}
proc getEastPatch*(this: TerrainPatch): ptr TerrainPatch {.noSideEffect,
    importcpp: "GetEastPatch", header: "TerrainPatch.h".}
proc getLodErrors*(this: var TerrainPatch): var PODVector[cfloat] {.
    importcpp: "GetLodErrors", header: "TerrainPatch.h".}
proc getCoordinates*(this: TerrainPatch): IntVector2 {.noSideEffect,
    importcpp: "GetCoordinates", header: "TerrainPatch.h".}
proc getLodLevel*(this: TerrainPatch): cuint {.noSideEffect,
    importcpp: "GetLodLevel", header: "TerrainPatch.h".}
proc getOcclusionOffset*(this: TerrainPatch): cfloat {.noSideEffect,
    importcpp: "GetOcclusionOffset", header: "TerrainPatch.h".}
