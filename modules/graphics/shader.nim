

import
  arrayPtr, resource

discard "forward decl of ShaderVariation"
type
  Shader* {.importcpp: "Urho3D::Shader", header: "Shader.h".} = object of Resource
    vsSourceCode* {.importc: "vsSourceCode_".}: UrString
    psSourceCode* {.importc: "psSourceCode_".}: UrString
    vsVariations* {.importc: "vsVariations_".}: HashMap[StringHash,
        SharedPtr[ShaderVariation]]
    psVariations* {.importc: "psVariations_".}: HashMap[StringHash,
        SharedPtr[ShaderVariation]]
    timeStamp* {.importc: "timeStamp_".}: cuint
    numVariations* {.importc: "numVariations_".}: cuint


proc getType*(this: Shader): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "Shader.h".}
proc getBaseType*(this: Shader): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Shader.h".}
proc getTypeName*(this: Shader): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Shader.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Shader::GetTypeStatic(@)", header: "Shader.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Shader::GetTypeNameStatic(@)", header: "Shader.h".}
proc constructShader*(context: ptr Context): Shader {.
    importcpp: "Urho3D::Shader(@)", header: "Shader.h", constructor.}
proc destroyShader*(this: var Shader) {.importcpp: "#.~Shader()",
                                        header: "Shader.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Shader::RegisterObject(@)", header: "Shader.h".}
proc beginLoad*(this: var Shader; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Shader.h".}
proc endLoad*(this: var Shader): bool {.importcpp: "EndLoad", header: "Shader.h".}
proc getVariation*(this: var Shader; `type`: ShaderType; defines: UrString): ptr ShaderVariation {.
    importcpp: "GetVariation", header: "Shader.h".}
proc getVariation*(this: var Shader; `type`: ShaderType; defines: cstring): ptr ShaderVariation {.
    importcpp: "GetVariation", header: "Shader.h".}
proc getSourceCode*(this: Shader; `type`: ShaderType): UrString {.noSideEffect,
    importcpp: "GetSourceCode", header: "Shader.h".}
proc getTimeStamp*(this: Shader): cuint {.noSideEffect,
    importcpp: "GetTimeStamp", header: "Shader.h".}
