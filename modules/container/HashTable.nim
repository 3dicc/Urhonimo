

import 
  allocator, vector


type 
  HashTable* {.importcpp: "Urho3D::HashTable", header: "HashTable.h".}[T, U] = object 
    allocator* {.importc: "allocator_".}: ptr AllocatorBlock
    #ptrs* {.importc: "ptrs_".}: array[U, ptr Node]

  HashTableNode* {.importcpp: "Urho3D::HashTable::Node", header: "HashTable.h".}[T, U] = object 
    hash* {.importc: "hash_".}: cuint
    value* {.importc: "value_".}: T
    next* {.importc: "next_".}: ptr HashTableNode

proc constructNode*[T, U](hash: cuint; value: T; 
                          next: ptr HashTableNode[T, U]): HashTableNode[T, U] {.
    importcpp: "Urho3D::HashTable::Node(@)", header: "HashTable.h".}

proc constructHashTable*[T, U](): HashTable[T, U] {.
    importcpp: "Urho3D::HashTable(@)", header: "HashTable.h".}
proc destroyHashTable*[T, U](this: var HashTable[T, U]) {.
    importcpp: "#.~HashTable()", header: "HashTable.h".}
proc insert*[T, U](this: var HashTable[T, U]; hash: cuint; value: T) {.
    importcpp: "Insert", header: "HashTable.h".}
proc erase*[T, U](this: var HashTable[T, U]; hash: cuint): bool {.
    importcpp: "Erase", header: "HashTable.h".}
proc clear*[T, U](this: var HashTable[T, U]) {.importcpp: "Clear", 
    header: "HashTable.h".}
proc find*[T, U](this: HashTable[T, U]; hash: cuint): ptr T {.noSideEffect, 
    importcpp: "Find", header: "HashTable.h".}
proc keys*[T, U](this: HashTable[T, U]): PODVector[cuint] {.noSideEffect, 
    importcpp: "Keys", header: "HashTable.h".}
proc values*[T, U](this: HashTable[T, U]): PODVector[ptr T] {.noSideEffect, 
    importcpp: "Values", header: "HashTable.h".}