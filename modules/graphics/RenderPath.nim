

import 
  color, graphicsDefs, `ptr`, refCounted, vector4

discard "forward decl of XMLElement"
discard "forward decl of XMLFile"
type 
  RenderCommandType* {.importcpp: "Urho3D::RenderCommandType".} = enum 
    CMD_NONE = 0, CMD_CLEAR, CMD_SCENEPASS, CMD_QUAD, CMD_FORWARDLIGHTS, 
    CMD_LIGHTVOLUMES



type 
  RenderCommandSortMode* {.importcpp: "Urho3D::RenderCommandSortMode".} = enum 
    SORT_FRONTTOBACK = 0, SORT_BACKTOFRONT



type 
  RenderTargetSizeMode* {.importcpp: "Urho3D::RenderTargetSizeMode".} = enum 
    SIZE_ABSOLUTE = 0, SIZE_VIEWPORTDIVISOR, SIZE_VIEWPORTMULTIPLIER



type 
  RenderTargetInfo* {.importc: "Urho3D::RenderTargetInfo", 
                      header: "RenderPath.h".} = object 
    name* {.importc: "name_".}: UrString
    tag* {.importc: "tag_".}: UrString
    format* {.importc: "format_".}: cuint
    size* {.importc: "size_".}: Vector2
    sizeMode* {.importc: "sizeMode_".}: RenderTargetSizeMode
    enabled* {.importc: "enabled_".}: bool
    filtered* {.importc: "filtered_".}: bool
    sRGB* {.importc: "sRGB_".}: bool
    persistent* {.importc: "persistent_".}: bool


proc constructRenderTargetInfo*(): RenderTargetInfo {.
    importcpp: "Urho3D::RenderTargetInfo(@)", header: "RenderPath.h".}
proc load*(this: var RenderTargetInfo; element: XMLElement) {.importcpp: "Load", 
    header: "RenderPath.h".}

type 
  RenderPathCommand* {.importc: "Urho3D::RenderPathCommand", 
                       header: "RenderPath.h".} = object 
    tag* {.importc: "tag_".}: UrString
    `type`* {.importc: "type_".}: RenderCommandType
    sortMode* {.importc: "sortMode_".}: RenderCommandSortMode
    pass* {.importc: "pass_".}: UrString
    metadata* {.importc: "metadata_".}: UrString
    vertexShaderName* {.importc: "vertexShaderName_".}: UrString
    pixelShaderName* {.importc: "pixelShaderName_".}: UrString
    vertexShaderDefines* {.importc: "vertexShaderDefines_".}: UrString
    pixelShaderDefines* {.importc: "pixelShaderDefines_".}: UrString
    textureNames* {.importc: "textureNames_".}: array[max_Texture_Units, 
        UrString]
    shaderParameters* {.importc: "shaderParameters_".}: HashMap[StringHash, 
        Variant]
    outputNames* {.importc: "outputNames_".}: Vector[UrString]
    clearFlags* {.importc: "clearFlags_".}: cuint
    clearColor* {.importc: "clearColor_".}: Color
    clearDepth* {.importc: "clearDepth_".}: cfloat
    clearStencil* {.importc: "clearStencil_".}: cuint
    enabled* {.importc: "enabled_".}: bool
    useFogColor* {.importc: "useFogColor_".}: bool
    markToStencil* {.importc: "markToStencil_".}: bool
    useLitBase* {.importc: "useLitBase_".}: bool
    vertexLights* {.importc: "vertexLights_".}: bool


proc constructRenderPathCommand*(): RenderPathCommand {.
    importcpp: "Urho3D::RenderPathCommand(@)", header: "RenderPath.h".}
proc load*(this: var RenderPathCommand; element: XMLElement) {.
    importcpp: "Load", header: "RenderPath.h".}
proc setTextureName*(this: var RenderPathCommand; unit: TextureUnit; 
                     name: UrString) {.importcpp: "SetTextureName", 
                                       header: "RenderPath.h".}
proc setShaderParameter*(this: var RenderPathCommand; name: UrString; 
                         value: Variant) {.importcpp: "SetShaderParameter", 
    header: "RenderPath.h".}
proc removeShaderParameter*(this: var RenderPathCommand; name: UrString) {.
    importcpp: "RemoveShaderParameter", header: "RenderPath.h".}
proc setNumOutputs*(this: var RenderPathCommand; num: cuint) {.
    importcpp: "SetNumOutputs", header: "RenderPath.h".}
