

import 
  graphicsDefs, hashTable, resource, refcounted, stringHash, urstr, vector,
  ptrs, shadervariation, urobject, deserializer, serializer

discard "forward decl of ShaderVariation"
type 
  PassLightingMode* {.importcpp: "Urho3D::PassLightingMode".} = enum 
    LIGHTING_UNLIT, LIGHTING_PERVERTEX, LIGHTING_PERPIXEL



type 
  Pass* {.importc: "Urho3D::Pass", header: "Technique.h".} = object of RefCounted
    `type`* {.importc: "type_".}: StringHash
    blendMode* {.importc: "blendMode_".}: BlendMode
    depthTestMode* {.importc: "depthTestMode_".}: CompareMode
    lightingMode* {.importc: "lightingMode_".}: PassLightingMode
    shadersLoadedFrameNumber* {.importc: "shadersLoadedFrameNumber_".}: cuint
    depthWrite* {.importc: "depthWrite_".}: bool
    alphaMask* {.importc: "alphaMask_".}: bool
    isSM3* {.importc: "isSM3_".}: bool
    isDesktop* {.importc: "isDesktop_".}: bool
    vertexShaderName* {.importc: "vertexShaderName_".}: UrString
    pixelShaderName* {.importc: "pixelShaderName_".}: UrString
    vertexShaderDefines* {.importc: "vertexShaderDefines_".}: UrString
    pixelShaderDefines* {.importc: "pixelShaderDefines_".}: UrString
    vertexShaders* {.importc: "vertexShaders_".}: Vector[
        SharedPtr[ShaderVariation]]
    pixelShaders* {.importc: "pixelShaders_".}: Vector[
        SharedPtr[ShaderVariation]]


proc constructPass*(`type`: StringHash): Pass {.importcpp: "Urho3D::Pass(@)", 
    header: "Technique.h".}
proc destroyPass*(this: var Pass) {.importcpp: "#.~Pass()", 
                                    header: "Technique.h".}
proc setBlendMode*(this: var Pass; mode: BlendMode) {.importcpp: "SetBlendMode", 
    header: "Technique.h".}
proc setDepthTestMode*(this: var Pass; mode: CompareMode) {.
    importcpp: "SetDepthTestMode", header: "Technique.h".}
proc setLightingMode*(this: var Pass; mode: PassLightingMode) {.
    importcpp: "SetLightingMode", header: "Technique.h".}
proc setDepthWrite*(this: var Pass; enable: bool) {.importcpp: "SetDepthWrite", 
    header: "Technique.h".}
proc setAlphaMask*(this: var Pass; enable: bool) {.importcpp: "SetAlphaMask", 
    header: "Technique.h".}
proc setIsSM3*(this: var Pass; enable: bool) {.importcpp: "SetIsSM3", 
    header: "Technique.h".}
proc setIsDesktop*(this: var Pass; enable: bool) {.importcpp: "SetIsDesktop", 
    header: "Technique.h".}
proc setVertexShader*(this: var Pass; name: UrString) {.
    importcpp: "SetVertexShader", header: "Technique.h".}
proc setPixelShader*(this: var Pass; name: UrString) {.
    importcpp: "SetPixelShader", header: "Technique.h".}
proc setVertexShaderDefines*(this: var Pass; defines: UrString) {.
    importcpp: "SetVertexShaderDefines", header: "Technique.h".}
proc setPixelShaderDefines*(this: var Pass; defines: UrString) {.
    importcpp: "SetPixelShaderDefines", header: "Technique.h".}
proc releaseShaders*(this: var Pass) {.importcpp: "ReleaseShaders", 
                                       header: "Technique.h".}
proc markShadersLoaded*(this: var Pass; frameNumber: cuint) {.
    importcpp: "MarkShadersLoaded", header: "Technique.h".}
proc getType*(this: Pass): StringHash {.noSideEffect, importcpp: "GetType", 
                                        header: "Technique.h".}
proc getBlendMode*(this: Pass): BlendMode {.noSideEffect, 
    importcpp: "GetBlendMode", header: "Technique.h".}
proc getDepthTestMode*(this: Pass): CompareMode {.noSideEffect, 
    importcpp: "GetDepthTestMode", header: "Technique.h".}
proc getLightingMode*(this: Pass): PassLightingMode {.noSideEffect, 
    importcpp: "GetLightingMode", header: "Technique.h".}
proc getShadersLoadedFrameNumber*(this: Pass): cuint {.noSideEffect, 
    importcpp: "GetShadersLoadedFrameNumber", header: "Technique.h".}
