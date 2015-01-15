
type 
  AllocatorBlock* {.importc: "Urho3D::AllocatorBlock", header: "Allocator.h".} = object 
    nodeSize* {.importc: "nodeSize_".}: cuint
    capacity* {.importc: "capacity_".}: cuint
    free* {.importc: "free_".}: ptr AllocatorNode
    next* {.importc: "next_".}: ptr AllocatorBlock
  AllocatorNode* {.importc: "Urho3D::AllocatorNode", header: "Allocator.h".} = object 
    next* {.importc: "next_".}: ptr AllocatorNode



proc allocatorInitialize*(nodeSize: cuint; initialCapacity: cuint = 1): ptr AllocatorBlock {.
    importcpp: "Urho3D::AllocatorInitialize(@)", header: "Allocator.h".}

proc allocatorUninitialize*(allocator: ptr AllocatorBlock) {.
    importcpp: "Urho3D::AllocatorUninitialize(@)", header: "Allocator.h".}

proc allocatorReserve*(allocator: ptr AllocatorBlock): pointer {.
    importcpp: "Urho3D::AllocatorReserve(@)", header: "Allocator.h".}

proc allocatorFree*(allocator: ptr AllocatorBlock; `ptr`: pointer) {.
    importcpp: "Urho3D::AllocatorFree(@)", header: "Allocator.h".}

type 
  Allocator* {.importc: "Urho3D::Allocator", header: "Allocator.h".}[T] = object 
    allocator* {.importc: "allocator_".}: ptr AllocatorBlock


proc constructAllocator*[T](initialCapacity: cuint = 0): Allocator[T] {.
    importcpp: "Urho3D::Allocator(@)", header: "Allocator.h".}
proc destroyAllocator*[T](this: var Allocator[T]) {.importcpp: "#.~Allocator()", 
    header: "Allocator.h".}
proc reserve*[T](this: var Allocator[T]): ptr T {.importcpp: "Reserve", 
    header: "Allocator.h".}
proc reserve*[T](this: var Allocator[T]; `object`: T): ptr T {.
    importcpp: "Reserve", header: "Allocator.h".}
proc free*[T](this: var Allocator[T]; `object`: ptr T) {.importcpp: "Free", 
    header: "Allocator.h".}