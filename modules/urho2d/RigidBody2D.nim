

import 
  component

discard "forward decl of CollisionShape2D"
discard "forward decl of Constraint2D"
discard "forward decl of PhysicsWorld2D"
type 
  BodyType2D* = enum 
    BT_STATIC = b2StaticBody, BT_DYNAMIC = b2DynamicBody, 
    BT_KINEMATIC = b2KinematicBody



type 
  RigidBody2D* {.importc: "Urho3D::RigidBody2D", header: "RigidBody2D.h".} = object of Component
    physicsWorld* {.importc: "physicsWorld_".}: WeakPtr[PhysicsWorld2D]
    bodyDef* {.importc: "bodyDef_".}: B2BodyDef
    massData* {.importc: "massData_".}: B2MassData
    useFixtureMass* {.importc: "useFixtureMass_".}: bool
    body* {.importc: "body_".}: ptr B2Body
    collisionShapes* {.importc: "collisionShapes_".}: Vector[
        WeakPtr[CollisionShape2D]]
    constraints* {.importc: "constraints_".}: Vector[WeakPtr[Constraint2D]]


proc getType*(this: RigidBody2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "RigidBody2D.h".}
proc getBaseType*(this: RigidBody2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "RigidBody2D.h".}
proc getTypeName*(this: RigidBody2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "RigidBody2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::RigidBody2D::GetTypeStatic(@)", header: "RigidBody2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::RigidBody2D::GetTypeNameStatic(@)", 
    header: "RigidBody2D.h".}
proc constructRigidBody2D*(scontext: ptr Context): RigidBody2D {.
    importcpp: "Urho3D::RigidBody2D(@)", header: "RigidBody2D.h".}
proc destroyRigidBody2D*(this: var RigidBody2D) {.importcpp: "#.~RigidBody2D()", 
    header: "RigidBody2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::RigidBody2D::RegisterObject(@)", header: "RigidBody2D.h".}
proc onSetEnabled*(this: var RigidBody2D) {.importcpp: "OnSetEnabled", 
    header: "RigidBody2D.h".}
proc setBodyType*(this: var RigidBody2D; bodyType: BodyType2D) {.
    importcpp: "SetBodyType", header: "RigidBody2D.h".}
proc setMass*(this: var RigidBody2D; mass: cfloat) {.importcpp: "SetMass", 
    header: "RigidBody2D.h".}
proc setInertia*(this: var RigidBody2D; inertia: cfloat) {.
    importcpp: "SetInertia", header: "RigidBody2D.h".}
proc setMassCenter*(this: var RigidBody2D; center: Vector2) {.
    importcpp: "SetMassCenter", header: "RigidBody2D.h".}
proc setUseFixtureMass*(this: var RigidBody2D; useFixtureMass: bool) {.
    importcpp: "SetUseFixtureMass", header: "RigidBody2D.h".}
proc setLinearDamping*(this: var RigidBody2D; linearDamping: cfloat) {.
    importcpp: "SetLinearDamping", header: "RigidBody2D.h".}
proc setAngularDamping*(this: var RigidBody2D; angularDamping: cfloat) {.
    importcpp: "SetAngularDamping", header: "RigidBody2D.h".}
proc setAllowSleep*(this: var RigidBody2D; allowSleep: bool) {.
    importcpp: "SetAllowSleep", header: "RigidBody2D.h".}
proc setFixedRotation*(this: var RigidBody2D; fixedRotation: bool) {.
    importcpp: "SetFixedRotation", header: "RigidBody2D.h".}
proc setBullet*(this: var RigidBody2D; bullet: bool) {.importcpp: "SetBullet", 
    header: "RigidBody2D.h".}
proc setGravityScale*(this: var RigidBody2D; gravityScale: cfloat) {.
    importcpp: "SetGravityScale", header: "RigidBody2D.h".}
proc setAwake*(this: var RigidBody2D; awake: bool) {.importcpp: "SetAwake", 
    header: "RigidBody2D.h".}
proc setLinearVelocity*(this: var RigidBody2D; linearVelocity: Vector2) {.
    importcpp: "SetLinearVelocity", header: "RigidBody2D.h".}
proc setAngularVelocity*(this: var RigidBody2D; angularVelocity: cfloat) {.
    importcpp: "SetAngularVelocity", header: "RigidBody2D.h".}
proc applyForce*(this: var RigidBody2D; force: Vector2; point: Vector2; 
                 wake: bool) {.importcpp: "ApplyForce", header: "RigidBody2D.h".}
