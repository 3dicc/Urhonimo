

import
  drawable, matrix3x4, text, vertexBuffer, vector, stringHash, urstr, urobject,
  font, material, uielement, color, graphicsdefs, vector2, variant

type
  Text3D* {.importcpp: "Urho3D::Text3D", header: "Text3D.h".} = object of Drawable
    when false:
      text* {.importc: "text_".}: Text
      geometries* {.importc: "geometries_".}: Vector[SharedPtr[Geometry]]
      vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]
      material* {.importc: "material_".}: SharedPtr[Material]
      uiBatches* {.importc: "uiBatches_".}: PODVector[UIBatch]
      uiVertexData* {.importc: "uiVertexData_".}: PODVector[cfloat]
      customWorldTransform* {.importc: "customWorldTransform_".}: Matrix3x4
      faceCameraMode* {.importc: "faceCameraMode_".}: FaceCameraMode
      textDirty* {.importc: "textDirty_".}: bool
      geometryDirty* {.importc: "geometryDirty_".}: bool


proc getType*(this: Text3D): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Text3D.h".}
proc getBaseType*(this: Text3D): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Text3D.h".}
proc getTypeName*(this: Text3D): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Text3D.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Text3D::GetTypeStatic(@)", header: "Text3D.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Text3D::GetTypeNameStatic(@)", header: "Text3D.h".}
proc constructText3D*(context: ptr Context): Text3D {.constructor,
    importcpp: "Urho3D::Text3D(@)", header: "Text3D.h".}
proc destroyText3D*(this: var Text3D) {.importcpp: "#.~Text3D()",
                                        header: "Text3D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Text3D::RegisterObject(@)", header: "Text3D.h".}
proc applyAttributes*(this: var Text3D) {.importcpp: "ApplyAttributes",
    header: "Text3D.h".}
proc updateBatches*(this: var Text3D; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "Text3D.h".}
proc updateGeometry*(this: var Text3D; frame: FrameInfo) {.
    importcpp: "UpdateGeometry", header: "Text3D.h".}
proc getUpdateGeometryType*(this: var Text3D): UpdateGeometryType {.
    importcpp: "GetUpdateGeometryType", header: "Text3D.h".}
proc setFont*(this: var Text3D; fontName: UrString;
              size: cint = Default_Font_Size): bool {.importcpp: "SetFont",
    header: "Text3D.h", discardable.}
proc setFont*(this: var Text3D; font: ptr Font; size: cint = Default_Font_Size): bool {.
    importcpp: "SetFont", header: "Text3D.h", discardable.}
proc setMaterial*(this: var Text3D; material: ptr Material) {.
    importcpp: "SetMaterial", header: "Text3D.h".}
proc setText*(this: var Text3D; text: UrString) {.importcpp: "SetText",
    header: "Text3D.h".}
proc setAlignment*(this: var Text3D; hAlign: HorizontalAlignment;
                   vAlign: VerticalAlignment) {.importcpp: "SetAlignment",
    header: "Text3D.h".}
proc setHorizontalAlignment*(this: var Text3D; align: HorizontalAlignment) {.
    importcpp: "SetHorizontalAlignment", header: "Text3D.h".}
proc setVerticalAlignment*(this: var Text3D; align: VerticalAlignment) {.
    importcpp: "SetVerticalAlignment", header: "Text3D.h".}
proc setTextAlignment*(this: var Text3D; align: HorizontalAlignment) {.
    importcpp: "SetTextAlignment", header: "Text3D.h".}
proc setRowSpacing*(this: var Text3D; spacing: cfloat) {.
    importcpp: "SetRowSpacing", header: "Text3D.h".}
proc setWordwrap*(this: var Text3D; enable: bool) {.importcpp: "SetWordwrap",
    header: "Text3D.h".}
proc setTextEffect*(this: var Text3D; textEffect: TextEffect) {.
    importcpp: "SetTextEffect", header: "Text3D.h".}
proc setEffectColor*(this: var Text3D; effectColor: Color) {.
    importcpp: "SetEffectColor", header: "Text3D.h".}
proc setEffectDepthBias*(this: var Text3D; bias: cfloat) {.
    importcpp: "SetEffectDepthBias", header: "Text3D.h".}
proc setWidth*(this: var Text3D; width: cint) {.importcpp: "SetWidth",
    header: "Text3D.h".}
proc setColor*(this: var Text3D; color: Color) {.importcpp: "SetColor",
    header: "Text3D.h".}
