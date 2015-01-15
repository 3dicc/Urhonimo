

import 
  refCounted


type 
  SharedPtr* {.importc: "Urho3D::SharedPtr", header: "Ptr.h".}[T] = object 
    `ptr`* {.importc: "ptr_".}: ptr T


proc constructSharedPtr*[T](): SharedPtr[T] {.importcpp: "Urho3D::SharedPtr(@)", 
    header: "Ptr.h".}
proc constructSharedPtr*[T](rhs: SharedPtr[T]): SharedPtr[T] {.
    importcpp: "Urho3D::SharedPtr(@)", header: "Ptr.h".}
proc constructSharedPtr*[T](`ptr`: ptr T): SharedPtr[T] {.
    importcpp: "Urho3D::SharedPtr(@)", header: "Ptr.h".}
proc destroySharedPtr*[T](this: var SharedPtr[T]) {.importcpp: "#.~SharedPtr()", 
    header: "Ptr.h".}
proc `->`*[T](this: SharedPtr[T]): ptr T {.noSideEffect, importcpp: "# -> #", 
    header: "Ptr.h".}
proc `*`*[T](this: SharedPtr[T]): var T {.noSideEffect, importcpp: "* #", 
    header: "Ptr.h".}
proc `[]`*[T](this: var SharedPtr[T]; index: cint): var T {.importcpp: "#[@]", 
    header: "Ptr.h".}
proc `<`*[T](this: SharedPtr[T]; rhs: SharedPtr[T]): bool {.noSideEffect, 
    importcpp: "# < #", header: "Ptr.h".}
proc `==`*[T](this: SharedPtr[T]; rhs: SharedPtr[T]): bool {.noSideEffect, 
    importcpp: "# == #", header: "Ptr.h".}
proc reset*[T](this: var SharedPtr[T]) {.importcpp: "Reset", header: "Ptr.h".}
proc detach*[T](this: var SharedPtr[T]) {.importcpp: "Detach", header: "Ptr.h".}
proc staticCast*[T, U](this: var SharedPtr[T]; rhs: SharedPtr[U]) {.
    importcpp: "StaticCast", header: "Ptr.h".}
proc dynamicCast*[T, U](this: var SharedPtr[T]; rhs: SharedPtr[U]) {.
    importcpp: "DynamicCast", header: "Ptr.h".}
proc null*[T](this: SharedPtr[T]): bool {.noSideEffect, importcpp: "Null", 
    header: "Ptr.h".}
proc notNull*[T](this: SharedPtr[T]): bool {.noSideEffect, importcpp: "NotNull", 
    header: "Ptr.h".}
proc get*[T](this: SharedPtr[T]): ptr T {.noSideEffect, importcpp: "Get", 
    header: "Ptr.h".}
proc refs*[T](this: SharedPtr[T]): cint {.noSideEffect, importcpp: "Refs", 
    header: "Ptr.h".}
proc weakRefs*[T](this: SharedPtr[T]): cint {.noSideEffect, 
    importcpp: "WeakRefs", header: "Ptr.h".}
proc refCountPtr*[T](this: SharedPtr[T]): ptr RefCount {.noSideEffect, 
    importcpp: "RefCountPtr", header: "Ptr.h".}
proc toHash*[T](this: SharedPtr[T]): cuint {.noSideEffect, importcpp: "ToHash", 
    header: "Ptr.h".}

proc staticCast*[T, U](`ptr`: SharedPtr[U]): SharedPtr[T] {.noSideEffect,
  importcpp: "StaticCast<'*0>", header: "Ptr.h".}

proc dynamicCast*[T, U](`ptr`: SharedPtr[U]): SharedPtr[T] {.noSideEffect,
  importcpp: "DynamicCast<'*0>", header: "Ptr.h".}

type 
  WeakPtr* {.importc: "Urho3D::WeakPtr", header: "Ptr.h".}[T] = object 
    `ptr`* {.importc: "ptr_".}: ptr T
    refCount* {.importc: "refCount_".}: ptr RefCount


