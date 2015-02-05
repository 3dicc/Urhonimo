

import 
  staticModel


type 
  StaticModelGroup* {.importc: "Urho3D::StaticModelGroup", 
                      header: "StaticModelGroup.h".} = object of StaticModel
    instanceNodes* {.importc: "instanceNodes_".}: Vector[WeakPtr[Node]]
    worldTransforms* {.importc: "worldTransforms_".}: PODVector[Matrix3x4]
    nodeIDsAttr* {.importc: "nodeIDsAttr_".}: VariantVector
    numWorldTransforms* {.importc: "numWorldTransforms_".}: cuint
    nodeIDsDirty* {.importc: "nodeIDsDirty_".}: bool


proc getType*(this: StaticModelGroup): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "StaticModelGroup.h".}
proc getBaseType*(this: StaticModelGroup): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "StaticModelGroup.h".}
proc getTypeName*(this: StaticModelGroup): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "StaticModelGroup.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::StaticModelGroup::GetTypeStatic(@)", 
    header: "StaticModelGroup.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::StaticModelGroup::GetTypeNameStatic(@)", 
    header: "StaticModelGroup.h".}
proc constructStaticModelGroup*(context: ptr Context): StaticModelGroup {.
    importcpp: "Urho3D::StaticModelGroup(@)", header: "StaticModelGroup.h".}
proc destroyStaticModelGroup*(this: var StaticModelGroup) {.
    importcpp: "#.~StaticModelGroup()", header: "StaticModelGroup.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::StaticModelGroup::RegisterObject(@)", 
    header: "StaticModelGroup.h".}
proc applyAttributes*(this: var StaticModelGroup) {.
    importcpp: "ApplyAttributes", header: "StaticModelGroup.h".}
proc processRayQuery*(this: var StaticModelGroup; query: RayOctreeQuery; 
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "StaticModelGroup.h".}
proc updateBatches*(this: var StaticModelGroup; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "StaticModelGroup.h".}
proc getNumOccluderTriangles*(this: var StaticModelGroup): cuint {.
    importcpp: "GetNumOccluderTriangles", header: "StaticModelGroup.h".}
proc drawOcclusion*(this: var StaticModelGroup; buffer: ptr OcclusionBuffer): bool {.
    importcpp: "DrawOcclusion", header: "StaticModelGroup.h".}
proc addInstanceNode*(this: var StaticModelGroup; node: ptr Node) {.
    importcpp: "AddInstanceNode", header: "StaticModelGroup.h".}
proc removeInstanceNode*(this: var StaticModelGroup; node: ptr Node) {.
    importcpp: "RemoveInstanceNode", header: "StaticModelGroup.h".}
proc removeAllInstanceNodes*(this: var StaticModelGroup) {.
    importcpp: "RemoveAllInstanceNodes", header: "StaticModelGroup.h".}
proc getNumInstanceNodes*(this: StaticModelGroup): cuint {.noSideEffect, 
    importcpp: "GetNumInstanceNodes", header: "StaticModelGroup.h".}
proc getInstanceNode*(this: StaticModelGroup; index: cuint): ptr Node {.
    noSideEffect, importcpp: "GetInstanceNode", header: "StaticModelGroup.h".}
proc setNodeIDsAttr*(this: var StaticModelGroup; value: VariantVector) {.
    importcpp: "SetNodeIDsAttr", header: "StaticModelGroup.h".}
proc getNodeIDsAttr*(this: StaticModelGroup): VariantVector {.noSideEffect, 
    importcpp: "GetNodeIDsAttr", header: "StaticModelGroup.h".}