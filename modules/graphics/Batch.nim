

import 
  drawable, mathDefs, matrix3x4, ptrs, rect, camera, graphics.geometry, light,
  material, matrix4, shadervariation, texture2d, vertexbuffer, zone, technique,
  graphicsdefs, vector, view

import hashmap except Node

discard "forward decl of Camera"
discard "forward decl of Drawable"
discard "forward decl of Geometry"
discard "forward decl of Light"
discard "forward decl of Material"
discard "forward decl of Matrix3x4"
discard "forward decl of Pass"
discard "forward decl of ShaderVariation"
discard "forward decl of Texture2D"
discard "forward decl of VertexBuffer"
discard "forward decl of View"
discard "forward decl of Zone"
discard "forward decl of LightBatchQueue"
type 
  Batch* {.importc: "Urho3D::Batch", header: "Batch.h", inheritable.} = object 
    sortKey* {.importc: "sortKey_".}: culonglong
    distance* {.importc: "distance_".}: cfloat
    geometry* {.importc: "geometry_".}: ptr Geometry
    material* {.importc: "material_".}: ptr Material
    worldTransform* {.importc: "worldTransform_".}: ptr Matrix3x4
    numWorldTransforms* {.importc: "numWorldTransforms_".}: cuint
    camera* {.importc: "camera_".}: ptr Camera
    zone* {.importc: "zone_".}: ptr Zone
    lightQueue* {.importc: "lightQueue_".}: ptr LightBatchQueue
    pass* {.importc: "pass_".}: ptr Pass
    vertexShader* {.importc: "vertexShader_".}: ptr ShaderVariation
    pixelShader* {.importc: "pixelShader_".}: ptr ShaderVariation
    geometryType* {.importc: "geometryType_".}: GeometryType
    overrideView* {.importc: "overrideView_".}: bool
    isBase* {.importc: "isBase_".}: bool
    lightMask* {.importc: "lightMask_".}: cuchar

  LightBatchQueue* {.importc: "Urho3D::LightBatchQueue", header: "Batch.h".} = object 
    light* {.importc: "light_".}: ptr Light
    shadowMap* {.importc: "shadowMap_".}: ptr Texture2D
    litBaseBatches* {.importc: "litBaseBatches_".}: BatchQueue
    litBatches* {.importc: "litBatches_".}: BatchQueue
    shadowSplits* {.importc: "shadowSplits_".}: Vector[ShadowBatchQueue]
    vertexLights* {.importc: "vertexLights_".}: PODVector[ptr Light]
    volumeBatches* {.importc: "volumeBatches_".}: PODVector[Batch]

  BatchQueue* {.importc: "Urho3D::BatchQueue", header: "Batch.h".} = object 
    batchGroups* {.importc: "batchGroups_".}: HashMap[BatchGroupKey, BatchGroup]
    shaderRemapping* {.importc: "shaderRemapping_".}: HashMap[cuint, cuint]
    materialRemapping* {.importc: "materialRemapping_".}: HashMap[cushort, 
        cushort]
    geometryRemapping* {.importc: "geometryRemapping_".}: HashMap[cushort, 
        cushort]
    batches* {.importc: "batches_".}: PODVector[Batch]
    sortedBatches* {.importc: "sortedBatches_".}: PODVector[ptr Batch]
    sortedBatchGroups* {.importc: "sortedBatchGroups_".}: PODVector[
        ptr BatchGroup]
    maxSortedInstances* {.importc: "maxSortedInstances_".}: cuint

  ShadowBatchQueue* {.importc: "Urho3D::ShadowBatchQueue", header: "Batch.h".} = object 
    shadowCamera* {.importc: "shadowCamera_".}: ptr Camera
    shadowViewport* {.importc: "shadowViewport_".}: IntRect
    shadowBatches* {.importc: "shadowBatches_".}: BatchQueue
    nearSplit* {.importc: "nearSplit_".}: cfloat
    farSplit* {.importc: "farSplit_".}: cfloat

  BatchGroupKey* {.importc: "Urho3D::BatchGroupKey", header: "Batch.h".} = object 
    zone* {.importc: "zone_".}: ptr Zone
    lightQueue* {.importc: "lightQueue_".}: ptr LightBatchQueue
    pass* {.importc: "pass_".}: ptr Pass
    material* {.importc: "material_".}: ptr Material
    geometry* {.importc: "geometry_".}: ptr Geometry

  InstanceData* {.importc: "Urho3D::InstanceData", header: "Batch.h".} = object 
    worldTransform* {.importc: "worldTransform_".}: ptr Matrix3x4
    distance* {.importc: "distance_".}: cfloat
  BatchGroup* {.importc: "Urho3D::BatchGroup", header: "Batch.h".} = object of Batch
    instances* {.importc: "instances_".}: PODVector[InstanceData]
    startIndex* {.importc: "startIndex_".}: cuint

