

import 
  constraint2D


type 
  ConstraintPulley2D* {.importc: "Urho3D::ConstraintPulley2D", 
                        header: "ConstraintPulley2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2PulleyJointDef
    ownerBodyGroundAnchor* {.importc: "ownerBodyGroundAnchor_".}: Vector2
    otherBodyGroundAnchor* {.importc: "otherBodyGroundAnchor_".}: Vector2
    ownerBodyAnchor* {.importc: "ownerBodyAnchor_".}: Vector2
    otherBodyAnchor* {.importc: "otherBodyAnchor_".}: Vector2


proc getType*(this: ConstraintPulley2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ConstraintPulley2D.h".}
proc getBaseType*(this: ConstraintPulley2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ConstraintPulley2D.h".}
proc getTypeName*(this: ConstraintPulley2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ConstraintPulley2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintPulley2D::GetTypeStatic(@)", 
    header: "ConstraintPulley2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintPulley2D::GetTypeNameStatic(@)", 
    header: "ConstraintPulley2D.h".}
proc constructConstraintPulley2D*(scontext: ptr Context): ConstraintPulley2D {.
    importcpp: "Urho3D::ConstraintPulley2D(@)", header: "ConstraintPulley2D.h".}
proc destroyConstraintPulley2D*(this: var ConstraintPulley2D) {.
    importcpp: "#.~ConstraintPulley2D()", header: "ConstraintPulley2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintPulley2D::RegisterObject(@)", 
    header: "ConstraintPulley2D.h".}
proc setOwnerBodyGroundAnchor*(this: var ConstraintPulley2D; 
                               groundAnchor: Vector2) {.
    importcpp: "SetOwnerBodyGroundAnchor", header: "ConstraintPulley2D.h".}
proc setOtherBodyGroundAnchor*(this: var ConstraintPulley2D; 
                               groundAnchor: Vector2) {.
    importcpp: "SetOtherBodyGroundAnchor", header: "ConstraintPulley2D.h".}
proc setOwnerBodyAnchor*(this: var ConstraintPulley2D; anchor: Vector2) {.
    importcpp: "SetOwnerBodyAnchor", header: "ConstraintPulley2D.h".}
proc setOtherBodyAnchor*(this: var ConstraintPulley2D; anchor: Vector2) {.
    importcpp: "SetOtherBodyAnchor", header: "ConstraintPulley2D.h".}
proc setRatio*(this: var ConstraintPulley2D; ratio: cfloat) {.
    importcpp: "SetRatio", header: "ConstraintPulley2D.h".}
proc getOwnerBodyGroundAnchor*(this: ConstraintPulley2D): Vector2 {.
    noSideEffect, importcpp: "GetOwnerBodyGroundAnchor", 
    header: "ConstraintPulley2D.h".}
proc getOtherBodyGroundAnchor*(this: ConstraintPulley2D): Vector2 {.
    noSideEffect, importcpp: "GetOtherBodyGroundAnchor", 
    header: "ConstraintPulley2D.h".}
proc getOwnerBodyAnchor*(this: ConstraintPulley2D): Vector2 {.noSideEffect, 
    importcpp: "GetOwnerBodyAnchor", header: "ConstraintPulley2D.h".}
proc getOtherBodyAnchor*(this: ConstraintPulley2D): Vector2 {.noSideEffect, 
    importcpp: "GetOtherBodyAnchor", header: "ConstraintPulley2D.h".}
proc getRatio*(this: ConstraintPulley2D): cfloat {.noSideEffect, 
    importcpp: "GetRatio", header: "ConstraintPulley2D.h".}