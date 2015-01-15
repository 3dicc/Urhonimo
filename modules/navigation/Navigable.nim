

import 
  component


type 
  Navigable* {.importc: "Urho3D::Navigable", header: "Navigable.h".} = object of Component
    recursive* {.importc: "recursive_".}: bool


proc getType*(this: Navigable): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Navigable.h".}
proc getBaseType*(this: Navigable): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Navigable.h".}
proc getTypeName*(this: Navigable): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Navigable.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Navigable::GetTypeStatic(@)", header: "Navigable.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Navigable::GetTypeNameStatic(@)", header: "Navigable.h".}
proc constructNavigable*(context: ptr Context): Navigable {.
    importcpp: "Urho3D::Navigable(@)", header: "Navigable.h".}
proc destroyNavigable*(this: var Navigable) {.importcpp: "#.~Navigable()", 
    header: "Navigable.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Navigable::RegisterObject(@)", header: "Navigable.h".}
proc setRecursive*(this: var Navigable; enable: bool) {.
    importcpp: "SetRecursive", header: "Navigable.h".}
proc isRecursive*(this: Navigable): bool {.noSideEffect, 
    importcpp: "IsRecursive", header: "Navigable.h".}