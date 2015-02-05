

import 
  constraint2D


type 
  ConstraintWheel2D* {.importc: "Urho3D::ConstraintWheel2D", 
                       header: "ConstraintWheel2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2WheelJointDef
    anchor* {.importc: "anchor_".}: Vector2
    axis* {.importc: "axis_".}: Vector2


proc getType*(this: ConstraintWheel2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ConstraintWheel2D.h".}
proc getBaseType*(this: ConstraintWheel2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ConstraintWheel2D.h".}
proc getTypeName*(this: ConstraintWheel2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ConstraintWheel2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintWheel2D::GetTypeStatic(@)", 
    header: "ConstraintWheel2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintWheel2D::GetTypeNameStatic(@)", 
    header: "ConstraintWheel2D.h".}
proc constructConstraintWheel2D*(scontext: ptr Context): ConstraintWheel2D {.
    importcpp: "Urho3D::ConstraintWheel2D(@)", header: "ConstraintWheel2D.h".}
proc destroyConstraintWheel2D*(this: var ConstraintWheel2D) {.
    importcpp: "#.~ConstraintWheel2D()", header: "ConstraintWheel2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintWheel2D::RegisterObject(@)", 
    header: "ConstraintWheel2D.h".}
proc setAnchor*(this: var ConstraintWheel2D; anchor: Vector2) {.
    importcpp: "SetAnchor", header: "ConstraintWheel2D.h".}
proc setAxis*(this: var ConstraintWheel2D; axis: Vector2) {.
    importcpp: "SetAxis", header: "ConstraintWheel2D.h".}
proc setEnableMotor*(this: var ConstraintWheel2D; enableMotor: bool) {.
    importcpp: "SetEnableMotor", header: "ConstraintWheel2D.h".}
proc setMaxMotorTorque*(this: var ConstraintWheel2D; maxMotorTorque: cfloat) {.
    importcpp: "SetMaxMotorTorque", header: "ConstraintWheel2D.h".}
proc setMotorSpeed*(this: var ConstraintWheel2D; motorSpeed: cfloat) {.
    importcpp: "SetMotorSpeed", header: "ConstraintWheel2D.h".}
proc setFrequencyHz*(this: var ConstraintWheel2D; frequencyHz: cfloat) {.
    importcpp: "SetFrequencyHz", header: "ConstraintWheel2D.h".}
proc setDampingRatio*(this: var ConstraintWheel2D; dampingRatio: cfloat) {.
    importcpp: "SetDampingRatio", header: "ConstraintWheel2D.h".}
proc getAnchor*(this: ConstraintWheel2D): Vector2 {.noSideEffect, 
    importcpp: "GetAnchor", header: "ConstraintWheel2D.h".}
proc getAxis*(this: ConstraintWheel2D): Vector2 {.noSideEffect, 
    importcpp: "GetAxis", header: "ConstraintWheel2D.h".}
proc getEnableMotor*(this: ConstraintWheel2D): bool {.noSideEffect, 
    importcpp: "GetEnableMotor", header: "ConstraintWheel2D.h".}
proc getMaxMotorTorque*(this: ConstraintWheel2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxMotorTorque", header: "ConstraintWheel2D.h".}
proc getMotorSpeed*(this: ConstraintWheel2D): cfloat {.noSideEffect, 
    importcpp: "GetMotorSpeed", header: "ConstraintWheel2D.h".}
proc getFrequencyHz*(this: ConstraintWheel2D): cfloat {.noSideEffect, 
    importcpp: "GetFrequencyHz", header: "ConstraintWheel2D.h".}
proc getDampingRatio*(this: ConstraintWheel2D): cfloat {.noSideEffect, 
    importcpp: "GetDampingRatio", header: "ConstraintWheel2D.h".}