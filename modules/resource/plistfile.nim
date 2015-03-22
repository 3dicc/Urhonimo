

import
  resource

discard "forward decl of XMLElement"
type
  PListValueType* {.importcpp: "Urho3D::PListValueType".} = enum
    PLVT_NONE = 0, PLVT_INT, PLVT_BOOL, PLVT_FLOAT, PLVT_STRING, PLVT_VALUEMAP,
    PLVT_VALUEVECTOR


discard "forward decl of PListValue"
type
  PListValueMap* {.importcpp: "Urho3D::PListValueMap", header: "PListFile.h".} = object of HashMap[
      UrString, PListValue]


proc `[]`*(this: var PListValueMap; key: UrString): var PListValue {.
    importcpp: "#[@]", header: "PListFile.h".}
proc `[]`*(this: PListValueMap; key: UrString): PListValue {.noSideEffect,
    importcpp: "#[@]", header: "PListFile.h".}
type
  PListValueVector* = Vector[PListValue]
  PListValue* {.importcpp: "Urho3D::PListValue", header: "PListFile.h".} = object
    `type`* {.importc: "type_".}: PListValueType


proc constructPListValue*(): PListValue {.importcpp: "Urho3D::PListValue(@)",
    header: "PListFile.h", constructor.}
proc constructPListValue*(value: cint): PListValue {.constructor,
    importcpp: "Urho3D::PListValue(@)", header: "PListFile.h".}
proc constructPListValue*(value: bool): PListValue {.constructor,
    importcpp: "Urho3D::PListValue(@)", header: "PListFile.h".}
proc constructPListValue*(value: cfloat): PListValue {.constructor,
    importcpp: "Urho3D::PListValue(@)", header: "PListFile.h".}
proc constructPListValue*(value: UrString): PListValue {.constructor,
    importcpp: "Urho3D::PListValue(@)", header: "PListFile.h".}
proc constructPListValue*(valueMap: var PListValueMap): PListValue {.constructor,
    importcpp: "Urho3D::PListValue(@)", header: "PListFile.h".}
proc constructPListValue*(valueVector: var PListValueVector): PListValue {.constructor,
    importcpp: "Urho3D::PListValue(@)", header: "PListFile.h".}
proc constructPListValue*(value: PListValue): PListValue {.constructor,
    importcpp: "Urho3D::PListValue(@)", header: "PListFile.h".}
proc destroyPListValue*(this: var PListValue) {.importcpp: "#.~PListValue()",
    header: "PListFile.h".}
proc bool*(this: PListValue): Operator {.noSideEffect, importcpp: "bool",
    header: "PListFile.h".}
proc setInt*(this: var PListValue; value: cint) {.importcpp: "SetInt",
    header: "PListFile.h".}
proc setBool*(this: var PListValue; value: bool) {.importcpp: "SetBool",
    header: "PListFile.h".}
proc setFloat*(this: var PListValue; value: cfloat) {.importcpp: "SetFloat",
    header: "PListFile.h".}
proc setString*(this: var PListValue; value: UrString) {.importcpp: "SetString",
    header: "PListFile.h".}
proc setValueMap*(this: var PListValue; valueMap: PListValueMap) {.
    importcpp: "SetValueMap", header: "PListFile.h".}
proc setValueVector*(this: var PListValue; valueVector: PListValueVector) {.
    importcpp: "SetValueVector", header: "PListFile.h".}
proc getType*(this: PListValue): PListValueType {.noSideEffect,
    importcpp: "GetType", header: "PListFile.h".}
proc getInt*(this: PListValue): cint {.noSideEffect, importcpp: "GetInt",
                                       header: "PListFile.h".}
proc getBool*(this: PListValue): bool {.noSideEffect, importcpp: "GetBool",
                                        header: "PListFile.h".}
proc getFloat*(this: PListValue): cfloat {.noSideEffect, importcpp: "GetFloat",
    header: "PListFile.h".}
proc getString*(this: PListValue): UrString {.noSideEffect,
    importcpp: "GetString", header: "PListFile.h".}
proc getIntRect*(this: PListValue): IntRect {.noSideEffect,
    importcpp: "GetIntRect", header: "PListFile.h".}
proc getIntVector2*(this: PListValue): IntVector2 {.noSideEffect,
    importcpp: "GetIntVector2", header: "PListFile.h".}
proc getValueMap*(this: PListValue): PListValueMap {.noSideEffect,
    importcpp: "GetValueMap", header: "PListFile.h".}
proc getValueVector*(this: PListValue): PListValueVector {.noSideEffect,
    importcpp: "GetValueVector", header: "PListFile.h".}
proc convertToValueMap*(this: var PListValue): var PListValueMap {.
    importcpp: "ConvertToValueMap", header: "PListFile.h".}
proc convertToValueVector*(this: var PListValue): var PListValueVector {.
    importcpp: "ConvertToValueVector", header: "PListFile.h".}

type
  PListFile* {.importc: "Urho3D::PListFile", header: "PListFile.h".} = object of Resource
    root* {.importc: "root_".}: PListValueMap


proc getType*(this: PListFile): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "PListFile.h".}
proc getBaseType*(this: PListFile): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "PListFile.h".}
proc getTypeName*(this: PListFile): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "PListFile.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::PListFile::GetTypeStatic(@)", header: "PListFile.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::PListFile::GetTypeNameStatic(@)", header: "PListFile.h".}
proc constructPListFile*(context: ptr Context): PListFile {.constructor,
    importcpp: "Urho3D::PListFile(@)", header: "PListFile.h".}
proc destroyPListFile*(this: var PListFile) {.importcpp: "#.~PListFile()",
    header: "PListFile.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::PListFile::RegisterObject(@)", header: "PListFile.h".}
proc beginLoad*(this: var PListFile; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "PListFile.h".}
proc getRoot*(this: PListFile): PListValueMap {.noSideEffect,
    importcpp: "GetRoot", header: "PListFile.h".}
