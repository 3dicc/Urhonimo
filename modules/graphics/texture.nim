

import
  color, gPUObject, graphicsDefs, resource, ptrs, urobject, xmlelement

const MAX_TEXTURE_QUALITY_LEVELS* = 3

discard "forward decl of XMLElement"
discard "forward decl of XMLFile"
type
  Texture* {.importcpp: "Urho3D::Texture", header: "Texture.h".} = object of Resource
    format* {.importc: "format_".}: cuint
    pool* {.importc: "pool_".}: cuint
    usage* {.importc: "usage_".}: cuint
    levels* {.importc: "levels_".}: cuint
    requestedLevels* {.importc: "requestedLevels_".}: cuint
    width* {.importc: "width_".}: cint
    height* {.importc: "height_".}: cint
    depth* {.importc: "depth_".}: cint
    filterMode* {.importc: "filterMode_".}: TextureFilterMode
    addressMode* {.importc: "addressMode_".}: array[Max_Coords,
        TextureAddressMode]
    mipsToSkip* {.importc: "mipsToSkip_".}: array[Max_Texture_Quality_Levels,
        cuint]
    borderColor* {.importc: "borderColor_".}: Color
    sRGB* {.importc: "sRGB_".}: bool
    backupTexture* {.importc: "backupTexture_".}: SharedPtr[Texture]


proc constructTexture*(context: ptr Context): Texture {.constructor,
    importcpp: "Urho3D::Texture(@)", header: "Texture.h".}
proc destroyTexture*(this: var Texture) {.importcpp: "#.~Texture()",
    header: "Texture.h".}
proc setNumLevels*(this: var Texture; levels: cuint) {.
    importcpp: "SetNumLevels", header: "Texture.h".}
proc setFilterMode*(this: var Texture; filter: TextureFilterMode) {.
    importcpp: "SetFilterMode", header: "Texture.h".}
proc setAddressMode*(this: var Texture; coord: TextureCoordinate;
                     address: TextureAddressMode) {.importcpp: "SetAddressMode",
    header: "Texture.h".}
proc setBorderColor*(this: var Texture; color: Color) {.
    importcpp: "SetBorderColor", header: "Texture.h".}
proc setSRGB*(this: var Texture; enable: bool) {.importcpp: "SetSRGB",
    header: "Texture.h".}
proc setBackupTexture*(this: var Texture; texture: ptr Texture) {.
    importcpp: "SetBackupTexture", header: "Texture.h".}
proc setMipsToSkip*(this: var Texture; quality: cint; mips: cint) {.
    importcpp: "SetMipsToSkip", header: "Texture.h".}
proc getFormat*(this: Texture): cuint {.noSideEffect, importcpp: "GetFormat",
                                        header: "Texture.h".}
proc isCompressed*(this: Texture): bool {.noSideEffect,
    importcpp: "IsCompressed", header: "Texture.h".}
proc getLevels*(this: Texture): cuint {.noSideEffect, importcpp: "GetLevels",
                                        header: "Texture.h".}
proc getWidth*(this: Texture): cint {.noSideEffect, importcpp: "GetWidth",
                                      header: "Texture.h".}
proc getHeight*(this: Texture): cint {.noSideEffect, importcpp: "GetHeight",
                                       header: "Texture.h".}
proc getDepth*(this: Texture): cint {.noSideEffect, importcpp: "GetDepth",
                                      header: "Texture.h".}
proc getFilterMode*(this: Texture): TextureFilterMode {.noSideEffect,
    importcpp: "GetFilterMode", header: "Texture.h".}
proc getAddressMode*(this: Texture; coord: TextureCoordinate): TextureAddressMode {.
    noSideEffect, importcpp: "GetAddressMode", header: "Texture.h".}
proc getBorderColor*(this: Texture): Color {.noSideEffect,
    importcpp: "GetBorderColor", header: "Texture.h".}
proc getSRGB*(this: Texture): bool {.noSideEffect, importcpp: "GetSRGB",
                                     header: "Texture.h".}
proc getBackupTexture*(this: Texture): ptr Texture {.noSideEffect,
    importcpp: "GetBackupTexture", header: "Texture.h".}
proc getMipsToSkip*(this: Texture; quality: cint): cint {.noSideEffect,
    importcpp: "GetMipsToSkip", header: "Texture.h".}
proc getLevelWidth*(this: Texture; level: cuint): cint {.noSideEffect,
    importcpp: "GetLevelWidth", header: "Texture.h".}
proc getLevelHeight*(this: Texture; level: cuint): cint {.noSideEffect,
    importcpp: "GetLevelHeight", header: "Texture.h".}
proc getLevelDepth*(this: Texture; level: cuint): cint {.noSideEffect,
    importcpp: "GetLevelDepth", header: "Texture.h".}
proc getUsage*(this: Texture): TextureUsage {.noSideEffect,
    importcpp: "GetUsage", header: "Texture.h".}
proc getDataSize*(this: Texture; width: cint; height: cint): cuint {.
    noSideEffect, importcpp: "GetDataSize", header: "Texture.h".}
proc getDataSize*(this: Texture; width: cint; height: cint; depth: cint): cuint {.
    noSideEffect, importcpp: "GetDataSize", header: "Texture.h".}
proc getRowDataSize*(this: Texture; width: cint): cuint {.noSideEffect,
    importcpp: "GetRowDataSize", header: "Texture.h".}
proc setParameters*(this: var Texture; xml: ptr XMLFile) {.
    importcpp: "SetParameters", header: "Texture.h".}
proc setParameters*(this: var Texture; element: XMLElement) {.
    importcpp: "SetParameters", header: "Texture.h".}
