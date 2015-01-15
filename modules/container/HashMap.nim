

import 
  hashBase, pair, sort, vector


type 
  HashMap* {.importc: "Urho3D::HashMap", header: "HashMap.h".}[T, U] = object of HashBase
  

  type 
    KeyValue* {.importc: "Urho3D::KeyValue", header: "HashMap.h".}[T, U] = object 
      first* {.importc: "first_".}: T
      second* {.importc: "second_".}: U

  proc constructKeyValue*[T, U](): KeyValue[T, U] {.
      importcpp: "Urho3D::KeyValue(@)", header: "HashMap.h".}
  proc constructKeyValue*[T, U](first: T; second: U): KeyValue[T, U] {.
      importcpp: "Urho3D::KeyValue(@)", header: "HashMap.h".}
  proc constructKeyValue*[T, U](value: KeyValue): KeyValue[T, U] {.
      importcpp: "Urho3D::KeyValue(@)", header: "HashMap.h".}
  proc `==`*[T, U](this: KeyValue[T, U]; rhs: KeyValue): bool {.noSideEffect, 
      importcpp: "# == #", header: "HashMap.h".}
  type 
    Node* {.importc: "Urho3D::Node", header: "HashMap.h".}[T, U] = object of HashNodeBase
      pair* {.importc: "pair_".}: KeyValue

  proc constructNode*[T, U](): Node[T, U] {.importcpp: "Urho3D::Node(@)", 
      header: "HashMap.h".}
  proc constructNode*[T, U](key: T; value: U): Node[T, U] {.
      importcpp: "Urho3D::Node(@)", header: "HashMap.h".}
  proc next*[T, U](this: Node[T, U]): ptr Node {.noSideEffect, 
      importcpp: "Next", header: "HashMap.h".}
  proc prev*[T, U](this: Node[T, U]): ptr Node {.noSideEffect, 
      importcpp: "Prev", header: "HashMap.h".}
  proc down*[T, U](this: Node[T, U]): ptr Node {.noSideEffect, 
      importcpp: "Down", header: "HashMap.h".}
  type 
    Iterator* {.importc: "Urho3D::Iterator", header: "HashMap.h".}[T, U] = object of HashIteratorBase
    
  proc constructIterator*[T, U](): Iterator[T, U] {.
      importcpp: "Urho3D::Iterator(@)", header: "HashMap.h".}
  proc constructIterator*[T, U](`ptr`: ptr Node): Iterator[T, U] {.
      importcpp: "Urho3D::Iterator(@)", header: "HashMap.h".}
  proc `++`*[T, U](this: var Iterator[T, U]): var Iterator {.importcpp: "++ #", 
      header: "HashMap.h".}
  proc `++`*[T, U](this: var Iterator[T, U]; a3: cint): Iterator {.
      importcpp: "++ #", header: "HashMap.h".}
  proc `--`*[T, U](this: var Iterator[T, U]): var Iterator {.importcpp: "-- #", 
      header: "HashMap.h".}
  proc `--`*[T, U](this: var Iterator[T, U]; a3: cint): Iterator {.
      importcpp: "-- #", header: "HashMap.h".}
  proc `->`*[T, U](this: Iterator[T, U]): ptr KeyValue {.noSideEffect, 
      importcpp: "# -> #", header: "HashMap.h".}
  proc `*`*[T, U](this: Iterator[T, U]): var KeyValue {.noSideEffect, 
      importcpp: "* #", header: "HashMap.h".}
  type 
    ConstIterator* {.importc: "Urho3D::ConstIterator", header: "HashMap.h".}[T, 
        U] = object of HashIteratorBase
    
  proc constructConstIterator*[T, U](): ConstIterator[T, U] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "HashMap.h".}
  proc constructConstIterator*[T, U](`ptr`: ptr Node): ConstIterator[T, U] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "HashMap.h".}
  proc constructConstIterator*[T, U](rhs: Iterator): ConstIterator[T, U] {.
      importcpp: "Urho3D::ConstIterator(@)", header: "HashMap.h".}
  proc `++`*[T, U](this: var ConstIterator[T, U]): var ConstIterator {.
      importcpp: "++ #", header: "HashMap.h".}
  proc `++`*[T, U](this: var ConstIterator[T, U]; a3: cint): ConstIterator {.
      importcpp: "++ #", header: "HashMap.h".}
  proc `--`*[T, U](this: var ConstIterator[T, U]): var ConstIterator {.
      importcpp: "-- #", header: "HashMap.h".}
  proc `--`*[T, U](this: var ConstIterator[T, U]; a3: cint): ConstIterator {.
      importcpp: "-- #", header: "HashMap.h".}
  proc `->`*[T, U](this: ConstIterator[T, U]): ptr KeyValue {.noSideEffect, 
      importcpp: "# -> #", header: "HashMap.h".}
  proc `*`*[T, U](this: ConstIterator[T, U]): KeyValue {.noSideEffect, 
      importcpp: "* #", header: "HashMap.h".}
