

type
  RandomAccessIterator* {.importcpp: "Urho3D::RandomAccessIterator",
                          header: "VectorBase.h".}[T] = object
    `ptr`* {.importc: "ptr_".}: ptr T


proc constructRandomAccessIterator*[T](): RandomAccessIterator[T] {.
    importcpp: "Urho3D::RandomAccessIterator(@)", header: "VectorBase.h",
    constructor.}
proc constructRandomAccessIterator*[T](`ptr`: ptr T): RandomAccessIterator[T] {.
    importcpp: "Urho3D::RandomAccessIterator(@)", header: "VectorBase.h",
    constructor.}
proc `->`*[T](this: RandomAccessIterator[T]): ptr T {.noSideEffect,
    importcpp: "# -> #", header: "VectorBase.h".}
proc `*`*[T](this: RandomAccessIterator[T]): var T {.noSideEffect,
    importcpp: "* #", header: "VectorBase.h".}
proc `++`*[T](this: var RandomAccessIterator[T]): var RandomAccessIterator[T] {.
    importcpp: "++ #", header: "VectorBase.h".}
proc `++`*[T](this: var RandomAccessIterator[T]; a3: cint): RandomAccessIterator[
    T] {.importcpp: "++ #", header: "VectorBase.h".}
proc `--`*[T](this: var RandomAccessIterator[T]): var RandomAccessIterator[T] {.
    importcpp: "-- #", header: "VectorBase.h".}
proc `--`*[T](this: var RandomAccessIterator[T]; a3: cint): RandomAccessIterator[
    T] {.importcpp: "-- #", header: "VectorBase.h".}
proc `+=`*[T](this: var RandomAccessIterator[T]; value: cint) {.
    importcpp: "# += #", header: "VectorBase.h".}
proc `-=`*[T](this: var RandomAccessIterator[T]; value: cint) {.
    importcpp: "# -= #", header: "VectorBase.h".}
proc `+`*[T](this: RandomAccessIterator[T]; value: cint): RandomAccessIterator[T] {.
    noSideEffect, importcpp: "# + #", header: "VectorBase.h".}
proc `-`*[T](this: RandomAccessIterator[T]; value: cint): RandomAccessIterator[T] {.
    noSideEffect, importcpp: "# - #", header: "VectorBase.h".}
proc `-`*[T](this: RandomAccessIterator[T]; rhs: RandomAccessIterator): cint {.
    noSideEffect, importcpp: "# - #", header: "VectorBase.h".}
proc `==`*[T](this: RandomAccessIterator[T]; rhs: RandomAccessIterator): bool {.
    noSideEffect, importcpp: "# == #", header: "VectorBase.h".}
proc `<`*[T](this: RandomAccessIterator[T]; rhs: RandomAccessIterator): bool {.
    noSideEffect, importcpp: "# < #", header: "VectorBase.h".}
proc `<=`*[T](this: RandomAccessIterator[T]; rhs: RandomAccessIterator): bool {.
    noSideEffect, importcpp: "# <= #", header: "VectorBase.h".}

type
  RandomAccessConstIterator* {.importcpp: "Urho3D::RandomAccessConstIterator",
                               header: "VectorBase.h".}[T] = object
    `ptr`* {.importc: "ptr_".}: ptr T


proc constructRandomAccessConstIterator*[T](): RandomAccessConstIterator[T] {.
    importcpp: "Urho3D::RandomAccessConstIterator(@)", header: "VectorBase.h",
    constructor.}
proc constructRandomAccessConstIterator*[T](`ptr`: ptr T): RandomAccessConstIterator[
    T] {.importcpp: "Urho3D::RandomAccessConstIterator(@)",
         header: "VectorBase.h", constructor.}
proc constructRandomAccessConstIterator*[T](rhs: RandomAccessIterator[T]): RandomAccessConstIterator[
    T] {.importcpp: "Urho3D::RandomAccessConstIterator(@)",
         header: "VectorBase.h", constructor.}
proc `->`*[T](this: RandomAccessConstIterator[T]): ptr T {.noSideEffect,
    importcpp: "# -> #", header: "VectorBase.h".}
proc `*`*[T](this: RandomAccessConstIterator[T]): T {.noSideEffect,
    importcpp: "* #", header: "VectorBase.h".}
proc `++`*[T](this: var RandomAccessConstIterator[T]): var RandomAccessConstIterator[
    T] {.importcpp: "++ #", header: "VectorBase.h".}
proc `++`*[T](this: var RandomAccessConstIterator[T]; a3: cint): RandomAccessConstIterator[
    T] {.importcpp: "++ #", header: "VectorBase.h".}
proc `--`*[T](this: var RandomAccessConstIterator[T]): var RandomAccessConstIterator[
    T] {.importcpp: "-- #", header: "VectorBase.h".}
proc `--`*[T](this: var RandomAccessConstIterator[T]; a3: cint): RandomAccessConstIterator[
    T] {.importcpp: "-- #", header: "VectorBase.h".}
proc `+=`*[T](this: var RandomAccessConstIterator[T]; value: cint) {.
    importcpp: "# += #", header: "VectorBase.h".}
proc `-=`*[T](this: var RandomAccessConstIterator[T]; value: cint) {.
    importcpp: "# -= #", header: "VectorBase.h".}
proc `+`*[T](this: RandomAccessConstIterator[T]; value: cint): RandomAccessConstIterator[
    T] {.noSideEffect, importcpp: "# + #", header: "VectorBase.h".}
proc `-`*[T](this: RandomAccessConstIterator[T]; value: cint): RandomAccessConstIterator[
    T] {.noSideEffect, importcpp: "# - #", header: "VectorBase.h".}
proc `-`*[T](this: RandomAccessConstIterator[T]; rhs: RandomAccessConstIterator): cint {.
    noSideEffect, importcpp: "# - #", header: "VectorBase.h".}
proc `==`*[T](this: RandomAccessConstIterator[T]; rhs: RandomAccessConstIterator): bool {.
    noSideEffect, importcpp: "# == #", header: "VectorBase.h".}
proc `<`*[T](this: RandomAccessConstIterator[T]; rhs: RandomAccessConstIterator): bool {.
    noSideEffect, importcpp: "# < #", header: "VectorBase.h".}
proc `<=`*[T](this: RandomAccessConstIterator[T]; rhs: RandomAccessConstIterator): bool {.
    noSideEffect, importcpp: "# <= #", header: "VectorBase.h".}

type
  VectorBase* {.importcpp: "Urho3D::VectorBase", header: "VectorBase.h",
                inheritable.} = object
    size {.importc: "size_".}: cuint
    capacity {.importc: "capacity_".}: cuint
    buffer {.importc: "buffer_".}: ptr cuchar


proc constructVectorBase*(): VectorBase {.importcpp: "Urho3D::VectorBase(@)",
    header: "VectorBase.h", constructor.}
proc swap*(this: var VectorBase; rhs: var VectorBase) {.importcpp: "Swap",
    header: "VectorBase.h".}
