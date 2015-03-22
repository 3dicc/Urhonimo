

import
  constraint2D


type
  ConstraintWeld2D* {.importcpp: "Urho3D::ConstraintWeld2D",
                      header: "ConstraintWeld2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2WeldJointDef
    anchor* {.importc: "anchor_".}: Vector2


proc getType*(this: ConstraintWeld2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "ConstraintWeld2D.h".}
proc getBaseType*(this: ConstraintWeld2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ConstraintWeld2D.h".}
proc getTypeName*(this: ConstraintWeld2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ConstraintWeld2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintWeld2D::GetTypeStatic(@)",
    header: "ConstraintWeld2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintWeld2D::GetTypeNameStatic(@)",
    header: "ConstraintWeld2D.h".}
proc constructConstraintWeld2D*(scontext: ptr Context): ConstraintWeld2D {.
    constructor, importcpp: "Urho3D::ConstraintWeld2D(@)", header: "ConstraintWeld2D.h".}
proc destroyConstraintWeld2D*(this: var ConstraintWeld2D) {.
    importcpp: "#.~ConstraintWeld2D()", header: "ConstraintWeld2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintWeld2D::RegisterObject(@)",
    header: "ConstraintWeld2D.h".}
proc setAnchor*(this: var ConstraintWeld2D; anchor: Vector2) {.
    importcpp: "SetAnchor", header: "ConstraintWeld2D.h".}
proc setFrequencyHz*(this: var ConstraintWeld2D; frequencyHz: cfloat) {.
    importcpp: "SetFrequencyHz", header: "ConstraintWeld2D.h".}
proc setDampingRatio*(this: var ConstraintWeld2D; dampingRatio: cfloat) {.
    importcpp: "SetDampingRatio", header: "ConstraintWeld2D.h".}
proc getAnchor*(this: ConstraintWeld2D): Vector2 {.noSideEffect,
    importcpp: "GetAnchor", header: "ConstraintWeld2D.h".}
proc getFrequencyHz*(this: ConstraintWeld2D): cfloat {.noSideEffect,
    importcpp: "GetFrequencyHz", header: "ConstraintWeld2D.h".}
proc getDampingRatio*(this: ConstraintWeld2D): cfloat {.noSideEffect,
    importcpp: "GetDampingRatio", header: "ConstraintWeld2D.h".}
