

import 
  model, skeleton, staticModel

discard "forward decl of Animation"
discard "forward decl of AnimationState"
type 
  AnimatedModel* {.importc: "Urho3D::AnimatedModel", header: "AnimatedModel.h".} = object of StaticModel
    skeleton* {.importc: "skeleton_".}: Skeleton
    morphVertexBuffers* {.importc: "morphVertexBuffers_".}: Vector[
        SharedPtr[VertexBuffer]]
    morphs* {.importc: "morphs_".}: Vector[ModelMorph]
    animationStates* {.importc: "animationStates_".}: Vector[
        SharedPtr[AnimationState]]
    skinMatrices* {.importc: "skinMatrices_".}: PODVector[Matrix3x4]
    geometryBoneMappings* {.importc: "geometryBoneMappings_".}: Vector[
        PODVector[cuint]]
    geometrySkinMatrices* {.importc: "geometrySkinMatrices_".}: Vector[
        PODVector[Matrix3x4]]
    geometrySkinMatrixPtrs* {.importc: "geometrySkinMatrixPtrs_".}: Vector[
        PODVector[ptr Matrix3x4]]
    boneBoundingBox* {.importc: "boneBoundingBox_".}: BoundingBox
    attrBuffer* {.importc: "attrBuffer_".}: VectorBuffer
    animationLodFrameNumber* {.importc: "animationLodFrameNumber_".}: cuint
    morphElementMask* {.importc: "morphElementMask_".}: cuint
    animationLodBias* {.importc: "animationLodBias_".}: cfloat
    animationLodTimer* {.importc: "animationLodTimer_".}: cfloat
    animationLodDistance* {.importc: "animationLodDistance_".}: cfloat
    updateInvisible* {.importc: "updateInvisible_".}: bool
    animationDirty* {.importc: "animationDirty_".}: bool
    animationOrderDirty* {.importc: "animationOrderDirty_".}: bool
    morphsDirty* {.importc: "morphsDirty_".}: bool
    skinningDirty* {.importc: "skinningDirty_".}: bool
    boneBoundingBoxDirty* {.importc: "boneBoundingBoxDirty_".}: bool
    isMaster* {.importc: "isMaster_".}: bool
    loading* {.importc: "loading_".}: bool
    assignBonesPending* {.importc: "assignBonesPending_".}: bool


proc getType*(this: AnimatedModel): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "AnimatedModel.h".}
proc getBaseType*(this: AnimatedModel): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "AnimatedModel.h".}
proc getTypeName*(this: AnimatedModel): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "AnimatedModel.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::AnimatedModel::GetTypeStatic(@)", 
    header: "AnimatedModel.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::AnimatedModel::GetTypeNameStatic(@)", 
    header: "AnimatedModel.h".}
proc constructAnimatedModel*(context: ptr Context): AnimatedModel {.
    importcpp: "Urho3D::AnimatedModel(@)", header: "AnimatedModel.h".}
proc destroyAnimatedModel*(this: var AnimatedModel) {.
    importcpp: "#.~AnimatedModel()", header: "AnimatedModel.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::AnimatedModel::RegisterObject(@)", 
    header: "AnimatedModel.h".}
proc load*(this: var AnimatedModel; source: var Deserializer; 
           setInstanceDefault: bool = false): bool {.importcpp: "Load", 
    header: "AnimatedModel.h".}
proc loadXML*(this: var AnimatedModel; source: XMLElement; 
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML", 
    header: "AnimatedModel.h".}
proc applyAttributes*(this: var AnimatedModel) {.importcpp: "ApplyAttributes", 
    header: "AnimatedModel.h".}
proc processRayQuery*(this: var AnimatedModel; query: RayOctreeQuery; 
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "AnimatedModel.h".}
proc update*(this: var AnimatedModel; frame: FrameInfo) {.importcpp: "Update", 
    header: "AnimatedModel.h".}
proc updateBatches*(this: var AnimatedModel; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "AnimatedModel.h".}
proc updateGeometry*(this: var AnimatedModel; frame: FrameInfo) {.
    importcpp: "UpdateGeometry", header: "AnimatedModel.h".}
proc getUpdateGeometryType*(this: var AnimatedModel): UpdateGeometryType {.
    importcpp: "GetUpdateGeometryType", header: "AnimatedModel.h".}
proc drawDebugGeometry*(this: var AnimatedModel; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "AnimatedModel.h".}
proc setModel*(this: var AnimatedModel; model: ptr Model; 
               createBones: bool = true) {.importcpp: "SetModel", 
    header: "AnimatedModel.h".}
proc addAnimationState*(this: var AnimatedModel; animation: ptr Animation): ptr AnimationState {.
    importcpp: "AddAnimationState", header: "AnimatedModel.h".}
proc removeAnimationState*(this: var AnimatedModel; animation: ptr Animation) {.
    importcpp: "RemoveAnimationState", header: "AnimatedModel.h".}
proc removeAnimationState*(this: var AnimatedModel; animationName: UrString) {.
    importcpp: "RemoveAnimationState", header: "AnimatedModel.h".}
proc removeAnimationState*(this: var AnimatedModel; 
                           animationNameHash: StringHash) {.
    importcpp: "RemoveAnimationState", header: "AnimatedModel.h".}
proc removeAnimationState*(this: var AnimatedModel; state: ptr AnimationState) {.
    importcpp: "RemoveAnimationState", header: "AnimatedModel.h".}
proc removeAnimationState*(this: var AnimatedModel; index: cuint) {.
    importcpp: "RemoveAnimationState", header: "AnimatedModel.h".}
proc removeAllAnimationStates*(this: var AnimatedModel) {.
    importcpp: "RemoveAllAnimationStates", header: "AnimatedModel.h".}
