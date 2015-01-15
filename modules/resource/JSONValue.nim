

import 
  boundingBox, rect, `ptr`, variant

discard "forward decl of UTF8"
discard "forward decl of CrtAllocator"
discard "forward decl of MemoryPoolAllocator"
discard "forward decl of GenericValue"
type 
  Value* = GenericValue[Utf8[char], MemoryPoolAllocator[CrtAllocator]]

discard "forward decl of JSONFile"
type 
  JSONValueType* = enum 
    JSON_ANY = 0, JSON_OBJECT, JSON_ARRAY



type 
  JSONValue* {.importc: "Urho3D::JSONValue", header: "JSONValue.h".} = object 
    file* {.importc: "file_".}: WeakPtr[JSONFile]
    value* {.importc: "value_".}: ptr Rapidjson.Value


proc constructJSONValue*(): JSONValue {.importcpp: "Urho3D::JSONValue(@)", 
                                        header: "JSONValue.h".}
proc constructJSONValue*(file: ptr JSONFile; value: ptr Rapidjson.Value): JSONValue {.
    importcpp: "Urho3D::JSONValue(@)", header: "JSONValue.h".}
proc constructJSONValue*(rhs: JSONValue): JSONValue {.
    importcpp: "Urho3D::JSONValue(@)", header: "JSONValue.h".}
proc destroyJSONValue*(this: var JSONValue) {.importcpp: "#.~JSONValue()", 
    header: "JSONValue.h".}
proc isNull*(this: JSONValue): bool {.noSideEffect, importcpp: "IsNull", 
                                      header: "JSONValue.h".}
proc notNull*(this: JSONValue): bool {.noSideEffect, importcpp: "NotNull", 
                                       header: "JSONValue.h".}
proc bool*(this: JSONValue): Operator {.noSideEffect, importcpp: "bool", 
                                        header: "JSONValue.h".}
proc createChild*(this: var JSONValue; name: UrString; 
                  valueType: JSONValueType = json_Object): JSONValue {.
    importcpp: "CreateChild", header: "JSONValue.h".}
proc getChild*(this: JSONValue; name: UrString; 
               valueType: JSONValueType = json_Any): JSONValue {.noSideEffect, 
    importcpp: "GetChild", header: "JSONValue.h".}
proc setInt*(this: var JSONValue; name: UrString; value: cint) {.
    importcpp: "SetInt", header: "JSONValue.h".}
proc setBool*(this: var JSONValue; name: UrString; value: bool) {.
    importcpp: "SetBool", header: "JSONValue.h".}
proc setFloat*(this: var JSONValue; name: UrString; value: cfloat) {.
    importcpp: "SetFloat", header: "JSONValue.h".}
proc setVector2*(this: var JSONValue; name: UrString; value: Vector2) {.
    importcpp: "SetVector2", header: "JSONValue.h".}
proc setVector3*(this: var JSONValue; name: UrString; value: Vector3) {.
    importcpp: "SetVector3", header: "JSONValue.h".}
proc setVector4*(this: var JSONValue; name: UrString; value: Vector4) {.
    importcpp: "SetVector4", header: "JSONValue.h".}
proc setVectorVariant*(this: var JSONValue; name: UrString; value: Variant) {.
    importcpp: "SetVectorVariant", header: "JSONValue.h".}
proc setQuaternion*(this: var JSONValue; name: UrString; value: Quaternion) {.
    importcpp: "SetQuaternion", header: "JSONValue.h".}
proc setColor*(this: var JSONValue; name: UrString; value: Color) {.
    importcpp: "SetColor", header: "JSONValue.h".}
proc setString*(this: var JSONValue; name: UrString; value: UrString) {.
    importcpp: "SetString", header: "JSONValue.h".}
proc setBuffer*(this: var JSONValue; name: UrString; data: pointer; size: cuint) {.
    importcpp: "SetBuffer", header: "JSONValue.h".}
proc setBuffer*(this: var JSONValue; name: UrString; value: PODVector[cuchar]) {.
    importcpp: "SetBuffer", header: "JSONValue.h".}
proc setResourceRef*(this: var JSONValue; name: UrString; value: ResourceRef) {.
    importcpp: "SetResourceRef", header: "JSONValue.h".}
