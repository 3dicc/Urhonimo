

import
  collisionShape2D


type
  CollisionCircle2D* {.importcpp: "Urho3D::CollisionCircle2D",
                       header: "CollisionCircle2D.h".} = object of CollisionShape2D
    circleShape* {.importc: "circleShape_".}: B2CircleShape
    radius* {.importc: "radius_".}: cfloat
    center* {.importc: "center_".}: Vector2


proc getType*(this: CollisionCircle2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "CollisionCircle2D.h".}
proc getBaseType*(this: CollisionCircle2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "CollisionCircle2D.h".}
proc getTypeName*(this: CollisionCircle2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "CollisionCircle2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::CollisionCircle2D::GetTypeStatic(@)",
    header: "CollisionCircle2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::CollisionCircle2D::GetTypeNameStatic(@)",
    header: "CollisionCircle2D.h".}
proc constructCollisionCircle2D*(scontext: ptr Context): CollisionCircle2D {.
    constructor, importcpp: "Urho3D::CollisionCircle2D(@)", header: "CollisionCircle2D.h".}
proc destroyCollisionCircle2D*(this: var CollisionCircle2D) {.
    importcpp: "#.~CollisionCircle2D()", header: "CollisionCircle2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CollisionCircle2D::RegisterObject(@)",
    header: "CollisionCircle2D.h".}
proc setRadius*(this: var CollisionCircle2D; radius: cfloat) {.
    importcpp: "SetRadius", header: "CollisionCircle2D.h".}
proc setCenter*(this: var CollisionCircle2D; center: Vector2) {.
    importcpp: "SetCenter", header: "CollisionCircle2D.h".}
proc setCenter*(this: var CollisionCircle2D; x: cfloat; y: cfloat) {.
    importcpp: "SetCenter", header: "CollisionCircle2D.h".}
proc getRadius*(this: CollisionCircle2D): cfloat {.noSideEffect,
    importcpp: "GetRadius", header: "CollisionCircle2D.h".}
proc getCenter*(this: CollisionCircle2D): Vector2 {.noSideEffect,
    importcpp: "GetCenter", header: "CollisionCircle2D.h".}
