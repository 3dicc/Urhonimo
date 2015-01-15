

import 
  arrayPtr, resource

discard "forward decl of FontFace"
var FONT_TEXTURE_MIN_SIZE* {.importc: "FONT_TEXTURE_MIN_SIZE", header: "Font.h".}: cint = 128

var FONT_DPI* {.importc: "FONT_DPI", header: "Font.h".}: cint = 96


type 
  Font_Type* = enum 
    FONT_NONE = 0, FONT_FREETYPE, FONT_BITMAP, MAX_FONT_TYPES



type 
  Font* {.importc: "Urho3D::Font", header: "Font.h".} = object of Resource
    faces* {.importc: "faces_".}: HashMap[cint, SharedPtr[FontFace]]
    fontData* {.importc: "fontData_".}: SharedArrayPtr[cuchar]
    fontDataSize* {.importc: "fontDataSize_".}: cuint
    absoluteOffset* {.importc: "absoluteOffset_".}: IntVector2
    scaledOffset* {.importc: "scaledOffset_".}: Vector2
    fontType* {.importc: "fontType_".}: Font_Type
    sdfFont* {.importc: "sdfFont_".}: bool


proc getType*(this: Font): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Font.h".}
proc getBaseType*(this: Font): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Font.h".}
proc getTypeName*(this: Font): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Font.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Font::GetTypeStatic(@)", header: "Font.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Font::GetTypeNameStatic(@)", header: "Font.h".}
proc constructFont*(context: ptr Context): Font {.importcpp: "Urho3D::Font(@)", 
    header: "Font.h".}
proc destroyFont*(this: var Font) {.importcpp: "#.~Font()", header: "Font.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Font::RegisterObject(@)", header: "Font.h".}
proc beginLoad*(this: var Font; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Font.h".}
proc saveXML*(this: var Font; dest: var Serializer; pointSize: cint; 
              usedGlyphs: bool = false): bool {.importcpp: "SaveXML", 
    header: "Font.h".}
proc setAbsoluteGlyphOffset*(this: var Font; offset: IntVector2) {.
    importcpp: "SetAbsoluteGlyphOffset", header: "Font.h".}
proc setScaledGlyphOffset*(this: var Font; offset: Vector2) {.
    importcpp: "SetScaledGlyphOffset", header: "Font.h".}
proc getFace*(this: var Font; pointSize: cint): ptr FontFace {.
    importcpp: "GetFace", header: "Font.h".}
proc isSDFFont*(this: Font): bool {.noSideEffect, importcpp: "IsSDFFont", 
                                    header: "Font.h".}
proc getAbsoluteGlyphOffset*(this: Font): IntVector2 {.noSideEffect, 
    importcpp: "GetAbsoluteGlyphOffset", header: "Font.h".}
proc getScaledGlyphOffset*(this: Font): Vector2 {.noSideEffect, 
    importcpp: "GetScaledGlyphOffset", header: "Font.h".}
proc getTotalGlyphOffset*(this: Font; pointSize: cint): IntVector2 {.
    noSideEffect, importcpp: "GetTotalGlyphOffset", header: "Font.h".}
proc releaseFaces*(this: var Font) {.importcpp: "ReleaseFaces", header: "Font.h".}