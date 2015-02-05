

import 
  constraint2D


type 
  ConstraintRope2D* {.importc: "Urho3D::ConstraintRope2D", 
                      header: "ConstraintRope2D.h".} = object of Constraint2D
    jointDef* {.importc: "jointDef_".}: B2RopeJointDef
    ownerBodyAnchor* {.importc: "ownerBodyAnchor_".}: Vector2
    otherBodyAnchor* {.importc: "otherBodyAnchor_".}: Vector2


proc getType*(this: ConstraintRope2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ConstraintRope2D.h".}
proc getBaseType*(this: ConstraintRope2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ConstraintRope2D.h".}
proc getTypeName*(this: ConstraintRope2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ConstraintRope2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ConstraintRope2D::GetTypeStatic(@)", 
    header: "ConstraintRope2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ConstraintRope2D::GetTypeNameStatic(@)", 
    header: "ConstraintRope2D.h".}
proc constructConstraintRope2D*(scontext: ptr Context): ConstraintRope2D {.
    importcpp: "Urho3D::ConstraintRope2D(@)", header: "ConstraintRope2D.h".}
proc destroyConstraintRope2D*(this: var ConstraintRope2D) {.
    importcpp: "#.~ConstraintRope2D()", header: "ConstraintRope2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ConstraintRope2D::RegisterObject(@)", 
    header: "ConstraintRope2D.h".}
proc setOwnerBodyAnchor*(this: var ConstraintRope2D; anchor: Vector2) {.
    importcpp: "SetOwnerBodyAnchor", header: "ConstraintRope2D.h".}
proc setOtherBodyAnchor*(this: var ConstraintRope2D; anchor: Vector2) {.
    importcpp: "SetOtherBodyAnchor", header: "ConstraintRope2D.h".}
proc setMaxLength*(this: var ConstraintRope2D; maxLength: cfloat) {.
    importcpp: "SetMaxLength", header: "ConstraintRope2D.h".}
proc getOwnerBodyAnchor*(this: ConstraintRope2D): Vector2 {.noSideEffect, 
    importcpp: "GetOwnerBodyAnchor", header: "ConstraintRope2D.h".}
proc getOtherBodyAnchor*(this: ConstraintRope2D): Vector2 {.noSideEffect, 
    importcpp: "GetOtherBodyAnchor", header: "ConstraintRope2D.h".}
proc getMaxLength*(this: ConstraintRope2D): cfloat {.noSideEffect, 
    importcpp: "GetMaxLength", header: "ConstraintRope2D.h".}