

import 
  file


type 
  RWOpsWrapper* {.importc: "Urho3D::RWOpsWrapper", header: "RWOpsWrapper.h".}[T] = object 
    ops* {.importc: "ops_".}: SDL_RWops


proc constructRWOpsWrapper*[T](`object`: var T): RWOpsWrapper[T] {.
    importcpp: "Urho3D::RWOpsWrapper(@)", header: "RWOpsWrapper.h".}
proc getRWOps*[T](this: var RWOpsWrapper[T]): ptr SDL_RWops {.
    importcpp: "GetRWOps", header: "RWOpsWrapper.h".}