

import 
  boundingBox, rect, variant, urstr, vector2, vector3, vector4, quaternion,
  matrix3, matrix4, color, stringHash, vector, rect


type 
  Deserializer* {.importc: "Urho3D::Deserializer", header: "Deserializer.h",
                  inheritable.} = object 
    position* {.importc: "position_".}: cuint
    size* {.importc: "size_".}: cuint


proc constructDeserializer*(): Deserializer {.
    importcpp: "Urho3D::Deserializer(@)", header: "Deserializer.h".}
proc constructDeserializer*(size: cuint): Deserializer {.
    importcpp: "Urho3D::Deserializer(@)", header: "Deserializer.h".}
proc destroyDeserializer*(this: var Deserializer) {.
    importcpp: "#.~Deserializer()", header: "Deserializer.h".}
proc read*(this: var Deserializer; dest: pointer; size: cuint): cuint {.
    importcpp: "Read", header: "Deserializer.h".}
proc seek*(this: var Deserializer; position: cuint): cuint {.importcpp: "Seek", 
    header: "Deserializer.h".}
proc getName*(this: Deserializer): UrString {.noSideEffect, 
    importcpp: "GetName", header: "Deserializer.h".}
proc getChecksum*(this: var Deserializer): cuint {.importcpp: "GetChecksum", 
    header: "Deserializer.h".}
proc getPosition*(this: Deserializer): cuint {.noSideEffect, 
    importcpp: "GetPosition", header: "Deserializer.h".}
proc getSize*(this: Deserializer): cuint {.noSideEffect, importcpp: "GetSize", 
    header: "Deserializer.h".}
proc isEof*(this: Deserializer): bool {.noSideEffect, importcpp: "IsEof", 
                                        header: "Deserializer.h".}
proc readInt*(this: var Deserializer): cint {.importcpp: "ReadInt", 
    header: "Deserializer.h".}
proc readShort*(this: var Deserializer): cshort {.importcpp: "ReadShort", 
    header: "Deserializer.h".}
proc readByte*(this: var Deserializer): cchar {.importcpp: "ReadByte", 
    header: "Deserializer.h".}
proc readUInt*(this: var Deserializer): cuint {.importcpp: "ReadUInt", 
    header: "Deserializer.h".}
proc readUShort*(this: var Deserializer): cushort {.importcpp: "ReadUShort", 
    header: "Deserializer.h".}
proc readUByte*(this: var Deserializer): cuchar {.importcpp: "ReadUByte", 
    header: "Deserializer.h".}
proc readBool*(this: var Deserializer): bool {.importcpp: "ReadBool", 
    header: "Deserializer.h".}
proc readFloat*(this: var Deserializer): cfloat {.importcpp: "ReadFloat", 
    header: "Deserializer.h".}
proc readIntRect*(this: var Deserializer): IntRect {.importcpp: "ReadIntRect", 
    header: "Deserializer.h".}
proc readIntVector2*(this: var Deserializer): IntVector2 {.
    importcpp: "ReadIntVector2", header: "Deserializer.h".}
proc readRect*(this: var Deserializer): Rect {.importcpp: "ReadRect", 
    header: "Deserializer.h".}
proc readVector2*(this: var Deserializer): Vector2 {.importcpp: "ReadVector2", 
    header: "Deserializer.h".}
proc readVector3*(this: var Deserializer): Vector3 {.importcpp: "ReadVector3", 
    header: "Deserializer.h".}
proc readPackedVector3*(this: var Deserializer; maxAbsCoord: cfloat): Vector3 {.
    importcpp: "ReadPackedVector3", header: "Deserializer.h".}
proc readVector4*(this: var Deserializer): Vector4 {.importcpp: "ReadVector4", 
    header: "Deserializer.h".}
proc readQuaternion*(this: var Deserializer): Quaternion {.
    importcpp: "ReadQuaternion", header: "Deserializer.h".}
proc readPackedQuaternion*(this: var Deserializer): Quaternion {.
    importcpp: "ReadPackedQuaternion", header: "Deserializer.h".}
proc readMatrix3*(this: var Deserializer): Matrix3 {.importcpp: "ReadMatrix3", 
    header: "Deserializer.h".}
proc readMatrix3x4*(this: var Deserializer): Matrix3x4 {.
    importcpp: "ReadMatrix3x4", header: "Deserializer.h".}
proc readMatrix4*(this: var Deserializer): Matrix4 {.importcpp: "ReadMatrix4", 
    header: "Deserializer.h".}
proc readColor*(this: var Deserializer): Color {.importcpp: "ReadColor", 
    header: "Deserializer.h".}
proc readBoundingBox*(this: var Deserializer): BoundingBox {.
    importcpp: "ReadBoundingBox", header: "Deserializer.h".}
proc readString*(this: var Deserializer): UrString {.importcpp: "ReadString", 
    header: "Deserializer.h".}
proc readFileID*(this: var Deserializer): UrString {.importcpp: "ReadFileID", 
    header: "Deserializer.h".}
proc readStringHash*(this: var Deserializer): StringHash {.
    importcpp: "ReadStringHash", header: "Deserializer.h".}
proc readBuffer*(this: var Deserializer): PODVector[cuchar] {.
    importcpp: "ReadBuffer", header: "Deserializer.h".}
proc readResourceRef*(this: var Deserializer): ResourceRef {.
    importcpp: "ReadResourceRef", header: "Deserializer.h".}
proc readResourceRefList*(this: var Deserializer): ResourceRefList {.
    importcpp: "ReadResourceRefList", header: "Deserializer.h".}
proc readVariant*(this: var Deserializer): Variant {.importcpp: "ReadVariant", 
    header: "Deserializer.h".}
proc readVariant*(this: var Deserializer; `type`: VariantType): Variant {.
    importcpp: "ReadVariant", header: "Deserializer.h".}
proc readVariantVector*(this: var Deserializer): VariantVector {.
    importcpp: "ReadVariantVector", header: "Deserializer.h".}
proc readVariantMap*(this: var Deserializer): VariantMap {.
    importcpp: "ReadVariantMap", header: "Deserializer.h".}
proc readVLE*(this: var Deserializer): cuint {.importcpp: "ReadVLE", 
    header: "Deserializer.h".}
proc readNetID*(this: var Deserializer): cuint {.importcpp: "ReadNetID", 
    header: "Deserializer.h".}
proc readLine*(this: var Deserializer): UrString {.importcpp: "ReadLine", 
    header: "Deserializer.h".}