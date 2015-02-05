

import 
  graphicsDefs, resource, valueAnimationInfo, vector4, urstr, variant, ptrs,
  technique, vector, urstr, stringHash, texture, hashmap, xmlelement,
  component, valueAnimation, animationdefs, urobject, deserializer, serializer,
  vector2

discard "forward decl of Material"
discard "forward decl of Pass"
discard "forward decl of Scene"
discard "forward decl of Technique"
discard "forward decl of Texture"
discard "forward decl of Texture2D"
discard "forward decl of TextureCube"
discard "forward decl of ValueAnimationInfo"
type 
  MaterialShaderParameter* {.importc: "Urho3D::MaterialShaderParameter", 
                             header: "Material.h".} = object 
    name* {.importc: "name_".}: UrString
    value* {.importc: "value_".}: Variant



type 
  TechniqueEntry* {.importc: "Urho3D::TechniqueEntry", header: "Material.h".} = object 
    technique* {.importc: "technique_".}: SharedPtr[Technique]
    qualityLevel* {.importc: "qualityLevel_".}: cint
    lodDistance* {.importc: "lodDistance_".}: cfloat


proc constructTechniqueEntry*(): TechniqueEntry {.
    importcpp: "Urho3D::TechniqueEntry(@)", header: "Material.h".}
proc constructTechniqueEntry*(tech: ptr Technique; qualityLevel: cuint; 
                              lodDistance: cfloat): TechniqueEntry {.
    importcpp: "Urho3D::TechniqueEntry(@)", header: "Material.h".}
proc destroyTechniqueEntry*(this: var TechniqueEntry) {.
    importcpp: "#.~TechniqueEntry()", header: "Material.h".}

type 
  ShaderParameterAnimationInfo* {.importc: "Urho3D::ShaderParameterAnimationInfo", 
                                  header: "Material.h".} = object of ValueAnimationInfo
    name* {.importc: "name_".}: UrString

type 
  BiasParameters* {.importc: "Urho3D::BiasParameters", header: "Light.h".} = object 
    constantBias* {.importc: "constantBias_".}: cfloat
    slopeScaledBias* {.importc: "slopeScaledBias_".}: cfloat

  Material* {.importc: "Urho3D::Material", header: "Material.h".} = object of Resource
    techniques* {.importc: "techniques_".}: Vector[TechniqueEntry]
    textures* {.importc: "textures_".}: array[Max_Material_Texture_Units, 
        SharedPtr[Texture]]
    shaderParameters* {.importc: "shaderParameters_".}: HashMap[StringHash, 
        MaterialShaderParameter]
    shaderParameterAnimationInfos* {.importc: "shaderParameterAnimationInfos_".}: HashMap[
        StringHash, SharedPtr[ShaderParameterAnimationInfo]]
    cullMode* {.importc: "cullMode_".}: CullMode
    shadowCullMode* {.importc: "shadowCullMode_".}: CullMode
    depthBias* {.importc: "depthBias_".}: BiasParameters
    auxViewFrameNumber* {.importc: "auxViewFrameNumber_".}: cuint
    occlusion* {.importc: "occlusion_".}: bool
    specular* {.importc: "specular_".}: bool
    subscribed* {.importc: "subscribed_".}: bool
    loadXMLFile* {.importc: "loadXMLFile_".}: SharedPtr[XMLFile]
    scene* {.importc: "scene_".}: WeakPtr[Scene]

proc constructShaderParameterAnimationInfo*(material: ptr Material; 
    name: UrString; attributeAnimation: ptr ValueAnimation; wrapMode: WrapMode; 
    speed: cfloat): ShaderParameterAnimationInfo {.
    importcpp: "Urho3D::ShaderParameterAnimationInfo(@)", header: "Material.h".}
proc constructShaderParameterAnimationInfo*(other: ShaderParameterAnimationInfo): ShaderParameterAnimationInfo {.
    importcpp: "Urho3D::ShaderParameterAnimationInfo(@)", header: "Material.h".}
