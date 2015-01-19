

import 
  attribute, hashMap, hashSet, ptrs, stringHash, vector, variant, connection


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

proc constructNodeReplicationState*(): NodeReplicationState {.
    importcpp: "Urho3D::NodeReplicationState(@)", header: "ReplicationState.h".}

proc clear*(this: var SceneReplicationState) {.importcpp: "Clear", 
    header: "ReplicationState.h".}