proc setResourceRefList*(this: var JSONValue; name: UrString; 
                         value: ResourceRefList) {.
    importcpp: "SetResourceRefList", header: "JSONValue.h".}
proc setIntRect*(this: var JSONValue; name: UrString; value: IntRect) {.
    importcpp: "SetIntRect", header: "JSONValue.h".}
proc setIntVector2*(this: var JSONValue; name: UrString; value: IntVector2) {.
    importcpp: "SetIntVector2", header: "JSONValue.h".}
proc setMatrix3*(this: var JSONValue; name: UrString; value: Matrix3) {.
    importcpp: "SetMatrix3", header: "JSONValue.h".}
proc setMatrix3x4*(this: var JSONValue; name: UrString; value: Matrix3x4) {.
    importcpp: "SetMatrix3x4", header: "JSONValue.h".}
proc setMatrix4*(this: var JSONValue; name: UrString; value: Matrix4) {.
    importcpp: "SetMatrix4", header: "JSONValue.h".}
proc setVariant*(this: var JSONValue; name: UrString; value: Variant) {.
    importcpp: "SetVariant", header: "JSONValue.h".}
proc setVariantValue*(this: var JSONValue; name: UrString; value: Variant) {.
    importcpp: "SetVariantValue", header: "JSONValue.h".}
proc isObject*(this: JSONValue): bool {.noSideEffect, importcpp: "IsObject", 
                                        header: "JSONValue.h".}
proc getChildNames*(this: JSONValue): Vector[UrString] {.noSideEffect, 
    importcpp: "GetChildNames", header: "JSONValue.h".}
proc getValueNames*(this: JSONValue): Vector[UrString] {.noSideEffect, 
    importcpp: "GetValueNames", header: "JSONValue.h".}
proc getInt*(this: JSONValue; name: UrString): cint {.noSideEffect, 
    importcpp: "GetInt", header: "JSONValue.h".}
proc getBool*(this: JSONValue; name: UrString): bool {.noSideEffect, 
    importcpp: "GetBool", header: "JSONValue.h".}
proc getFloat*(this: JSONValue; name: UrString): cfloat {.noSideEffect, 
    importcpp: "GetFloat", header: "JSONValue.h".}
proc getVector2*(this: JSONValue; name: UrString): Vector2 {.noSideEffect, 
    importcpp: "GetVector2", header: "JSONValue.h".}
proc getVector3*(this: JSONValue; name: UrString): Vector3 {.noSideEffect, 
    importcpp: "GetVector3", header: "JSONValue.h".}
proc getVector4*(this: JSONValue; name: UrString): Vector4 {.noSideEffect, 
    importcpp: "GetVector4", header: "JSONValue.h".}
proc getVectorVariant*(this: JSONValue; name: UrString): Variant {.noSideEffect, 
    importcpp: "GetVectorVariant", header: "JSONValue.h".}
proc getQuaternion*(this: JSONValue; name: UrString): Quaternion {.noSideEffect, 
    importcpp: "GetQuaternion", header: "JSONValue.h".}
proc getColor*(this: JSONValue; name: UrString): Color {.noSideEffect, 
    importcpp: "GetColor", header: "JSONValue.h".}
proc getString*(this: JSONValue; name: UrString): UrString {.noSideEffect, 
    importcpp: "GetString", header: "JSONValue.h".}
proc getCString*(this: JSONValue; name: UrString): cstring {.noSideEffect, 
    importcpp: "GetCString", header: "JSONValue.h".}
proc getBuffer*(this: JSONValue; name: UrString): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetBuffer", header: "JSONValue.h".}
proc getBuffer*(this: JSONValue; name: UrString; dest: pointer; size: cuint): bool {.
    noSideEffect, importcpp: "GetBuffer", header: "JSONValue.h".}
proc getResourceRef*(this: JSONValue; name: UrString): ResourceRef {.
    noSideEffect, importcpp: "GetResourceRef", header: "JSONValue.h".}
proc getResourceRefList*(this: JSONValue; name: UrString): ResourceRefList {.
    noSideEffect, importcpp: "GetResourceRefList", header: "JSONValue.h".}
