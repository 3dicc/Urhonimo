

import 
  refCounted


type 
  SharedPtr* {.importc: "Urho3D::SharedPtr", header: "Ptr.h".}[T] = object 
    `ptr`* {.importc: "ptr_".}: ptr T


#proc constructSharedPtr*[T](): SharedPtr[T] {.importc: "Urho3D::SharedPtr<'0>", 
#                                        header: "Ptr.h".}
proc constructSharedPtr*[T](rhs: var SharedPtr[T]): SharedPtr[T] {.
    importc: "Urho3D::SharedPtr", header: "Ptr.h".}
proc constructSharedPtr*[T](`ptr`: ptr T): SharedPtr[T] {.
    importc: "Urho3D::SharedPtr", header: "Ptr.h".}
proc destroySharedPtr*[T](this: var SharedPtr[T]) {.importc: "Urho3D::~SharedPtr", 
    header: "Ptr.h".}
proc `->`*[T](this: SharedPtr[T]): ptr T {.noSideEffect, 
                                     importc: "Urho3D::SharedPtr::operator->", 
                                     header: "Ptr.h".}
proc `*`*[T](this: SharedPtr[T]): var T {.noSideEffect, 
                                    importc: "Urho3D::SharedPtr::operator*", 
                                    header: "Ptr.h".}
proc `[]`*[T](this: var SharedPtr[T]; index: cint): var T {.
    importc: "Urho3D::SharedPtr::operator[]", header: "Ptr.h".}
proc `<`*[T](this: SharedPtr[T]; rhs: var SharedPtr[T]): bool {.noSideEffect, 
    importc: "Urho3D::SharedPtr::operator<", header: "Ptr.h".}
proc `==`*[T](this: SharedPtr[T]; rhs: var SharedPtr[T]): bool {.noSideEffect, 
    importc: "Urho3D::SharedPtr::operator==", header: "Ptr.h".}
proc reset*[T](this: var SharedPtr[T]) {.importcpp: "Reset", header: "Ptr.h".}
proc detach*[T](this: var SharedPtr[T]) {.importcpp: "Detach", header: "Ptr.h".}
proc staticCast*[T,U](this: var SharedPtr[T]; rhs: var SharedPtr[U]) {.
    importcpp: "StaticCast", header: "Ptr.h".}
proc dynamicCast*[T,U](this: var SharedPtr[T]; rhs: var SharedPtr[U]) {.
    importcpp: "DynamicCast", header: "Ptr.h".}
proc null*[T](this: SharedPtr[T]): bool {.noSideEffect, importcpp: "Null", 
                                    header: "Ptr.h".}
proc notNull*[T](this: SharedPtr[T]): bool {.noSideEffect, importcpp: "NotNull", 
                                       header: "Ptr.h".}
proc get*[T](this: SharedPtr[T]): ptr T {.noSideEffect, importcpp: "Get", 
                                    header: "Ptr.h".}
proc refs*[T](this: SharedPtr[T]): cint {.noSideEffect, importcpp: "Refs", 
                                    header: "Ptr.h".}
proc weakRefs*[T](this: SharedPtr[T]): cint {.noSideEffect, importcpp: "WeakRefs", 
                                        header: "Ptr.h".}
proc refCountPtr*[T](this: SharedPtr[T]): ptr RefCount {.noSideEffect, 
    importcpp: "RefCountPtr", header: "Ptr.h".}
proc toHash*[T](this: SharedPtr[T]): cuint {.noSideEffect, importcpp: "ToHash", 
                                       header: "Ptr.h".}

proc staticCast*[T, U](`ptr`: var SharedPtr[U]): SharedPtr[T]

proc dynamicCast*[T, U](`ptr`: var SharedPtr[U]): SharedPtr[T]

type 
  WeakPtr* {.importc: "Urho3D::WeakPtr", header: "Ptr.h".}[T] = object 
    `ptr`* {.importc: "ptr_".}: ptr T
    refCount* {.importc: "refCount_".}: ptr RefCount


#proc constructWeakPtr*[T](): WeakPtr[T] {.importc: "Urho3D::WeakPtr<'0>", header: "Ptr.h".}
proc constructWeakPtr*[T](rhs: var WeakPtr[T]): WeakPtr[T] {.
    importc: "Urho3D::WeakPtr", header: "Ptr.h".}
proc constructWeakPtr*[T](rhs: var SharedPtr[T]): WeakPtr[T] {.
    importc: "Urho3D::WeakPtr", header: "Ptr.h".}
proc constructWeakPtr*[T](`ptr`: ptr T): WeakPtr[T] {.importc: "Urho3D::WeakPtr", 
    header: "Ptr.h".}
proc destroyWeakPtr*[T](this: var WeakPtr[T]) {.importc: "Urho3D::~WeakPtr", 
    header: "Ptr.h".}
proc lock*[T](this: WeakPtr[T]): SharedPtr[T] {.noSideEffect, importcpp: "Lock", 
    header: "Ptr.h".}
proc get*[T](this: WeakPtr[T]): ptr T {.noSideEffect, importcpp: "Get", 
                                  header: "Ptr.h".}
proc `->`*[T](this: WeakPtr[T]): ptr T {.noSideEffect, 
                                   importc: "Urho3D::WeakPtr::operator->", 
                                   header: "Ptr.h".}
proc `*`*[T](this: WeakPtr[T]): var T {.noSideEffect, 
                                  importc: "Urho3D::WeakPtr::operator*", 
                                  header: "Ptr.h".}
proc `[]`*[T](this: var WeakPtr[T]; index: cint): var T {.
    importc: "Urho3D::WeakPtr::operator[]", header: "Ptr.h".}
proc `==`*[T](this: WeakPtr[T]; rhs: var WeakPtr[T]): bool {.noSideEffect, 
    importc: "Urho3D::WeakPtr::operator==", header: "Ptr.h".}
proc `<`*[T](this: WeakPtr[T]; rhs: var WeakPtr[T]): bool {.noSideEffect, 
    importc: "Urho3D::WeakPtr::operator<", header: "Ptr.h".}
proc reset*(this: var WeakPtr) {.importcpp: "Reset", header: "Ptr.h".}
proc staticCast*[U](this: var WeakPtr; rhs: var WeakPtr[U]) {.
    importcpp: "StaticCast", header: "Ptr.h".}
proc dynamicCast*[U](this: var WeakPtr; rhs: var WeakPtr[U]) {.
    importcpp: "DynamicCast", header: "Ptr.h".}
proc null*(this: WeakPtr): bool {.noSideEffect, importcpp: "Null", 
                                  header: "Ptr.h".}
proc notNull*(this: WeakPtr): bool {.noSideEffect, importcpp: "NotNull", 
                                     header: "Ptr.h".}
proc refs*(this: WeakPtr): cint {.noSideEffect, importcpp: "Refs", 
                                  header: "Ptr.h".}
proc weakRefs*(this: WeakPtr): cint {.noSideEffect, importcpp: "WeakRefs", 
                                      header: "Ptr.h".}
proc expired*(this: WeakPtr): bool {.noSideEffect, importcpp: "Expired", 
                                     header: "Ptr.h".}
proc refCountPtr*(this: WeakPtr): ptr RefCount {.noSideEffect, 
    importcpp: "RefCountPtr", header: "Ptr.h".}
proc toHash*(this: WeakPtr): cuint {.noSideEffect, importcpp: "ToHash", 
                                     header: "Ptr.h".}

proc staticCast*[T, U](`ptr`: var WeakPtr[U]): WeakPtr[T]

proc dynamicCast*[T, U](`ptr`: var WeakPtr[U]): WeakPtr[T]