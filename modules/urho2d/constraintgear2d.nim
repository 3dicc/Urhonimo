

import
  constraint2D


type
  ConstraintGear2D* {.importcpp: "Urho3D::ConstraintGear2D",
                      header: "ConstraintGear2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2GearJointDef
    ownerConstraint* {.importc: "ownerConstraint_".}: WeakPtr[Constraint2D]
    otherConstraint* {.importc: "otherConstraint_".}: WeakPtr[Constraint2D]


proc getType*(this: ConstraintGear2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "ConstraintGear2D.h".}
proc getBaseType*(this: ConstraintGear2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ConstraintGear2D.h".}
proc getTypeName*(this: ConstraintGear2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ConstraintGear2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintGear2D::GetTypeStatic(@)",
    header: "ConstraintGear2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintGear2D::GetTypeNameStatic(@)",
    header: "ConstraintGear2D.h".}
proc constructConstraintGear2D*(scontext: ptr Context): ConstraintGear2D {.
    constructor, importcpp: "Urho3D::ConstraintGear2D(@)", header: "ConstraintGear2D.h".}
proc destroyConstraintGear2D*(this: var ConstraintGear2D) {.
    importcpp: "#.~ConstraintGear2D()", header: "ConstraintGear2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintGear2D::RegisterObject(@)",
    header: "ConstraintGear2D.h".}
proc setOwnerConstraint*(this: var ConstraintGear2D;
                         constraint: ptr Constraint2D) {.
    importcpp: "SetOwnerConstraint", header: "ConstraintGear2D.h".}
proc setOtherConstraint*(this: var ConstraintGear2D;
                         constraint: ptr Constraint2D) {.
    importcpp: "SetOtherConstraint", header: "ConstraintGear2D.h".}
proc setRatio*(this: var ConstraintGear2D; ratio: cfloat) {.
    importcpp: "SetRatio", header: "ConstraintGear2D.h".}
proc getOwnerConstraint*(this: ConstraintGear2D): ptr Constraint2D {.
    noSideEffect, importcpp: "GetOwnerConstraint", header: "ConstraintGear2D.h".}
proc getOtherConstraint*(this: ConstraintGear2D): ptr Constraint2D {.
    noSideEffect, importcpp: "GetOtherConstraint", header: "ConstraintGear2D.h".}
proc getRatio*(this: ConstraintGear2D): cfloat {.noSideEffect,
    importcpp: "GetRatio", header: "ConstraintGear2D.h".}
