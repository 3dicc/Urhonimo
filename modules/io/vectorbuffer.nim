

import
  deserializer, serializer, vector


type
  VectorBuffer* {.importcpp: "Urho3D::VectorBuffer", header: "VectorBuffer.h".} = object of Deserializer
    buffer* {.importc: "buffer_".}: PODVector[cuchar]


proc constructVectorBuffer*(): VectorBuffer {.constructor,
    importcpp: "Urho3D::VectorBuffer(@)", header: "VectorBuffer.h".}
proc constructVectorBuffer*(data: PODVector[cuchar]): VectorBuffer {.constructor,
    importcpp: "Urho3D::VectorBuffer(@)", header: "VectorBuffer.h".}
proc constructVectorBuffer*(data: pointer; size: cuint): VectorBuffer {.constructor,
    importcpp: "Urho3D::VectorBuffer(@)", header: "VectorBuffer.h".}
proc constructVectorBuffer*(source: var Deserializer; size: cuint): VectorBuffer {.
    importcpp: "Urho3D::VectorBuffer(@)", header: "VectorBuffer.h", constructor.}
proc read*(this: var VectorBuffer; dest: pointer; size: cuint): cuint {.
    importcpp: "Read", header: "VectorBuffer.h".}
proc seek*(this: var VectorBuffer; position: cuint): cuint {.importcpp: "Seek",
    header: "VectorBuffer.h".}
proc write*(this: var VectorBuffer; data: pointer; size: cuint): cuint {.
    importcpp: "Write", header: "VectorBuffer.h".}
proc setData*(this: var VectorBuffer; data: PODVector[cuchar]) {.
    importcpp: "SetData", header: "VectorBuffer.h".}
proc setData*(this: var VectorBuffer; data: pointer; size: cuint) {.
    importcpp: "SetData", header: "VectorBuffer.h".}
proc setData*(this: var VectorBuffer; source: var Deserializer; size: cuint) {.
    importcpp: "SetData", header: "VectorBuffer.h".}
proc clear*(this: var VectorBuffer) {.importcpp: "Clear",
                                      header: "VectorBuffer.h".}
proc resize*(this: var VectorBuffer; size: cuint) {.importcpp: "Resize",
    header: "VectorBuffer.h".}
proc getData*(this: VectorBuffer): ptr cuchar {.noSideEffect,
    importcpp: "GetData", header: "VectorBuffer.h".}
proc getModifiableData*(this: var VectorBuffer): ptr cuchar {.
    importcpp: "GetModifiableData", header: "VectorBuffer.h".}
proc getBuffer*(this: VectorBuffer): PODVector[cuchar] {.noSideEffect,
    importcpp: "GetBuffer", header: "VectorBuffer.h".}
