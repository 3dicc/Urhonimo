

import
  component

discard "forward decl of RigidBody2D"
type
  CollisionShape2D* {.importcpp: "Urho3D::CollisionShape2D",
                      header: "CollisionShape2D.h".} = object of Component
    rigidBody* {.importc: "rigidBody_".}: WeakPtr[RigidBody2D]
    fixtureDef* {.importc: "fixtureDef_".}: B2FixtureDef
    fixture* {.importc: "fixture_".}: ptr B2Fixture
    cachedWorldScale* {.importc: "cachedWorldScale_".}: Vector3


proc getType*(this: CollisionShape2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "CollisionShape2D.h".}
proc getBaseType*(this: CollisionShape2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "CollisionShape2D.h".}
proc getTypeName*(this: CollisionShape2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "CollisionShape2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::CollisionShape2D::GetTypeStatic(@)",
    header: "CollisionShape2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::CollisionShape2D::GetTypeNameStatic(@)",
    header: "CollisionShape2D.h".}
proc constructCollisionShape2D*(scontext: ptr Context): CollisionShape2D {.
    constructor, importcpp: "Urho3D::CollisionShape2D(@)", header: "CollisionShape2D.h".}
proc destroyCollisionShape2D*(this: var CollisionShape2D) {.
    importcpp: "#.~CollisionShape2D()", header: "CollisionShape2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CollisionShape2D::RegisterObject(@)",
    header: "CollisionShape2D.h".}
proc onSetEnabled*(this: var CollisionShape2D) {.importcpp: "OnSetEnabled",
    header: "CollisionShape2D.h".}
proc setTrigger*(this: var CollisionShape2D; trigger: bool) {.
    importcpp: "SetTrigger", header: "CollisionShape2D.h".}
proc setCategoryBits*(this: var CollisionShape2D; categoryBits: cint) {.
    importcpp: "SetCategoryBits", header: "CollisionShape2D.h".}
proc setMaskBits*(this: var CollisionShape2D; maskBits: cint) {.
    importcpp: "SetMaskBits", header: "CollisionShape2D.h".}
proc setGroupIndex*(this: var CollisionShape2D; groupIndex: cint) {.
    importcpp: "SetGroupIndex", header: "CollisionShape2D.h".}
proc setDensity*(this: var CollisionShape2D; density: cfloat) {.
    importcpp: "SetDensity", header: "CollisionShape2D.h".}
proc setFriction*(this: var CollisionShape2D; friction: cfloat) {.
    importcpp: "SetFriction", header: "CollisionShape2D.h".}
proc setRestitution*(this: var CollisionShape2D; restitution: cfloat) {.
    importcpp: "SetRestitution", header: "CollisionShape2D.h".}
proc createFixture*(this: var CollisionShape2D) {.importcpp: "CreateFixture",
    header: "CollisionShape2D.h".}
proc releaseFixture*(this: var CollisionShape2D) {.importcpp: "ReleaseFixture",
    header: "CollisionShape2D.h".}
proc isTrigger*(this: CollisionShape2D): bool {.noSideEffect,
    importcpp: "IsTrigger", header: "CollisionShape2D.h".}
proc getCategoryBits*(this: CollisionShape2D): cint {.noSideEffect,
    importcpp: "GetCategoryBits", header: "CollisionShape2D.h".}
proc getMaskBits*(this: CollisionShape2D): cint {.noSideEffect,
    importcpp: "GetMaskBits", header: "CollisionShape2D.h".}
proc getGroupIndex*(this: CollisionShape2D): cint {.noSideEffect,
    importcpp: "GetGroupIndex", header: "CollisionShape2D.h".}
proc getDensity*(this: CollisionShape2D): cfloat {.noSideEffect,
    importcpp: "GetDensity", header: "CollisionShape2D.h".}
proc getFriction*(this: CollisionShape2D): cfloat {.noSideEffect,
    importcpp: "GetFriction", header: "CollisionShape2D.h".}
proc getRestitution*(this: CollisionShape2D): cfloat {.noSideEffect,
    importcpp: "GetRestitution", header: "CollisionShape2D.h".}
proc getMass*(this: CollisionShape2D): cfloat {.noSideEffect,
    importcpp: "GetMass", header: "CollisionShape2D.h".}
proc getInertia*(this: CollisionShape2D): cfloat {.noSideEffect,
    importcpp: "GetInertia", header: "CollisionShape2D.h".}
proc getMassCenter*(this: CollisionShape2D): Vector2 {.noSideEffect,
    importcpp: "GetMassCenter", header: "CollisionShape2D.h".}
proc getFixture*(this: CollisionShape2D): ptr B2Fixture {.noSideEffect,
    importcpp: "GetFixture", header: "CollisionShape2D.h".}
