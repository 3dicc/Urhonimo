

import
  constraint2D


type
  ConstraintRevolute2D* {.importcpp: "Urho3D::ConstraintRevolute2D",
                          header: "ConstraintRevolute2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2RevoluteJointDef
    anchor* {.importc: "anchor_".}: Vector2


proc getType*(this: ConstraintRevolute2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "ConstraintRevolute2D.h".}
proc getBaseType*(this: ConstraintRevolute2D): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ConstraintRevolute2D.h".}
proc getTypeName*(this: ConstraintRevolute2D): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ConstraintRevolute2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintRevolute2D::GetTypeStatic(@)",
    header: "ConstraintRevolute2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintRevolute2D::GetTypeNameStatic(@)",
    header: "ConstraintRevolute2D.h".}
proc constructConstraintRevolute2D*(scontext: ptr Context): ConstraintRevolute2D {.
    importcpp: "Urho3D::ConstraintRevolute2D(@)",
    header: "ConstraintRevolute2D.h", constructor.}
proc destroyConstraintRevolute2D*(this: var ConstraintRevolute2D) {.
    importcpp: "#.~ConstraintRevolute2D()", header: "ConstraintRevolute2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintRevolute2D::RegisterObject(@)",
    header: "ConstraintRevolute2D.h".}
proc setAnchor*(this: var ConstraintRevolute2D; anchor: Vector2) {.
    importcpp: "SetAnchor", header: "ConstraintRevolute2D.h".}
proc setEnableLimit*(this: var ConstraintRevolute2D; enableLimit: bool) {.
    importcpp: "SetEnableLimit", header: "ConstraintRevolute2D.h".}
proc setLowerAngle*(this: var ConstraintRevolute2D; lowerAngle: cfloat) {.
    importcpp: "SetLowerAngle", header: "ConstraintRevolute2D.h".}
proc setUpperAngle*(this: var ConstraintRevolute2D; upperAngle: cfloat) {.
    importcpp: "SetUpperAngle", header: "ConstraintRevolute2D.h".}
proc setEnableMotor*(this: var ConstraintRevolute2D; enableMotor: bool) {.
    importcpp: "SetEnableMotor", header: "ConstraintRevolute2D.h".}
proc setMotorSpeed*(this: var ConstraintRevolute2D; motorSpeed: cfloat) {.
    importcpp: "SetMotorSpeed", header: "ConstraintRevolute2D.h".}
proc setMaxMotorTorque*(this: var ConstraintRevolute2D; maxMotorTorque: cfloat) {.
    importcpp: "SetMaxMotorTorque", header: "ConstraintRevolute2D.h".}
proc getAnchor*(this: ConstraintRevolute2D): Vector2 {.noSideEffect,
    importcpp: "GetAnchor", header: "ConstraintRevolute2D.h".}
proc getEnableLimit*(this: ConstraintRevolute2D): bool {.noSideEffect,
    importcpp: "GetEnableLimit", header: "ConstraintRevolute2D.h".}
proc getLowerAngle*(this: ConstraintRevolute2D): cfloat {.noSideEffect,
    importcpp: "GetLowerAngle", header: "ConstraintRevolute2D.h".}
proc getUpperAngle*(this: ConstraintRevolute2D): cfloat {.noSideEffect,
    importcpp: "GetUpperAngle", header: "ConstraintRevolute2D.h".}
proc getEnableMotor*(this: ConstraintRevolute2D): bool {.noSideEffect,
    importcpp: "GetEnableMotor", header: "ConstraintRevolute2D.h".}
proc getMotorSpeed*(this: ConstraintRevolute2D): cfloat {.noSideEffect,
    importcpp: "GetMotorSpeed", header: "ConstraintRevolute2D.h".}
proc getMaxMotorTorque*(this: ConstraintRevolute2D): cfloat {.noSideEffect,
    importcpp: "GetMaxMotorTorque", header: "ConstraintRevolute2D.h".}
