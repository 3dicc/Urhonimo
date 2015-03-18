

import
  vector2, ptrs, texture, rect, matrix4, uIElement, graphicsdefs, stringHash,
  urstr, urobject, vector, variant


type
  Sprite* {.importcpp: "Urho3D::Sprite", header: "Sprite.h".} = object of UIElement
    floatPosition* {.importc: "floatPosition_".}: Vector2
    hotSpot* {.importc: "hotSpot_".}: IntVector2
    scale* {.importc: "scale_".}: Vector2
    rotation* {.importc: "rotation_".}: cfloat
    texture* {.importc: "texture_".}: SharedPtr[Texture]
    imageRect* {.importc: "imageRect_".}: IntRect
    blendMode* {.importc: "blendMode_".}: BlendMode
    transform* {.importc: "transform_".}: Matrix3x4


proc getType*(this: Sprite): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Sprite.h".}
proc getBaseType*(this: Sprite): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Sprite.h".}
proc getTypeName*(this: Sprite): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Sprite.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Sprite::GetTypeStatic(@)", header: "Sprite.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Sprite::GetTypeNameStatic(@)", header: "Sprite.h".}
proc constructSprite*(context: ptr Context): Sprite {.constructor,
    importcpp: "Urho3D::Sprite(@)", header: "Sprite.h".}
proc destroySprite*(this: var Sprite) {.importcpp: "#.~Sprite()",
                                        header: "Sprite.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Sprite::RegisterObject(@)", header: "Sprite.h".}
proc isWithinScissor*(this: var Sprite; currentScissor: IntRect): bool {.
    importcpp: "IsWithinScissor", header: "Sprite.h".}
proc getScreenPosition*(this: Sprite): IntVector2 {.noSideEffect,
    importcpp: "GetScreenPosition", header: "Sprite.h".}
proc getBatches*(this: var Sprite; batches: var PODVector[UIBatch];
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "Sprite.h".}
proc onPositionSet*(this: var Sprite) {.importcpp: "OnPositionSet",
                                        header: "Sprite.h".}
proc setPosition*(this: var Sprite; position: Vector2) {.
    importcpp: "SetPosition", header: "Sprite.h".}
proc setPosition*(this: var Sprite; x: cfloat; y: cfloat) {.
    importcpp: "SetPosition", header: "Sprite.h".}
proc setHotSpot*(this: var Sprite; hotSpot: IntVector2) {.
    importcpp: "SetHotSpot", header: "Sprite.h".}
proc setHotSpot*(this: var Sprite; x: cint; y: cint) {.importcpp: "SetHotSpot",
    header: "Sprite.h".}
proc setScale*(this: var Sprite; scale: Vector2) {.importcpp: "SetScale",
    header: "Sprite.h".}
proc setScale*(this: var Sprite; x: cfloat; y: cfloat) {.importcpp: "SetScale",
    header: "Sprite.h".}
proc setScale*(this: var Sprite; scale: cfloat) {.importcpp: "SetScale",
    header: "Sprite.h".}
proc setRotation*(this: var Sprite; angle: cfloat) {.importcpp: "SetRotation",
    header: "Sprite.h".}
proc setTexture*(this: var Sprite; texture: ptr Texture) {.
    importcpp: "SetTexture", header: "Sprite.h".}
proc setImageRect*(this: var Sprite; rect: IntRect) {.importcpp: "SetImageRect",
    header: "Sprite.h".}
proc setFullImageRect*(this: var Sprite) {.importcpp: "SetFullImageRect",
    header: "Sprite.h".}
proc setBlendMode*(this: var Sprite; mode: BlendMode) {.
    importcpp: "SetBlendMode", header: "Sprite.h".}
proc getPosition*(this: Sprite): Vector2 {.noSideEffect,
    importcpp: "GetPosition", header: "Sprite.h".}
proc getHotSpot*(this: Sprite): IntVector2 {.noSideEffect,
    importcpp: "GetHotSpot", header: "Sprite.h".}
proc getScale*(this: Sprite): Vector2 {.noSideEffect, importcpp: "GetScale",
                                        header: "Sprite.h".}
proc getRotation*(this: Sprite): cfloat {.noSideEffect,
    importcpp: "GetRotation", header: "Sprite.h".}
proc getTexture*(this: Sprite): ptr Texture {.noSideEffect,
    importcpp: "GetTexture", header: "Sprite.h".}
proc getImageRect*(this: Sprite): IntRect {.noSideEffect,
    importcpp: "GetImageRect", header: "Sprite.h".}
proc getBlendMode*(this: Sprite): BlendMode {.noSideEffect,
    importcpp: "GetBlendMode", header: "Sprite.h".}
proc setTextureAttr*(this: var Sprite; value: ResourceRef) {.
    importcpp: "SetTextureAttr", header: "Sprite.h".}
proc getTextureAttr*(this: Sprite): ResourceRef {.noSideEffect,
    importcpp: "GetTextureAttr", header: "Sprite.h".}
proc getTransform*(this: Sprite): Matrix3x4 {.noSideEffect,
    importcpp: "GetTransform", header: "Sprite.h".}
