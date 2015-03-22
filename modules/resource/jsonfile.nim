

import
  resource, jSONValue

discard "forward decl of GenericDocument"
type
  Document* = GenericDocument[Utf8[char], MemoryPoolAllocator[CrtAllocator]]


type
  JSONFile* {.importcpp: "Urho3D::JSONFile", header: "JSONFile.h".} = object of Resource
    document* {.importc: "document_".}: ptr Rapidjson.Document


proc getType*(this: JSONFile): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "JSONFile.h".}
proc getBaseType*(this: JSONFile): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "JSONFile.h".}
proc getTypeName*(this: JSONFile): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "JSONFile.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::JSONFile::GetTypeStatic(@)", header: "JSONFile.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::JSONFile::GetTypeNameStatic(@)", header: "JSONFile.h".}
proc constructJSONFile*(context: ptr Context): JSONFile {.
    importcpp: "Urho3D::JSONFile(@)", header: "JSONFile.h", constructor.}
proc destroyJSONFile*(this: var JSONFile) {.importcpp: "#.~JSONFile()",
    header: "JSONFile.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::JSONFile::RegisterObject(@)", header: "JSONFile.h".}
proc beginLoad*(this: var JSONFile; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "JSONFile.h".}
proc save*(this: JSONFile; dest: var Serializer): bool {.noSideEffect,
    importcpp: "Save", header: "JSONFile.h".}
proc createRoot*(this: var JSONFile; valueType: JSONValueType = json_Object): JSONValue {.
    importcpp: "CreateRoot", header: "JSONFile.h".}
proc getRoot*(this: var JSONFile; valueType: JSONValueType = json_Any): JSONValue {.
    importcpp: "GetRoot", header: "JSONFile.h".}
proc getDocument*(this: JSONFile): ptr Rapidjson.Document {.noSideEffect,
    importcpp: "GetDocument", header: "JSONFile.h".}
