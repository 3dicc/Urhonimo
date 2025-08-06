

import
  hashBase, refCounted


type
  SharedArrayPtr* [T]{.importcpp: "Urho3D::SharedArrayPtr", header: "ArrayPtr.h".} = object
    `ptr`* {.importc: "ptr_".}: ptr T
    refCount* {.importc: "refCount_".}: ptr RefCount


proc constructSharedArrayPtr*[T](): SharedArrayPtr[T] {.
    importcpp: "Urho3D::SharedArrayPtr(@)", header: "ArrayPtr.h", constructor.}
proc constructSharedArrayPtr*[T](rhs: SharedArrayPtr[T]): SharedArrayPtr[T] {.
    importcpp: "Urho3D::SharedArrayPtr(@)", header: "ArrayPtr.h", constructor.}
proc constructSharedArrayPtr*[T](`ptr`: ptr T): SharedArrayPtr[T] {.
    importcpp: "Urho3D::SharedArrayPtr(@)", header: "ArrayPtr.h", constructor.}
proc destroySharedArrayPtr*[T](this: var SharedArrayPtr[T]) {.
    importcpp: "#.~SharedArrayPtr()", header: "ArrayPtr.h".}
proc `->`*[T](this: SharedArrayPtr[T]): ptr T {.noSideEffect,
    importcpp: "# -> #", header: "ArrayPtr.h".}
proc `*`*[T](this: SharedArrayPtr[T]): var T {.noSideEffect, importcpp: "* #",
    header: "ArrayPtr.h".}
proc `[]`*[T](this: var SharedArrayPtr[T]; index: cint): var T {.
    importcpp: "#[@]", header: "ArrayPtr.h".}
proc `==`*[T](this: SharedArrayPtr[T]; rhs: SharedArrayPtr[T]): bool {.
    noSideEffect, importcpp: "# == #", header: "ArrayPtr.h".}
proc `<`*[T](this: SharedArrayPtr[T]; rhs: SharedArrayPtr[T]): bool {.
    noSideEffect, importcpp: "# < #", header: "ArrayPtr.h".}
proc reset*[T](this: var SharedArrayPtr[T]) {.importcpp: "Reset",
    header: "ArrayPtr.h".}
proc staticCast*[T, U](this: var SharedArrayPtr[T]; rhs: SharedArrayPtr[U]) {.
    importcpp: "StaticCast", header: "ArrayPtr.h".}
proc reinterpretCast*[T, U](this: var SharedArrayPtr[T]; rhs: SharedArrayPtr[U]) {.
    importcpp: "ReinterpretCast", header: "ArrayPtr.h".}
proc null*[T](this: SharedArrayPtr[T]): bool {.noSideEffect, importcpp: "Null",
    header: "ArrayPtr.h".}
proc notNull*[T](this: SharedArrayPtr[T]): bool {.noSideEffect,
    importcpp: "NotNull", header: "ArrayPtr.h".}
proc get*[T](this: SharedArrayPtr[T]): ptr T {.noSideEffect, importcpp: "Get",
    header: "ArrayPtr.h".}
proc refs*[T](this: SharedArrayPtr[T]): cint {.noSideEffect, importcpp: "Refs",
    header: "ArrayPtr.h".}
proc weakRefs*[T](this: SharedArrayPtr[T]): cint {.noSideEffect,
    importcpp: "WeakRefs", header: "ArrayPtr.h".}
proc refCountPtr*[T](this: SharedArrayPtr[T]): ptr RefCount {.noSideEffect,
    importcpp: "RefCountPtr", header: "ArrayPtr.h".}
proc toHash*[T](this: SharedArrayPtr[T]): cuint {.noSideEffect,
    importcpp: "ToHash", header: "ArrayPtr.h".}

proc staticCast*[T, U](`ptr`: SharedArrayPtr[U]): SharedArrayPtr[T] {.noSideEffect,
    importcpp: "Urho3D::StaticCast(@)", header: "ArrayPtr.h".}

proc reinterpretCast*[T, U](`ptr`: SharedArrayPtr[U]): SharedArrayPtr[T] {.noSideEffect,
    importcpp: "Urho3D::ReinterpretCast(@)", header: "ArrayPtr.h".}

