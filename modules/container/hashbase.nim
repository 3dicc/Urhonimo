

import 
  allocator, hash


type 
  HashNodeBase* {.importcpp: "Urho3D::HashNodeBase", header: "HashBase.h",
                  inheritable.} = object 
    down* {.importc: "down_".}: ptr HashNodeBase
    prev* {.importc: "prev_".}: ptr HashNodeBase
    next* {.importc: "next_".}: ptr HashNodeBase


proc constructHashNodeBase*(): HashNodeBase {.
    importcpp: "Urho3D::HashNodeBase(@)", header: "HashBase.h".}

type 
  HashIteratorBase* {.importcpp: "Urho3D::HashIteratorBase", header: "HashBase.h",
                      inheritable.} = object 
    `ptr`* {.importc: "ptr_".}: ptr HashNodeBase


proc constructHashIteratorBase*(): HashIteratorBase {.
    importcpp: "Urho3D::HashIteratorBase(@)", header: "HashBase.h".}
proc constructHashIteratorBase*(`ptr`: ptr HashNodeBase): HashIteratorBase {.
    importcpp: "Urho3D::HashIteratorBase(@)", header: "HashBase.h".}
proc `==`*(this: HashIteratorBase; rhs: HashIteratorBase): bool {.noSideEffect, 
    importcpp: "# == #", header: "HashBase.h".}
proc gotoNext*(this: var HashIteratorBase) {.importcpp: "GotoNext", 
    header: "HashBase.h".}
proc gotoPrev*(this: var HashIteratorBase) {.importcpp: "GotoPrev", 
    header: "HashBase.h".}

type 
  HashBase* {.importcpp: "Urho3D::HashBase", header: "HashBase.h", 
              inheritable.} = object 
    head* {.importc: "head_".}: ptr HashNodeBase
    tail* {.importc: "tail_".}: ptr HashNodeBase
    ptrs* {.importc: "ptrs_".}: ptr ptr HashNodeBase
    allocator* {.importc: "allocator_".}: ptr AllocatorBlock


proc constructHashBase*(): HashBase {.importcpp: "Urho3D::HashBase(@)", 
                                      header: "HashBase.h".}
proc swap*(this: var HashBase; rhs: var HashBase) {.importcpp: "Swap", 
    header: "HashBase.h".}
proc size*(this: HashBase): cuint {.noSideEffect, importcpp: "Size", 
                                    header: "HashBase.h".}
proc numBuckets*(this: HashBase): cuint {.noSideEffect, importcpp: "NumBuckets", 
    header: "HashBase.h".}
proc empty*(this: HashBase): bool {.noSideEffect, importcpp: "Empty", 
                                    header: "HashBase.h".}