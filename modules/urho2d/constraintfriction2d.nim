

import
  constraint2D


type
  ConstraintFriction2D* {.importcpp: "Urho3D::ConstraintFriction2D",
                          header: "ConstraintFriction2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2FrictionJointDef
    anchor* {.importc: "anchor_".}: Vector2


proc getType*(this: ConstraintFriction2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "ConstraintFriction2D.h".}
proc getBaseType*(this: ConstraintFriction2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ConstraintFriction2D.h".}
proc getTypeName*(this: ConstraintFriction2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ConstraintFriction2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintFriction2D::GetTypeStatic(@)",
    header: "ConstraintFriction2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintFriction2D::GetTypeNameStatic(@)",
    header: "ConstraintFriction2D.h".}
proc constructConstraintFriction2D*(scontext: ptr Context): ConstraintFriction2D {.
    importcpp: "Urho3D::ConstraintFriction2D(@)", constructor,
    header: "ConstraintFriction2D.h".}
proc destroyConstraintFriction2D*(this: var ConstraintFriction2D) {.
    importcpp: "#.~ConstraintFriction2D()", header: "ConstraintFriction2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintFriction2D::RegisterObject(@)",
    header: "ConstraintFriction2D.h".}
proc setAnchor*(this: var ConstraintFriction2D; anchor: Vector2) {.
    importcpp: "SetAnchor", header: "ConstraintFriction2D.h".}
proc setMaxForce*(this: var ConstraintFriction2D; maxForce: cfloat) {.
    importcpp: "SetMaxForce", header: "ConstraintFriction2D.h".}
proc setMaxTorque*(this: var ConstraintFriction2D; maxTorque: cfloat) {.
    importcpp: "SetMaxTorque", header: "ConstraintFriction2D.h".}
proc getAnchor*(this: ConstraintFriction2D): Vector2 {.noSideEffect,
    importcpp: "GetAnchor", header: "ConstraintFriction2D.h".}
proc getMaxForce*(this: ConstraintFriction2D): cfloat {.noSideEffect,
    importcpp: "GetMaxForce", header: "ConstraintFriction2D.h".}
proc getMaxTorque*(this: ConstraintFriction2D): cfloat {.noSideEffect,
    importcpp: "GetMaxTorque", header: "ConstraintFriction2D.h".}
