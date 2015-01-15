

import 
  hashMap, stringHash, variant, rect, vector2, quaternion, vector3, vector4,
  color, matrix3, matrix4, boundingbox, urstr, vector

type 
  Serializer* {.importc: "Urho3D::Serializer", header: "Serializer.h".} = object 
  

proc destroySerializer*(this: var Serializer) {.importcpp: "#.~Serializer()", 
    header: "Serializer.h".}
proc write*(this: var Serializer; data: pointer; size: cuint): cuint {.
    importcpp: "Write", header: "Serializer.h".}
proc writeInt*(this: var Serializer; value: cint): bool {.importcpp: "WriteInt", 
    header: "Serializer.h".}
proc writeShort*(this: var Serializer; value: cshort): bool {.
    importcpp: "WriteShort", header: "Serializer.h".}
proc writeByte*(this: var Serializer; value: cchar): bool {.
    importcpp: "WriteByte", header: "Serializer.h".}
proc writeUInt*(this: var Serializer; value: cuint): bool {.
    importcpp: "WriteUInt", header: "Serializer.h".}
proc writeUShort*(this: var Serializer; value: cushort): bool {.
    importcpp: "WriteUShort", header: "Serializer.h".}
proc writeUByte*(this: var Serializer; value: cuchar): bool {.
    importcpp: "WriteUByte", header: "Serializer.h".}
proc writeBool*(this: var Serializer; value: bool): bool {.
    importcpp: "WriteBool", header: "Serializer.h".}
proc writeFloat*(this: var Serializer; value: cfloat): bool {.
    importcpp: "WriteFloat", header: "Serializer.h".}
proc writeIntRect*(this: var Serializer; value: IntRect): bool {.
    importcpp: "WriteIntRect", header: "Serializer.h".}
proc writeIntVector2*(this: var Serializer; value: IntVector2): bool {.
    importcpp: "WriteIntVector2", header: "Serializer.h".}
proc writeRect*(this: var Serializer; value: Rect): bool {.
    importcpp: "WriteRect", header: "Serializer.h".}
proc writeVector2*(this: var Serializer; value: Vector2): bool {.
    importcpp: "WriteVector2", header: "Serializer.h".}
proc writeVector3*(this: var Serializer; value: Vector3): bool {.
    importcpp: "WriteVector3", header: "Serializer.h".}
proc writePackedVector3*(this: var Serializer; value: Vector3; 
                         maxAbsCoord: cfloat): bool {.
    importcpp: "WritePackedVector3", header: "Serializer.h".}
proc writeVector4*(this: var Serializer; value: Vector4): bool {.
    importcpp: "WriteVector4", header: "Serializer.h".}
proc writeQuaternion*(this: var Serializer; value: Quaternion): bool {.
    importcpp: "WriteQuaternion", header: "Serializer.h".}
proc writePackedQuaternion*(this: var Serializer; value: Quaternion): bool {.
    importcpp: "WritePackedQuaternion", header: "Serializer.h".}
proc writeMatrix3*(this: var Serializer; value: Matrix3): bool {.
    importcpp: "WriteMatrix3", header: "Serializer.h".}
proc writeMatrix3x4*(this: var Serializer; value: Matrix3x4): bool {.
    importcpp: "WriteMatrix3x4", header: "Serializer.h".}
proc writeMatrix4*(this: var Serializer; value: Matrix4): bool {.
    importcpp: "WriteMatrix4", header: "Serializer.h".}
proc writeColor*(this: var Serializer; value: Color): bool {.
    importcpp: "WriteColor", header: "Serializer.h".}
proc writeBoundingBox*(this: var Serializer; value: BoundingBox): bool {.
    importcpp: "WriteBoundingBox", header: "Serializer.h".}
proc writeString*(this: var Serializer; value: UrString): bool {.
    importcpp: "WriteString", header: "Serializer.h".}
proc writeFileID*(this: var Serializer; value: UrString): bool {.
    importcpp: "WriteFileID", header: "Serializer.h".}
proc writeStringHash*(this: var Serializer; value: StringHash): bool {.
    importcpp: "WriteStringHash", header: "Serializer.h".}
proc writeBuffer*(this: var Serializer; buffer: PODVector[cuchar]): bool {.
    importcpp: "WriteBuffer", header: "Serializer.h".}
proc writeResourceRef*(this: var Serializer; value: ResourceRef): bool {.
    importcpp: "WriteResourceRef", header: "Serializer.h".}
proc writeResourceRefList*(this: var Serializer; value: ResourceRefList): bool {.
    importcpp: "WriteResourceRefList", header: "Serializer.h".}
proc writeVariant*(this: var Serializer; value: Variant): bool {.
    importcpp: "WriteVariant", header: "Serializer.h".}
proc writeVariantData*(this: var Serializer; value: Variant): bool {.
    importcpp: "WriteVariantData", header: "Serializer.h".}
proc writeVariantVector*(this: var Serializer; value: VariantVector): bool {.
    importcpp: "WriteVariantVector", header: "Serializer.h".}
proc writeVariantMap*(this: var Serializer; value: VariantMap): bool {.
    importcpp: "WriteVariantMap", header: "Serializer.h".}
proc writeVLE*(this: var Serializer; value: cuint): bool {.
    importcpp: "WriteVLE", header: "Serializer.h".}
proc writeNetID*(this: var Serializer; value: cuint): bool {.
    importcpp: "WriteNetID", header: "Serializer.h".}
proc writeLine*(this: var Serializer; value: UrString): bool {.
    importcpp: "WriteLine", header: "Serializer.h".}