proc constructHashMap*[T, U](): HashMap[T, U] {.importcpp: "Urho3D::HashMap(@)", 
    header: "HashMap.h".}
proc constructHashMap*[T, U](map: HashMap[T, U]): HashMap[T, U] {.
    importcpp: "Urho3D::HashMap(@)", header: "HashMap.h".}
proc destroyHashMap*[T, U](this: var HashMap[T, U]) {.importcpp: "#.~HashMap()", 
    header: "HashMap.h".}
proc `+=`*[T, U](this: var HashMap[T, U]; rhs: Pair[T, U]) {.
    importcpp: "# += #", header: "HashMap.h".}
proc `+=`*[T, U](this: var HashMap[T, U]; rhs: HashMap[T, U]) {.
    importcpp: "# += #", header: "HashMap.h".}
proc `==`*[T, U](this: HashMap[T, U]; rhs: HashMap[T, U]): bool {.noSideEffect, 
    importcpp: "# == #", header: "HashMap.h".}
proc `[]`*[T, U](this: var HashMap[T, U]; key: T): var U {.importcpp: "#[@]", 
    header: "HashMap.h".}
proc insert*[T, U](this: var HashMap[T, U]; pair: Pair[T, U]): Iterator {.
    importcpp: "Insert", header: "HashMap.h".}
proc insert*[T, U](this: var HashMap[T, U]; map: HashMap[T, U]) {.
    importcpp: "Insert", header: "HashMap.h".}
proc insert*[T, U](this: var HashMap[T, U]; it: ConstIterator): Iterator {.
    importcpp: "Insert", header: "HashMap.h".}
proc insert*[T, U](this: var HashMap[T, U]; start: ConstIterator; 
                   `end`: ConstIterator) {.importcpp: "Insert", 
    header: "HashMap.h".}
proc erase*[T, U](this: var HashMap[T, U]; key: T): bool {.importcpp: "Erase", 
    header: "HashMap.h".}
proc erase*[T, U](this: var HashMap[T, U]; it: Iterator): Iterator {.
    importcpp: "Erase", header: "HashMap.h".}
proc clear*[T, U](this: var HashMap[T, U]) {.importcpp: "Clear", 
    header: "HashMap.h".}
proc sort*[T, U](this: var HashMap[T, U]) {.importcpp: "Sort", 
    header: "HashMap.h".}
proc rehash*[T, U](this: var HashMap[T, U]; numBuckets: cuint): bool {.
    importcpp: "Rehash", header: "HashMap.h".}
proc find*[T, U](this: var HashMap[T, U]; key: T): Iterator {.importcpp: "Find", 
    header: "HashMap.h".}
proc find*[T, U](this: HashMap[T, U]; key: T): ConstIterator {.noSideEffect, 
    importcpp: "Find", header: "HashMap.h".}
proc contains*[T, U](this: HashMap[T, U]; key: T): bool {.noSideEffect, 
    importcpp: "Contains", header: "HashMap.h".}
proc keys*[T, U](this: HashMap[T, U]): Vector[T] {.noSideEffect, 
    importcpp: "Keys", header: "HashMap.h".}
proc values*[T, U](this: HashMap[T, U]): Vector[U] {.noSideEffect, 
    importcpp: "Values", header: "HashMap.h".}
proc begin*[T, U](this: var HashMap[T, U]): Iterator {.importcpp: "Begin", 
    header: "HashMap.h".}
proc begin*[T, U](this: HashMap[T, U]): ConstIterator {.noSideEffect, 
    importcpp: "Begin", header: "HashMap.h".}
proc `end`*[T, U](this: var HashMap[T, U]): Iterator {.importcpp: "End", 
    header: "HashMap.h".}
proc `end`*[T, U](this: HashMap[T, U]): ConstIterator {.noSideEffect, 
    importcpp: "End", header: "HashMap.h".}
proc front*[T, U](this: HashMap[T, U]): T {.noSideEffect, importcpp: "Front", 
    header: "HashMap.h".}
proc back*[T, U](this: HashMap[T, U]): T {.noSideEffect, importcpp: "Back", 
    header: "HashMap.h".}