

import 
  component, urobject, urstr, stringHash, ptrs, indexbuffer, image, arrayPtr,
  material, vector, terrainpatch, pair, vector3, vector2, attribute, variant

discard "forward decl of Image"
discard "forward decl of IndexBuffer"
discard "forward decl of Material"
discard "forward decl of Node"
discard "forward decl of TerrainPatch"
type 
  Terrain* {.importc: "Urho3D::Terrain", header: "Terrain.h".} = object of Component
    indexBuffer* {.importc: "indexBuffer_".}: SharedPtr[IndexBuffer]
    heightMap* {.importc: "heightMap_".}: SharedPtr[Image]
    heightData* {.importc: "heightData_".}: SharedArrayPtr[cfloat]
    sourceHeightData* {.importc: "sourceHeightData_".}: SharedArrayPtr[cfloat]
    material* {.importc: "material_".}: SharedPtr[Material]
    patches* {.importc: "patches_".}: Vector[WeakPtr[TerrainPatch]]
    drawRanges* {.importc: "drawRanges_".}: PODVector[Pair[cuint, cuint]]
    spacing* {.importc: "spacing_".}: Vector3
    lastSpacing* {.importc: "lastSpacing_".}: Vector3
    patchWorldOrigin* {.importc: "patchWorldOrigin_".}: Vector2
    patchWorldSize* {.importc: "patchWorldSize_".}: Vector2
    numVertices* {.importc: "numVertices_".}: IntVector2
    lastNumVertices* {.importc: "lastNumVertices_".}: IntVector2
    numPatches* {.importc: "numPatches_".}: IntVector2
    patchSize* {.importc: "patchSize_".}: cint
    lastPatchSize* {.importc: "lastPatchSize_".}: cint
    numLodLevels* {.importc: "numLodLevels_".}: cuint
    smoothing* {.importc: "smoothing_".}: bool
    visible* {.importc: "visible_".}: bool
    castShadows* {.importc: "castShadows_".}: bool
    occluder* {.importc: "occluder_".}: bool
    occludee* {.importc: "occludee_".}: bool
    viewMask* {.importc: "viewMask_".}: cuint
    lightMask* {.importc: "lightMask_".}: cuint
    shadowMask* {.importc: "shadowMask_".}: cuint
    zoneMask* {.importc: "zoneMask_".}: cuint
    drawDistance* {.importc: "drawDistance_".}: cfloat
    shadowDistance* {.importc: "shadowDistance_".}: cfloat
    lodBias* {.importc: "lodBias_".}: cfloat
    maxLights* {.importc: "maxLights_".}: cuint
    recreateTerrain* {.importc: "recreateTerrain_".}: bool


proc getType*(this: Terrain): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Terrain.h".}
proc getBaseType*(this: Terrain): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Terrain.h".}
proc getTypeName*(this: Terrain): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Terrain.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Terrain::GetTypeStatic(@)", header: "Terrain.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Terrain::GetTypeNameStatic(@)", header: "Terrain.h".}
proc constructTerrain*(context: ptr Context): Terrain {.
    importcpp: "Urho3D::Terrain(@)", header: "Terrain.h".}
proc destroyTerrain*(this: var Terrain) {.importcpp: "#.~Terrain()", 
    header: "Terrain.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Terrain::RegisterObject(@)", header: "Terrain.h".}
proc onSetAttribute*(this: var Terrain; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "Terrain.h".}
proc applyAttributes*(this: var Terrain) {.importcpp: "ApplyAttributes", 
    header: "Terrain.h".}
proc onSetEnabled*(this: var Terrain) {.importcpp: "OnSetEnabled", 
                                        header: "Terrain.h".}
proc setPatchSize*(this: var Terrain; size: cint) {.importcpp: "SetPatchSize", 
    header: "Terrain.h".}
proc setSpacing*(this: var Terrain; spacing: Vector3) {.importcpp: "SetSpacing", 
    header: "Terrain.h".}
proc setSmoothing*(this: var Terrain; enable: bool) {.importcpp: "SetSmoothing", 
    header: "Terrain.h".}
proc setHeightMap*(this: var Terrain; image: ptr Image): bool {.
    importcpp: "SetHeightMap", header: "Terrain.h", discardable.}
proc setMaterial*(this: var Terrain; material: ptr Material) {.
    importcpp: "SetMaterial", header: "Terrain.h".}
proc setDrawDistance*(this: var Terrain; distance: cfloat) {.
    importcpp: "SetDrawDistance", header: "Terrain.h".}
proc setShadowDistance*(this: var Terrain; distance: cfloat) {.
    importcpp: "SetShadowDistance", header: "Terrain.h".}
proc setLodBias*(this: var Terrain; bias: cfloat) {.importcpp: "SetLodBias", 
    header: "Terrain.h".}
proc setViewMask*(this: var Terrain; mask: cuint) {.importcpp: "SetViewMask", 
    header: "Terrain.h".}
proc setLightMask*(this: var Terrain; mask: cuint) {.importcpp: "SetLightMask", 
    header: "Terrain.h".}
proc setShadowMask*(this: var Terrain; mask: cuint) {.
    importcpp: "SetShadowMask", header: "Terrain.h".}
proc setZoneMask*(this: var Terrain; mask: cuint) {.importcpp: "SetZoneMask", 
    header: "Terrain.h".}
proc setMaxLights*(this: var Terrain; num: cuint) {.importcpp: "SetMaxLights", 
    header: "Terrain.h".}
