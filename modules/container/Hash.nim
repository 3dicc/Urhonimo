


proc makeHash*[T](value: ptr T): cuint {.noSideEffect,
  importcpp: "Urho3D::MakeHash(@)", header: "Hash.h".}

proc makeHash*[T](value: T): cuint{.noSideEffect,
  importcpp: "Urho3D::MakeHash(@)", header: "Hash.h".}