proc applyForceToCenter*(this: var RigidBody2D; force: Vector2; wake: bool) {.
    importcpp: "ApplyForceToCenter", header: "RigidBody2D.h".}
proc applyTorque*(this: var RigidBody2D; torque: cfloat; wake: bool) {.
    importcpp: "ApplyTorque", header: "RigidBody2D.h".}
proc applyLinearImpulse*(this: var RigidBody2D; impulse: Vector2; 
                         point: Vector2; wake: bool) {.
    importcpp: "ApplyLinearImpulse", header: "RigidBody2D.h".}
proc applyAngularImpulse*(this: var RigidBody2D; impulse: cfloat; wake: bool) {.
    importcpp: "ApplyAngularImpulse", header: "RigidBody2D.h".}
proc createBody*(this: var RigidBody2D) {.importcpp: "CreateBody", 
    header: "RigidBody2D.h".}
proc releaseBody*(this: var RigidBody2D) {.importcpp: "ReleaseBody", 
    header: "RigidBody2D.h".}
proc applyWorldTransform*(this: var RigidBody2D) {.
    importcpp: "ApplyWorldTransform", header: "RigidBody2D.h".}
proc addCollisionShape2D*(this: var RigidBody2D; 
                          collisionShape: ptr CollisionShape2D) {.
    importcpp: "AddCollisionShape2D", header: "RigidBody2D.h".}
proc removeCollisionShape2D*(this: var RigidBody2D; 
                             collisionShape: ptr CollisionShape2D) {.
    importcpp: "RemoveCollisionShape2D", header: "RigidBody2D.h".}
proc addConstraint2D*(this: var RigidBody2D; constraint: ptr Constraint2D) {.
    importcpp: "AddConstraint2D", header: "RigidBody2D.h".}
proc removeConstraint2D*(this: var RigidBody2D; constraint: ptr Constraint2D) {.
    importcpp: "RemoveConstraint2D", header: "RigidBody2D.h".}
proc getBodyType*(this: RigidBody2D): BodyType2D {.noSideEffect, 
    importcpp: "GetBodyType", header: "RigidBody2D.h".}
proc getMass*(this: RigidBody2D): cfloat {.noSideEffect, importcpp: "GetMass", 
    header: "RigidBody2D.h".}
proc getInertia*(this: RigidBody2D): cfloat {.noSideEffect, 
    importcpp: "GetInertia", header: "RigidBody2D.h".}
proc getMassCenter*(this: RigidBody2D): Vector2 {.noSideEffect, 
    importcpp: "GetMassCenter", header: "RigidBody2D.h".}
proc getUseFixtureMass*(this: RigidBody2D): bool {.noSideEffect, 
    importcpp: "GetUseFixtureMass", header: "RigidBody2D.h".}
proc getLinearDamping*(this: RigidBody2D): cfloat {.noSideEffect, 
    importcpp: "GetLinearDamping", header: "RigidBody2D.h".}
proc getAngularDamping*(this: RigidBody2D): cfloat {.noSideEffect, 
    importcpp: "GetAngularDamping", header: "RigidBody2D.h".}
proc isAllowSleep*(this: RigidBody2D): bool {.noSideEffect, 
    importcpp: "IsAllowSleep", header: "RigidBody2D.h".}
proc isFixedRotation*(this: RigidBody2D): bool {.noSideEffect, 
    importcpp: "IsFixedRotation", header: "RigidBody2D.h".}
proc isBullet*(this: RigidBody2D): bool {.noSideEffect, importcpp: "IsBullet", 
    header: "RigidBody2D.h".}
proc getGravityScale*(this: RigidBody2D): cfloat {.noSideEffect, 
    importcpp: "GetGravityScale", header: "RigidBody2D.h".}
proc isAwake*(this: RigidBody2D): bool {.noSideEffect, importcpp: "IsAwake", 
    header: "RigidBody2D.h".}
proc getLinearVelocity*(this: RigidBody2D): Vector2 {.noSideEffect, 
    importcpp: "GetLinearVelocity", header: "RigidBody2D.h".}
proc getAngularVelocity*(this: RigidBody2D): cfloat {.noSideEffect, 
    importcpp: "GetAngularVelocity", header: "RigidBody2D.h".}
proc getBody*(this: RigidBody2D): ptr B2Body {.noSideEffect, 
    importcpp: "GetBody", header: "RigidBody2D.h".}