proc getDepthWrite*(this: Pass): bool {.noSideEffect, 
                                        importcpp: "GetDepthWrite", 
                                        header: "Technique.h".}
proc getAlphaMask*(this: Pass): bool {.noSideEffect, importcpp: "GetAlphaMask", 
                                       header: "Technique.h".}
proc isSM3*(this: Pass): bool {.noSideEffect, importcpp: "IsSM3", 
                                header: "Technique.h".}
proc isDesktop*(this: Pass): bool {.noSideEffect, importcpp: "IsDesktop", 
                                    header: "Technique.h".}
proc getVertexShader*(this: Pass): UrString {.noSideEffect, 
    importcpp: "GetVertexShader", header: "Technique.h".}
proc getPixelShader*(this: Pass): UrString {.noSideEffect, 
    importcpp: "GetPixelShader", header: "Technique.h".}
proc getVertexShaderDefines*(this: Pass): UrString {.noSideEffect, 
    importcpp: "GetVertexShaderDefines", header: "Technique.h".}
proc getPixelShaderDefines*(this: Pass): UrString {.noSideEffect, 
    importcpp: "GetPixelShaderDefines", header: "Technique.h".}
proc getVertexShaders*(this: var Pass): var Vector[SharedPtr[ShaderVariation]] {.
    importcpp: "GetVertexShaders", header: "Technique.h".}
proc getPixelShaders*(this: var Pass): var Vector[SharedPtr[ShaderVariation]] {.
    importcpp: "GetPixelShaders", header: "Technique.h".}

type 
  Technique* {.importc: "Urho3D::Technique", header: "Technique.h".} = object of Resource
    isSM3* {.importc: "isSM3_".}: bool
    sm3Support* {.importc: "sm3Support_".}: bool
    isDesktop* {.importc: "isDesktop_".}: bool
    desktopSupport* {.importc: "desktopSupport_".}: bool
    passes* {.importc: "passes_".}: HashTable[SharedPtr[Pass], range[0..15]]
    numPasses* {.importc: "numPasses_".}: cuint


proc getType*(this: Technique): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Technique.h".}
proc getBaseType*(this: Technique): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Technique.h".}
proc getTypeName*(this: Technique): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Technique.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Technique::GetTypeStatic(@)", header: "Technique.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Technique::GetTypeNameStatic(@)", header: "Technique.h".}
proc constructTechnique*(context: ptr Context): Technique {.
    importcpp: "Urho3D::Technique(@)", header: "Technique.h".}
proc destroyTechnique*(this: var Technique) {.importcpp: "#.~Technique()", 
    header: "Technique.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Technique::RegisterObject(@)", header: "Technique.h".}
proc beginLoad*(this: var Technique; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Technique.h".}
proc setIsSM3*(this: var Technique; enable: bool) {.importcpp: "SetIsSM3", 
    header: "Technique.h".}
proc setIsDesktop*(this: var Technique; enable: bool) {.
    importcpp: "SetIsDesktop", header: "Technique.h".}
proc createPass*(this: var Technique; `type`: StringHash): ptr Pass {.
    importcpp: "CreatePass", header: "Technique.h".}
proc removePass*(this: var Technique; `type`: StringHash) {.
    importcpp: "RemovePass", header: "Technique.h".}
proc releaseShaders*(this: var Technique) {.importcpp: "ReleaseShaders", 
    header: "Technique.h".}
proc isSM3*(this: Technique): bool {.noSideEffect, importcpp: "IsSM3", 
                                     header: "Technique.h".}
proc isDesktop*(this: Technique): bool {.noSideEffect, importcpp: "IsDesktop", 
    header: "Technique.h".}
proc isSupported*(this: Technique): bool {.noSideEffect, 
    importcpp: "IsSupported", header: "Technique.h".}
proc hasPass*(this: Technique; `type`: StringHash): bool {.noSideEffect, 
    importcpp: "HasPass", header: "Technique.h".}
proc getPass*(this: Technique; `type`: StringHash): ptr Pass {.noSideEffect, 
    importcpp: "GetPass", header: "Technique.h".}
proc getSupportedPass*(this: Technique; `type`: StringHash): ptr Pass {.
    noSideEffect, importcpp: "GetSupportedPass", header: "Technique.h".}
proc getNumPasses*(this: Technique): cuint {.noSideEffect, 
    importcpp: "GetNumPasses", header: "Technique.h".}
proc getPassTypes*(this: Technique): Vector[StringHash] {.noSideEffect, 
    importcpp: "GetPassTypes", header: "Technique.h".}
proc getPasses*(this: Technique): PODVector[ptr Pass] {.noSideEffect, 
    importcpp: "GetPasses", header: "Technique.h".}