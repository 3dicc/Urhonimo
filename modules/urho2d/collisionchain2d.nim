

import 
  collisionShape2D


type 
  CollisionChain2D* {.importc: "Urho3D::CollisionChain2D", 
                      header: "CollisionChain2D.h".} = object of CollisionShape2D
    chainShape* {.importc: "chainShape_".}: B2ChainShape
    loop* {.importc: "loop_".}: bool
    vertices* {.importc: "vertices_".}: PODVector[Vector2]


proc getType*(this: CollisionChain2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "CollisionChain2D.h".}
proc getBaseType*(this: CollisionChain2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "CollisionChain2D.h".}
proc getTypeName*(this: CollisionChain2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "CollisionChain2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::CollisionChain2D::GetTypeStatic(@)", 
    header: "CollisionChain2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::CollisionChain2D::GetTypeNameStatic(@)", 
    header: "CollisionChain2D.h".}
proc constructCollisionChain2D*(scontext: ptr Context): CollisionChain2D {.
    importcpp: "Urho3D::CollisionChain2D(@)", header: "CollisionChain2D.h".}
proc destroyCollisionChain2D*(this: var CollisionChain2D) {.
    importcpp: "#.~CollisionChain2D()", header: "CollisionChain2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CollisionChain2D::RegisterObject(@)", 
    header: "CollisionChain2D.h".}
proc setLoop*(this: var CollisionChain2D; loop: bool) {.importcpp: "SetLoop", 
    header: "CollisionChain2D.h".}
proc setVertexCount*(this: var CollisionChain2D; count: cuint) {.
    importcpp: "SetVertexCount", header: "CollisionChain2D.h".}
proc setVertex*(this: var CollisionChain2D; index: cuint; vertex: Vector2) {.
    importcpp: "SetVertex", header: "CollisionChain2D.h".}
proc setVertices*(this: var CollisionChain2D; vertices: PODVector[Vector2]) {.
    importcpp: "SetVertices", header: "CollisionChain2D.h".}
proc getLoop*(this: CollisionChain2D): bool {.noSideEffect, 
    importcpp: "GetLoop", header: "CollisionChain2D.h".}
proc getVertexCount*(this: CollisionChain2D): cuint {.noSideEffect, 
    importcpp: "GetVertexCount", header: "CollisionChain2D.h".}
proc getVertex*(this: CollisionChain2D; index: cuint): Vector2 {.noSideEffect, 
    importcpp: "GetVertex", header: "CollisionChain2D.h".}
proc getVertices*(this: CollisionChain2D): PODVector[Vector2] {.noSideEffect, 
    importcpp: "GetVertices", header: "CollisionChain2D.h".}