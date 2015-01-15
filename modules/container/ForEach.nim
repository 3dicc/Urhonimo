

import 
  vector


type 
  FalseWrapper* {.importc: "Urho3D::false_wrapper", header: "ForEach.h".}[T] = object 
    value* {.importc: "value".}: T


proc constructfalseWrapper*[T](value: T): FalseWrapper[T] {.
    importcpp: "Urho3D::false_wrapper(@)", header: "ForEach.h".}
proc bool*[T](this: FalseWrapper[T]): Operator {.noSideEffect, 
    importcpp: "bool", header: "ForEach.h".}
proc makeFalseWrapper*[T](value: T): FalseWrapper[T]

proc begin*[T](v: var Urho3D.Vector[T]): Urho3D.RandomAccessIterator[T]
proc begin*[T](v: ptr Urho3D.Vector[T]): Urho3D.RandomAccessIterator[T]
proc begin*[T](v: Urho3D.Vector[T]): Urho3D.RandomAccessConstIterator[T]
proc begin*[T](v: ptr Urho3D.Vector[T]): Urho3D.RandomAccessConstIterator[T]
proc `end`*[T](v: var Urho3D.Vector[T]): Urho3D.RandomAccessIterator[T]
proc `end`*[T](v: ptr Urho3D.Vector[T]): Urho3D.RandomAccessIterator[T]
proc `end`*[T](v: Urho3D.Vector[T]): Urho3D.RandomAccessConstIterator[T]
proc `end`*[T](v: ptr Urho3D.Vector[T]): Urho3D.RandomAccessConstIterator[T]

proc begin*[T](v: var Urho3D.PODVector[T]): Urho3D.RandomAccessIterator[T]
proc begin*[T](v: ptr Urho3D.PODVector[T]): Urho3D.RandomAccessIterator[T]
proc begin*[T](v: Urho3D.PODVector[T]): Urho3D.RandomAccessConstIterator[T]
proc begin*[T](v: ptr Urho3D.PODVector[T]): Urho3D.RandomAccessConstIterator[T]
proc `end`*[T](v: var Urho3D.PODVector[T]): Urho3D.RandomAccessIterator[T]
proc `end`*[T](v: ptr Urho3D.PODVector[T]): Urho3D.RandomAccessIterator[T]
proc `end`*[T](v: Urho3D.PODVector[T]): Urho3D.RandomAccessConstIterator[T]
proc `end`*[T](v: ptr Urho3D.PODVector[T]): Urho3D.RandomAccessConstIterator[T]