type
  WeakArrayPtr* [T]{.importc: "Urho3D::WeakArrayPtr", header: "ArrayPtr.h".} = object
    `ptr`* {.importc: "ptr_".}: ptr T
    refCount* {.importc: "refCount_".}: ptr RefCount


proc constructWeakArrayPtr*[T](): WeakArrayPtr[T] {.
    importcpp: "Urho3D::WeakArrayPtr(@)", header: "ArrayPtr.h", constructor.}
proc constructWeakArrayPtr*[T](rhs: WeakArrayPtr[T]): WeakArrayPtr[T] {.
    importcpp: "Urho3D::WeakArrayPtr(@)", header: "ArrayPtr.h", constructor.}
proc constructWeakArrayPtr*[T](rhs: SharedArrayPtr[T]): WeakArrayPtr[T] {.
    importcpp: "Urho3D::WeakArrayPtr(@)", header: "ArrayPtr.h", constructor.}
proc destroyWeakArrayPtr*[T](this: var WeakArrayPtr[T]) {.
    importcpp: "#.~WeakArrayPtr()", header: "ArrayPtr.h".}
proc lock*[T](this: WeakArrayPtr[T]): SharedArrayPtr[T] {.noSideEffect,
    importcpp: "Lock", header: "ArrayPtr.h".}
proc get*[T](this: WeakArrayPtr[T]): ptr T {.noSideEffect, importcpp: "Get",
    header: "ArrayPtr.h".}
proc `->`*[T](this: WeakArrayPtr[T]): ptr T {.noSideEffect, importcpp: "# -> #",
    header: "ArrayPtr.h".}
proc `*`*[T](this: WeakArrayPtr[T]): var T {.noSideEffect, importcpp: "* #",
    header: "ArrayPtr.h".}
proc `[]`*[T](this: var WeakArrayPtr[T]; index: cint): var T {.
    importcpp: "#[@]", header: "ArrayPtr.h".}
proc `==`*[T](this: WeakArrayPtr[T]; rhs: WeakArrayPtr[T]): bool {.noSideEffect,
    importcpp: "# == #", header: "ArrayPtr.h".}
proc `<`*[T](this: WeakArrayPtr[T]; rhs: WeakArrayPtr[T]): bool {.noSideEffect,
    importcpp: "# < #", header: "ArrayPtr.h".}
proc reset*[T](this: var WeakArrayPtr[T]) {.importcpp: "Reset",
    header: "ArrayPtr.h".}
proc staticCast*[T, U](this: var WeakArrayPtr[T]; rhs: WeakArrayPtr[U]) {.
    importcpp: "StaticCast", header: "ArrayPtr.h".}
proc dynamicCast*[T, U](this: var WeakArrayPtr[T]; rhs: WeakArrayPtr[U]) {.
    importcpp: "DynamicCast", header: "ArrayPtr.h".}
proc null*[T](this: WeakArrayPtr[T]): bool {.noSideEffect, importcpp: "Null",
    header: "ArrayPtr.h".}
proc notNull*[T](this: WeakArrayPtr[T]): bool {.noSideEffect,
    importcpp: "NotNull", header: "ArrayPtr.h".}
proc refs*[T](this: WeakArrayPtr[T]): cint {.noSideEffect, importcpp: "Refs",
    header: "ArrayPtr.h".}
proc weakRefs*[T](this: WeakArrayPtr[T]): cint {.noSideEffect,
    importcpp: "WeakRefs", header: "ArrayPtr.h".}
proc expired*[T](this: WeakArrayPtr[T]): bool {.noSideEffect,
    importcpp: "Expired", header: "ArrayPtr.h".}
proc refCountPtr*[T](this: WeakArrayPtr[T]): ptr RefCount {.noSideEffect,
    importcpp: "RefCountPtr", header: "ArrayPtr.h".}
proc toHash*[T](this: WeakArrayPtr[T]): cuint {.noSideEffect,
    importcpp: "ToHash", header: "ArrayPtr.h".}

proc staticCast*[T, U](`ptr`: WeakArrayPtr[U]): WeakArrayPtr[T] {.noSideEffect,
    importcpp: "Urho3D::StaticCast(@)", header: "ArrayPtr.h".}

proc reinterpretCast*[T, U](`ptr`: WeakArrayPtr[U]): WeakArrayPtr[T]{.noSideEffect,
    importcpp: "Urho3D::ReinterpretCast(@)", header: "ArrayPtr.h".}