proc setOutputName*(this: var RenderPathCommand; index: cuint; name: UrString) {.
    importcpp: "SetOutputName", header: "RenderPath.h".}
proc getTextureName*(this: RenderPathCommand; unit: TextureUnit): UrString {.
    noSideEffect, importcpp: "GetTextureName", header: "RenderPath.h".}
proc getShaderParameter*(this: RenderPathCommand; name: UrString): Variant {.
    noSideEffect, importcpp: "GetShaderParameter", header: "RenderPath.h".}
proc getNumOutputs*(this: RenderPathCommand): cuint {.noSideEffect, 
    importcpp: "GetNumOutputs", header: "RenderPath.h".}
proc getOutputName*(this: RenderPathCommand; index: cuint): UrString {.
    noSideEffect, importcpp: "GetOutputName", header: "RenderPath.h".}

type 
  RenderPath* {.importc: "Urho3D::RenderPath", header: "RenderPath.h".} = object of RefCounted
    renderTargets* {.importc: "renderTargets_".}: Vector[RenderTargetInfo]
    commands* {.importc: "commands_".}: Vector[RenderPathCommand]


proc constructRenderPath*(): RenderPath {.importcpp: "Urho3D::RenderPath(@)", 
    header: "RenderPath.h".}
proc destroyRenderPath*(this: var RenderPath) {.importcpp: "#.~RenderPath()", 
    header: "RenderPath.h".}
proc clone*(this: var RenderPath): SharedPtr[RenderPath] {.importcpp: "Clone", 
    header: "RenderPath.h".}
proc load*(this: var RenderPath; file: ptr XMLFile): bool {.importcpp: "Load", 
    header: "RenderPath.h".}
proc append*(this: var RenderPath; file: ptr XMLFile): bool {.
    importcpp: "Append", header: "RenderPath.h".}
proc setEnabled*(this: var RenderPath; tag: UrString; active: bool) {.
    importcpp: "SetEnabled", header: "RenderPath.h".}
proc toggleEnabled*(this: var RenderPath; tag: UrString) {.
    importcpp: "ToggleEnabled", header: "RenderPath.h".}
proc setRenderTarget*(this: var RenderPath; index: cuint; info: RenderTargetInfo) {.
    importcpp: "SetRenderTarget", header: "RenderPath.h".}
proc addRenderTarget*(this: var RenderPath; info: RenderTargetInfo) {.
    importcpp: "AddRenderTarget", header: "RenderPath.h".}
proc removeRenderTarget*(this: var RenderPath; index: cuint) {.
    importcpp: "RemoveRenderTarget", header: "RenderPath.h".}
proc removeRenderTarget*(this: var RenderPath; name: UrString) {.
    importcpp: "RemoveRenderTarget", header: "RenderPath.h".}
proc removeRenderTargets*(this: var RenderPath; tag: UrString) {.
    importcpp: "RemoveRenderTargets", header: "RenderPath.h".}
proc setCommand*(this: var RenderPath; index: cuint; command: RenderPathCommand) {.
    importcpp: "SetCommand", header: "RenderPath.h".}
proc addCommand*(this: var RenderPath; command: RenderPathCommand) {.
    importcpp: "AddCommand", header: "RenderPath.h".}
proc insertCommand*(this: var RenderPath; index: cuint; 
                    command: RenderPathCommand) {.importcpp: "InsertCommand", 
    header: "RenderPath.h".}
proc removeCommand*(this: var RenderPath; index: cuint) {.
    importcpp: "RemoveCommand", header: "RenderPath.h".}
proc removeCommands*(this: var RenderPath; tag: UrString) {.
    importcpp: "RemoveCommands", header: "RenderPath.h".}
proc setShaderParameter*(this: var RenderPath; name: UrString; value: Variant) {.
    importcpp: "SetShaderParameter", header: "RenderPath.h".}
proc getNumRenderTargets*(this: RenderPath): cuint {.noSideEffect, 
    importcpp: "GetNumRenderTargets", header: "RenderPath.h".}
proc getNumCommands*(this: RenderPath): cuint {.noSideEffect, 
    importcpp: "GetNumCommands", header: "RenderPath.h".}
proc getShaderParameter*(this: RenderPath; name: UrString): Variant {.
    noSideEffect, importcpp: "GetShaderParameter", header: "RenderPath.h".}