proc destroyShaderParameterAnimationInfo*(this: var ShaderParameterAnimationInfo) {.
    importcpp: "#.~ShaderParameterAnimationInfo()", header: "Material.h".}
proc getName*(this: ShaderParameterAnimationInfo): UrString {.noSideEffect, 
    importcpp: "GetName", header: "Material.h".}

proc getType*(this: Material): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Material.h".}
proc getBaseType*(this: Material): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Material.h".}
proc getTypeName*(this: Material): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Material.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Material::GetTypeStatic(@)", header: "Material.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Material::GetTypeNameStatic(@)", header: "Material.h".}
proc constructMaterial*(context: ptr Context): Material {.
    importcpp: "Urho3D::Material(@)", header: "Material.h".}
proc destroyMaterial*(this: var Material) {.importcpp: "#.~Material()", 
    header: "Material.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Material::RegisterObject(@)", header: "Material.h".}
proc beginLoad*(this: var Material; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Material.h".}
proc endLoad*(this: var Material): bool {.importcpp: "EndLoad", 
    header: "Material.h".}
proc save*(this: Material; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Material.h".}
proc load*(this: var Material; source: XMLElement): bool {.importcpp: "Load", 
    header: "Material.h".}
proc save*(this: Material; dest: var XMLElement): bool {.noSideEffect, 
    importcpp: "Save", header: "Material.h".}
proc setNumTechniques*(this: var Material; num: cuint) {.
    importcpp: "SetNumTechniques", header: "Material.h".}
proc setTechnique*(this: var Material; index: cuint; tech: ptr Technique; 
                   qualityLevel: cuint = 0; lodDistance: cfloat = 0.0) {.
    importcpp: "SetTechnique", header: "Material.h".}
proc setShaderParameter*(this: var Material; name: UrString; value: Variant) {.
    importcpp: "SetShaderParameter", header: "Material.h".}
proc setShaderParameterAnimation*(this: var Material; name: UrString; 
                                  animation: ptr ValueAnimation; 
                                  wrapMode: WrapMode = WM_Loop; 
                                  speed: cfloat = 1.0) {.
    importcpp: "SetShaderParameterAnimation", header: "Material.h".}
proc setShaderParameterAnimationWrapMode*(this: var Material; name: UrString; 
    wrapMode: WrapMode) {.importcpp: "SetShaderParameterAnimationWrapMode", 
                          header: "Material.h".}
proc setShaderParameterAnimationSpeed*(this: var Material; name: UrString; 
                                       speed: cfloat) {.
    importcpp: "SetShaderParameterAnimationSpeed", header: "Material.h".}
proc setTexture*(this: var Material; unit: TextureUnit; texture: ptr Texture) {.
    importcpp: "SetTexture", header: "Material.h".}
proc setUVTransform*(this: var Material; offset: Vector2; rotation: cfloat; 
                     repeat: Vector2) {.importcpp: "SetUVTransform", 
                                        header: "Material.h".}
proc setUVTransform*(this: var Material; offset: Vector2; rotation: cfloat; 
                     repeat: cfloat) {.importcpp: "SetUVTransform", 
                                       header: "Material.h".}
proc setCullMode*(this: var Material; mode: CullMode) {.
    importcpp: "SetCullMode", header: "Material.h".}
proc setShadowCullMode*(this: var Material; mode: CullMode) {.
    importcpp: "SetShadowCullMode", header: "Material.h".}
proc setDepthBias*(this: var Material; parameters: BiasParameters) {.
    importcpp: "SetDepthBias", header: "Material.h".}
proc setScene*(this: var Material; scene: ptr Scene) {.importcpp: "SetScene", 
    header: "Material.h".}
proc removeShaderParameter*(this: var Material; name: UrString) {.
    importcpp: "RemoveShaderParameter", header: "Material.h".}
proc releaseShaders*(this: var Material) {.importcpp: "ReleaseShaders", 
    header: "Material.h".}
proc clone*(this: Material; cloneName: UrString): SharedPtr[
    Material] {.noSideEffect, importcpp: "Clone", header: "Material.h".}
proc sortTechniques*(this: var Material) {.importcpp: "SortTechniques", 
    header: "Material.h".}
proc markForAuxView*(this: var Material; frameNumber: cuint) {.
    importcpp: "MarkForAuxView", header: "Material.h".}
proc getNumTechniques*(this: Material): cuint {.noSideEffect, 
    importcpp: "GetNumTechniques", header: "Material.h".}
proc getTechniques*(this: Material): Vector[TechniqueEntry] {.noSideEffect, 
    importcpp: "GetTechniques", header: "Material.h".}
proc getTechniqueEntry*(this: Material; index: cuint): TechniqueEntry {.
    noSideEffect, importcpp: "GetTechniqueEntry", header: "Material.h".}
proc getTechnique*(this: Material; index: cuint): ptr Technique {.noSideEffect, 
    importcpp: "GetTechnique", header: "Material.h".}
proc getPass*(this: Material; index: cuint; passType: StringHash): ptr Pass {.
    noSideEffect, importcpp: "GetPass", header: "Material.h".}
proc getTexture*(this: Material; unit: TextureUnit): ptr Texture {.noSideEffect, 
    importcpp: "GetTexture", header: "Material.h".}
proc getTextures*(this: Material): ptr SharedPtr[Texture] {.noSideEffect, 
    importcpp: "GetTextures", header: "Material.h".}
proc getShaderParameter*(this: Material; name: UrString): Variant {.
    noSideEffect, importcpp: "GetShaderParameter", header: "Material.h".}
proc getShaderParameterAnimation*(this: Material; name: UrString): ptr ValueAnimation {.
    noSideEffect, importcpp: "GetShaderParameterAnimation", header: "Material.h".}
proc getShaderParameterAnimationWrapMode*(this: Material; name: UrString): WrapMode {.
    noSideEffect, importcpp: "GetShaderParameterAnimationWrapMode", 
    header: "Material.h".}
proc getShaderParameterAnimationSpeed*(this: Material; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetShaderParameterAnimationSpeed", 
    header: "Material.h".}
proc getShaderParameters*(this: Material): HashMap[StringHash, 
    MaterialShaderParameter] {.noSideEffect, importcpp: "GetShaderParameters", 
                               header: "Material.h".}
proc getCullMode*(this: Material): CullMode {.noSideEffect, 
    importcpp: "GetCullMode", header: "Material.h".}
proc getShadowCullMode*(this: Material): CullMode {.noSideEffect, 
    importcpp: "GetShadowCullMode", header: "Material.h".}
proc getDepthBias*(this: Material): BiasParameters {.noSideEffect, 
    importcpp: "GetDepthBias", header: "Material.h".}
proc getAuxViewFrameNumber*(this: Material): cuint {.noSideEffect, 
    importcpp: "GetAuxViewFrameNumber", header: "Material.h".}
proc getOcclusion*(this: Material): bool {.noSideEffect, 
    importcpp: "GetOcclusion", header: "Material.h".}
proc getSpecular*(this: Material): bool {.noSideEffect, 
    importcpp: "GetSpecular", header: "Material.h".}
proc getScene*(this: Material): ptr Scene {.noSideEffect, importcpp: "GetScene", 
    header: "Material.h".}
proc getTextureUnitName*(unit: TextureUnit): UrString {.
    importcpp: "Urho3D::Material::GetTextureUnitName(@)", header: "Material.h".}
proc parseShaderParameterValue*(value: UrString): Variant {.
    importcpp: "Urho3D::Material::ParseShaderParameterValue(@)", 
    header: "Material.h".}