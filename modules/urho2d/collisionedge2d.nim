

import
  collisionShape2D


type
  CollisionEdge2D* {.importcpp: "Urho3D::CollisionEdge2D",
                     header: "CollisionEdge2D.h".} = object of CollisionShape2D
    edgeShape* {.importc: "edgeShape_".}: B2EdgeShape
    vertex1* {.importc: "vertex1_".}: Vector2
    vertex2* {.importc: "vertex2_".}: Vector2


proc getType*(this: CollisionEdge2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "CollisionEdge2D.h".}
proc getBaseType*(this: CollisionEdge2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "CollisionEdge2D.h".}
proc getTypeName*(this: CollisionEdge2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "CollisionEdge2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::CollisionEdge2D::GetTypeStatic(@)",
    header: "CollisionEdge2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::CollisionEdge2D::GetTypeNameStatic(@)",
    header: "CollisionEdge2D.h".}
proc constructCollisionEdge2D*(scontext: ptr Context): CollisionEdge2D {.
    constructor, importcpp: "Urho3D::CollisionEdge2D(@)", header: "CollisionEdge2D.h".}
proc destroyCollisionEdge2D*(this: var CollisionEdge2D) {.
    importcpp: "#.~CollisionEdge2D()", header: "CollisionEdge2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CollisionEdge2D::RegisterObject(@)",
    header: "CollisionEdge2D.h".}
proc setVertex1*(this: var CollisionEdge2D; vertex: Vector2) {.
    importcpp: "SetVertex1", header: "CollisionEdge2D.h".}
proc setVertex2*(this: var CollisionEdge2D; vertex: Vector2) {.
    importcpp: "SetVertex2", header: "CollisionEdge2D.h".}
proc setVertices*(this: var CollisionEdge2D; vertex1: Vector2; vertex2: Vector2) {.
    importcpp: "SetVertices", header: "CollisionEdge2D.h".}
proc getVertex1*(this: CollisionEdge2D): Vector2 {.noSideEffect,
    importcpp: "GetVertex1", header: "CollisionEdge2D.h".}
proc getVertex2*(this: CollisionEdge2D): Vector2 {.noSideEffect,
    importcpp: "GetVertex2", header: "CollisionEdge2D.h".}
