

import 
  rect


type 
  AreaAllocator* {.importc: "Urho3D::AreaAllocator", header: "AreaAllocator.h".} = object 
    freeAreas* {.importc: "freeAreas_".}: PODVector[IntRect]
    size* {.importc: "size_".}: IntVector2
    maxSize* {.importc: "maxSize_".}: IntVector2
    doubleWidth* {.importc: "doubleWidth_".}: bool
    fastMode* {.importc: "fastMode_".}: bool


proc constructAreaAllocator*(): AreaAllocator {.
    importcpp: "Urho3D::AreaAllocator(@)", header: "AreaAllocator.h".}
proc constructAreaAllocator*(width: cint; height: cint; fastMode: bool = true): AreaAllocator {.
    importcpp: "Urho3D::AreaAllocator(@)", header: "AreaAllocator.h".}
proc constructAreaAllocator*(width: cint; height: cint; maxWidth: cint; 
                             maxHeight: cint; fastMode: bool = true): AreaAllocator {.
    importcpp: "Urho3D::AreaAllocator(@)", header: "AreaAllocator.h".}
proc reset*(this: var AreaAllocator; width: cint; height: cint; 
            maxWidth: cint = 0; maxHeight: cint = 0; fastMode: bool = true) {.
    importcpp: "Reset", header: "AreaAllocator.h".}
proc allocate*(this: var AreaAllocator; width: cint; height: cint; x: var cint; 
               y: var cint): bool {.importcpp: "Allocate", 
                                    header: "AreaAllocator.h".}
proc getWidth*(this: AreaAllocator): cint {.noSideEffect, importcpp: "GetWidth", 
    header: "AreaAllocator.h".}
proc getHeight*(this: AreaAllocator): cint {.noSideEffect, 
    importcpp: "GetHeight", header: "AreaAllocator.h".}
proc getFastMode*(this: AreaAllocator): bool {.noSideEffect, 
    importcpp: "GetFastMode", header: "AreaAllocator.h".}