

import 
  color, hashMap, matrix3, matrix4, ptrs, rect, urstr, stringHash, vector,
  vector2, vector3, vector4, quaternion, refcounted


type 
  VariantType* {.importcpp: "Urho3D::VariantType".} = enum 
    VAR_NONE = 0, VAR_INT, VAR_BOOL, VAR_FLOAT, VAR_VECTOR2, VAR_VECTOR3, 
    VAR_VECTOR4, VAR_QUATERNION, VAR_COLOR, VAR_STRING, VAR_BUFFER, VAR_VOIDPTR, 
    VAR_RESOURCEREF, VAR_RESOURCEREFLIST, VAR_VARIANTVECTOR, VAR_VARIANTMAP, 
    VAR_INTRECT, VAR_INTVECTOR2, VAR_PTR, VAR_MATRIX3, VAR_MATRIX3X4, 
    VAR_MATRIX4, MAX_VAR_TYPES



type 
  VariantValue* {.importcpp: "Urho3D::VariantValue", header: "Variant.h".} = object 
  


type 
  ResourceRef* {.importcpp: "Urho3D::ResourceRef", header: "Variant.h".} = object 
    `type`* {.importc: "type_".}: StringHash
    name* {.importc: "name_".}: UrString


proc constructResourceRef*(): ResourceRef {.importcpp: "Urho3D::ResourceRef(@)", 
    header: "Variant.h".}
proc constructResourceRef*(`type`: StringHash): ResourceRef {.
    importcpp: "Urho3D::ResourceRef(@)", header: "Variant.h".}
proc constructResourceRef*(`type`: StringHash; name: UrString): ResourceRef {.
    importcpp: "Urho3D::ResourceRef(@)", header: "Variant.h".}
proc constructResourceRef*(rhs: ResourceRef): ResourceRef {.
    importcpp: "Urho3D::ResourceRef(@)", header: "Variant.h".}
proc `==`*(this: ResourceRef; rhs: ResourceRef): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}

type 
  ResourceRefList* {.importc: "Urho3D::ResourceRefList", header: "Variant.h".} = object 
    `type`* {.importc: "type_".}: StringHash
    names* {.importc: "names_".}: Vector[UrString]


proc constructResourceRefList*(): ResourceRefList {.
    importcpp: "Urho3D::ResourceRefList(@)", header: "Variant.h".}
proc constructResourceRefList*(`type`: StringHash): ResourceRefList {.
    importcpp: "Urho3D::ResourceRefList(@)", header: "Variant.h".}
proc constructResourceRefList*(`type`: StringHash; names: Vector[UrString]): ResourceRefList {.
    importcpp: "Urho3D::ResourceRefList(@)", header: "Variant.h".}
proc `==`*(this: ResourceRefList; rhs: ResourceRefList): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
discard "forward decl of Variant"

type 
  Variant* {.importcpp: "Urho3D::Variant", header: "Variant.h".} = object 
    `type`* {.importc: "type_".}: VariantType
    value* {.importc: "value_".}: VariantValue

  VariantVector* = Vector[Variant]
  VariantMap* = HashMap[StringHash, Variant]


proc constructVariant*(): Variant {.importcpp: "Urho3D::Variant(@)", 
                                    header: "Variant.h".}
proc constructVariant*(value: cint): Variant {.importcpp: "Urho3D::Variant(@)", 
    header: "Variant.h".}
proc constructVariant*(value: cuint): Variant {.importcpp: "Urho3D::Variant(@)", 
    header: "Variant.h".}
proc constructVariant*(value: StringHash): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: bool): Variant {.importcpp: "Urho3D::Variant(@)", 
    header: "Variant.h".}
proc constructVariant*(value: cfloat): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Vector2): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Vector3): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Vector4): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Quaternion): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Color): Variant {.importcpp: "Urho3D::Variant(@)", 
    header: "Variant.h".}
proc constructVariant*(value: UrString): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: cstring): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: PODVector[cuchar]): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: pointer): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: ResourceRef): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: ResourceRefList): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: VariantVector): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: VariantMap): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: IntRect): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: IntVector2): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: ptr RefCounted): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Matrix3): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Matrix3x4): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Matrix4): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(`type`: UrString; value: UrString): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(`type`: VariantType; value: UrString): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(`type`: cstring; value: cstring): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(`type`: VariantType; value: cstring): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc constructVariant*(value: Variant): Variant {.
    importcpp: "Urho3D::Variant(@)", header: "Variant.h".}
proc destroyVariant*(this: var Variant) {.importcpp: "#.~Variant()", 
    header: "Variant.h".}
proc clear*(this: var Variant) {.importcpp: "Clear", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Variant): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: cint): bool {.noSideEffect, importcpp: "# == #", 
    header: "Variant.h".}
proc `==`*(this: Variant; rhs: cuint): bool {.noSideEffect, importcpp: "# == #", 
    header: "Variant.h".}
proc `==`*(this: Variant; rhs: bool): bool {.noSideEffect, importcpp: "# == #", 
    header: "Variant.h".}
proc `==`*(this: Variant; rhs: cfloat): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Vector2): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Vector3): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Vector4): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Quaternion): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Color): bool {.noSideEffect, importcpp: "# == #", 
    header: "Variant.h".}
proc `==`*(this: Variant; rhs: UrString): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: PODVector[cuchar]): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: pointer): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: ResourceRef): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: ResourceRefList): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: VariantVector): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: VariantMap): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: IntRect): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: IntVector2): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: StringHash): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: ptr RefCounted): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Matrix3): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Matrix3x4): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc `==`*(this: Variant; rhs: Matrix4): bool {.noSideEffect, 
    importcpp: "# == #", header: "Variant.h".}
