

import 
  attribute, hashMap, hashSet, `ptr`, stringHash

var MAX_NETWORK_ATTRIBUTES* {.importc: "MAX_NETWORK_ATTRIBUTES", 
                              header: "ReplicationState.h".}: cuint = 64

discard "forward decl of Component"
discard "forward decl of Connection"
discard "forward decl of Node"
discard "forward decl of Scene"
discard "forward decl of ReplicationState"
discard "forward decl of ComponentReplicationState"
discard "forward decl of NodeReplicationState"
discard "forward decl of SceneReplicationState"
type 
  DirtyBits* {.importc: "Urho3D::DirtyBits", header: "ReplicationState.h".} = object 
    data* {.importc: "data_".}: array[max_Network_Attributes div 8, cuchar]
    count* {.importc: "count_".}: cuchar


proc constructDirtyBits*(): DirtyBits {.importcpp: "Urho3D::DirtyBits(@)", 
                                        header: "ReplicationState.h".}
proc constructDirtyBits*(bits: DirtyBits): DirtyBits {.
    importcpp: "Urho3D::DirtyBits(@)", header: "ReplicationState.h".}
proc set*(this: var DirtyBits; index: cuint) {.importcpp: "Set", 
    header: "ReplicationState.h".}
proc clear*(this: var DirtyBits; index: cuint) {.importcpp: "Clear", 
    header: "ReplicationState.h".}
proc clearAll*(this: var DirtyBits) {.importcpp: "ClearAll", 
                                      header: "ReplicationState.h".}
proc isSet*(this: DirtyBits; index: cuint): bool {.noSideEffect, 
    importcpp: "IsSet", header: "ReplicationState.h".}
proc count*(this: DirtyBits): cuint {.noSideEffect, importcpp: "Count", 
                                      header: "ReplicationState.h".}

type 
  NetworkState* {.importc: "Urho3D::NetworkState", header: "ReplicationState.h".} = object 
    attributes* {.importc: "attributes_".}: ptr Vector[AttributeInfo]
    currentValues* {.importc: "currentValues_".}: Vector[Variant]
    previousValues* {.importc: "previousValues_".}: Vector[Variant]
    replicationStates* {.importc: "replicationStates_".}: PODVector[
        ptr ReplicationState]
    previousVars* {.importc: "previousVars_".}: VariantMap



type 
  ReplicationState* {.importc: "Urho3D::ReplicationState", 
                      header: "ReplicationState.h".} = object 
    connection* {.importc: "connection_".}: ptr Connection



type 
  ComponentReplicationState* {.importc: "Urho3D::ComponentReplicationState", 
                               header: "ReplicationState.h".} = object of ReplicationState
    nodeState* {.importc: "nodeState_".}: ptr NodeReplicationState
    component* {.importc: "component_".}: WeakPtr[Component]
    dirtyAttributes* {.importc: "dirtyAttributes_".}: DirtyBits



type 
  NodeReplicationState* {.importc: "Urho3D::NodeReplicationState", 
                          header: "ReplicationState.h".} = object of ReplicationState
    sceneState* {.importc: "sceneState_".}: ptr SceneReplicationState
    node* {.importc: "node_".}: WeakPtr[Node]
    dirtyAttributes* {.importc: "dirtyAttributes_".}: DirtyBits
    dirtyVars* {.importc: "dirtyVars_".}: HashSet[StringHash]
    componentStates* {.importc: "componentStates_".}: HashMap[cuint, 
        ComponentReplicationState]
    priorityAcc* {.importc: "priorityAcc_".}: cfloat
    markedDirty* {.importc: "markedDirty_".}: bool


proc constructNodeReplicationState*(): NodeReplicationState {.
    importcpp: "Urho3D::NodeReplicationState(@)", header: "ReplicationState.h".}

type 
  SceneReplicationState* {.importc: "Urho3D::SceneReplicationState", 
                           header: "ReplicationState.h".} = object of ReplicationState
    nodeStates* {.importc: "nodeStates_".}: HashMap[cuint, NodeReplicationState]
    dirtyNodes* {.importc: "dirtyNodes_".}: HashSet[cuint]


proc clear*(this: var SceneReplicationState) {.importcpp: "Clear", 
    header: "ReplicationState.h".}