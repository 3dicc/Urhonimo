

import
  gpuobject, urobject, graphicsDefs, arrayPtr, ptrs, stringhash, urstr


type
  IndexBuffer* {.importcpp: "Urho3D::IndexBuffer", header: "IndexBuffer.h".} = object of UrObject
    when false:
      shadowData* {.importc: "shadowData_".}: SharedArrayPtr[cuchar]
      indexCount* {.importc: "indexCount_".}: cuint
      indexSize* {.importc: "indexSize_".}: cuint
      pool* {.importc: "pool_".}: cuint
      usage* {.importc: "usage_".}: cuint
      lockState* {.importc: "lockState_".}: LockState
      lockStart* {.importc: "lockStart_".}: cuint
      lockCount* {.importc: "lockCount_".}: cuint
      lockScratchData* {.importc: "lockScratchData_".}: pointer
      shadowed* {.importc: "shadowed_".}: bool


proc getType*(this: IndexBuffer): StringHash {.noSideEffect,
    importcpp: "GetType", header: "IndexBuffer.h".}
proc getBaseType*(this: IndexBuffer): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "IndexBuffer.h".}
proc getTypeName*(this: IndexBuffer): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "IndexBuffer.h".}
proc getTypeStatic*(): StringHash {.importcpp: "Urho3D::IndexBuffer::GetTypeStatic(@)",
                                    header: "IndexBuffer.h".}
proc getTypeNameStatic*(): UrString {.importcpp: "Urho3D::IndexBuffer::GetTypeNameStatic(@)",
                                      header: "IndexBuffer.h".}
proc constructIndexBuffer*(context: ptr Context): IndexBuffer {.constructor,
    importcpp: "Urho3D::IndexBuffer(@)", header: "IndexBuffer.h".}
proc destroyIndexBuffer*(this: var IndexBuffer) {.importcpp: "#.~IndexBuffer()",
    header: "IndexBuffer.h".}
proc onDeviceLost*(this: var IndexBuffer) {.importcpp: "OnDeviceLost",
    header: "IndexBuffer.h".}
proc onDeviceReset*(this: var IndexBuffer) {.importcpp: "OnDeviceReset",
    header: "IndexBuffer.h".}
proc release*(this: var IndexBuffer) {.importcpp: "Release",
                                       header: "IndexBuffer.h".}
proc setShadowed*(this: var IndexBuffer; enable: bool) {.
    importcpp: "SetShadowed", header: "IndexBuffer.h".}
proc setSize*(this: var IndexBuffer; indexCount: cuint; largeIndices: bool;
              dynamic: bool = false): bool {.importcpp: "SetSize",
    header: "IndexBuffer.h", discardable.}
proc setData*(this: var IndexBuffer; data: pointer): bool {.
    importcpp: "SetData", header: "IndexBuffer.h", discardable.}
proc setDataRange*(this: var IndexBuffer; data: pointer; start: cuint;
                   count: cuint; `discard`: bool = false): bool {.
    importcpp: "SetDataRange", header: "IndexBuffer.h", discardable.}
proc lock*(this: var IndexBuffer; start: cuint; count: cuint;
           `discard`: bool = false): pointer {.importcpp: "Lock",
    header: "IndexBuffer.h".}
proc unlock*(this: var IndexBuffer) {.importcpp: "Unlock",
                                      header: "IndexBuffer.h".}
proc isShadowed*(this: IndexBuffer): bool {.noSideEffect,
    importcpp: "IsShadowed", header: "IndexBuffer.h".}
proc isDynamic*(this: IndexBuffer): bool {.noSideEffect, importcpp: "IsDynamic",
    header: "IndexBuffer.h".}
proc isLocked*(this: IndexBuffer): bool {.noSideEffect, importcpp: "IsLocked",
    header: "IndexBuffer.h".}
proc getIndexCount*(this: IndexBuffer): cuint {.noSideEffect,
    importcpp: "GetIndexCount", header: "IndexBuffer.h".}
proc getIndexSize*(this: IndexBuffer): cuint {.noSideEffect,
    importcpp: "GetIndexSize", header: "IndexBuffer.h".}
proc getUsedVertexRange*(this: var IndexBuffer; start: cuint; count: cuint;
                         minVertex: var cuint; vertexCount: var cuint): bool {.
    importcpp: "GetUsedVertexRange", header: "IndexBuffer.h".}
proc getShadowData*(this: IndexBuffer): ptr cuchar {.noSideEffect,
    importcpp: "GetShadowData", header: "IndexBuffer.h".}
proc getShadowDataShared*(this: IndexBuffer): SharedArrayPtr[cuchar] {.
    noSideEffect, importcpp: "GetShadowDataShared", header: "IndexBuffer.h".}
