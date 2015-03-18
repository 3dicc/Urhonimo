

import
  arrayPtr, boundingBox, component, hashSet, matrix3x4

discard "forward decl of dtNavMesh"
discard "forward decl of dtNavMeshQuery"
discard "forward decl of dtQueryFilter"
discard "forward decl of Geometry"
discard "forward decl of FindPathData"
discard "forward decl of NavigationBuildData"
type
  NavigationGeometryInfo* {.importcpp: "Urho3D::NavigationGeometryInfo",
                            header: "NavigationMesh.h".} = object
    component* {.importc: "component_".}: ptr Component
    lodLevel* {.importc: "lodLevel_".}: cuint
    transform* {.importc: "transform_".}: Matrix3x4
    boundingBox* {.importc: "boundingBox_".}: BoundingBox



type
  NavigationMesh* {.importcpp: "Urho3D::NavigationMesh",
                    header: "NavigationMesh.h".} = object of Component
    navMesh* {.importc: "navMesh_".}: ptr DtNavMesh
    navMeshQuery* {.importc: "navMeshQuery_".}: ptr DtNavMeshQuery
    queryFilter* {.importc: "queryFilter_".}: ptr DtQueryFilter
    pathData* {.importc: "pathData_".}: ptr FindPathData
    tileSize* {.importc: "tileSize_".}: cint
    cellSize* {.importc: "cellSize_".}: cfloat
    cellHeight* {.importc: "cellHeight_".}: cfloat
    agentHeight* {.importc: "agentHeight_".}: cfloat
    agentRadius* {.importc: "agentRadius_".}: cfloat
    agentMaxClimb* {.importc: "agentMaxClimb_".}: cfloat
    agentMaxSlope* {.importc: "agentMaxSlope_".}: cfloat
    regionMinSize* {.importc: "regionMinSize_".}: cfloat
    regionMergeSize* {.importc: "regionMergeSize_".}: cfloat
    edgeMaxLength* {.importc: "edgeMaxLength_".}: cfloat
    edgeMaxError* {.importc: "edgeMaxError_".}: cfloat
    detailSampleDistance* {.importc: "detailSampleDistance_".}: cfloat
    detailSampleMaxError* {.importc: "detailSampleMaxError_".}: cfloat
    padding* {.importc: "padding_".}: Vector3
    numTilesX* {.importc: "numTilesX_".}: cint
    numTilesZ* {.importc: "numTilesZ_".}: cint
    boundingBox* {.importc: "boundingBox_".}: BoundingBox


proc getType*(this: NavigationMesh): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "NavigationMesh.h".}
proc getBaseType*(this: NavigationMesh): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "NavigationMesh.h".}
proc getTypeName*(this: NavigationMesh): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "NavigationMesh.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::NavigationMesh::GetTypeStatic(@)",
    header: "NavigationMesh.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::NavigationMesh::GetTypeNameStatic(@)",
    header: "NavigationMesh.h".}
proc constructNavigationMesh*(context: ptr Context): NavigationMesh {.
    importcpp: "Urho3D::NavigationMesh(@)", header: "NavigationMesh.h",
    constructor.}
proc destroyNavigationMesh*(this: var NavigationMesh) {.
    importcpp: "#.~NavigationMesh()", header: "NavigationMesh.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::NavigationMesh::RegisterObject(@)",
    header: "NavigationMesh.h".}
proc drawDebugGeometry*(this: var NavigationMesh; debug: ptr DebugRenderer;
                        depthTest: bool) {.importcpp: "DrawDebugGeometry",
    header: "NavigationMesh.h".}
proc setTileSize*(this: var NavigationMesh; size: cint) {.
    importcpp: "SetTileSize", header: "NavigationMesh.h".}
proc setCellSize*(this: var NavigationMesh; size: cfloat) {.
    importcpp: "SetCellSize", header: "NavigationMesh.h".}
proc setCellHeight*(this: var NavigationMesh; height: cfloat) {.
    importcpp: "SetCellHeight", header: "NavigationMesh.h".}
proc setAgentHeight*(this: var NavigationMesh; height: cfloat) {.
    importcpp: "SetAgentHeight", header: "NavigationMesh.h".}
proc setAgentRadius*(this: var NavigationMesh; radius: cfloat) {.
    importcpp: "SetAgentRadius", header: "NavigationMesh.h".}
proc setAgentMaxClimb*(this: var NavigationMesh; maxClimb: cfloat) {.
    importcpp: "SetAgentMaxClimb", header: "NavigationMesh.h".}
proc setAgentMaxSlope*(this: var NavigationMesh; maxSlope: cfloat) {.
    importcpp: "SetAgentMaxSlope", header: "NavigationMesh.h".}
proc setRegionMinSize*(this: var NavigationMesh; size: cfloat) {.
    importcpp: "SetRegionMinSize", header: "NavigationMesh.h".}
proc setRegionMergeSize*(this: var NavigationMesh; size: cfloat) {.
    importcpp: "SetRegionMergeSize", header: "NavigationMesh.h".}
proc setEdgeMaxLength*(this: var NavigationMesh; length: cfloat) {.
    importcpp: "SetEdgeMaxLength", header: "NavigationMesh.h".}
