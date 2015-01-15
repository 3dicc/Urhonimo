

import 
  resource

discard "forward decl of PListFile"
discard "forward decl of Sprite2D"
discard "forward decl of Texture2D"
discard "forward decl of XMLFile"
type 
  SpriteSheet2D* {.importc: "Urho3D::SpriteSheet2D", header: "SpriteSheet2D.h".} = object of Resource
    texture* {.importc: "texture_".}: SharedPtr[Texture2D]
    spriteMapping* {.importc: "spriteMapping_".}: HashMap[UrString, 
        SharedPtr[Sprite2D]]
    loadPListFile* {.importc: "loadPListFile_".}: SharedPtr[PListFile]
    loadXMLFile* {.importc: "loadXMLFile_".}: SharedPtr[XMLFile]
    loadTextureName* {.importc: "loadTextureName_".}: UrString


proc getType*(this: SpriteSheet2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "SpriteSheet2D.h".}
proc getBaseType*(this: SpriteSheet2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "SpriteSheet2D.h".}
proc getTypeName*(this: SpriteSheet2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "SpriteSheet2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::SpriteSheet2D::GetTypeStatic(@)", 
    header: "SpriteSheet2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::SpriteSheet2D::GetTypeNameStatic(@)", 
    header: "SpriteSheet2D.h".}
proc constructSpriteSheet2D*(context: ptr Context): SpriteSheet2D {.
    importcpp: "Urho3D::SpriteSheet2D(@)", header: "SpriteSheet2D.h".}
proc destroySpriteSheet2D*(this: var SpriteSheet2D) {.
    importcpp: "#.~SpriteSheet2D()", header: "SpriteSheet2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::SpriteSheet2D::RegisterObject(@)", 
    header: "SpriteSheet2D.h".}
proc beginLoad*(this: var SpriteSheet2D; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "SpriteSheet2D.h".}
proc endLoad*(this: var SpriteSheet2D): bool {.importcpp: "EndLoad", 
    header: "SpriteSheet2D.h".}
proc getTexture*(this: SpriteSheet2D): ptr Texture2D {.noSideEffect, 
    importcpp: "GetTexture", header: "SpriteSheet2D.h".}
proc getSprite*(this: SpriteSheet2D; name: UrString): ptr Sprite2D {.
    noSideEffect, importcpp: "GetSprite", header: "SpriteSheet2D.h".}
proc defineSprite*(this: var SpriteSheet2D; name: UrString; rectangle: IntRect; 
                   hotSpot: Vector2 = vector2(0.5, 0.5); 
                   offset: IntVector2 = intVector2.zero) {.
    importcpp: "DefineSprite", header: "SpriteSheet2D.h".}
proc getSpriteMapping*(this: SpriteSheet2D): HashMap[UrString, 
    SharedPtr[Sprite2D]] {.noSideEffect, importcpp: "GetSpriteMapping", 
                           header: "SpriteSheet2D.h".}