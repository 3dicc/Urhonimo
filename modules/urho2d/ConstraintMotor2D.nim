

import 
  constraint2D


type 
  ConstraintMotor2D* {.importc: "Urho3D::ConstraintMotor2D", 
                       header: "ConstraintMotor2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2MotorJointDef
    linearOffset* {.importc: "linearOffset_".}: Vector2


proc getType*(this: ConstraintMotor2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ConstraintMotor2D.h".}
proc getBaseType*(this: ConstraintMotor2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ConstraintMotor2D.h".}
proc getTypeName*(this: ConstraintMotor2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ConstraintMotor2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintMotor2D::GetTypeStatic(@)", 
    header: "ConstraintMotor2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintMotor2D::GetTypeNameStatic(@)", 
    header: "ConstraintMotor2D.h".}
proc constructConstraintMotor2D*(scontext: ptr Context): ConstraintMotor2D {.
    importcpp: "Urho3D::ConstraintMotor2D(@)", header: "ConstraintMotor2D.h".}
proc destroyConstraintMotor2D*(this: var ConstraintMotor2D) {.
    importcpp: "#.~ConstraintMotor2D()", header: "ConstraintMotor2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintMotor2D::RegisterObject(@)", 
    header: "ConstraintMotor2D.h".}
proc setLinearOffset*(this: var ConstraintMotor2D; linearOffset: Vector2) {.
    importcpp: "SetLinearOffset", header: "ConstraintMotor2D.h".}
proc setAngularOffset*(this: var ConstraintMotor2D; angularOffset: cfloat) {.
    importcpp: "SetAngularOffset", header: "ConstraintMotor2D.h".}
proc setMaxForce*(this: var ConstraintMotor2D; maxForce: cfloat) {.
    importcpp: "SetMaxForce", header: "ConstraintMotor2D.h".}
proc setMaxTorque*(this: var ConstraintMotor2D; maxTorque: cfloat) {.
    importcpp: "SetMaxTorque", header: "ConstraintMotor2D.h".}
proc setCorrectionFactor*(this: var ConstraintMotor2D; correctionFactor: cfloat) {.
    importcpp: "SetCorrectionFactor", header: "ConstraintMotor2D.h".}
proc getLinearOffset*(this: ConstraintMotor2D): Vector2 {.noSideEffect, 
    importcpp: "GetLinearOffset", header: "ConstraintMotor2D.h".}
proc getAngularOffset*(this: ConstraintMotor2D): cfloat {.noSideEffect, 
    importcpp: "GetAngularOffset", header: "ConstraintMotor2D.h".}
proc getMaxForce*(this: ConstraintMotor2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxForce", header: "ConstraintMotor2D.h".}
proc getMaxTorque*(this: ConstraintMotor2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxTorque", header: "ConstraintMotor2D.h".}
proc getCorrectionFactor*(this: ConstraintMotor2D): cfloat {.noSideEffect, 
    importcpp: "GetCorrectionFactor", header: "ConstraintMotor2D.h".}