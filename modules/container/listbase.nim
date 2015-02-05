

import 
  allocator


type 
  ListNodeBase* {.importcpp: "Urho3D::ListNodeBase", header: "ListBase.h",
                  inheritable.} = object 
    prev* {.importc: "prev_".}: ptr ListNodeBase
    next* {.importc: "next_".}: ptr ListNodeBase


proc constructListNodeBase*(): ListNodeBase {.
    importcpp: "Urho3D::ListNodeBase(@)", header: "ListBase.h".}

type 
  ListIteratorBase* {.importcpp: "Urho3D::ListIteratorBase", header: "ListBase.h",
                      inheritable.} = object 
    `ptr`* {.importc: "ptr_".}: ptr ListNodeBase


proc constructListIteratorBase*(): ListIteratorBase {.
    importcpp: "Urho3D::ListIteratorBase(@)", header: "ListBase.h".}
proc constructListIteratorBase*(`ptr`: ptr ListNodeBase): ListIteratorBase {.
    importcpp: "Urho3D::ListIteratorBase(@)", header: "ListBase.h".}
proc `==`*(this: ListIteratorBase; rhs: ListIteratorBase): bool {.noSideEffect, 
    importcpp: "# == #", header: "ListBase.h".}
proc gotoNext*(this: var ListIteratorBase) {.importcpp: "GotoNext", 
    header: "ListBase.h".}
proc gotoPrev*(this: var ListIteratorBase) {.importcpp: "GotoPrev", 
    header: "ListBase.h".}

type 
  ListBase* {.importcpp: "Urho3D::ListBase", header: "ListBase.h",
              inheritable.} = object 
    head* {.importc: "head_".}: ptr ListNodeBase
    tail* {.importc: "tail_".}: ptr ListNodeBase
    allocator* {.importc: "allocator_".}: ptr AllocatorBlock
    size* {.importc: "size_".}: cuint


proc constructListBase*(): ListBase {.importcpp: "Urho3D::ListBase(@)", 
                                      header: "ListBase.h".}
proc swap*(this: var ListBase; rhs: var ListBase) {.importcpp: "Swap", 
    header: "ListBase.h".}