

import 
  collisionShape2D


type 
  CollisionPolygon2D* {.importc: "Urho3D::CollisionPolygon2D", 
                        header: "CollisionPolygon2D.h".} = object of CollisionShape2D
    polygonShape* {.importc: "polygonShape_".}: B2PolygonShape
    vertices* {.importc: "vertices_".}: PODVector[Vector2]


proc getType*(this: CollisionPolygon2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "CollisionPolygon2D.h".}
proc getBaseType*(this: CollisionPolygon2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "CollisionPolygon2D.h".}
proc getTypeName*(this: CollisionPolygon2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "CollisionPolygon2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::CollisionPolygon2D::GetTypeStatic(@)", 
    header: "CollisionPolygon2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::CollisionPolygon2D::GetTypeNameStatic(@)", 
    header: "CollisionPolygon2D.h".}
proc constructCollisionPolygon2D*(scontext: ptr Context): CollisionPolygon2D {.
    importcpp: "Urho3D::CollisionPolygon2D(@)", header: "CollisionPolygon2D.h".}
proc destroyCollisionPolygon2D*(this: var CollisionPolygon2D) {.
    importcpp: "#.~CollisionPolygon2D()", header: "CollisionPolygon2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CollisionPolygon2D::RegisterObject(@)", 
    header: "CollisionPolygon2D.h".}
proc setVertexCount*(this: var CollisionPolygon2D; count: cuint) {.
    importcpp: "SetVertexCount", header: "CollisionPolygon2D.h".}
proc setVertex*(this: var CollisionPolygon2D; index: cuint; vertex: Vector2) {.
    importcpp: "SetVertex", header: "CollisionPolygon2D.h".}
proc setVertices*(this: var CollisionPolygon2D; vertices: PODVector[Vector2]) {.
    importcpp: "SetVertices", header: "CollisionPolygon2D.h".}
proc getVertexCount*(this: CollisionPolygon2D): cuint {.noSideEffect, 
    importcpp: "GetVertexCount", header: "CollisionPolygon2D.h".}
proc getVertex*(this: CollisionPolygon2D; index: cuint): Vector2 {.noSideEffect, 
    importcpp: "GetVertex", header: "CollisionPolygon2D.h".}
proc getVertices*(this: CollisionPolygon2D): PODVector[Vector2] {.noSideEffect, 
    importcpp: "GetVertices", header: "CollisionPolygon2D.h".}