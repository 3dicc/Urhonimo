

import
  hashBase, pair, sort, vector


type
  HashMap* {.importcpp: "Urho3D::HashMap", header: "HashMap.h".}[T, U] = object of HashBase

  KeyValue* {.importcpp: "Urho3D::HashMap::KeyValue", header: "HashMap.h".}[T, U] = object
    first* {.importc: "first_".}: T
    second* {.importc: "second_".}: U

proc constructKeyValue*[T, U](): KeyValue[T, U] {.
    importcpp: "Urho3D::KeyValue(@)", header: "HashMap.h", constructor.}
proc constructKeyValue*[T, U](first: T; second: U): KeyValue[T, U] {.
    importcpp: "Urho3D::KeyValue(@)", header: "HashMap.h", constructor.}
proc constructKeyValue*[T, U](value: KeyValue): KeyValue[T, U] {.
    importcpp: "Urho3D::KeyValue(@)", header: "HashMap.h", constructor.}
proc `==`*[T, U](this: KeyValue[T, U]; rhs: KeyValue): bool {.noSideEffect,
    importcpp: "# == #", header: "HashMap.h".}
type
  Node* {.importcpp: "Urho3D::Node", header: "HashMap.h".}[T, U] = object of HashNodeBase
    pair* {.importc: "pair_".}: KeyValue[T, U]

proc constructNode*[T, U](): Node[T, U] {.importcpp: "Urho3D::Node(@)",
    header: "HashMap.h", constructor.}
proc constructNode*[T, U](key: T; value: U): Node[T, U] {.
    importcpp: "Urho3D::Node(@)", header: "HashMap.h", constructor.}
proc next*[T, U](this: Node[T, U]): ptr Node {.noSideEffect,
    importcpp: "Next", header: "HashMap.h".}
proc prev*[T, U](this: Node[T, U]): ptr Node {.noSideEffect,
    importcpp: "Prev", header: "HashMap.h".}
proc down*[T, U](this: Node[T, U]): ptr Node {.noSideEffect,
    importcpp: "Down", header: "HashMap.h".}

type
  HashMapIterator* {.importcpp: "Urho3D::HashMap::Iterator", header: "HashMap.h".}[T, U] = object of HashIteratorBase

proc constructIterator*[T, U](): HashMapIterator[T, U] {.
    importcpp: "Urho3D::HashMap::Iterator(@)", header: "HashMap.h",
    constructor.}
proc constructIterator*[T, U](`ptr`: ptr Node): HashMapIterator[T, U] {.
    importcpp: "Urho3D::HashMap::Iterator(@)", header: "HashMap.h",
    constructor.}
proc `++`*[T, U](this: var HashMapIterator[T, U]): var HashMapIterator {.importcpp: "++ #",
    header: "HashMap.h".}
proc `++`*[T, U](this: var HashMapIterator[T, U]; a3: cint): HashMapIterator {.
    importcpp: "++ #", header: "HashMap.h".}
proc `--`*[T, U](this: var HashMapIterator[T, U]): var HashMapIterator {.importcpp: "-- #",
    header: "HashMap.h".}
proc `--`*[T, U](this: var HashMapIterator[T, U]; a3: cint): HashMapIterator {.
    importcpp: "-- #", header: "HashMap.h".}
proc `->`*[T, U](this: HashMapIterator[T, U]): ptr KeyValue {.noSideEffect,
    importcpp: "# -> #", header: "HashMap.h".}
proc `*`*[T, U](this: HashMapIterator[T, U]): var KeyValue {.noSideEffect,
    importcpp: "* #", header: "HashMap.h".}
type
  ConstIterator* {.importc: "Urho3D::HashMap::ConstIterator", header: "HashMap.h".}[T,
      U] = object of HashIteratorBase

proc constructConstIterator*[T, U](): ConstIterator[T, U] {.
    importcpp: "Urho3D::ConstIterator(@)", header: "HashMap.h", constructor.}
proc constructConstIterator*[T, U](`ptr`: ptr Node): ConstIterator[T, U] {.
    importcpp: "Urho3D::ConstIterator(@)", header: "HashMap.h",constructor.}
proc constructConstIterator*[T, U](rhs: HashMapIterator): ConstIterator[T, U] {.
    importcpp: "Urho3D::ConstIterator(@)", header: "HashMap.h", constructor.}
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
    header: "HashMap.h", constructor.}
proc constructHashMap*[T, U](map: HashMap[T, U]): HashMap[T, U] {.
    importcpp: "Urho3D::HashMap(@)", header: "HashMap.h", constructor.}
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
proc insert*[T, U](this: var HashMap[T, U]; pair: Pair[T, U]): HashMapIterator {.
    importcpp: "Insert", header: "HashMap.h".}
proc insert*[T, U](this: var HashMap[T, U]; map: HashMap[T, U]) {.
    importcpp: "Insert", header: "HashMap.h".}
proc insert*[T, U](this: var HashMap[T, U]; it: ConstIterator): HashMapIterator {.
    importcpp: "Insert", header: "HashMap.h".}
proc insert*[T, U](this: var HashMap[T, U]; start: ConstIterator;
                   `end`: ConstIterator) {.importcpp: "Insert",
    header: "HashMap.h".}
proc erase*[T, U](this: var HashMap[T, U]; key: T): bool {.importcpp: "Erase",
    header: "HashMap.h".}
proc erase*[T, U](this: var HashMap[T, U]; it: HashMapIterator): HashMapIterator {.
    importcpp: "Erase", header: "HashMap.h".}
proc clear*[T, U](this: var HashMap[T, U]) {.importcpp: "Clear",
    header: "HashMap.h".}
proc sort*[T, U](this: var HashMap[T, U]) {.importcpp: "Sort",
    header: "HashMap.h".}
proc rehash*[T, U](this: var HashMap[T, U]; numBuckets: cuint): bool {.
    importcpp: "Rehash", header: "HashMap.h".}
proc find*[T, U](this: var HashMap[T, U]; key: T): HashMapIterator {.importcpp: "Find",
    header: "HashMap.h".}
proc find*[T, U](this: HashMap[T, U]; key: T): ConstIterator {.noSideEffect,
    importcpp: "Find", header: "HashMap.h".}
proc contains*[T, U](this: HashMap[T, U]; key: T): bool {.noSideEffect,
    importcpp: "Contains", header: "HashMap.h".}
proc keys*[T, U](this: HashMap[T, U]): Vector[T] {.noSideEffect,
    importcpp: "Keys", header: "HashMap.h".}
proc values*[T, U](this: HashMap[T, U]): Vector[U] {.noSideEffect,
    importcpp: "Values", header: "HashMap.h".}
proc begin*[T, U](this: var HashMap[T, U]): HashMapIterator {.importcpp: "Begin",
    header: "HashMap.h".}
proc begin*[T, U](this: HashMap[T, U]): ConstIterator {.noSideEffect,
    importcpp: "Begin", header: "HashMap.h".}
proc `end`*[T, U](this: var HashMap[T, U]): HashMapIterator {.importcpp: "End",
    header: "HashMap.h".}
proc `end`*[T, U](this: HashMap[T, U]): ConstIterator {.noSideEffect,
    importcpp: "End", header: "HashMap.h".}
proc front*[T, U](this: HashMap[T, U]): T {.noSideEffect, importcpp: "Front",
    header: "HashMap.h".}
proc back*[T, U](this: HashMap[T, U]): T {.noSideEffect, importcpp: "Back",
    header: "HashMap.h".}
