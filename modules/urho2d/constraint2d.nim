

import
  component

discard "forward decl of RigidBody2D"
discard "forward decl of PhysicsWorld2D"
type
  Constraint2D* {.importcpp: "Urho3D::Constraint2D", header: "Constraint2D.h".} = object of Component
    physicsWorld* {.importc: "physicsWorld_".}: WeakPtr[PhysicsWorld2D]
    joint* {.importc: "joint_".}: ptr B2Joint
    ownerBody* {.importc: "ownerBody_".}: WeakPtr[RigidBody2D]
    otherBody* {.importc: "otherBody_".}: WeakPtr[RigidBody2D]
    collideConnected* {.importc: "collideConnected_".}: bool
    attachedConstraint* {.importc: "attachedConstraint_".}: WeakPtr[Constraint2D]


proc getType*(this: Constraint2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "Constraint2D.h".}
proc getBaseType*(this: Constraint2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Constraint2D.h".}
proc getTypeName*(this: Constraint2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Constraint2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Constraint2D::GetTypeStatic(@)",
    header: "Constraint2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Constraint2D::GetTypeNameStatic(@)",
    header: "Constraint2D.h".}
proc constructConstraint2D*(scontext: ptr Context): Constraint2D {.
    constructor, importcpp: "Urho3D::Constraint2D(@)", header: "Constraint2D.h".}
proc destroyConstraint2D*(this: var Constraint2D) {.
    importcpp: "#.~Constraint2D()", header: "Constraint2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Constraint2D::RegisterObject(@)",
    header: "Constraint2D.h".}
proc onSetEnabled*(this: var Constraint2D) {.importcpp: "OnSetEnabled",
    header: "Constraint2D.h".}
proc createJoint*(this: var Constraint2D) {.importcpp: "CreateJoint",
    header: "Constraint2D.h".}
proc releaseJoint*(this: var Constraint2D) {.importcpp: "ReleaseJoint",
    header: "Constraint2D.h".}
proc setOtherBody*(this: var Constraint2D; body: ptr RigidBody2D) {.
    importcpp: "SetOtherBody", header: "Constraint2D.h".}
proc setCollideConnected*(this: var Constraint2D; collideConnected: bool) {.
    importcpp: "SetCollideConnected", header: "Constraint2D.h".}
proc setAttachedConstraint*(this: var Constraint2D; constraint: ptr Constraint2D) {.
    importcpp: "SetAttachedConstraint", header: "Constraint2D.h".}
proc getOwnerBody*(this: Constraint2D): ptr RigidBody2D {.noSideEffect,
    importcpp: "GetOwnerBody", header: "Constraint2D.h".}
proc getOtherBody*(this: Constraint2D): ptr RigidBody2D {.noSideEffect,
    importcpp: "GetOtherBody", header: "Constraint2D.h".}
proc getCollideConnected*(this: Constraint2D): bool {.noSideEffect,
    importcpp: "GetCollideConnected", header: "Constraint2D.h".}
proc getAttachedConstraint*(this: Constraint2D): ptr Constraint2D {.
    noSideEffect, importcpp: "GetAttachedConstraint", header: "Constraint2D.h".}
proc getJoint*(this: Constraint2D): ptr B2Joint {.noSideEffect,
    importcpp: "GetJoint", header: "Constraint2D.h".}
