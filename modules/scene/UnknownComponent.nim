

import 
  component, stringHash, urstr, urobject


type 
  UnknownComponent* {.importc: "Urho3D::UnknownComponent", 
                      header: "UnknownComponent.h".} = object of Component
    typeHash* {.importc: "typeHash_".}: StringHash
    typeName* {.importc: "typeName_".}: UrString
    xmlAttributeInfos* {.importc: "xmlAttributeInfos_".}: Vector[AttributeInfo]
    xmlAttributes* {.importc: "xmlAttributes_".}: Vector[UrString]
    binaryAttributes* {.importc: "binaryAttributes_".}: PODVector[cuchar]
    useXML* {.importc: "useXML_".}: bool


proc constructUnknownComponent*(context: ptr Context): UnknownComponent {.
    importcpp: "Urho3D::UnknownComponent(@)", header: "UnknownComponent.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::UnknownComponent::RegisterObject(@)", 
    header: "UnknownComponent.h".}
proc getType*(this: UnknownComponent): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "UnknownComponent.h".}
proc getTypeName*(this: UnknownComponent): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "UnknownComponent.h".}
proc getAttributes*(this: UnknownComponent): ptr Vector[AttributeInfo] {.
    noSideEffect, importcpp: "GetAttributes", header: "UnknownComponent.h".}
proc load*(this: var UnknownComponent; source: var Deserializer; 
           setInstanceDefault: bool = false): bool {.importcpp: "Load", 
    header: "UnknownComponent.h".}
proc loadXML*(this: var UnknownComponent; source: XMLElement; 
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML", 
    header: "UnknownComponent.h".}
proc save*(this: UnknownComponent; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "UnknownComponent.h".}
proc saveXML*(this: UnknownComponent; dest: var XMLElement): bool {.
    noSideEffect, importcpp: "SaveXML", header: "UnknownComponent.h".}
proc setTypeName*(this: var UnknownComponent; typeName: UrString) {.
    importcpp: "SetTypeName", header: "UnknownComponent.h".}
proc setType*(this: var UnknownComponent; typeHash: StringHash) {.
    importcpp: "SetType", header: "UnknownComponent.h".}
proc getXMLAttributes*(this: UnknownComponent): Vector[UrString] {.noSideEffect, 
    importcpp: "GetXMLAttributes", header: "UnknownComponent.h".}
proc getBinaryAttributes*(this: UnknownComponent): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetBinaryAttributes", header: "UnknownComponent.h".}
proc getUseXML*(this: UnknownComponent): bool {.noSideEffect, 
    importcpp: "GetUseXML", header: "UnknownComponent.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::UnknownComponent::GetTypeStatic(@)", 
    header: "UnknownComponent.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::UnknownComponent::GetTypeNameStatic(@)", 
    header: "UnknownComponent.h".}