

import 
  urho3D


type 
  RefCount* {.importc: "Urho3D::RefCount", header: "RefCounted.h".} = object 
    refs* {.importc: "refs_".}: cint
    weakRefs* {.importc: "weakRefs_".}: cint


proc constructRefCount*(): RefCount {.importcpp: "Urho3D::RefCount(@)", 
                                      header: "RefCounted.h".}
proc destroyRefCount*(this: var RefCount) {.importcpp: "#.~RefCount()", 
    header: "RefCounted.h".}

type 
  RefCounted* {.importc: "Urho3D::RefCounted", header: "RefCounted.h".} = object 
    refCount* {.importc: "refCount_".}: ptr RefCount


proc constructRefCounted*(): RefCounted {.importcpp: "Urho3D::RefCounted(@)", 
    header: "RefCounted.h".}
proc destroyRefCounted*(this: var RefCounted) {.importcpp: "#.~RefCounted()", 
    header: "RefCounted.h".}
proc addRef*(this: var RefCounted) {.importcpp: "AddRef", header: "RefCounted.h".}
proc releaseRef*(this: var RefCounted) {.importcpp: "ReleaseRef", 
    header: "RefCounted.h".}
proc refs*(this: RefCounted): cint {.noSideEffect, importcpp: "Refs", 
                                     header: "RefCounted.h".}
proc weakRefs*(this: RefCounted): cint {.noSideEffect, importcpp: "WeakRefs", 
    header: "RefCounted.h".}
proc refCountPtr*(this: var RefCounted): ptr RefCount {.
    importcpp: "RefCountPtr", header: "RefCounted.h".}