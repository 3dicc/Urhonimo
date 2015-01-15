

import 
  graphicsDefs, uIElement

discard "forward decl of Texture"
discard "forward decl of Texture2D"
type 
  BorderImage* {.importc: "Urho3D::BorderImage", header: "BorderImage.h".} = object of UIElement
    texture* {.importc: "texture_".}: SharedPtr[Texture]
    imageRect* {.importc: "imageRect_".}: IntRect
    border* {.importc: "border_".}: IntRect
    imageBorder* {.importc: "imageBorder_".}: IntRect
    hoverOffset* {.importc: "hoverOffset_".}: IntVector2
    blendMode* {.importc: "blendMode_".}: BlendMode
    tiled* {.importc: "tiled_".}: bool


proc getType*(this: BorderImage): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "BorderImage.h".}
proc getBaseType*(this: BorderImage): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "BorderImage.h".}
proc getTypeName*(this: BorderImage): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "BorderImage.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::BorderImage::GetTypeStatic(@)", header: "BorderImage.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::BorderImage::GetTypeNameStatic(@)", 
    header: "BorderImage.h".}
proc constructBorderImage*(context: ptr Context): BorderImage {.
    importcpp: "Urho3D::BorderImage(@)", header: "BorderImage.h".}
proc destroyBorderImage*(this: var BorderImage) {.importcpp: "#.~BorderImage()", 
    header: "BorderImage.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::BorderImage::RegisterObject(@)", header: "BorderImage.h".}
proc getBatches*(this: var BorderImage; batches: var PODVector[UIBatch]; 
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "BorderImage.h".}
proc setTexture*(this: var BorderImage; texture: ptr Texture) {.
    importcpp: "SetTexture", header: "BorderImage.h".}
proc setImageRect*(this: var BorderImage; rect: IntRect) {.
    importcpp: "SetImageRect", header: "BorderImage.h".}
proc setFullImageRect*(this: var BorderImage) {.importcpp: "SetFullImageRect", 
    header: "BorderImage.h".}
proc setBorder*(this: var BorderImage; rect: IntRect) {.importcpp: "SetBorder", 
    header: "BorderImage.h".}
proc setImageBorder*(this: var BorderImage; rect: IntRect) {.
    importcpp: "SetImageBorder", header: "BorderImage.h".}
proc setHoverOffset*(this: var BorderImage; offset: IntVector2) {.
    importcpp: "SetHoverOffset", header: "BorderImage.h".}
proc setHoverOffset*(this: var BorderImage; x: cint; y: cint) {.
    importcpp: "SetHoverOffset", header: "BorderImage.h".}
proc setBlendMode*(this: var BorderImage; mode: BlendMode) {.
    importcpp: "SetBlendMode", header: "BorderImage.h".}
proc setTiled*(this: var BorderImage; enable: bool) {.importcpp: "SetTiled", 
    header: "BorderImage.h".}
proc getTexture*(this: BorderImage): ptr Texture {.noSideEffect, 
    importcpp: "GetTexture", header: "BorderImage.h".}
proc getImageRect*(this: BorderImage): IntRect {.noSideEffect, 
    importcpp: "GetImageRect", header: "BorderImage.h".}
proc getBorder*(this: BorderImage): IntRect {.noSideEffect, 
    importcpp: "GetBorder", header: "BorderImage.h".}
proc getImageBorder*(this: BorderImage): IntRect {.noSideEffect, 
    importcpp: "GetImageBorder", header: "BorderImage.h".}
proc getHoverOffset*(this: BorderImage): IntVector2 {.noSideEffect, 
    importcpp: "GetHoverOffset", header: "BorderImage.h".}
proc getBlendMode*(this: BorderImage): BlendMode {.noSideEffect, 
    importcpp: "GetBlendMode", header: "BorderImage.h".}
proc isTiled*(this: BorderImage): bool {.noSideEffect, importcpp: "IsTiled", 
    header: "BorderImage.h".}
proc setTextureAttr*(this: var BorderImage; value: ResourceRef) {.
    importcpp: "SetTextureAttr", header: "BorderImage.h".}
proc getTextureAttr*(this: BorderImage): ResourceRef {.noSideEffect, 
    importcpp: "GetTextureAttr", header: "BorderImage.h".}