

import
  color, vector2, vector3

proc toColor*(color: B2Color): Color {.inline.}
proc toB2Vec2*(vector: Vector2): B2Vec2 {.inline.}
proc toVector2*(vec2: B2Vec2): Vector2 {.inline.}
proc toB2Vec2*(vector: Vector3): B2Vec2 {.inline.}
proc toVector3*(vec2: B2Vec2): Vector3 {.inline.}

#proc !=*(left: B2Vec2; right: B2Vec2): bool {.inline.}
