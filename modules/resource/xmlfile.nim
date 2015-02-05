

import 
  resource, xMLElement, stringHash, urstr, deserializer, serializer

proc getType*(this: XMLFile): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "XMLFile.h".}
proc getBaseType*(this: XMLFile): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "XMLFile.h".}
proc getTypeName*(this: XMLFile): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "XMLFile.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::XMLFile::GetTypeStatic(@)", header: "XMLFile.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::XMLFile::GetTypeNameStatic(@)", header: "XMLFile.h".}

#proc registerObject*(context: ptr Context) {.
#    importcpp: "Urho3D::XMLFile::RegisterObject(@)", header: "XMLFile.h".}
proc beginLoad*(this: var XMLFile; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "XMLFile.h".}
proc save*(this: XMLFile; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "XMLFile.h".}
proc fromString*(this: var XMLFile; source: UrString): bool {.
    importcpp: "FromString", header: "XMLFile.h".}
proc createRoot*(this: var XMLFile; name: UrString): XMLElement {.
    importcpp: "CreateRoot", header: "XMLFile.h".}
proc getRoot*(this: var XMLFile; name: UrString): XMLElement {.
    importcpp: "GetRoot", header: "XMLFile.h".}

proc toString*(this: XMLFile): UrString {.noSideEffect, importcpp: "ToString", 
    header: "XMLFile.h".}
proc patch*(this: var XMLFile; patchFile: ptr XMLFile) {.importcpp: "Patch", 
    header: "XMLFile.h".}
proc patch*(this: var XMLFile; patchElement: XMLElement) {.importcpp: "Patch", 
    header: "XMLFile.h".}