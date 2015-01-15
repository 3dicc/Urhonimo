

import 
  constraint2D


type 
  ConstraintPrismatic2D* {.importc: "Urho3D::ConstraintPrismatic2D", 
                           header: "ConstraintPrismatic2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2PrismaticJointDef
    anchor* {.importc: "anchor_".}: Vector2
    axis* {.importc: "axis_".}: Vector2


proc getType*(this: ConstraintPrismatic2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ConstraintPrismatic2D.h".}
proc getBaseType*(this: ConstraintPrismatic2D): Urho3D.StringHash {.
    noSideEffect, importcpp: "GetBaseType", header: "ConstraintPrismatic2D.h".}
proc getTypeName*(this: ConstraintPrismatic2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ConstraintPrismatic2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintPrismatic2D::GetTypeStatic(@)", 
    header: "ConstraintPrismatic2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintPrismatic2D::GetTypeNameStatic(@)", 
    header: "ConstraintPrismatic2D.h".}
proc constructConstraintPrismatic2D*(scontext: ptr Context): ConstraintPrismatic2D {.
    importcpp: "Urho3D::ConstraintPrismatic2D(@)", 
    header: "ConstraintPrismatic2D.h".}
proc destroyConstraintPrismatic2D*(this: var ConstraintPrismatic2D) {.
    importcpp: "#.~ConstraintPrismatic2D()", header: "ConstraintPrismatic2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintPrismatic2D::RegisterObject(@)", 
    header: "ConstraintPrismatic2D.h".}
proc setAnchor*(this: var ConstraintPrismatic2D; anchor: Vector2) {.
    importcpp: "SetAnchor", header: "ConstraintPrismatic2D.h".}
proc setAxis*(this: var ConstraintPrismatic2D; axis: Vector2) {.
    importcpp: "SetAxis", header: "ConstraintPrismatic2D.h".}
proc setEnableLimit*(this: var ConstraintPrismatic2D; enableLimit: bool) {.
    importcpp: "SetEnableLimit", header: "ConstraintPrismatic2D.h".}
proc setLowerTranslation*(this: var ConstraintPrismatic2D; 
                          lowerTranslation: cfloat) {.
    importcpp: "SetLowerTranslation", header: "ConstraintPrismatic2D.h".}
proc setUpperTranslation*(this: var ConstraintPrismatic2D; 
                          upperTranslation: cfloat) {.
    importcpp: "SetUpperTranslation", header: "ConstraintPrismatic2D.h".}
proc setEnableMotor*(this: var ConstraintPrismatic2D; enableMotor: bool) {.
    importcpp: "SetEnableMotor", header: "ConstraintPrismatic2D.h".}
proc setMaxMotorForce*(this: var ConstraintPrismatic2D; maxMotorForce: cfloat) {.
    importcpp: "SetMaxMotorForce", header: "ConstraintPrismatic2D.h".}
proc setMotorSpeed*(this: var ConstraintPrismatic2D; motorSpeed: cfloat) {.
    importcpp: "SetMotorSpeed", header: "ConstraintPrismatic2D.h".}
proc getAnchor*(this: ConstraintPrismatic2D): Vector2 {.noSideEffect, 
    importcpp: "GetAnchor", header: "ConstraintPrismatic2D.h".}
proc getAxis*(this: ConstraintPrismatic2D): Vector2 {.noSideEffect, 
    importcpp: "GetAxis", header: "ConstraintPrismatic2D.h".}
proc getEnableLimit*(this: ConstraintPrismatic2D): bool {.noSideEffect, 
    importcpp: "GetEnableLimit", header: "ConstraintPrismatic2D.h".}
proc getLowerTranslation*(this: ConstraintPrismatic2D): cfloat {.noSideEffect, 
    importcpp: "GetLowerTranslation", header: "ConstraintPrismatic2D.h".}
proc getUpperTranslation*(this: ConstraintPrismatic2D): cfloat {.noSideEffect, 
    importcpp: "GetUpperTranslation", header: "ConstraintPrismatic2D.h".}
proc getEnableMotor*(this: ConstraintPrismatic2D): bool {.noSideEffect, 
    importcpp: "GetEnableMotor", header: "ConstraintPrismatic2D.h".}
proc getMaxMotorForce*(this: ConstraintPrismatic2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxMotorForce", header: "ConstraintPrismatic2D.h".}
proc getMotorSpeed*(this: ConstraintPrismatic2D): cfloat {.noSideEffect, 
    importcpp: "GetMotorSpeed", header: "ConstraintPrismatic2D.h".}