proc getIntRect*(this: JSONValue; name: UrString): IntRect {.noSideEffect, 
    importcpp: "GetIntRect", header: "JSONValue.h".}
proc getIntVector2*(this: JSONValue; name: UrString): IntVector2 {.noSideEffect, 
    importcpp: "GetIntVector2", header: "JSONValue.h".}
proc getMatrix3*(this: JSONValue; name: UrString): Matrix3 {.noSideEffect, 
    importcpp: "GetMatrix3", header: "JSONValue.h".}
proc getMatrix3x4*(this: JSONValue; name: UrString): Matrix3x4 {.noSideEffect, 
    importcpp: "GetMatrix3x4", header: "JSONValue.h".}
proc getMatrix4*(this: JSONValue; name: UrString): Matrix4 {.noSideEffect, 
    importcpp: "GetMatrix4", header: "JSONValue.h".}
proc getVariant*(this: JSONValue; name: UrString): Variant {.noSideEffect, 
    importcpp: "GetVariant", header: "JSONValue.h".}
proc getVariantValue*(this: JSONValue; name: UrString; `type`: VariantType): Variant {.
    noSideEffect, importcpp: "GetVariantValue", header: "JSONValue.h".}
proc createChild*(this: var JSONValue; valueType: JSONValueType = json_Object): JSONValue {.
    importcpp: "CreateChild", header: "JSONValue.h".}
proc getChild*(this: JSONValue; index: cuint; 
               valueType: JSONValueType = json_Any): JSONValue {.noSideEffect, 
    importcpp: "GetChild", header: "JSONValue.h".}
proc addInt*(this: var JSONValue; value: cint) {.importcpp: "AddInt", 
    header: "JSONValue.h".}
proc addBool*(this: var JSONValue; value: bool) {.importcpp: "AddBool", 
    header: "JSONValue.h".}
proc addFloat*(this: var JSONValue; value: cfloat) {.importcpp: "AddFloat", 
    header: "JSONValue.h".}
proc addVector2*(this: var JSONValue; value: Vector2) {.importcpp: "AddVector2", 
    header: "JSONValue.h".}
proc addVector3*(this: var JSONValue; value: Vector3) {.importcpp: "AddVector3", 
    header: "JSONValue.h".}
proc addVector4*(this: var JSONValue; value: Vector4) {.importcpp: "AddVector4", 
    header: "JSONValue.h".}
proc addVectorVariant*(this: var JSONValue; value: Variant) {.
    importcpp: "AddVectorVariant", header: "JSONValue.h".}
proc addQuaternion*(this: var JSONValue; value: Quaternion) {.
    importcpp: "AddQuaternion", header: "JSONValue.h".}
proc addColor*(this: var JSONValue; value: Color) {.importcpp: "AddColor", 
    header: "JSONValue.h".}
proc addString*(this: var JSONValue; value: UrString) {.importcpp: "AddString", 
    header: "JSONValue.h".}
proc addBuffer*(this: var JSONValue; value: PODVector[cuchar]) {.
    importcpp: "AddBuffer", header: "JSONValue.h".}
proc addBuffer*(this: var JSONValue; data: pointer; size: cuint) {.
    importcpp: "AddBuffer", header: "JSONValue.h".}
proc addResourceRef*(this: var JSONValue; value: ResourceRef) {.
    importcpp: "AddResourceRef", header: "JSONValue.h".}
proc addResourceRefList*(this: var JSONValue; value: ResourceRefList) {.
    importcpp: "AddResourceRefList", header: "JSONValue.h".}
proc addIntRect*(this: var JSONValue; value: IntRect) {.importcpp: "AddIntRect", 
    header: "JSONValue.h".}
proc addIntVector2*(this: var JSONValue; value: IntVector2) {.
    importcpp: "AddIntVector2", header: "JSONValue.h".}
proc addMatrix3*(this: var JSONValue; value: Matrix3) {.importcpp: "AddMatrix3", 
    header: "JSONValue.h".}
proc addMatrix3x4*(this: var JSONValue; value: Matrix3x4) {.
    importcpp: "AddMatrix3x4", header: "JSONValue.h".}
proc addMatrix4*(this: var JSONValue; value: Matrix4) {.importcpp: "AddMatrix4", 
    header: "JSONValue.h".}
