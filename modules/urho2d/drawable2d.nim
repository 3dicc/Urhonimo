

import
  drawable, material, sprite2D, ptrs, graphicsdefs, vector, materialcache2d,
  drawableproxy2d, stringHash, urstr, urobject, texture2d, variant

discard "forward decl of DrawableProxy2D"
discard "forward decl of MaterialCache2D"
discard "forward decl of VertexBuffer"
var PIXEL_SIZE* {.importcpp: "Urho3D::PIXEL_SIZE", header: "Drawable2D.h".}: cfloat


type
  Drawable2D* {.importcpp: "Urho3D::Drawable2D", header: "Drawable2D.h".} = object of Drawable
    layer* {.importc: "layer_".}: cint
    orderInLayer* {.importc: "orderInLayer_".}: cint
    sprite* {.importc: "sprite_".}: SharedPtr[Sprite2D]
    material* {.importc: "material_".}: SharedPtr[Material]
    blendMode* {.importc: "blendMode_".}: BlendMode
    vertices* {.importc: "vertices_".}: Vector[Vertex2D]
    verticesDirty* {.importc: "verticesDirty_".}: bool
    materialUpdatePending* {.importc: "materialUpdatePending_".}: bool
    defaultMaterial* {.importc: "defaultMaterial_".}: SharedPtr[Material]
    materialCache* {.importc: "materialCache_".}: WeakPtr[MaterialCache2D]
    drawableProxy* {.importc: "drawableProxy_".}: WeakPtr[DrawableProxy2D]
    visibility* {.importc: "visibility_".}: bool


proc getType*(this: Drawable2D): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Drawable2D.h".}
proc getBaseType*(this: Drawable2D): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Drawable2D.h".}
proc getTypeName*(this: Drawable2D): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Drawable2D.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Drawable2D::GetTypeStatic(@)", header: "Drawable2D.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Drawable2D::GetTypeNameStatic(@)",
    header: "Drawable2D.h".}
proc constructDrawable2D*(context: ptr Context): Drawable2D {.
    importcpp: "Urho3D::Drawable2D(@)", header: "Drawable2D.h".}
proc destroyDrawable2D*(this: var Drawable2D) {.importcpp: "#.~Drawable2D()",
    header: "Drawable2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Drawable2D::RegisterObject(@)", header: "Drawable2D.h".}
proc applyAttributes*(this: var Drawable2D) {.importcpp: "ApplyAttributes",
    header: "Drawable2D.h".}
proc onSetEnabled*(this: var Drawable2D) {.importcpp: "OnSetEnabled",
    header: "Drawable2D.h".}
proc setLayer*(this: var Drawable2D; layer: cint) {.importcpp: "SetLayer",
    header: "Drawable2D.h".}
proc setOrderInLayer*(this: var Drawable2D; orderInLayer: cint) {.
    importcpp: "SetOrderInLayer", header: "Drawable2D.h".}
proc setSprite*(this: var Drawable2D; sprite: ptr Sprite2D) {.
    importcpp: "SetSprite", header: "Drawable2D.h".}
proc setBlendMode*(this: var Drawable2D; mode: BlendMode) {.
    importcpp: "SetBlendMode", header: "Drawable2D.h".}
proc setMaterial*(this: var Drawable2D; material: ptr Material) {.
    importcpp: "SetMaterial", header: "Drawable2D.h".}
proc getLayer*(this: Drawable2D): cint {.noSideEffect, importcpp: "GetLayer",
    header: "Drawable2D.h".}
proc getOrderInLayer*(this: Drawable2D): cint {.noSideEffect,
    importcpp: "GetOrderInLayer", header: "Drawable2D.h".}
proc getSprite*(this: Drawable2D): ptr Sprite2D {.noSideEffect,
    importcpp: "GetSprite", header: "Drawable2D.h".}
proc getTexture*(this: Drawable2D): ptr Texture2D {.noSideEffect,
    importcpp: "GetTexture", header: "Drawable2D.h".}
proc getBlendMode*(this: Drawable2D): BlendMode {.noSideEffect,
    importcpp: "GetBlendMode", header: "Drawable2D.h".}
proc getMaterial*(this: Drawable2D): ptr Material {.noSideEffect,
    importcpp: "GetMaterial", header: "Drawable2D.h".}
proc getUsedMaterial*(this: Drawable2D): ptr Material {.noSideEffect,
    importcpp: "GetUsedMaterial", header: "Drawable2D.h".}
proc getVertices*(this: var Drawable2D): Vector[Vertex2D] {.
    importcpp: "GetVertices", header: "Drawable2D.h".}
proc setVisibility*(this: var Drawable2D; visibility: bool) {.
    importcpp: "SetVisibility", header: "Drawable2D.h".}
proc getVisibility*(this: Drawable2D): bool {.noSideEffect,
    importcpp: "GetVisibility", header: "Drawable2D.h".}
proc setSpriteAttr*(this: var Drawable2D; value: ResourceRef) {.
    importcpp: "SetSpriteAttr", header: "Drawable2D.h".}
proc getSpriteAttr*(this: Drawable2D): ResourceRef {.noSideEffect,
    importcpp: "GetSpriteAttr", header: "Drawable2D.h".}
proc setBlendModeAttr*(this: var Drawable2D; mode: BlendMode) {.
    importcpp: "SetBlendModeAttr", header: "Drawable2D.h".}
proc setMaterialAttr*(this: var Drawable2D; value: ResourceRef) {.
    importcpp: "SetMaterialAttr", header: "Drawable2D.h".}
proc getMaterialAttr*(this: Drawable2D): ResourceRef {.noSideEffect,
    importcpp: "GetMaterialAttr", header: "Drawable2D.h".}
proc compareDrawable2Ds*(lhs: ptr Drawable2D; rhs: ptr Drawable2D): bool {.
    noSideEffect, importcpp: "compareDrawable2Ds(@)", header: "Drawable2D.h".}

proc addDrawable*(this: var DrawableProxy2D; drawable: ptr Drawable2D) {.
    importcpp: "AddDrawable", header: "DrawableProxy2D.h".}
proc removeDrawable*(this: var DrawableProxy2D; drawable: ptr Drawable2D) {.
    importcpp: "RemoveDrawable", header: "DrawableProxy2D.h".}
proc checkVisibility*(this: DrawableProxy2D; drawable: ptr Drawable2D): bool {.
    noSideEffect, importcpp: "CheckVisibility", header: "DrawableProxy2D.h".}
