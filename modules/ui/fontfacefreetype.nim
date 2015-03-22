

import
  fontFace

discard "forward decl of FreeTypeLibrary"
discard "forward decl of Texture2D"
type
  FontFaceFreeType* {.importcpp: "Urho3D::FontFaceFreeType",
                      header: "FontFaceFreeType.h".} = object of FontFace
    freeType* {.importc: "freeType_".}: SharedPtr[FreeTypeLibrary]
    face* {.importc: "face_".}: pointer
    hasMutableGlyph* {.importc: "hasMutableGlyph_".}: bool
    ascender* {.importc: "ascender_".}: cint
    allocator* {.importc: "allocator_".}: AreaAllocator


proc constructFontFaceFreeType*(font: ptr Font): FontFaceFreeType {.constructor,
    importcpp: "Urho3D::FontFaceFreeType(@)", header: "FontFaceFreeType.h".}
proc destroyFontFaceFreeType*(this: var FontFaceFreeType) {.
    importcpp: "#.~FontFaceFreeType()", header: "FontFaceFreeType.h".}
proc load*(this: var FontFaceFreeType; fontData: ptr cuchar;
           fontDataSize: cuint; pointSize: cint): bool {.importcpp: "Load",
    header: "FontFaceFreeType.h".}
proc getGlyph*(this: var FontFaceFreeType; c: cuint): ptr FontGlyph {.
    importcpp: "GetGlyph", header: "FontFaceFreeType.h".}
proc hasMutableGlyphs*(this: FontFaceFreeType): bool {.noSideEffect,
    importcpp: "HasMutableGlyphs", header: "FontFaceFreeType.h".}