proc addVariant*(this: var JSONValue; value: Variant) {.importcpp: "AddVariant", 
    header: "JSONValue.h".}
proc addVariantValue*(this: var JSONValue; value: Variant) {.
    importcpp: "AddVariantValue", header: "JSONValue.h".}
proc isArray*(this: JSONValue): bool {.noSideEffect, importcpp: "IsArray", 
                                       header: "JSONValue.h".}
proc getSize*(this: JSONValue): cuint {.noSideEffect, importcpp: "GetSize", 
                                        header: "JSONValue.h".}
proc getInt*(this: JSONValue; index: cuint): cint {.noSideEffect, 
    importcpp: "GetInt", header: "JSONValue.h".}
proc getBool*(this: JSONValue; index: cuint): bool {.noSideEffect, 
    importcpp: "GetBool", header: "JSONValue.h".}
proc getFloat*(this: JSONValue; index: cuint): cfloat {.noSideEffect, 
    importcpp: "GetFloat", header: "JSONValue.h".}
proc getVector2*(this: JSONValue; index: cuint): Vector2 {.noSideEffect, 
    importcpp: "GetVector2", header: "JSONValue.h".}
proc getVector3*(this: JSONValue; index: cuint): Vector3 {.noSideEffect, 
    importcpp: "GetVector3", header: "JSONValue.h".}
proc getVector4*(this: JSONValue; index: cuint): Vector4 {.noSideEffect, 
    importcpp: "GetVector4", header: "JSONValue.h".}
proc getVectorVariant*(this: JSONValue; index: cuint): Variant {.noSideEffect, 
    importcpp: "GetVectorVariant", header: "JSONValue.h".}
proc getQuaternion*(this: JSONValue; index: cuint): Quaternion {.noSideEffect, 
    importcpp: "GetQuaternion", header: "JSONValue.h".}
proc getColor*(this: JSONValue; index: cuint): Color {.noSideEffect, 
    importcpp: "GetColor", header: "JSONValue.h".}
proc getString*(this: JSONValue; index: cuint): UrString {.noSideEffect, 
    importcpp: "GetString", header: "JSONValue.h".}
proc getCString*(this: JSONValue; index: cuint): cstring {.noSideEffect, 
    importcpp: "GetCString", header: "JSONValue.h".}
proc getBuffer*(this: JSONValue; index: cuint): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetBuffer", header: "JSONValue.h".}
proc getBuffer*(this: JSONValue; index: cuint; dest: pointer; size: cuint): bool {.
    noSideEffect, importcpp: "GetBuffer", header: "JSONValue.h".}
proc getResourceRef*(this: JSONValue; index: cuint): ResourceRef {.noSideEffect, 
    importcpp: "GetResourceRef", header: "JSONValue.h".}
proc getResourceRefList*(this: JSONValue; index: cuint): ResourceRefList {.
    noSideEffect, importcpp: "GetResourceRefList", header: "JSONValue.h".}
proc getIntRect*(this: JSONValue; index: cuint): IntRect {.noSideEffect, 
    importcpp: "GetIntRect", header: "JSONValue.h".}
proc getIntVector2*(this: JSONValue; index: cuint): IntVector2 {.noSideEffect, 
    importcpp: "GetIntVector2", header: "JSONValue.h".}
proc getMatrix3*(this: JSONValue; index: cuint): Matrix3 {.noSideEffect, 
    importcpp: "GetMatrix3", header: "JSONValue.h".}
proc getMatrix3x4*(this: JSONValue; index: cuint): Matrix3x4 {.noSideEffect, 
    importcpp: "GetMatrix3x4", header: "JSONValue.h".}
proc getMatrix4*(this: JSONValue; index: cuint): Matrix4 {.noSideEffect, 
    importcpp: "GetMatrix4", header: "JSONValue.h".}
proc getVariant*(this: JSONValue; index: cuint): Variant {.noSideEffect, 
    importcpp: "GetVariant", header: "JSONValue.h".}
proc getVariantValue*(this: JSONValue; index: cuint; `type`: VariantType): Variant {.
    noSideEffect, importcpp: "GetVariantValue", header: "JSONValue.h".}