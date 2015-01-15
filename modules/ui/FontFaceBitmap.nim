

import 
  fontFace

discard "forward decl of Image"
discard "forward decl of Serializer"
type 
  FontFaceBitmap* {.importc: "Urho3D::FontFaceBitmap", 
                    header: "FontFaceBitmap.h".} = object of FontFace
  

proc constructFontFaceBitmap*(font: ptr Font): FontFaceBitmap {.
    importcpp: "Urho3D::FontFaceBitmap(@)", header: "FontFaceBitmap.h".}
proc destroyFontFaceBitmap*(this: var FontFaceBitmap) {.
    importcpp: "#.~FontFaceBitmap()", header: "FontFaceBitmap.h".}
proc load*(this: var FontFaceBitmap; fontData: ptr cuchar; fontDataSize: cuint; 
           pointSize: cint): bool {.importcpp: "Load", 
                                    header: "FontFaceBitmap.h".}
proc load*(this: var FontFaceBitmap; fontFace: ptr FontFace; usedGlyphs: bool): bool {.
    importcpp: "Load", header: "FontFaceBitmap.h".}
proc save*(this: var FontFaceBitmap; dest: var Serializer; pontSize: cint): bool {.
    importcpp: "Save", header: "FontFaceBitmap.h".}