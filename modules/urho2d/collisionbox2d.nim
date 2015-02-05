

import 
  collisionShape2D


type 
  CollisionBox2D* {.importc: "Urho3D::CollisionBox2D", 
                    header: "CollisionBox2D.h".} = object of CollisionShape2D
    boxShape* {.importc: "boxShape_".}: B2PolygonShape
    size* {.importc: "size_".}: Vector2
    center* {.importc: "center_".}: Vector2
    angle* {.importc: "angle_".}: cfloat


proc getType*(this: CollisionBox2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "CollisionBox2D.h".}
proc getBaseType*(this: CollisionBox2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "CollisionBox2D.h".}
proc getTypeName*(this: CollisionBox2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "CollisionBox2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::CollisionBox2D::GetTypeStatic(@)", 
    header: "CollisionBox2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::CollisionBox2D::GetTypeNameStatic(@)", 
    header: "CollisionBox2D.h".}
proc constructCollisionBox2D*(scontext: ptr Context): CollisionBox2D {.
    importcpp: "Urho3D::CollisionBox2D(@)", header: "CollisionBox2D.h".}
proc destroyCollisionBox2D*(this: var CollisionBox2D) {.
    importcpp: "#.~CollisionBox2D()", header: "CollisionBox2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CollisionBox2D::RegisterObject(@)", 
    header: "CollisionBox2D.h".}
proc setSize*(this: var CollisionBox2D; size: Vector2) {.importcpp: "SetSize", 
    header: "CollisionBox2D.h".}
proc setSize*(this: var CollisionBox2D; width: cfloat; height: cfloat) {.
    importcpp: "SetSize", header: "CollisionBox2D.h".}
proc setCenter*(this: var CollisionBox2D; center: Vector2) {.
    importcpp: "SetCenter", header: "CollisionBox2D.h".}
proc setCenter*(this: var CollisionBox2D; x: cfloat; y: cfloat) {.
    importcpp: "SetCenter", header: "CollisionBox2D.h".}
proc setAngle*(this: var CollisionBox2D; angle: cfloat) {.importcpp: "SetAngle", 
    header: "CollisionBox2D.h".}
proc getSize*(this: CollisionBox2D): Vector2 {.noSideEffect, 
    importcpp: "GetSize", header: "CollisionBox2D.h".}
proc getCenter*(this: CollisionBox2D): Vector2 {.noSideEffect, 
    importcpp: "GetCenter", header: "CollisionBox2D.h".}
proc getAngle*(this: CollisionBox2D): cfloat {.noSideEffect, 
    importcpp: "GetAngle", header: "CollisionBox2D.h".}