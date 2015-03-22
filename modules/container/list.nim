

import
  listBase


type
  List* {.importcpp: "Urho3D::List", header: "List.h".}[T] = object of ListBase

  Node* {.importcpp: "Urho3D::List::Node", header: "List.h".}[T] = object of ListNodeBase
    value* {.importc: "value_".}: T

proc constructNode*[T](): Node[T] {.importcpp: "Urho3D::List::Node(@)",
                                    header: "List.h", constructor.}
proc constructNode*[T](value: T): Node[T] {.importcpp: "Urho3D::List::Node(@)",
    header: "List.h", constructor.}
proc next*[T](this: Node[T]): ptr Node {.noSideEffect, importcpp: "Next",
    header: "List.h".}
proc prev*[T](this: var Node[T]): ptr Node {.importcpp: "Prev",
    header: "List.h".}

type
  ListIterator* {.importcpp: "Urho3D::List::Iterator", header: "List.h".}[T] = object of ListIteratorBase

proc constructListIterator*[T](): ListIterator[T] {.importcpp: "Urho3D::List::Iterator(@)",
    header: "List.h", constructor.}
proc constructListIterator*[T](`ptr`: ptr Node): ListIterator[T] {.
    importcpp: "Urho3D::List::Iterator(@)", header: "List.h", constructor.}
proc `++`*[T](this: var ListIterator[T]): var ListIterator {.importcpp: "++ #",
    header: "List.h".}
proc `++`*[T](this: var ListIterator[T]; a3: cint): ListIterator {.importcpp: "++ #",
    header: "List.h".}
proc `--`*[T](this: var ListIterator[T]): var ListIterator {.importcpp: "-- #",
    header: "List.h".}
proc `--`*[T](this: var ListIterator[T]; a3: cint): ListIterator {.importcpp: "-- #",
    header: "List.h".}
proc `->`*[T](this: ListIterator[T]): ptr T {.noSideEffect, importcpp: "# -> #",
    header: "List.h".}
proc `*`*[T](this: ListIterator[T]): var T {.noSideEffect, importcpp: "* #",
    header: "List.h".}

type
  ConstListIterator* {.importcpp: "Urho3D::List::ConstIterator", header: "List.h".}[T] = object of ListIteratorBase

proc constructConstListIterator*[T](): ConstListIterator[T] {.
    importcpp: "Urho3D::List::ConstIterator(@)", header: "List.h",
    constructor.}
proc constructConstListIterator*[T](`ptr`: ptr Node): ConstListIterator[T] {.
    importcpp: "Urho3D::List::ConstIterator(@)", header: "List.h",
    constructor.}
proc constructConstListIterator*[T](rhs: ListIterator): ConstListIterator[T] {.
    importcpp: "Urho3D::List::ConstIterator(@)", header: "List.h",
    constructor.}
proc `++`*[T](this: var ConstListIterator[T]): var ConstListIterator {.
    importcpp: "++ #", header: "List.h".}
proc `++`*[T](this: var ConstListIterator[T]; a3: cint): ConstListIterator {.
    importcpp: "++ #", header: "List.h".}
proc `--`*[T](this: var ConstListIterator[T]): var ConstListIterator {.
    importcpp: "-- #", header: "List.h".}
proc `--`*[T](this: var ConstListIterator[T]; a3: cint): ConstListIterator {.
    importcpp: "-- #", header: "List.h".}
proc `->`*[T](this: ConstListIterator[T]): ptr T {.noSideEffect,
    importcpp: "# -> #", header: "List.h".}
proc `*`*[T](this: ConstListIterator[T]): T {.noSideEffect, importcpp: "* #",
    header: "List.h".}

proc constructList*[T](): List[T] {.importcpp: "Urho3D::List(@)",
                                    header: "List.h", constructor.}
proc constructList*[T](list: List[T]): List[T] {.importcpp: "Urho3D::List(@)",
    header: "List.h", constructor.}
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
proc insert*[T](this: var List[T]; dest: ListIterator; value: T) {.
    importcpp: "Insert", header: "List.h".}
proc insert*[T](this: var List[T]; dest: ListIterator; list: List[T]) {.
    importcpp: "Insert", header: "List.h".}
proc insert*[T](this: var List[T]; dest: ListIterator; start: ConstListIterator;
                `end`: ConstListIterator) {.importcpp: "Insert", header: "List.h".}
proc insert*[T](this: var List[T]; dest: ListIterator; start: ptr T; `end`: ptr T) {.
    importcpp: "Insert", header: "List.h".}
proc pop*[T](this: var List[T]) {.importcpp: "Pop", header: "List.h".}
proc popFront*[T](this: var List[T]) {.importcpp: "PopFront", header: "List.h".}
proc erase*[T](this: var List[T]; it: ListIterator): ListIterator {.importcpp: "Erase",
    header: "List.h".}
proc erase*[T](this: var List[T]; start: ListIterator; `end`: ListIterator): ListIterator {.
    importcpp: "Erase", header: "List.h".}
proc clear*[T](this: var List[T]) {.importcpp: "Clear", header: "List.h".}
proc resize*[T](this: var List[T]; newSize: cuint) {.importcpp: "Resize",
    header: "List.h".}
proc find*[T](this: var List[T]; value: T): ListIterator {.importcpp: "Find",
    header: "List.h".}
proc find*[T](this: List[T]; value: T): ConstListIterator {.noSideEffect,
    importcpp: "Find", header: "List.h".}
proc contains*[T](this: List[T]; value: T): bool {.noSideEffect,
    importcpp: "Contains", header: "List.h".}
proc begin*[T](this: var List[T]): ListIterator {.importcpp: "Begin",
    header: "List.h".}
proc begin*[T](this: List[T]): ConstListIterator {.noSideEffect, importcpp: "Begin",
    header: "List.h".}
proc `end`*[T](this: var List[T]): ListIterator {.importcpp: "End", header: "List.h".}
proc `end`*[T](this: List[T]): ConstListIterator {.noSideEffect, importcpp: "End",
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
                                      