proc setColor*(this: var Text3D; corner: Corner; color: Color) {.
    importcpp: "SetColor", header: "Text3D.h".}
proc setOpacity*(this: var Text3D; opacity: cfloat) {.importcpp: "SetOpacity",
    header: "Text3D.h".}
proc setFaceCameraMode*(this: var Text3D; mode: FaceCameraMode) {.
    importcpp: "SetFaceCameraMode", header: "Text3D.h".}
proc getFont*(this: Text3D): ptr Font {.noSideEffect, importcpp: "GetFont",
                                        header: "Text3D.h".}
proc getMaterial*(this: Text3D): ptr Material {.noSideEffect,
    importcpp: "GetMaterial", header: "Text3D.h".}
proc getFontSize*(this: Text3D): cint {.noSideEffect, importcpp: "GetFontSize",
                                        header: "Text3D.h".}
proc getText*(this: Text3D): UrString {.noSideEffect, importcpp: "GetText",
                                        header: "Text3D.h".}
proc getTextAlignment*(this: Text3D): HorizontalAlignment {.noSideEffect,
    importcpp: "GetTextAlignment", header: "Text3D.h".}
proc getHorizontalAlignment*(this: Text3D): HorizontalAlignment {.noSideEffect,
    importcpp: "GetHorizontalAlignment", header: "Text3D.h".}
proc getVerticalAlignment*(this: Text3D): VerticalAlignment {.noSideEffect,
    importcpp: "GetVerticalAlignment", header: "Text3D.h".}
proc getRowSpacing*(this: Text3D): cfloat {.noSideEffect,
    importcpp: "GetRowSpacing", header: "Text3D.h".}
proc getWordwrap*(this: Text3D): bool {.noSideEffect, importcpp: "GetWordwrap",
                                        header: "Text3D.h".}
proc getTextEffect*(this: Text3D): TextEffect {.noSideEffect,
    importcpp: "GetTextEffect", header: "Text3D.h".}
proc getEffectColor*(this: Text3D): Color {.noSideEffect,
    importcpp: "GetEffectColor", header: "Text3D.h".}
proc getEffectDepthBias*(this: Text3D): cfloat {.noSideEffect,
    importcpp: "GetEffectDepthBias", header: "Text3D.h".}
proc getWidth*(this: Text3D): cint {.noSideEffect, importcpp: "GetWidth",
                                     header: "Text3D.h".}
proc getRowHeight*(this: Text3D): cint {.noSideEffect,
    importcpp: "GetRowHeight", header: "Text3D.h".}
proc getNumRows*(this: Text3D): cuint {.noSideEffect, importcpp: "GetNumRows",
                                        header: "Text3D.h".}
proc getNumChars*(this: Text3D): cuint {.noSideEffect, importcpp: "GetNumChars",
    header: "Text3D.h".}
proc getRowWidth*(this: Text3D; index: cuint): cint {.noSideEffect,
    importcpp: "GetRowWidth", header: "Text3D.h".}
proc getCharPosition*(this: var Text3D; index: cuint): IntVector2 {.
    importcpp: "GetCharPosition", header: "Text3D.h".}
proc getCharSize*(this: var Text3D; index: cuint): IntVector2 {.
    importcpp: "GetCharSize", header: "Text3D.h".}
proc getColor*(this: Text3D; corner: Corner): Color {.noSideEffect,
    importcpp: "GetColor", header: "Text3D.h".}
proc getOpacity*(this: Text3D): cfloat {.noSideEffect, importcpp: "GetOpacity",
    header: "Text3D.h".}
proc getFaceCameraMode*(this: Text3D): FaceCameraMode {.noSideEffect,
    importcpp: "GetFaceCameraMode", header: "Text3D.h".}
proc setFontAttr*(this: var Text3D; value: ResourceRef) {.
    importcpp: "SetFontAttr", header: "Text3D.h".}
proc getFontAttr*(this: Text3D): ResourceRef {.noSideEffect,
    importcpp: "GetFontAttr", header: "Text3D.h".}
proc setMaterialAttr*(this: var Text3D; value: ResourceRef) {.
    importcpp: "SetMaterialAttr", header: "Text3D.h".}
proc getMaterialAttr*(this: Text3D): ResourceRef {.noSideEffect,
    importcpp: "GetMaterialAttr", header: "Text3D.h".}
proc getColorAttr*(this: Text3D): Color {.noSideEffect,
    importcpp: "GetColorAttr", header: "Text3D.h".}
