

import
  constraint2D


type
  ConstraintDistance2D* {.importcpp: "Urho3D::ConstraintDistance2D",
                          header: "ConstraintDistance2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2DistanceJointDef
    ownerBodyAnchor* {.importc: "ownerBodyAnchor_".}: Vector2
    otherBodyAnchor* {.importc: "otherBodyAnchor_".}: Vector2


proc getType*(this: ConstraintDistance2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "ConstraintDistance2D.h".}
proc getBaseType*(this: ConstraintDistance2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ConstraintDistance2D.h".}
proc getTypeName*(this: ConstraintDistance2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ConstraintDistance2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintDistance2D::GetTypeStatic(@)",
    header: "ConstraintDistance2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintDistance2D::GetTypeNameStatic(@)",
    header: "ConstraintDistance2D.h".}
proc constructConstraintDistance2D*(scontext: ptr Context): ConstraintDistance2D {.
    importcpp: "Urho3D::ConstraintDistance2D(@)", constructor,
    header: "ConstraintDistance2D.h".}
proc destroyConstraintDistance2D*(this: var ConstraintDistance2D) {.
    importcpp: "#.~ConstraintDistance2D()", header: "ConstraintDistance2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintDistance2D::RegisterObject(@)",
    header: "ConstraintDistance2D.h".}
proc setOwnerBodyAnchor*(this: var ConstraintDistance2D; anchor: Vector2) {.
    importcpp: "SetOwnerBodyAnchor", header: "ConstraintDistance2D.h".}
proc setOtherBodyAnchor*(this: var ConstraintDistance2D; anchor: Vector2) {.
    importcpp: "SetOtherBodyAnchor", header: "ConstraintDistance2D.h".}
proc setFrequencyHz*(this: var ConstraintDistance2D; frequencyHz: cfloat) {.
    importcpp: "SetFrequencyHz", header: "ConstraintDistance2D.h".}
proc setDampingRatio*(this: var ConstraintDistance2D; dampingRatio: cfloat) {.
    importcpp: "SetDampingRatio", header: "ConstraintDistance2D.h".}
proc getOwnerBodyAnchor*(this: ConstraintDistance2D): Vector2 {.noSideEffect,
    importcpp: "GetOwnerBodyAnchor", header: "ConstraintDistance2D.h".}
proc getOtherBodyAnchor*(this: ConstraintDistance2D): Vector2 {.noSideEffect,
    importcpp: "GetOtherBodyAnchor", header: "ConstraintDistance2D.h".}
proc getFrequencyHz*(this: ConstraintDistance2D): cfloat {.noSideEffect,
    importcpp: "GetFrequencyHz", header: "ConstraintDistance2D.h".}
proc getDampingRatio*(this: ConstraintDistance2D): cfloat {.noSideEffect,
    importcpp: "GetDampingRatio", header: "ConstraintDistance2D.h".}