proc fromString*(this: var Variant; `type`: UrString; value: UrString) {.
    importcpp: "FromString", header: "Variant.h".}
proc fromString*(this: var Variant; `type`: cstring; value: cstring) {.
    importcpp: "FromString", header: "Variant.h".}
proc fromString*(this: var Variant; `type`: VariantType; value: UrString) {.
    importcpp: "FromString", header: "Variant.h".}
proc fromString*(this: var Variant; `type`: VariantType; value: cstring) {.
    importcpp: "FromString", header: "Variant.h".}
proc setBuffer*(this: var Variant; data: pointer; size: cuint) {.
    importcpp: "SetBuffer", header: "Variant.h".}
proc getInt*(this: Variant): cint {.noSideEffect, importcpp: "GetInt", 
                                    header: "Variant.h".}
proc getUInt*(this: Variant): cint {.noSideEffect, importcpp: "GetUInt", 
                                     header: "Variant.h".}
proc getStringHash*(this: Variant): StringHash {.noSideEffect, 
    importcpp: "GetStringHash", header: "Variant.h".}
proc getBool*(this: Variant): bool {.noSideEffect, importcpp: "GetBool", 
                                     header: "Variant.h".}
proc getFloat*(this: Variant): cfloat {.noSideEffect, importcpp: "GetFloat", 
                                        header: "Variant.h".}
proc getVector2*(this: Variant): Vector2 {.noSideEffect, 
    importcpp: "GetVector2", header: "Variant.h".}
proc getVector3*(this: Variant): Vector3 {.noSideEffect, 
    importcpp: "GetVector3", header: "Variant.h".}
proc getVector4*(this: Variant): Vector4 {.noSideEffect, 
    importcpp: "GetVector4", header: "Variant.h".}
proc getQuaternion*(this: Variant): Quaternion {.noSideEffect, 
    importcpp: "GetQuaternion", header: "Variant.h".}
proc getColor*(this: Variant): Color {.noSideEffect, importcpp: "GetColor", 
                                       header: "Variant.h".}
proc getString*(this: Variant): UrString {.noSideEffect, importcpp: "GetString", 
    header: "Variant.h".}
proc getBuffer*(this: Variant): PODVector[cuchar] {.noSideEffect, 
    importcpp: "GetBuffer", header: "Variant.h".}
proc getVoidPtr*(this: Variant): pointer {.noSideEffect, 
    importcpp: "GetVoidPtr", header: "Variant.h".}
proc getResourceRef*(this: Variant): ResourceRef {.noSideEffect, 
    importcpp: "GetResourceRef", header: "Variant.h".}
proc getResourceRefList*(this: Variant): ResourceRefList {.noSideEffect, 
    importcpp: "GetResourceRefList", header: "Variant.h".}
proc getVariantVector*(this: Variant): VariantVector {.noSideEffect, 
    importcpp: "GetVariantVector", header: "Variant.h".}
proc getVariantMap*(this: Variant): VariantMap {.noSideEffect, 
    importcpp: "GetVariantMap", header: "Variant.h".}
proc getIntRect*(this: Variant): IntRect {.noSideEffect, 
    importcpp: "GetIntRect", header: "Variant.h".}
proc getIntVector2*(this: Variant): IntVector2 {.noSideEffect, 
    importcpp: "GetIntVector2", header: "Variant.h".}
proc getPtr*(this: Variant): ptr RefCounted {.noSideEffect, importcpp: "GetPtr", 
    header: "Variant.h".}
proc getMatrix3*(this: Variant): Matrix3 {.noSideEffect, 
    importcpp: "GetMatrix3", header: "Variant.h".}
proc getMatrix3x4*(this: Variant): Matrix3x4 {.noSideEffect, 
    importcpp: "GetMatrix3x4", header: "Variant.h".}
proc getMatrix4*(this: Variant): Matrix4 {.noSideEffect, 
    importcpp: "GetMatrix4", header: "Variant.h".}
proc getType*(this: Variant): VariantType {.noSideEffect, importcpp: "GetType", 
    header: "Variant.h".}
proc getTypeName*(this: Variant): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Variant.h".}
proc toString*(this: Variant): UrString {.noSideEffect, importcpp: "ToString", 
    header: "Variant.h".}
proc isZero*(this: Variant): bool {.noSideEffect, importcpp: "IsZero", 
                                    header: "Variant.h".}
proc isEmpty*(this: Variant): bool {.noSideEffect, importcpp: "IsEmpty", 
                                     header: "Variant.h".}
proc get*[T](this: Variant): T {.noSideEffect, importcpp: "Get", 
                                 header: "Variant.h".}
proc getBufferPtr*(this: var Variant): ptr PODVector[cuchar] {.
    importcpp: "GetBufferPtr", header: "Variant.h".}
proc getVariantVectorPtr*(this: var Variant): ptr VariantVector {.
    importcpp: "GetVariantVectorPtr", header: "Variant.h".}
proc getVariantMapPtr*(this: var Variant): ptr VariantMap {.
    importcpp: "GetVariantMapPtr", header: "Variant.h".}
proc getTypeName*(`type`: VariantType): UrString {.
    importcpp: "Urho3D::Variant::GetTypeName(@)", header: "Variant.h".}
proc getTypeFromName*(typeName: UrString): VariantType {.
    importcpp: "Urho3D::Variant::GetTypeFromName(@)", header: "Variant.h".}
proc getTypeFromName*(typeName: cstring): VariantType {.
    importcpp: "Urho3D::Variant::GetTypeFromName(@)", header: "Variant.h".}