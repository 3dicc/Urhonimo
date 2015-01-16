

import 
  uIElement, font, fontface, vector2, ptrs, urstr, color, vector, stringHash,
  urobject, rect, variant

var DEFAULT_FONT_SIZE* {.importc: "DEFAULT_FONT_SIZE", header: "Text.h".}: cint = 12

type 
  TextEffect* = enum 
    TE_NONE = 0, TE_SHADOW, TE_STROKE
  CharLocation* {.importc: "Urho3D::CharLocation", header: "Text.h".} = object 
    position* {.importc: "position_".}: IntVector2
    size* {.importc: "size_".}: IntVector2
  GlyphLocation* {.importc: "Urho3D::GlyphLocation", header: "Text.h".} = object 
    x* {.importc: "x_".}: cint
    y* {.importc: "y_".}: cint
    glyph* {.importc: "glyph_".}: ptr FontGlyph

proc constructGlyphLocation*(x: cint; y: cint; glyph: ptr FontGlyph): GlyphLocation {.
    importcpp: "Urho3D::GlyphLocation(@)", header: "Text.h".}

type 
  Text* {.importc: "Urho3D::Text", header: "Text.h".} = object of UIElement
    usedInText3D* {.importc: "usedInText3D_".}: bool
    font* {.importc: "font_".}: SharedPtr[Font]
    fontFace* {.importc: "fontFace_".}: WeakPtr[FontFace]
    fontSize* {.importc: "fontSize_".}: cint
    text* {.importc: "text_".}: UrString
    textAlignment* {.importc: "textAlignment_".}: HorizontalAlignment
    rowSpacing* {.importc: "rowSpacing_".}: cfloat
    wordWrap* {.importc: "wordWrap_".}: bool
    charLocationsDirty* {.importc: "charLocationsDirty_".}: bool
    selectionStart* {.importc: "selectionStart_".}: cuint
    selectionLength* {.importc: "selectionLength_".}: cuint
    selectionColor* {.importc: "selectionColor_".}: Color
    hoverColor* {.importc: "hoverColor_".}: Color
    textEffect* {.importc: "textEffect_".}: TextEffect
    effectColor* {.importc: "effectColor_".}: Color
    effectDepthBias* {.importc: "effectDepthBias_".}: cfloat
    rowHeight* {.importc: "rowHeight_".}: cint
    unicodeText* {.importc: "unicodeText_".}: PODVector[cuint]
    printText* {.importc: "printText_".}: PODVector[cuint]
    printToText* {.importc: "printToText_".}: PODVector[cuint]
    rowWidths* {.importc: "rowWidths_".}: PODVector[cint]
    pageGlyphLocations* {.importc: "pageGlyphLocations_".}: Vector[
        PODVector[GlyphLocation]]
    charLocations* {.importc: "charLocations_".}: PODVector[CharLocation]


proc getType*(this: Text): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Text.h".}
proc getBaseType*(this: Text): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Text.h".}
proc getTypeName*(this: Text): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Text.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Text::GetTypeStatic(@)", header: "Text.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Text::GetTypeNameStatic(@)", header: "Text.h".}
proc constructText*(context: ptr Context): Text {.importcpp: "Urho3D::Text(@)", 
    header: "Text.h".}
proc destroyText*(this: var Text) {.importcpp: "#.~Text()", header: "Text.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Text::RegisterObject(@)", header: "Text.h".}
proc applyAttributes*(this: var Text) {.importcpp: "ApplyAttributes", 
                                        header: "Text.h".}
proc getBatches*(this: var Text; batches: var PODVector[UIBatch]; 
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "Text.h".}
proc onResize*(this: var Text) {.importcpp: "OnResize", header: "Text.h".}
proc onIndentSet*(this: var Text) {.importcpp: "OnIndentSet", header: "Text.h".}
proc setFont*(this: var Text; fontName: UrString; size: cint = Default_Font_Size): bool {.
    importcpp: "SetFont", header: "Text.h".}
proc setFont*(this: var Text; font: ptr Font; size: cint = Default_Font_Size): bool {.
    importcpp: "SetFont", header: "Text.h".}
proc setText*(this: var Text; text: UrString) {.importcpp: "SetText", 
    header: "Text.h".}
proc setTextAlignment*(this: var Text; align: HorizontalAlignment) {.
    importcpp: "SetTextAlignment", header: "Text.h".}
