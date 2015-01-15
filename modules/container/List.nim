

import 
  listBase


type 
  List* {.importc: "Urho3D::List", header: "List.h".}[T] = object of ListBase
  

  type 
    Node* {.importc: "Urho3D::Node", header: "List.h".}[T] = object of ListNodeBase
      value* {.importc: "value_".}: T

  proc constructNode*[T](): Node[T] {.importcpp: "Urho3D::Node(@)", 
                                      header: "List.h".}
  proc constructNode*[T](value: T): Node[T] {.importcpp: "Urho3D::Node(@)", 
      header: "List.h".}
  proc next*[T](this: Node[T]): ptr Node {.noSideEffect, importcpp: "Next", 
      header: "List.h".}
  proc prev*[T](this: var Node[T]): ptr Node {.importcpp: "Prev", 
      header: "List.h".}
  type 
    Iterator* {.importc: "Urho3D::Iterator", header: "List.h".}[T] = object of ListIteratorBase
    
  proc constructIterator*[T](): Iterator[T] {.importcpp: "Urho3D::Iterator(@)", 
      header: "List.h".}
  proc constructIterator*[T](`ptr`: ptr Node): Iterator[T] {.
      importcpp: "Urho3D::Iterator(@)", header: "List.h".}
  proc `++`*[T](this: var Iterator[T]): var Iterator {.importcpp: "++ #", 
      header: "List.h".}
  proc `++`*[T](this: var Iterator[T]; a3: cint): Iterator {.importcpp: "++ #", 
      header: "List.h".}
  proc `--`*[T](this: var Iterator[T]): var Iterator {.importcpp: "-- #", 
      header: "List.h".}
  proc `--`*[T](this: var Iterator[T]; a3: cint): Iterator {.importcpp: "-- #", 
      header: "List.h".}
  proc `->`*[T](this: Iterator[T]): ptr T {.noSideEffect, importcpp: "# -> #", 
      header: "List.h".}
  proc `*`*[T](this: Iterator[T]): var T {.noSideEffect, importcpp: "* #", 
      header: "List.h".}
  type 
    ConstIterator* {.importc: "Urho3D::ConstIterator", header: "List.h".}[T] = object of ListIteratorBase
    
  proc constructConstIterator*[T](): ConstIterator[T] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "List.h".}
  proc constructConstIterator*[T](`ptr`: ptr Node): ConstIterator[T] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "List.h".}
  proc constructConstIterator*[T](rhs: Iterator): ConstIterator[T] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "List.h".}
  proc `++`*[T](this: var ConstIterator[T]): var ConstIterator {.
      importcpp: "++ #", header: "List.h".}
  proc `++`*[T](this: var ConstIterator[T]; a3: cint): ConstIterator {.
      importcpp: "++ #", header: "List.h".}
  proc `--`*[T](this: var ConstIterator[T]): var ConstIterator {.
      importcpp: "-- #", header: "List.h".}
  proc `--`*[T](this: var ConstIterator[T]; a3: cint): ConstIterator {.
      importcpp: "-- #", header: "List.h".}
  proc `->`*[T](this: ConstIterator[T]): ptr T {.noSideEffect, 
      importcpp: "# -> #", header: "List.h".}
  proc `*`*[T](this: ConstIterator[T]): T {.noSideEffect, importcpp: "* #", 
      header: "List.h".}
proc constructList*[T](): List[T] {.importcpp: "Urho3D::List(@)", 
                                    header: "List.h".}
proc constructList*[T](list: List[T]): List[T] {.importcpp: "Urho3D::List(@)", 
    header: "List.h".}
proc destroyList*[T](this: var List[T]) {.importcpp: "#.~List()", 
    header: "List.h".}
proc `+=`*[T](this: var List[T]; rhs: T) {.importcpp: "# += #", header: "List.h".}
proc `+=`*[T](this: var List[T]; rhs: List[T]) {.importcpp: "# += #", 
    header: "List.h".}
proc `==`*[T](this: List[T]; rhs: List[T]): bool {.noSideEffect, 
    importcpp: "# == #", header: "List.h".}
proc push*[T](this: var List[T]; value: T) {.importcpp: "Push", header: "List.h".}
proc pushFront*[T](this: var List[T]; value: T) {.importcpp: "PushFront", 
    header: "List.h".}
proc insert*[T](this: var List[T]; dest: Iterator; value: T) {.
    importcpp: "Insert", header: "List.h".}
proc insert*[T](this: var List[T]; dest: Iterator; list: List[T]) {.
    importcpp: "Insert", header: "List.h".}
proc insert*[T](this: var List[T]; dest: Iterator; start: ConstIterator; 
                `end`: ConstIterator) {.importcpp: "Insert", header: "List.h".}
proc insert*[T](this: var List[T]; dest: Iterator; start: ptr T; `end`: ptr T) {.
    importcpp: "Insert", header: "List.h".}
proc pop*[T](this: var List[T]) {.importcpp: "Pop", header: "List.h".}
proc popFront*[T](this: var List[T]) {.importcpp: "PopFront", header: "List.h".}
proc erase*[T](this: var List[T]; it: Iterator): Iterator {.importcpp: "Erase", 
    header: "List.h".}
proc erase*[T](this: var List[T]; start: Iterator; `end`: Iterator): Iterator {.
    importcpp: "Erase", header: "List.h".}
proc clear*[T](this: var List[T]) {.importcpp: "Clear", header: "List.h".}
proc resize*[T](this: var List[T]; newSize: cuint) {.importcpp: "Resize", 
    header: "List.h".}
proc find*[T](this: var List[T]; value: T): Iterator {.importcpp: "Find", 
    header: "List.h".}
proc find*[T](this: List[T]; value: T): ConstIterator {.noSideEffect, 
    importcpp: "Find", header: "List.h".}
proc contains*[T](this: List[T]; value: T): bool {.noSideEffect, 
    importcpp: "Contains", header: "List.h".}
proc begin*[T](this: var List[T]): Iterator {.importcpp: "Begin", 
    header: "List.h".}
proc begin*[T](this: List[T]): ConstIterator {.noSideEffect, importcpp: "Begin", 
    header: "List.h".}
proc `end`*[T](this: var List[T]): Iterator {.importcpp: "End", header: "List.h".}
proc `end`*[T](this: List[T]): ConstIterator {.noSideEffect, importcpp: "End", 
    header: "List.h".}
proc front*[T](this: var List[T]): var T {.importcpp: "Front", header: "List.h".}
proc front*[T](this: List[T]): T {.noSideEffect, importcpp: "Front", 
                                   header: "List.h".}
proc back*[T](this: var List[T]): var T {.importcpp: "Back", header: "List.h".}
proc back*[T](this: List[T]): T {.noSideEffect, importcpp: "Back", 
                                  header: "List.h".}
proc size*[T](this: List[T]): cuint {.noSideEffect, importcpp: "Size", 
                                      header: "List.h".}
proc empty*[T](this: List[T]): bool {.noSideEffect, importcpp: "Empty", 
                                      header: "List.h".}