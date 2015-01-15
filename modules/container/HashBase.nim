

import 
  urho3D, allocator, hash, swap


type 
  HashNodeBase* {.importc: "Urho3D::HashNodeBase", header: "HashBase.h".} = object 
    down* {.importc: "down_".}: ptr HashNodeBase
    prev* {.importc: "prev_".}: ptr HashNodeBase
    next* {.importc: "next_".}: ptr HashNodeBase


proc constructHashNodeBase*(): HashNodeBase {.
    importcpp: "Urho3D::HashNodeBase(@)", header: "HashBase.h".}

type 
  HashIteratorBase* {.importc: "Urho3D::HashIteratorBase", header: "HashBase.h".} = object 
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
  HashBase* {.importc: "Urho3D::HashBase", header: "HashBase.h".} = object 
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