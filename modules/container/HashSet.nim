

import 
  hashBase, sort


type 
  HashSet* {.importc: "Urho3D::HashSet", header: "HashSet.h".}[T] = object of HashBase
  

  type 
    Node* {.importc: "Urho3D::Node", header: "HashSet.h".}[T] = object of HashNodeBase
      key* {.importc: "key_".}: T

  proc constructNode*[T](): Node[T] {.importcpp: "Urho3D::Node(@)", 
                                      header: "HashSet.h".}
  proc constructNode*[T](key: T): Node[T] {.importcpp: "Urho3D::Node(@)", 
      header: "HashSet.h".}
  proc next*[T](this: Node[T]): ptr Node {.noSideEffect, importcpp: "Next", 
      header: "HashSet.h".}
  proc prev*[T](this: Node[T]): ptr Node {.noSideEffect, importcpp: "Prev", 
      header: "HashSet.h".}
  proc down*[T](this: Node[T]): ptr Node {.noSideEffect, importcpp: "Down", 
      header: "HashSet.h".}
  type 
    Iterator* {.importc: "Urho3D::Iterator", header: "HashSet.h".}[T] = object of HashIteratorBase
    
  proc constructIterator*[T](): Iterator[T] {.importcpp: "Urho3D::Iterator(@)", 
      header: "HashSet.h".}
  proc constructIterator*[T](`ptr`: ptr Node): Iterator[T] {.
      importcpp: "Urho3D::Iterator(@)", header: "HashSet.h".}
  proc `++`*[T](this: var Iterator[T]): var Iterator {.importcpp: "++ #", 
      header: "HashSet.h".}
  proc `++`*[T](this: var Iterator[T]; a3: cint): Iterator {.importcpp: "++ #", 
      header: "HashSet.h".}
  proc `--`*[T](this: var Iterator[T]): var Iterator {.importcpp: "-- #", 
      header: "HashSet.h".}
  proc `--`*[T](this: var Iterator[T]; a3: cint): Iterator {.importcpp: "-- #", 
      header: "HashSet.h".}
  proc `->`*[T](this: Iterator[T]): ptr T {.noSideEffect, importcpp: "# -> #", 
      header: "HashSet.h".}
  proc `*`*[T](this: Iterator[T]): T {.noSideEffect, importcpp: "* #", 
                                       header: "HashSet.h".}
  type 
    ConstIterator* {.importc: "Urho3D::ConstIterator", header: "HashSet.h".}[T] = object of HashIteratorBase
    
  proc constructConstIterator*[T](): ConstIterator[T] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "HashSet.h".}
  proc constructConstIterator*[T](`ptr`: ptr Node): ConstIterator[T] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "HashSet.h".}
  proc constructConstIterator*[T](rhs: Iterator): ConstIterator[T] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "HashSet.h".}
  proc `++`*[T](this: var ConstIterator[T]): var ConstIterator {.
      importcpp: "++ #", header: "HashSet.h".}
  proc `++`*[T](this: var ConstIterator[T]; a3: cint): ConstIterator {.
      importcpp: "++ #", header: "HashSet.h".}
  proc `--`*[T](this: var ConstIterator[T]): var ConstIterator {.
      importcpp: "-- #", header: "HashSet.h".}
  proc `--`*[T](this: var ConstIterator[T]; a3: cint): ConstIterator {.
      importcpp: "-- #", header: "HashSet.h".}
  proc `->`*[T](this: ConstIterator[T]): ptr T {.noSideEffect, 
      importcpp: "# -> #", header: "HashSet.h".}
  proc `*`*[T](this: ConstIterator[T]): T {.noSideEffect, importcpp: "* #", 
      header: "HashSet.h".}
proc constructHashSet*[T](): HashSet[T] {.importcpp: "Urho3D::HashSet(@)", 
    header: "HashSet.h".}
proc constructHashSet*[T](set: HashSet[T]): HashSet[T] {.
    importcpp: "Urho3D::HashSet(@)", header: "HashSet.h".}
proc destroyHashSet*[T](this: var HashSet[T]) {.importcpp: "#.~HashSet()", 
    header: "HashSet.h".}
proc `+=`*[T](this: var HashSet[T]; rhs: T) {.importcpp: "# += #", 
    header: "HashSet.h".}
proc `+=`*[T](this: var HashSet[T]; rhs: HashSet[T]) {.importcpp: "# += #", 
    header: "HashSet.h".}
proc `==`*[T](this: HashSet[T]; rhs: HashSet[T]): bool {.noSideEffect, 
    importcpp: "# == #", header: "HashSet.h".}
proc insert*[T](this: var HashSet[T]; key: T): Iterator {.importcpp: "Insert", 
    header: "HashSet.h".}
proc insert*[T](this: var HashSet[T]; set: HashSet[T]) {.importcpp: "Insert", 
    header: "HashSet.h".}
proc insert*[T](this: var HashSet[T]; it: ConstIterator): Iterator {.
    importcpp: "Insert", header: "HashSet.h".}
proc erase*[T](this: var HashSet[T]; key: T): bool {.importcpp: "Erase", 
    header: "HashSet.h".}
proc erase*[T](this: var HashSet[T]; it: Iterator): Iterator {.
    importcpp: "Erase", header: "HashSet.h".}
proc clear*[T](this: var HashSet[T]) {.importcpp: "Clear", header: "HashSet.h".}
proc sort*[T](this: var HashSet[T]) {.importcpp: "Sort", header: "HashSet.h".}
proc rehash*[T](this: var HashSet[T]; numBuckets: cuint): bool {.
    importcpp: "Rehash", header: "HashSet.h".}
proc find*[T](this: var HashSet[T]; key: T): Iterator {.importcpp: "Find", 
    header: "HashSet.h".}
proc find*[T](this: HashSet[T]; key: T): ConstIterator {.noSideEffect, 
    importcpp: "Find", header: "HashSet.h".}
proc contains*[T](this: HashSet[T]; key: T): bool {.noSideEffect, 
    importcpp: "Contains", header: "HashSet.h".}
proc begin*[T](this: var HashSet[T]): Iterator {.importcpp: "Begin", 
    header: "HashSet.h".}
proc begin*[T](this: HashSet[T]): ConstIterator {.noSideEffect, 
    importcpp: "Begin", header: "HashSet.h".}
proc `end`*[T](this: var HashSet[T]): Iterator {.importcpp: "End", 
    header: "HashSet.h".}
proc `end`*[T](this: HashSet[T]): ConstIterator {.noSideEffect, 
    importcpp: "End", header: "HashSet.h".}
proc front*[T](this: HashSet[T]): T {.noSideEffect, importcpp: "Front", 
                                      header: "HashSet.h".}
proc back*[T](this: HashSet[T]): T {.noSideEffect, importcpp: "Back", 
                                     header: "HashSet.h".}