proc setAnimationLodBias*(this: var AnimatedModel; bias: cfloat) {.
    importcpp: "SetAnimationLodBias", header: "AnimatedModel.h".}
proc setUpdateInvisible*(this: var AnimatedModel; enable: bool) {.
    importcpp: "SetUpdateInvisible", header: "AnimatedModel.h".}
proc setMorphWeight*(this: var AnimatedModel; index: cuint; weight: cfloat) {.
    importcpp: "SetMorphWeight", header: "AnimatedModel.h".}
proc setMorphWeight*(this: var AnimatedModel; name: UrString; weight: cfloat) {.
    importcpp: "SetMorphWeight", header: "AnimatedModel.h".}
proc setMorphWeight*(this: var AnimatedModel; nameHash: StringHash; 
                     weight: cfloat) {.importcpp: "SetMorphWeight", 
                                       header: "AnimatedModel.h".}
proc resetMorphWeights*(this: var AnimatedModel) {.
    importcpp: "ResetMorphWeights", header: "AnimatedModel.h".}
proc getSkeleton*(this: var AnimatedModel): var Skeleton {.
    importcpp: "GetSkeleton", header: "AnimatedModel.h".}
proc getAnimationStates*(this: AnimatedModel): Vector[SharedPtr[AnimationState]] {.
    noSideEffect, importcpp: "GetAnimationStates", header: "AnimatedModel.h".}
proc getNumAnimationStates*(this: AnimatedModel): cuint {.noSideEffect, 
    importcpp: "GetNumAnimationStates", header: "AnimatedModel.h".}
proc getAnimationState*(this: AnimatedModel; animation: ptr Animation): ptr AnimationState {.
    noSideEffect, importcpp: "GetAnimationState", header: "AnimatedModel.h".}
proc getAnimationState*(this: AnimatedModel; animationName: UrString): ptr AnimationState {.
    noSideEffect, importcpp: "GetAnimationState", header: "AnimatedModel.h".}
proc getAnimationState*(this: AnimatedModel; animationNameHash: StringHash): ptr AnimationState {.
    noSideEffect, importcpp: "GetAnimationState", header: "AnimatedModel.h".}
proc getAnimationState*(this: AnimatedModel; index: cuint): ptr AnimationState {.
    noSideEffect, importcpp: "GetAnimationState", header: "AnimatedModel.h".}
proc getAnimationLodBias*(this: AnimatedModel): cfloat {.noSideEffect, 
    importcpp: "GetAnimationLodBias", header: "AnimatedModel.h".}
proc getUpdateInvisible*(this: AnimatedModel): bool {.noSideEffect, 
    importcpp: "GetUpdateInvisible", header: "AnimatedModel.h".}
proc getMorphs*(this: AnimatedModel): Vector[ModelMorph] {.noSideEffect, 
    importcpp: "GetMorphs", header: "AnimatedModel.h".}
proc getMorphVertexBuffers*(this: AnimatedModel): Vector[SharedPtr[VertexBuffer]] {.
    noSideEffect, importcpp: "GetMorphVertexBuffers", header: "AnimatedModel.h".}
proc getNumMorphs*(this: AnimatedModel): cuint {.noSideEffect, 
    importcpp: "GetNumMorphs", header: "AnimatedModel.h".}
proc getMorphWeight*(this: AnimatedModel; index: cuint): cfloat {.noSideEffect, 
    importcpp: "GetMorphWeight", header: "AnimatedModel.h".}
proc getMorphWeight*(this: AnimatedModel; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetMorphWeight", header: "AnimatedModel.h".}
proc getMorphWeight*(this: AnimatedModel; nameHash: StringHash): cfloat {.
    noSideEffect, importcpp: "GetMorphWeight", header: "AnimatedModel.h".}
proc isMaster*(this: AnimatedModel): bool {.noSideEffect, importcpp: "IsMaster", 
    header: "AnimatedModel.h".}
proc setModelAttr*(this: var AnimatedModel; value: ResourceRef) {.
    importcpp: "SetModelAttr", header: "AnimatedModel.h".}
proc setBonesEnabledAttr*(this: var AnimatedModel; value: VariantVector) {.
    importcpp: "SetBonesEnabledAttr", header: "AnimatedModel.h".}
proc setAnimationStatesAttr*(this: var AnimatedModel; value: VariantVector) {.
    importcpp: "SetAnimationStatesAttr", header: "AnimatedModel.h".}
proc setMorphsAttr*(this: var AnimatedModel; value: PODVector[cuchar]) {.
    importcpp: "SetMorphsAttr", header: "AnimatedModel.h".}
proc getModelAttr*(this: AnimatedModel): ResourceRef {.noSideEffect, 
    importcpp: "GetModelAttr", header: "AnimatedModel.h".}
proc getBonesEnabledAttr*(this: AnimatedModel): VariantVector {.noSideEffect, 
    importcpp: "GetBonesEnabledAttr", header: "AnimatedModel.h".}
proc getAnimationStatesAttr*(this: AnimatedModel): VariantVector {.noSideEffect, 
    importcpp: "GetAnimationStatesAttr", header: "AnimatedModel.h".}
proc getMorphsAttr*(this: AnimatedModel): PODVector[cuchar] {.noSideEffect, 
    importcpp: "GetMorphsAttr", header: "AnimatedModel.h".}
proc getGeometryBoneMappings*(this: AnimatedModel): Vector[PODVector[cuint]] {.
    noSideEffect, importcpp: "GetGeometryBoneMappings", 
    header: "AnimatedModel.h".}
proc getGeometrySkinMatrices*(this: AnimatedModel): Vector[PODVector[Matrix3x4]] {.
    noSideEffect, importcpp: "GetGeometrySkinMatrices", 
    header: "AnimatedModel.h".}