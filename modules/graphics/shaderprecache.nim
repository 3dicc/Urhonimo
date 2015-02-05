

import 
  hashSet, UrObject, xMLFile

discard "forward decl of Graphics"
discard "forward decl of ShaderVariation"
type 
  ShaderPrecache* {.importc: "Urho3D::ShaderPrecache", 
                    header: "ShaderPrecache.h".} = object of UrObject
    fileName* {.importc: "fileName_".}: UrString
    xmlFile* {.importc: "xmlFile_".}: XMLFile
    usedPtrCombinations* {.importc: "usedPtrCombinations_".}: HashSet[
        Pair[ptr ShaderVariation, ptr ShaderVariation]]
    usedCombinations* {.importc: "usedCombinations_".}: HashSet[UrString]


proc getType*(this: ShaderPrecache): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ShaderPrecache.h".}
proc getBaseType*(this: ShaderPrecache): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ShaderPrecache.h".}
proc getTypeName*(this: ShaderPrecache): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ShaderPrecache.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ShaderPrecache::GetTypeStatic(@)", 
    header: "ShaderPrecache.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ShaderPrecache::GetTypeNameStatic(@)", 
    header: "ShaderPrecache.h".}
proc constructShaderPrecache*(context: ptr Context; fileName: UrString): ShaderPrecache {.
    importcpp: "Urho3D::ShaderPrecache(@)", header: "ShaderPrecache.h".}
proc destroyShaderPrecache*(this: var ShaderPrecache) {.
    importcpp: "#.~ShaderPrecache()", header: "ShaderPrecache.h".}
proc storeShaders*(this: var ShaderPrecache; vs: ptr ShaderVariation; 
                   ps: ptr ShaderVariation) {.importcpp: "StoreShaders", 
    header: "ShaderPrecache.h".}
proc loadShaders*(graphics: ptr Graphics; source: var Deserializer) {.
    importcpp: "Urho3D::ShaderPrecache::LoadShaders(@)", 
    header: "ShaderPrecache.h".}