

import
  gpuobject, graphicsDefs, arrayPtr, urobject, stringhash, urstr


type
  VertexBuffer* {.importcpp: "Urho3D::VertexBuffer", header: "VertexBuffer.h".} = object of UrObject
    when false:
      shadowData* {.importc: "shadowData_".}: SharedArrayPtr[cuchar]
      vertexCount* {.importc: "vertexCount_".}: cuint
      vertexSize* {.importc: "vertexSize_".}: cuint
      elementMask* {.importc: "elementMask_".}: cuint
      elementOffset* {.importc: "elementOffset_".}: array[max_Vertex_Elements,
          cuint]
      pool* {.importc: "pool_".}: cuint
      usage* {.importc: "usage_".}: cuint
      lockState* {.importc: "lockState_".}: LockState
      lockStart* {.importc: "lockStart_".}: cuint
      lockCount* {.importc: "lockCount_".}: cuint
      lockScratchData* {.importc: "lockScratchData_".}: pointer
      shadowed* {.importc: "shadowed_".}: bool


proc getType*(this: VertexBuffer): StringHash {.noSideEffect,
    importcpp: "GetType", header: "VertexBuffer.h".}
proc getBaseType*(this: VertexBuffer): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "VertexBuffer.h".}
proc getTypeName*(this: VertexBuffer): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "VertexBuffer.h".}
proc getTypeStatic*(): StringHash {.importcpp: "Urho3D::VertexBuffer::GetTypeStatic(@)",
                                    header: "VertexBuffer.h".}
proc getTypeNameStatic*(): UrString {.importcpp: "Urho3D::VertexBuffer::GetTypeNameStatic(@)",
                                      header: "VertexBuffer.h".}
proc constructVertexBuffer*(context: ptr Context): VertexBuffer {.constructor,
    importcpp: "Urho3D::VertexBuffer(@)", header: "VertexBuffer.h".}
proc destroyVertexBuffer*(this: var VertexBuffer) {.
    importcpp: "#.~VertexBuffer()", header: "VertexBuffer.h".}
proc onDeviceLost*(this: var VertexBuffer) {.importcpp: "OnDeviceLost",
    header: "VertexBuffer.h".}
proc onDeviceReset*(this: var VertexBuffer) {.importcpp: "OnDeviceReset",
    header: "VertexBuffer.h".}
proc release*(this: var VertexBuffer) {.importcpp: "Release",
                                        header: "VertexBuffer.h".}
proc setShadowed*(this: var VertexBuffer; enable: bool) {.
    importcpp: "SetShadowed", header: "VertexBuffer.h".}
proc setSize*(this: var VertexBuffer; vertexCount: cuint; elementMask: cuint;
              dynamic: bool = false): bool {.importcpp: "SetSize",
    header: "VertexBuffer.h", discardable.}
proc setData*(this: var VertexBuffer; data: pointer): bool {.
    importcpp: "SetData", header: "VertexBuffer.h", discardable.}
proc setDataRange*(this: var VertexBuffer; data: pointer; start: cuint;
                   count: cuint; `discard`: bool = false): bool {.
    importcpp: "SetDataRange", header: "VertexBuffer.h", discardable.}
proc lock*(this: var VertexBuffer; start: cuint; count: cuint;
           `discard`: bool = false): pointer {.importcpp: "Lock",
    header: "VertexBuffer.h".}
proc unlock*(this: var VertexBuffer) {.importcpp: "Unlock",
                                       header: "VertexBuffer.h".}
proc isShadowed*(this: VertexBuffer): bool {.noSideEffect,
    importcpp: "IsShadowed", header: "VertexBuffer.h".}
proc isDynamic*(this: VertexBuffer): bool {.noSideEffect,
    importcpp: "IsDynamic", header: "VertexBuffer.h".}
proc isLocked*(this: VertexBuffer): bool {.noSideEffect, importcpp: "IsLocked",
    header: "VertexBuffer.h".}
proc getVertexCount*(this: VertexBuffer): cuint {.noSideEffect,
    importcpp: "GetVertexCount", header: "VertexBuffer.h".}
proc getVertexSize*(this: VertexBuffer): cuint {.noSideEffect,
    importcpp: "GetVertexSize", header: "VertexBuffer.h".}
proc getElementMask*(this: VertexBuffer): cuint {.noSideEffect,
    importcpp: "GetElementMask", header: "VertexBuffer.h".}
proc getElementOffset*(this: VertexBuffer; element: VertexElement): cuint {.
    noSideEffect, importcpp: "GetElementOffset", header: "VertexBuffer.h".}
proc getBufferHash*(this: var VertexBuffer; streamIndex: cuint; useMask: cuint): culonglong {.
    importcpp: "GetBufferHash", header: "VertexBuffer.h".}
proc getShadowData*(this: VertexBuffer): ptr cuchar {.noSideEffect,
    importcpp: "GetShadowData", header: "VertexBuffer.h".}
proc getShadowDataShared*(this: VertexBuffer): SharedArrayPtr[cuchar] {.
    noSideEffect, importcpp: "GetShadowDataShared", header: "VertexBuffer.h".}
proc getVertexSize*(elementMask: cuint): cuint {.
    importcpp: "Urho3D::VertexBuffer::GetVertexSize(@)",
    header: "VertexBuffer.h".}
proc getElementOffset*(elementMask: cuint; element: VertexElement): cuint {.
    importcpp: "Urho3D::VertexBuffer::GetElementOffset(@)",
    header: "VertexBuffer.h".}
