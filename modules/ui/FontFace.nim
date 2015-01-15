

import 
  areaAllocator, arrayPtr, list

discard "forward decl of Font"
discard "forward decl of Image"
discard "forward decl of Texture2D"
type 
  FontGlyph* {.importc: "Urho3D::FontGlyph", header: "FontFace.h".} = object 
    x* {.importc: "x_".}: cshort
    y* {.importc: "y_".}: cshort
    width* {.importc: "width_".}: cshort
    height* {.importc: "height_".}: cshort
    offsetX* {.importc: "offsetX_".}: cshort
    offsetY* {.importc: "offsetY_".}: cshort
    advanceX* {.importc: "advanceX_".}: cshort
    page* {.importc: "page_".}: cuint
    used* {.importc: "used_".}: bool


proc constructFontGlyph*(): FontGlyph {.importcpp: "Urho3D::FontGlyph(@)", 
                                        header: "FontFace.h".}

type 
  FontFace* {.importc: "Urho3D::FontFace", header: "FontFace.h".} = object of RefCounted
    font* {.importc: "font_".}: ptr Font
    glyphMapping* {.importc: "glyphMapping_".}: HashMap[cuint, FontGlyph]
    kerningMapping* {.importc: "kerningMapping_".}: HashMap[cuint, cshort]
    textures* {.importc: "textures_".}: Vector[SharedPtr[Texture2D]]
    pointSize* {.importc: "pointSize_".}: cint
    rowHeight* {.importc: "rowHeight_".}: cint


proc constructFontFace*(font: ptr Font): FontFace {.
    importcpp: "Urho3D::FontFace(@)", header: "FontFace.h".}
proc destroyFontFace*(this: var FontFace) {.importcpp: "#.~FontFace()", 
    header: "FontFace.h".}
proc load*(this: var FontFace; fontData: ptr cuchar; fontDataSize: cuint; 
           pointSize: cint): bool {.importcpp: "Load", header: "FontFace.h".}
proc getGlyph*(this: var FontFace; c: cuint): ptr FontGlyph {.
    importcpp: "GetGlyph", header: "FontFace.h".}
proc hasMutableGlyphs*(this: FontFace): bool {.noSideEffect, 
    importcpp: "HasMutableGlyphs", header: "FontFace.h".}
proc getKerning*(this: FontFace; c: cuint; d: cuint): cshort {.noSideEffect, 
    importcpp: "GetKerning", header: "FontFace.h".}
proc isDataLost*(this: FontFace): bool {.noSideEffect, importcpp: "IsDataLost", 
    header: "FontFace.h".}
proc getPointSize*(this: FontFace): cint {.noSideEffect, 
    importcpp: "GetPointSize", header: "FontFace.h".}
proc getRowHeight*(this: FontFace): cint {.noSideEffect, 
    importcpp: "GetRowHeight", header: "FontFace.h".}
proc getTextures*(this: FontFace): Vector[SharedPtr[Texture2D]] {.noSideEffect, 
    importcpp: "GetTextures", header: "FontFace.h".}