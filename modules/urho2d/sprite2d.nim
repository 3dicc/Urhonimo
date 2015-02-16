

import 
  graphicsDefs, resource, vector3, vector2

discard "forward decl of SpriteSheet2D"
discard "forward decl of Texture2D"
type 
  Vertex2D* {.importc: "Urho3D::Vertex2D", header: "Sprite2D.h".} = object 
    position* {.importc: "position_".}: Vector3
    color* {.importc: "color_".}: cuint
    uv* {.importc: "uv_".}: Vector2


var MASK_VERTEX2D* {.importc: "MASK_VERTEX2D", header: "Sprite2D.h".}: cuint = mask_Position or
    mask_Color or mask_Texcoord1


type 
  Sprite2D* {.importc: "Urho3D::Sprite2D", header: "Sprite2D.h".} = object of Resource
    texture* {.importc: "texture_".}: SharedPtr[Texture2D]
    rectangle* {.importc: "rectangle_".}: IntRect
    hotSpot* {.importc: "hotSpot_".}: Vector2
    offset* {.importc: "offset_".}: IntVector2
    spriteSheet* {.importc: "spriteSheet_".}: WeakPtr[SpriteSheet2D]
    loadTexture* {.importc: "loadTexture_".}: SharedPtr[Texture2D]


proc getType*(this: Sprite2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Sprite2D.h".}
proc getBaseType*(this: Sprite2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Sprite2D.h".}
proc getTypeName*(this: Sprite2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Sprite2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Sprite2D::GetTypeStatic(@)", header: "Sprite2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Sprite2D::GetTypeNameStatic(@)", header: "Sprite2D.h".}
proc constructSprite2D*(context: ptr Context): Sprite2D {.
    importcpp: "Urho3D::Sprite2D(@)", header: "Sprite2D.h".}
proc destroySprite2D*(this: var Sprite2D) {.importcpp: "#.~Sprite2D()", 
    header: "Sprite2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Sprite2D::RegisterObject(@)", header: "Sprite2D.h".}
proc beginLoad*(this: var Sprite2D; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Sprite2D.h".}
proc endLoad*(this: var Sprite2D): bool {.importcpp: "EndLoad", 
    header: "Sprite2D.h".}
proc setTexture*(this: var Sprite2D; texture: ptr Texture2D) {.
    importcpp: "SetTexture", header: "Sprite2D.h".}
proc setRectangle*(this: var Sprite2D; rectangle: IntRect) {.
    importcpp: "SetRectangle", header: "Sprite2D.h".}
proc setHotSpot*(this: var Sprite2D; hotSpot: Vector2) {.
    importcpp: "SetHotSpot", header: "Sprite2D.h".}
proc setOffset*(this: var Sprite2D; offset: IntVector2) {.
    importcpp: "SetOffset", header: "Sprite2D.h".}
proc setSpriteSheet*(this: var Sprite2D; spriteSheet: ptr SpriteSheet2D) {.
    importcpp: "SetSpriteSheet", header: "Sprite2D.h".}
proc getTexture*(this: Sprite2D): ptr Texture2D {.noSideEffect, 
    importcpp: "GetTexture", header: "Sprite2D.h".}
proc getRectangle*(this: Sprite2D): IntRect {.noSideEffect, 
    importcpp: "GetRectangle", header: "Sprite2D.h".}
proc getHotSpot*(this: Sprite2D): Vector2 {.noSideEffect, 
    importcpp: "GetHotSpot", header: "Sprite2D.h".}
proc getOffset*(this: Sprite2D): IntVector2 {.noSideEffect, 
    importcpp: "GetOffset", header: "Sprite2D.h".}
proc getSpriteSheet*(this: Sprite2D): ptr SpriteSheet2D {.noSideEffect, 
    importcpp: "GetSpriteSheet", header: "Sprite2D.h".}
