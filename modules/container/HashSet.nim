

import 
  hashBase, sort


type 
  HashSet* {.importc: "Urho3D::HashSet", header: "HashSet.h".}[T] = object of HashBase
  
  Node* {.importc: "Urho3D::HashSet::Node", header: "HashSet.h".}[T] = object of HashNodeBase
    key* {.importc: "key_".}: T

proc constructNode*[T](): Node[T] {.importcpp: "Urho3D::HashSet::Node(@)", 
                                    header: "HashSet.h".}
proc constructNode*[T](key: T): Node[T] {.importcpp: "Urho3D::HashSet::Node(@)", 
    header: "HashSet.h".}
proc next*[T](this: Node[T]): ptr Node[T] {.noSideEffect, importcpp: "Next", 
    header: "HashSet.h".}
proc prev*[T](this: Node[T]): ptr Node[T] {.noSideEffect, importcpp: "Prev", 
    header: "HashSet.h".}
proc down*[T](this: Node[T]): ptr Node[T] {.noSideEffect, importcpp: "Down", 
    header: "HashSet.h".}

type 
  HashSetIterator* {.importc: "Urho3D::HashSet::Iterator", header: "HashSet.h".}[T] = object of HashIteratorBase
  
proc constructHashSetIterator*[T](): HashSetIterator[T] {.importcpp: "Urho3D::HashSet::Iterator(@)", 
    header: "HashSet.h".}
proc constructHashSetIterator*[T](`ptr`: ptr Node): HashSetIterator[T] {.
    importcpp: "Urho3D::HashSet::Iterator(@)", header: "HashSet.h".}
proc `++`*[T](this: var HashSetIterator[T]): var HashSetIterator[T] {.importcpp: "++ #", 
    header: "HashSet.h".}
proc `++`*[T](this: var HashSetIterator[T]; a3: cint): HashSetIterator[T] {.importcpp: "++ #", 
    header: "HashSet.h".}
proc `--`*[T](this: var HashSetIterator[T]): var HashSetIterator[T] {.importcpp: "-- #", 
    header: "HashSet.h".}
proc `--`*[T](this: var HashSetIterator[T]; a3: cint): HashSetIterator[T] {.importcpp: "-- #", 
    header: "HashSet.h".}
proc `->`*[T](this: HashSetIterator[T]): ptr T {.noSideEffect, importcpp: "# -> #", 
    header: "HashSet.h".}
proc `*`*[T](this: HashSetIterator[T]): T {.noSideEffect, importcpp: "* #", 
                                     header: "HashSet.h".}

type 
  ConstHashSetIterator* {.importc: "Urho3D::ConstIterator", header: "HashSet.h".}[T] = object of HashIteratorBase
  
proc constructConstHashSetIterator*[T](): ConstHashSetIterator[T] {.
    importcpp: "Urho3D::HashSet::ConstIterator(@)", header: "HashSet.h".}
proc constructConstHashSetIterator*[T](`ptr`: ptr Node): ConstHashSetIterator[T] {.
    importcpp: "Urho3D::HashSet::ConstIterator(@)", header: "HashSet.h".}
proc constructConstHashSetIterator*[T](rhs: HashSetIterator): ConstHashSetIterator[T] {.
    importcpp: "Urho3D::HashSet::ConstIterator(@)", header: "HashSet.h".}
proc `++`*[T](this: var ConstHashSetIterator[T]): var ConstHashSetIterator[T] {.
    importcpp: "++ #", header: "HashSet.h".}
proc `++`*[T](this: var ConstHashSetIterator[T]; a3: cint): ConstHashSetIterator[T] {.
    importcpp: "++ #", header: "HashSet.h".}
proc `--`*[T](this: var ConstHashSetIterator[T]): var ConstHashSetIterator[T] {.
    importcpp: "-- #", header: "HashSet.h".}
proc `--`*[T](this: var ConstHashSetIterator[T]; a3: cint): ConstHashSetIterator[T] {.
    importcpp: "-- #", header: "HashSet.h".}
proc `->`*[T](this: ConstHashSetIterator[T]): ptr T {.noSideEffect, 
    importcpp: "# -> #", header: "HashSet.h".}
proc `*`*[T](this: ConstHashSetIterator[T]): T {.noSideEffect, importcpp: "* #", 
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
proc insert*[T](this: var HashSet[T]; key: T): HashSetIterator[T] {.importcpp: "Insert", 
    header: "HashSet.h".}
proc insert*[T](this: var HashSet[T]; set: HashSet[T]) {.importcpp: "Insert", 
    header: "HashSet.h".}
proc insert*[T](this: var HashSet[T]; it: ConstHashSetIterator[T]): HashSetIterator[T] {.
    importcpp: "Insert", header: "HashSet.h".}
proc erase*[T](this: var HashSet[T]; key: T): bool {.importcpp: "Erase", 
    header: "HashSet.h".}
proc erase*[T](this: var HashSet[T]; it: HashSetIterator[T]): HashSetIterator[T] {.
    importcpp: "Erase", header: "HashSet.h".}
proc clear*[T](this: var HashSet[T]) {.importcpp: "Clear", header: "HashSet.h".}
proc sort*[T](this: var HashSet[T]) {.importcpp: "Sort", header: "HashSet.h".}
proc rehash*[T](this: var HashSet[T]; numBuckets: cuint): bool {.
    importcpp: "Rehash", header: "HashSet.h".}
proc find*[T](this: var HashSet[T]; key: T): HashSetIterator[T] {.importcpp: "Find", 
    header: "HashSet.h".}
proc find*[T](this: HashSet[T]; key: T): ConstHashSetIterator[T] {.noSideEffect, 
    importcpp: "Find", header: "HashSet.h".}
proc contains*[T](this: HashSet[T]; key: T): bool {.noSideEffect, 
    importcpp: "Contains", header: "HashSet.h".}
proc begin*[T](this: var HashSet[T]): HashSetIterator[T] {.importcpp: "Begin", 
    header: "HashSet.h".}
proc begin*[T](this: HashSet[T]): ConstHashSetIterator[T] {.noSideEffect, 
    importcpp: "Begin", header: "HashSet.h".}
proc `end`*[T](this: var HashSet[T]): HashSetIterator[T] {.importcpp: "End", 
    header: "HashSet.h".}
proc `end`*[T](this: HashSet[T]): ConstHashSetIterator[T] {.noSideEffect, 
    importcpp: "End", header: "HashSet.h".}
proc front*[T](this: HashSet[T]): T {.noSideEffect, importcpp: "Front", 
                                      header: "HashSet.h".}
proc back*[T](this: HashSet[T]): T {.noSideEffect, importcpp: "Back", 
                                     header: "HashSet.h".}
