

import
  arrayPtr, graphicsDefs, UrObject, vector, ptrs, vertexBuffer, indexBuffer,
  stringHash, urstr, urobject, graphics, ray, vector3

discard "forward decl of IndexBuffer"
discard "forward decl of Ray"
discard "forward decl of Graphics"
discard "forward decl of VertexBuffer"
type
  Geometry* {.importcpp: "Urho3D::Geometry", header: "Geometry.h".} = object of UrObject
    vertexBuffers* {.importc: "vertexBuffers_".}: Vector[SharedPtr[VertexBuffer]]
    elementMasks* {.importc: "elementMasks_".}: PODVector[cuint]
    indexBuffer* {.importc: "indexBuffer_".}: SharedPtr[IndexBuffer]
    rawVertexData* {.importc: "rawVertexData_".}: SharedArrayPtr[cuchar]
    rawIndexData* {.importc: "rawIndexData_".}: SharedArrayPtr[cuchar]
    primitiveType* {.importc: "primitiveType_".}: PrimitiveType
    indexStart* {.importc: "indexStart_".}: cuint
    indexCount* {.importc: "indexCount_".}: cuint
    vertexStart* {.importc: "vertexStart_".}: cuint
    vertexCount* {.importc: "vertexCount_".}: cuint
    positionBufferIndex* {.importc: "positionBufferIndex_".}: cuint
    rawVertexSize* {.importc: "rawVertexSize_".}: cuint
    rawElementMask* {.importc: "rawElementMask_".}: cuint
    rawIndexSize* {.importc: "rawIndexSize_".}: cuint
    lodDistance* {.importc: "lodDistance_".}: cfloat


proc getType*(this: Geometry): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Geometry.h".}
proc getBaseType*(this: Geometry): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Geometry.h".}
proc getTypeName*(this: Geometry): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Geometry.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Geometry::GetTypeStatic(@)", header: "Geometry.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Geometry::GetTypeNameStatic(@)", header: "Geometry.h".}
proc constructGeometry*(context: ptr Context): Geometry {.constructor,
    importcpp: "Urho3D::Geometry(@)", header: "Geometry.h".}
proc destroyGeometry*(this: var Geometry) {.importcpp: "#.~Geometry()",
    header: "Geometry.h".}
proc setNumVertexBuffers*(this: var Geometry; num: cuint): bool {.
    importcpp: "SetNumVertexBuffers", header: "Geometry.h".}
proc setVertexBuffer*(this: var Geometry; index: cuint;
                      buffer: ptr VertexBuffer;
                      elementMask: cuint = Mask_Default): bool {.
    importcpp: "SetVertexBuffer", header: "Geometry.h", discardable.}
proc setIndexBuffer*(this: var Geometry; buffer: ptr IndexBuffer) {.
    importcpp: "SetIndexBuffer", header: "Geometry.h".}
proc setDrawRange*(this: var Geometry; `type`: PrimitiveType; indexStart: cuint;
                   indexCount: cuint; getUsedVertexRange: bool = true): bool {.
    importcpp: "SetDrawRange", header: "Geometry.h", discardable.}
proc setDrawRange*(this: var Geometry; `type`: PrimitiveType; indexStart: cuint;
                   indexCount: cuint; vertexStart: cuint; vertexCount: cuint;
                   checkIllegal: bool = true): bool {.importcpp: "SetDrawRange",
    header: "Geometry.h", discardable.}
proc setLodDistance*(this: var Geometry; distance: cfloat) {.
    importcpp: "SetLodDistance", header: "Geometry.h".}
proc setRawVertexData*(this: var Geometry; data: SharedArrayPtr[cuchar];
                       vertexSize: cuint; elementMask: cuint) {.
    importcpp: "SetRawVertexData", header: "Geometry.h".}
proc setRawIndexData*(this: var Geometry; data: SharedArrayPtr[cuchar];
                      indexSize: cuint) {.importcpp: "SetRawIndexData",
    header: "Geometry.h".}
proc draw*(this: var Geometry; graphics: ptr Graphics) {.importcpp: "Draw",
    header: "Geometry.h".}
proc getVertexBuffers*(this: Geometry): Vector[SharedPtr[VertexBuffer]] {.
    noSideEffect, importcpp: "GetVertexBuffers", header: "Geometry.h".}
proc getVertexElementMasks*(this: Geometry): PODVector[cuint] {.noSideEffect,
    importcpp: "GetVertexElementMasks", header: "Geometry.h".}
proc getNumVertexBuffers*(this: Geometry): cuint {.noSideEffect,
    importcpp: "GetNumVertexBuffers", header: "Geometry.h".}
proc getVertexBuffer*(this: Geometry; index: cuint): ptr VertexBuffer {.
    noSideEffect, importcpp: "GetVertexBuffer", header: "Geometry.h".}
proc getVertexElementMask*(this: Geometry; index: cuint): cuint {.noSideEffect,
    importcpp: "GetVertexElementMask", header: "Geometry.h".}
proc getIndexBuffer*(this: Geometry): ptr IndexBuffer {.noSideEffect,
    importcpp: "GetIndexBuffer", header: "Geometry.h".}
proc getPrimitiveType*(this: Geometry): PrimitiveType {.noSideEffect,
    importcpp: "GetPrimitiveType", header: "Geometry.h".}
proc getIndexStart*(this: Geometry): cuint {.noSideEffect,
    importcpp: "GetIndexStart", header: "Geometry.h".}
proc getIndexCount*(this: Geometry): cuint {.noSideEffect,
    importcpp: "GetIndexCount", header: "Geometry.h".}
proc getVertexStart*(this: Geometry): cuint {.noSideEffect,
    importcpp: "GetVertexStart", header: "Geometry.h".}
proc getVertexCount*(this: Geometry): cuint {.noSideEffect,
    importcpp: "GetVertexCount", header: "Geometry.h".}
proc getLodDistance*(this: Geometry): cfloat {.noSideEffect,
    importcpp: "GetLodDistance", header: "Geometry.h".}
proc getBufferHash*(this: Geometry): cushort {.noSideEffect,
    importcpp: "GetBufferHash", header: "Geometry.h".}
proc getRawData*(this: Geometry; vertexData: var ptr cuchar;
                 vertexSize: var cuint; indexData: var ptr cuchar;
                 indexSize: var cuint; elementMask: var cuint) {.noSideEffect,
    importcpp: "GetRawData", header: "Geometry.h".}
proc getRawDataShared*(this: Geometry; vertexData: var SharedArrayPtr[cuchar];
                       vertexSize: var cuint;
                       indexData: var SharedArrayPtr[cuchar];
                       indexSize: var cuint; elementMask: var cuint) {.
    noSideEffect, importcpp: "GetRawDataShared", header: "Geometry.h".}
proc getHitDistance*(this: Geometry; ray: Ray; outNormal: ptr Vector3 = nil): cfloat {.
    noSideEffect, importcpp: "GetHitDistance", header: "Geometry.h".}
proc isInside*(this: Geometry; ray: Ray): bool {.noSideEffect,
    importcpp: "IsInside", header: "Geometry.h".}
proc isEmpty*(this: Geometry): bool {.noSideEffect, importcpp: "IsEmpty",
                                      header: "Geometry.h".}