proc setRowSpacing*(this: var Text; spacing: cfloat) {.
    importcpp: "SetRowSpacing", header: "Text.h".}
proc setWordwrap*(this: var Text; enable: bool) {.importcpp: "SetWordwrap", 
    header: "Text.h".}
proc setSelection*(this: var Text; start: cuint; length: cuint = cuint(-1)) {.
    importcpp: "SetSelection", header: "Text.h".}
proc clearSelection*(this: var Text) {.importcpp: "ClearSelection", 
                                       header: "Text.h".}
proc setSelectionColor*(this: var Text; color: Color) {.
    importcpp: "SetSelectionColor", header: "Text.h".}
proc setHoverColor*(this: var Text; color: Color) {.importcpp: "SetHoverColor", 
    header: "Text.h".}
proc setTextEffect*(this: var Text; textEffect: TextEffect) {.
    importcpp: "SetTextEffect", header: "Text.h".}
proc setEffectColor*(this: var Text; effectColor: Color) {.
    importcpp: "SetEffectColor", header: "Text.h".}
proc getFont*(this: Text): ptr Font {.noSideEffect, importcpp: "GetFont", 
                                      header: "Text.h".}
proc getFontSize*(this: Text): cint {.noSideEffect, importcpp: "GetFontSize", 
                                      header: "Text.h".}
proc getText*(this: Text): UrString {.noSideEffect, importcpp: "GetText", 
                                      header: "Text.h".}
proc getTextAlignment*(this: Text): HorizontalAlignment {.noSideEffect, 
    importcpp: "GetTextAlignment", header: "Text.h".}
proc getRowSpacing*(this: Text): cfloat {.noSideEffect, 
    importcpp: "GetRowSpacing", header: "Text.h".}
proc getWordwrap*(this: Text): bool {.noSideEffect, importcpp: "GetWordwrap", 
                                      header: "Text.h".}
proc getSelectionStart*(this: Text): cuint {.noSideEffect, 
    importcpp: "GetSelectionStart", header: "Text.h".}
proc getSelectionLength*(this: Text): cuint {.noSideEffect, 
    importcpp: "GetSelectionLength", header: "Text.h".}
proc getSelectionColor*(this: Text): Color {.noSideEffect, 
    importcpp: "GetSelectionColor", header: "Text.h".}
proc getHoverColor*(this: Text): Color {.noSideEffect, 
    importcpp: "GetHoverColor", header: "Text.h".}
proc getTextEffect*(this: Text): TextEffect {.noSideEffect, 
    importcpp: "GetTextEffect", header: "Text.h".}
proc getEffectColor*(this: Text): Color {.noSideEffect, 
    importcpp: "GetEffectColor", header: "Text.h".}
proc getRowHeight*(this: Text): cint {.noSideEffect, importcpp: "GetRowHeight", 
                                       header: "Text.h".}
proc getNumRows*(this: Text): cuint {.noSideEffect, importcpp: "GetNumRows", 
                                      header: "Text.h".}
proc getNumChars*(this: Text): cuint {.noSideEffect, importcpp: "GetNumChars", 
                                       header: "Text.h".}
proc getRowWidth*(this: Text; index: cuint): cint {.noSideEffect, 
    importcpp: "GetRowWidth", header: "Text.h".}
proc getCharPosition*(this: var Text; index: cuint): IntVector2 {.
    importcpp: "GetCharPosition", header: "Text.h".}
proc getCharSize*(this: var Text; index: cuint): IntVector2 {.
    importcpp: "GetCharSize", header: "Text.h".}
proc setUsedInText3D*(this: var Text; usedInText3D: bool) {.
    importcpp: "SetUsedInText3D", header: "Text.h".}
proc setEffectDepthBias*(this: var Text; bias: cfloat) {.
    importcpp: "SetEffectDepthBias", header: "Text.h".}
proc getEffectDepthBias*(this: Text): cfloat {.noSideEffect, 
    importcpp: "GetEffectDepthBias", header: "Text.h".}
proc setFontAttr*(this: var Text; value: ResourceRef) {.
    importcpp: "SetFontAttr", header: "Text.h".}
proc getFontAttr*(this: Text): ResourceRef {.noSideEffect, 
    importcpp: "GetFontAttr", header: "Text.h".}