proc constructWeakPtr*[T](): WeakPtr[T] {.importcpp: "Urho3D::WeakPtr(@)", 
    header: "Ptr.h".}
proc constructWeakPtr*[T](rhs: WeakPtr[T]): WeakPtr[T] {.
    importcpp: "Urho3D::WeakPtr(@)", header: "Ptr.h".}
proc constructWeakPtr*[T](rhs: SharedPtr[T]): WeakPtr[T] {.
    importcpp: "Urho3D::WeakPtr(@)", header: "Ptr.h".}
proc constructWeakPtr*[T](`ptr`: ptr T): WeakPtr[T] {.
    importcpp: "Urho3D::WeakPtr(@)", header: "Ptr.h".}
proc destroyWeakPtr*[T](this: var WeakPtr[T]) {.importcpp: "#.~WeakPtr()", 
    header: "Ptr.h".}
proc lock*[T](this: WeakPtr[T]): SharedPtr[T] {.noSideEffect, importcpp: "Lock", 
    header: "Ptr.h".}
proc get*[T](this: WeakPtr[T]): ptr T {.noSideEffect, importcpp: "Get", 
                                        header: "Ptr.h".}
proc `->`*[T](this: WeakPtr[T]): ptr T {.noSideEffect, importcpp: "# -> #", 
    header: "Ptr.h".}
proc `*`*[T](this: WeakPtr[T]): var T {.noSideEffect, importcpp: "* #", 
                                        header: "Ptr.h".}
proc `[]`*[T](this: var WeakPtr[T]; index: cint): var T {.importcpp: "#[@]", 
    header: "Ptr.h".}
proc `==`*[T](this: WeakPtr[T]; rhs: WeakPtr[T]): bool {.noSideEffect, 
    importcpp: "# == #", header: "Ptr.h".}
proc `<`*[T](this: WeakPtr[T]; rhs: WeakPtr[T]): bool {.noSideEffect, 
    importcpp: "# < #", header: "Ptr.h".}
proc reset*[T](this: var WeakPtr[T]) {.importcpp: "Reset", header: "Ptr.h".}
proc staticCast*[T, U](this: var WeakPtr[T]; rhs: WeakPtr[U]) {.
    importcpp: "StaticCast", header: "Ptr.h".}
proc dynamicCast*[T, U](this: var WeakPtr[T]; rhs: WeakPtr[U]) {.
    importcpp: "DynamicCast", header: "Ptr.h".}
proc null*[T](this: WeakPtr[T]): bool {.noSideEffect, importcpp: "Null", 
                                        header: "Ptr.h".}
proc notNull*[T](this: WeakPtr[T]): bool {.noSideEffect, importcpp: "NotNull", 
    header: "Ptr.h".}
proc refs*[T](this: WeakPtr[T]): cint {.noSideEffect, importcpp: "Refs", 
                                        header: "Ptr.h".}
proc weakRefs*[T](this: WeakPtr[T]): cint {.noSideEffect, importcpp: "WeakRefs", 
    header: "Ptr.h".}
proc expired*[T](this: WeakPtr[T]): bool {.noSideEffect, importcpp: "Expired", 
    header: "Ptr.h".}
proc refCountPtr*[T](this: WeakPtr[T]): ptr RefCount {.noSideEffect, 
    importcpp: "RefCountPtr", header: "Ptr.h".}
proc toHash*[T](this: WeakPtr[T]): cuint {.noSideEffect, importcpp: "ToHash", 
    header: "Ptr.h".}

proc staticCast*[T, U](`ptr`: WeakPtr[U]): WeakPtr[T] {.noSideEffect,
  importcpp: "StaticCast<'*0>", header: "Ptr.h".}

proc dynamicCast*[T, U](`ptr`: WeakPtr[U]): WeakPtr[T] {.noSideEffect,
  importcpp: "DynamicCast<'*0>", header: "Ptr.h".}