proc constructBatch*(): Batch {.importcpp: "Urho3D::Batch(@)", header: "Batch.h".}
proc constructBatch*(rhs: SourceBatch): Batch {.importcpp: "Urho3D::Batch(@)", 
    header: "Batch.h".}
proc calculateSortKey*(this: var Batch) {.importcpp: "CalculateSortKey", 
    header: "Batch.h".}
proc prepare*(this: Batch; view: ptr View; setModelTransform: bool = true) {.
    noSideEffect, importcpp: "Prepare", header: "Batch.h".}
proc draw*(this: Batch; view: ptr View) {.noSideEffect, importcpp: "Draw", 
    header: "Batch.h".}

proc constructInstanceData*(): InstanceData {.
    importcpp: "Urho3D::InstanceData(@)", header: "Batch.h".}
proc constructInstanceData*(worldTransform: ptr Matrix3x4; distance: cfloat): InstanceData {.
    importcpp: "Urho3D::InstanceData(@)", header: "Batch.h".}


proc constructBatchGroup*(): BatchGroup {.importcpp: "Urho3D::BatchGroup(@)", 
    header: "Batch.h".}
proc constructBatchGroup*(batch: Batch): BatchGroup {.
    importcpp: "Urho3D::BatchGroup(@)", header: "Batch.h".}
proc destroyBatchGroup*(this: var BatchGroup) {.importcpp: "#.~BatchGroup()", 
    header: "Batch.h".}
proc addTransforms*(this: var BatchGroup; batch: Batch) {.
    importcpp: "AddTransforms", header: "Batch.h".}
proc setTransforms*(this: var BatchGroup; lockedData: pointer; 
                    freeIndex: var cuint) {.importcpp: "SetTransforms", 
    header: "Batch.h".}
proc draw*(this: BatchGroup; view: ptr View) {.noSideEffect, importcpp: "Draw", 
    header: "Batch.h".}


proc constructBatchGroupKey*(): BatchGroupKey {.
    importcpp: "Urho3D::BatchGroupKey(@)", header: "Batch.h".}
proc constructBatchGroupKey*(batch: Batch): BatchGroupKey {.
    importcpp: "Urho3D::BatchGroupKey(@)", header: "Batch.h".}
proc `==`*(this: BatchGroupKey; rhs: BatchGroupKey): bool {.noSideEffect, 
    importcpp: "# == #", header: "Batch.h".}
proc toHash*(this: BatchGroupKey): cuint {.noSideEffect, importcpp: "ToHash", 
    header: "Batch.h".}


proc clear*(this: var BatchQueue; maxSortedInstances: cint) {.
    importcpp: "Clear", header: "Batch.h".}
proc sortBackToFront*(this: var BatchQueue) {.importcpp: "SortBackToFront", 
    header: "Batch.h".}
proc sortFrontToBack*(this: var BatchQueue) {.importcpp: "SortFrontToBack", 
    header: "Batch.h".}
proc sortFrontToBack2Pass*(this: var BatchQueue; 
                           batches: var PODVector[ptr Batch]) {.
    importcpp: "SortFrontToBack2Pass", header: "Batch.h".}
proc setTransforms*(this: var BatchQueue; lockedData: pointer; 
                    freeIndex: var cuint) {.importcpp: "SetTransforms", 
    header: "Batch.h".}
proc draw*(this: BatchQueue; view: ptr View; markToStencil: bool = false; 
           usingLightOptimization: bool = false) {.noSideEffect, 
    importcpp: "Draw", header: "Batch.h".}
proc getNumInstances*(this: BatchQueue): cuint {.noSideEffect, 
    importcpp: "GetNumInstances", header: "Batch.h".}
proc isEmpty*(this: BatchQueue): bool {.noSideEffect, importcpp: "IsEmpty", 
                                        header: "Batch.h".}


proc setLightQueue*(this: var Light; queue: ptr LightBatchQueue) {.
    importcpp: "SetLightQueue", header: "Light.h".}
proc getLightQueue*(this: Light): ptr LightBatchQueue {.noSideEffect, 
    importcpp: "GetLightQueue", header: "Light.h".}
