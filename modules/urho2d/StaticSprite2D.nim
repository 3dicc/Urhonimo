

import 
  drawable2D


type 
  StaticSprite2D* {.importc: "Urho3D::StaticSprite2D", 
                    header: "StaticSprite2D.h".} = object of Drawable2D
    flipX* {.importc: "flipX_".}: bool
    flipY* {.importc: "flipY_".}: bool
    color* {.importc: "color_".}: Color
    useHotSpot* {.importc: "useHotSpot_".}: bool
    hotSpot* {.importc: "hotSpot_".}: Vector2


proc getType*(this: StaticSprite2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "StaticSprite2D.h".}
proc getBaseType*(this: StaticSprite2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "StaticSprite2D.h".}
proc getTypeName*(this: StaticSprite2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "StaticSprite2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::StaticSprite2D::GetTypeStatic(@)", 
    header: "StaticSprite2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::StaticSprite2D::GetTypeNameStatic(@)", 
    header: "StaticSprite2D.h".}
proc constructStaticSprite2D*(context: ptr Context): StaticSprite2D {.
    importcpp: "Urho3D::StaticSprite2D(@)", header: "StaticSprite2D.h".}
proc destroyStaticSprite2D*(this: var StaticSprite2D) {.
    importcpp: "#.~StaticSprite2D()", header: "StaticSprite2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::StaticSprite2D::RegisterObject(@)", 
    header: "StaticSprite2D.h".}
proc setFlip*(this: var StaticSprite2D; flipX: bool; flipY: bool) {.
    importcpp: "SetFlip", header: "StaticSprite2D.h".}
proc setFlipX*(this: var StaticSprite2D; flipX: bool) {.importcpp: "SetFlipX", 
    header: "StaticSprite2D.h".}
proc setFlipY*(this: var StaticSprite2D; flipY: bool) {.importcpp: "SetFlipY", 
    header: "StaticSprite2D.h".}
proc setColor*(this: var StaticSprite2D; color: Color) {.importcpp: "SetColor", 
    header: "StaticSprite2D.h".}
proc setUseHotSpot*(this: var StaticSprite2D; useHotSpot: bool) {.
    importcpp: "SetUseHotSpot", header: "StaticSprite2D.h".}
proc setHotSpot*(this: var StaticSprite2D; hotspot: Vector2) {.
    importcpp: "SetHotSpot", header: "StaticSprite2D.h".}
proc getFlipX*(this: StaticSprite2D): bool {.noSideEffect, 
    importcpp: "GetFlipX", header: "StaticSprite2D.h".}
proc getFlipY*(this: StaticSprite2D): bool {.noSideEffect, 
    importcpp: "GetFlipY", header: "StaticSprite2D.h".}
proc getColor*(this: StaticSprite2D): Color {.noSideEffect, 
    importcpp: "GetColor", header: "StaticSprite2D.h".}
proc getUseHotSpot*(this: StaticSprite2D): bool {.noSideEffect, 
    importcpp: "GetUseHotSpot", header: "StaticSprite2D.h".}
proc getHotSpot*(this: StaticSprite2D): Vector2 {.noSideEffect, 
    importcpp: "GetHotSpot", header: "StaticSprite2D.h".}