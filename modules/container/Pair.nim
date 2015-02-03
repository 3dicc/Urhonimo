

import 
  hash


type 
  Pair* {.importcpp: "Urho3D::Pair", header: "Pair.h".}[T, U] = object 
    first* {.importc: "first_".}: T
    second* {.importc: "second_".}: U


proc constructPair*[T, U](): Pair[T, U] {.importcpp: "Urho3D::Pair(@)", 
    header: "Pair.h".}
proc constructPair*[T, U](first: T; second: U): Pair[T, U] {.
    importcpp: "Urho3D::Pair(@)", header: "Pair.h".}
proc `==`*[T, U](this: Pair[T, U]; rhs: Pair[T, U]): bool {.noSideEffect, 
    importcpp: "# == #", header: "Pair.h".}
proc `<`*[T, U](this: Pair[T, U]; rhs: Pair[T, U]): bool {.noSideEffect, 
    importcpp: "# < #", header: "Pair.h".}
proc toHash*[T, U](this: Pair[T, U]): cuint {.noSideEffect, importcpp: "ToHash", 
    header: "Pair.h".}

proc makePair*[T, U](first: T; second: U): Pair[T, U] {.noSideEffect,
  importcpp: "Urho3D::MakePair(@)", header: "Pair.h".}
