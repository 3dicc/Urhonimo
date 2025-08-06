

type
  LinkedListNode* {.importcpp: "Urho3D::LinkedListNode",
                    header: "LinkedList.h", inheritable.} = object
    next* {.importc: "next_".}: ptr LinkedListNode


proc constructLinkedListNode*(): LinkedListNode {.
    importcpp: "Urho3D::LinkedListNode(@)", header: "LinkedList.h",
    constructor.}

type
  LinkedList* [T]{.importcpp: "Urho3D::LinkedList", header: "LinkedList.h".} = object
    head* {.importc: "head_".}: ptr T


proc constructLinkedList*[T](): LinkedList[T] {.
    importcpp: "Urho3D::LinkedList(@)", header: "LinkedList.h", constructor.}
proc destroyLinkedList*[T](this: var LinkedList[T]) {.
    importcpp: "#.~LinkedList()", header: "LinkedList.h".}
proc clear*[T](this: var LinkedList[T]) {.importcpp: "Clear",
    header: "LinkedList.h".}
proc insertFront*[T](this: var LinkedList[T]; element: ptr T) {.
    importcpp: "InsertFront", header: "LinkedList.h".}
proc insert*[T](this: var LinkedList[T]; element: ptr T) {.importcpp: "Insert",
    header: "LinkedList.h".}
proc erase*[T](this: var LinkedList[T]; element: ptr T): bool {.
    importcpp: "Erase", header: "LinkedList.h".}
proc erase*[T](this: var LinkedList[T]; element: ptr T; previous: ptr T): bool {.
    importcpp: "Erase", header: "LinkedList.h".}
proc first*[T](this: LinkedList[T]): ptr T {.noSideEffect, importcpp: "First",
    header: "LinkedList.h".}
proc last*[T](this: LinkedList[T]): ptr T {.noSideEffect, importcpp: "Last",
    header: "LinkedList.h".}
proc next*[T](this: LinkedList[T]; element: ptr T): ptr T {.noSideEffect,
    importcpp: "Next", header: "LinkedList.h".}
proc empty*[T](this: LinkedList[T]): bool {.noSideEffect, importcpp: "Empty",
    header: "LinkedList.h".}