proc setEdgeMaxError*(this: var NavigationMesh; error: cfloat) {.
    importcpp: "SetEdgeMaxError", header: "NavigationMesh.h".}
proc setDetailSampleDistance*(this: var NavigationMesh; distance: cfloat) {.
    importcpp: "SetDetailSampleDistance", header: "NavigationMesh.h".}
proc setDetailSampleMaxError*(this: var NavigationMesh; error: cfloat) {.
    importcpp: "SetDetailSampleMaxError", header: "NavigationMesh.h".}
proc setPadding*(this: var NavigationMesh; padding: Vector3) {.
    importcpp: "SetPadding", header: "NavigationMesh.h".}
proc build*(this: var NavigationMesh): bool {.importcpp: "Build",
    header: "NavigationMesh.h".}
proc build*(this: var NavigationMesh; boundingBox: BoundingBox): bool {.
    importcpp: "Build", header: "NavigationMesh.h".}
proc findNearestPoint*(this: var NavigationMesh; point: Vector3;
                       extents: Vector3 = vector3.one): Vector3 {.
    importcpp: "FindNearestPoint", header: "NavigationMesh.h".}
proc moveAlongSurface*(this: var NavigationMesh; start: Vector3; `end`: Vector3;
                       extents: Vector3 = vector3.one; maxVisited: cint = 3): Vector3 {.
    importcpp: "MoveAlongSurface", header: "NavigationMesh.h".}
proc findPath*(this: var NavigationMesh; dest: var PODVector[Vector3];
               start: Vector3; `end`: Vector3; extents: Vector3 = vector3.one) {.
    importcpp: "FindPath", header: "NavigationMesh.h".}
proc getRandomPoint*(this: var NavigationMesh): Vector3 {.
    importcpp: "GetRandomPoint", header: "NavigationMesh.h".}
proc getRandomPointInCircle*(this: var NavigationMesh; center: Vector3;
                             radius: cfloat; extents: Vector3 = vector3.one): Vector3 {.
    importcpp: "GetRandomPointInCircle", header: "NavigationMesh.h".}
proc getDistanceToWall*(this: var NavigationMesh; point: Vector3;
                        radius: cfloat; extents: Vector3 = vector3.one): cfloat {.
    importcpp: "GetDistanceToWall", header: "NavigationMesh.h".}
proc raycast*(this: var NavigationMesh; start: Vector3; `end`: Vector3;
              extents: Vector3 = vector3.one): Vector3 {.importcpp: "Raycast",
    header: "NavigationMesh.h".}
proc drawDebugGeometry*(this: var NavigationMesh; depthTest: bool) {.
    importcpp: "DrawDebugGeometry", header: "NavigationMesh.h".}
proc getTileSize*(this: NavigationMesh): cint {.noSideEffect,
    importcpp: "GetTileSize", header: "NavigationMesh.h".}
proc getCellSize*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetCellSize", header: "NavigationMesh.h".}
proc getCellHeight*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetCellHeight", header: "NavigationMesh.h".}
proc getAgentHeight*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetAgentHeight", header: "NavigationMesh.h".}
proc getAgentRadius*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetAgentRadius", header: "NavigationMesh.h".}
proc getAgentMaxClimb*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetAgentMaxClimb", header: "NavigationMesh.h".}
proc getAgentMaxSlope*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetAgentMaxSlope", header: "NavigationMesh.h".}
proc getRegionMinSize*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetRegionMinSize", header: "NavigationMesh.h".}
proc getRegionMergeSize*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetRegionMergeSize", header: "NavigationMesh.h".}
proc getEdgeMaxLength*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetEdgeMaxLength", header: "NavigationMesh.h".}
proc getEdgeMaxError*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetEdgeMaxError", header: "NavigationMesh.h".}
proc getDetailSampleDistance*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetDetailSampleDistance", header: "NavigationMesh.h".}
proc getDetailSampleMaxError*(this: NavigationMesh): cfloat {.noSideEffect,
    importcpp: "GetDetailSampleMaxError", header: "NavigationMesh.h".}
proc getPadding*(this: NavigationMesh): Vector3 {.noSideEffect,
    importcpp: "GetPadding", header: "NavigationMesh.h".}
proc isInitialized*(this: NavigationMesh): bool {.noSideEffect,
    importcpp: "IsInitialized", header: "NavigationMesh.h".}
proc getBoundingBox*(this: NavigationMesh): BoundingBox {.noSideEffect,
    importcpp: "GetBoundingBox", header: "NavigationMesh.h".}
proc getWorldBoundingBox*(this: NavigationMesh): BoundingBox {.noSideEffect,
    importcpp: "GetWorldBoundingBox", header: "NavigationMesh.h".}
proc getNumTiles*(this: NavigationMesh): IntVector2 {.noSideEffect,
    importcpp: "GetNumTiles", header: "NavigationMesh.h".}
proc setNavigationDataAttr*(this: var NavigationMesh; value: PODVector[cuchar]) {.
    importcpp: "SetNavigationDataAttr", header: "NavigationMesh.h".}
proc getNavigationDataAttr*(this: NavigationMesh): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetNavigationDataAttr", header: "NavigationMesh.h".}

proc registerNavigationLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterNavigationLibrary(@)",
    header: "NavigationMesh.h".}
