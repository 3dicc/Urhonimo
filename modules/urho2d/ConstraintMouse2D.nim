

import 
  constraint2D


type 
  ConstraintMouse2D* {.importc: "Urho3D::ConstraintMouse2D", 
                       header: "ConstraintMouse2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2MouseJointDef
    target* {.importc: "target_".}: Vector2
    targetSetted* {.importc: "targetSetted_".}: bool


proc getType*(this: ConstraintMouse2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ConstraintMouse2D.h".}
proc getBaseType*(this: ConstraintMouse2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ConstraintMouse2D.h".}
proc getTypeName*(this: ConstraintMouse2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ConstraintMouse2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintMouse2D::GetTypeStatic(@)", 
    header: "ConstraintMouse2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintMouse2D::GetTypeNameStatic(@)", 
    header: "ConstraintMouse2D.h".}
proc constructConstraintMouse2D*(scontext: ptr Context): ConstraintMouse2D {.
    importcpp: "Urho3D::ConstraintMouse2D(@)", header: "ConstraintMouse2D.h".}
proc destroyConstraintMouse2D*(this: var ConstraintMouse2D) {.
    importcpp: "#.~ConstraintMouse2D()", header: "ConstraintMouse2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintMouse2D::RegisterObject(@)", 
    header: "ConstraintMouse2D.h".}
proc setTarget*(this: var ConstraintMouse2D; target: Vector2) {.
    importcpp: "SetTarget", header: "ConstraintMouse2D.h".}
proc setMaxForce*(this: var ConstraintMouse2D; maxForce: cfloat) {.
    importcpp: "SetMaxForce", header: "ConstraintMouse2D.h".}
proc setFrequencyHz*(this: var ConstraintMouse2D; frequencyHz: cfloat) {.
    importcpp: "SetFrequencyHz", header: "ConstraintMouse2D.h".}
proc setDampingRatio*(this: var ConstraintMouse2D; dampingRatio: cfloat) {.
    importcpp: "SetDampingRatio", header: "ConstraintMouse2D.h".}
proc getTarget*(this: ConstraintMouse2D): Vector2 {.noSideEffect, 
    importcpp: "GetTarget", header: "ConstraintMouse2D.h".}
proc getMaxForce*(this: ConstraintMouse2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxForce", header: "ConstraintMouse2D.h".}
proc getFrequencyHz*(this: ConstraintMouse2D): cfloat {.noSideEffect, 
    importcpp: "GetFrequencyHz", header: "ConstraintMouse2D.h".}
proc getDampingRatio*(this: ConstraintMouse2D): cfloat {.noSideEffect, 
    importcpp: "GetDampingRatio", header: "ConstraintMouse2D.h".}