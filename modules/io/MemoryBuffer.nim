

import 
  deserializer, serializer, vector


type 
  MemoryBuffer* {.importc: "Urho3D::MemoryBuffer", header: "MemoryBuffer.h".} = object of Deserializer
    buffer* {.importc: "buffer_".}: ptr cuchar
    readOnly* {.importc: "readOnly_".}: bool


proc constructMemoryBuffer*(data: pointer; size: cuint): MemoryBuffer {.
    importcpp: "Urho3D::MemoryBuffer(@)", header: "MemoryBuffer.h".}
proc constructMemoryBuffer*(data: PODVector[cuchar]): MemoryBuffer {.
    importcpp: "Urho3D::MemoryBuffer(@)", header: "MemoryBuffer.h".}
proc read*(this: var MemoryBuffer; dest: pointer; size: cuint): cuint {.
    importcpp: "Read", header: "MemoryBuffer.h".}
proc seek*(this: var MemoryBuffer; position: cuint): cuint {.importcpp: "Seek", 
    header: "MemoryBuffer.h".}
proc write*(this: var MemoryBuffer; data: pointer; size: cuint): cuint {.
    importcpp: "Write", header: "MemoryBuffer.h".}
proc getData*(this: var MemoryBuffer): ptr cuchar {.importcpp: "GetData", 
    header: "MemoryBuffer.h".}
proc isReadOnly*(this: var MemoryBuffer): bool {.importcpp: "IsReadOnly", 
    header: "MemoryBuffer.h".}