proc setCastShadows*(this: var Terrain; enable: bool) {.
    importcpp: "SetCastShadows", header: "Terrain.h".}
proc setOccluder*(this: var Terrain; enable: bool) {.importcpp: "SetOccluder", 
    header: "Terrain.h".}
proc setOccludee*(this: var Terrain; enable: bool) {.importcpp: "SetOccludee", 
    header: "Terrain.h".}
proc applyHeightMap*(this: var Terrain) {.importcpp: "ApplyHeightMap", 
    header: "Terrain.h".}
proc getPatchSize*(this: Terrain): cint {.noSideEffect, 
    importcpp: "GetPatchSize", header: "Terrain.h".}
proc getSpacing*(this: Terrain): Vector3 {.noSideEffect, 
    importcpp: "GetSpacing", header: "Terrain.h".}
proc getNumVertices*(this: Terrain): IntVector2 {.noSideEffect, 
    importcpp: "GetNumVertices", header: "Terrain.h".}
proc getNumPatches*(this: Terrain): IntVector2 {.noSideEffect, 
    importcpp: "GetNumPatches", header: "Terrain.h".}
proc getSmoothing*(this: Terrain): bool {.noSideEffect, 
    importcpp: "GetSmoothing", header: "Terrain.h".}
proc getHeightMap*(this: Terrain): ptr Image {.noSideEffect, 
    importcpp: "GetHeightMap", header: "Terrain.h".}
proc getMaterial*(this: Terrain): ptr Material {.noSideEffect, 
    importcpp: "GetMaterial", header: "Terrain.h".}
proc getPatch*(this: Terrain; index: cuint): ptr TerrainPatch {.noSideEffect, 
    importcpp: "GetPatch", header: "Terrain.h".}
proc getPatch*(this: Terrain; x: cint; z: cint): ptr TerrainPatch {.
    noSideEffect, importcpp: "GetPatch", header: "Terrain.h".}
proc getHeight*(this: Terrain; worldPosition: Vector3): cfloat {.noSideEffect, 
    importcpp: "GetHeight", header: "Terrain.h".}
proc getNormal*(this: Terrain; worldPosition: Vector3): Vector3 {.noSideEffect, 
    importcpp: "GetNormal", header: "Terrain.h".}
proc worldToHeightMap*(this: Terrain; worldPosition: Vector3): IntVector2 {.
    noSideEffect, importcpp: "WorldToHeightMap", header: "Terrain.h".}
proc getHeightData*(this: Terrain): SharedArrayPtr[cfloat] {.noSideEffect, 
    importcpp: "GetHeightData", header: "Terrain.h".}
proc getDrawDistance*(this: Terrain): cfloat {.noSideEffect, 
    importcpp: "GetDrawDistance", header: "Terrain.h".}
proc getShadowDistance*(this: Terrain): cfloat {.noSideEffect, 
    importcpp: "GetShadowDistance", header: "Terrain.h".}
proc getLodBias*(this: Terrain): cfloat {.noSideEffect, importcpp: "GetLodBias", 
    header: "Terrain.h".}
proc getViewMask*(this: Terrain): cuint {.noSideEffect, 
    importcpp: "GetViewMask", header: "Terrain.h".}
proc getLightMask*(this: Terrain): cuint {.noSideEffect, 
    importcpp: "GetLightMask", header: "Terrain.h".}
proc getShadowMask*(this: Terrain): cuint {.noSideEffect, 
    importcpp: "GetShadowMask", header: "Terrain.h".}
proc getZoneMask*(this: Terrain): cuint {.noSideEffect, 
    importcpp: "GetZoneMask", header: "Terrain.h".}
proc getMaxLights*(this: Terrain): cuint {.noSideEffect, 
    importcpp: "GetMaxLights", header: "Terrain.h".}
proc isVisible*(this: Terrain): bool {.noSideEffect, importcpp: "IsVisible", 
                                       header: "Terrain.h".}
proc getCastShadows*(this: Terrain): bool {.noSideEffect, 
    importcpp: "GetCastShadows", header: "Terrain.h".}
proc isOccluder*(this: Terrain): bool {.noSideEffect, importcpp: "IsOccluder", 
                                        header: "Terrain.h".}
proc isOccludee*(this: Terrain): bool {.noSideEffect, importcpp: "IsOccludee", 
                                        header: "Terrain.h".}
proc createPatchGeometry*(this: var Terrain; patch: ptr TerrainPatch) {.
    importcpp: "CreatePatchGeometry", header: "Terrain.h".}
proc updatePatchLod*(this: var Terrain; patch: ptr TerrainPatch) {.
    importcpp: "UpdatePatchLod", header: "Terrain.h".}
proc setHeightMapAttr*(this: var Terrain; value: ResourceRef) {.
    importcpp: "SetHeightMapAttr", header: "Terrain.h".}
proc setMaterialAttr*(this: var Terrain; value: ResourceRef) {.
    importcpp: "SetMaterialAttr", header: "Terrain.h".}
proc setPatchSizeAttr*(this: var Terrain; value: cint) {.
    importcpp: "SetPatchSizeAttr", header: "Terrain.h".}
proc getHeightMapAttr*(this: Terrain): ResourceRef {.noSideEffect, 
    importcpp: "GetHeightMapAttr", header: "Terrain.h".}
proc getMaterialAttr*(this: Terrain): ResourceRef {.noSideEffect, 
    importcpp: "GetMaterialAttr", header: "Terrain.h".}
