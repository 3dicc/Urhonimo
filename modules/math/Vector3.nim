

import 
  vector2


type 
  Vector3* {.importc: "Urho3D::Vector3", header: "Vector3.h".} = object 
    x* {.importc: "x_".}: cfloat
    y* {.importc: "y_".}: cfloat
    z* {.importc: "z_".}: cfloat


proc constructVector3*(): Vector3 {.importcpp: "Urho3D::Vector3(@)", 
                                    header: "Vector3.h".}
proc constructVector3*(vector: Vector3): Vector3 {.
    importcpp: "Urho3D::Vector3(@)", header: "Vector3.h".}
proc constructVector3*(vector: Vector2; z: cfloat): Vector3 {.
    importcpp: "Urho3D::Vector3(@)", header: "Vector3.h".}
proc constructVector3*(vector: Vector2): Vector3 {.
    importcpp: "Urho3D::Vector3(@)", header: "Vector3.h".}
proc constructVector3*(x: cfloat; y: cfloat; z: cfloat): Vector3 {.
    importcpp: "Urho3D::Vector3(@)", header: "Vector3.h".}
proc constructVector3*(x: cfloat; y: cfloat): Vector3 {.
    importcpp: "Urho3D::Vector3(@)", header: "Vector3.h".}
proc constructVector3*(data: ptr cfloat): Vector3 {.
    importcpp: "Urho3D::Vector3(@)", header: "Vector3.h".}
proc `==`*(this: Vector3; rhs: Vector3): bool {.noSideEffect, 
    importcpp: "# == #", header: "Vector3.h".}
proc `+`*(this: Vector3; rhs: Vector3): Vector3 {.noSideEffect, 
    importcpp: "# + #", header: "Vector3.h".}
proc `-`*(this: Vector3): Vector3 {.noSideEffect, importcpp: "- #", 
                                    header: "Vector3.h".}
proc `-`*(this: Vector3; rhs: Vector3): Vector3 {.noSideEffect, 
    importcpp: "# - #", header: "Vector3.h".}
proc `*`*(this: Vector3; rhs: cfloat): Vector3 {.noSideEffect, 
    importcpp: "# * #", header: "Vector3.h".}
proc `*`*(this: Vector3; rhs: Vector3): Vector3 {.noSideEffect, 
    importcpp: "# * #", header: "Vector3.h".}
proc `/`*(this: Vector3; rhs: cfloat): Vector3 {.noSideEffect, 
    importcpp: "# / #", header: "Vector3.h".}
proc `/`*(this: Vector3; rhs: Vector3): Vector3 {.noSideEffect, 
    importcpp: "# / #", header: "Vector3.h".}
proc `+=`*(this: var Vector3; rhs: Vector3) {.importcpp: "# += #", 
    header: "Vector3.h".}
proc `-=`*(this: var Vector3; rhs: Vector3) {.importcpp: "# -= #", 
    header: "Vector3.h".}
proc `*=`*(this: var Vector3; rhs: cfloat) {.importcpp: "# *= #", 
    header: "Vector3.h".}
proc `*=`*(this: var Vector3; rhs: Vector3) {.importcpp: "# *= #", 
    header: "Vector3.h".}
proc `/=`*(this: var Vector3; rhs: cfloat) {.importcpp: "# /= #", 
    header: "Vector3.h".}
proc `/=`*(this: var Vector3; rhs: Vector3) {.importcpp: "# /= #", 
    header: "Vector3.h".}
proc normalize*(this: var Vector3) {.importcpp: "Normalize", header: "Vector3.h".}
proc length*(this: Vector3): cfloat {.noSideEffect, importcpp: "Length", 
                                      header: "Vector3.h".}
proc lengthSquared*(this: Vector3): cfloat {.noSideEffect, 
    importcpp: "LengthSquared", header: "Vector3.h".}
proc dotProduct*(this: Vector3; rhs: Vector3): cfloat {.noSideEffect, 
    importcpp: "DotProduct", header: "Vector3.h".}
proc absDotProduct*(this: Vector3; rhs: Vector3): cfloat {.noSideEffect, 
    importcpp: "AbsDotProduct", header: "Vector3.h".}
proc crossProduct*(this: Vector3; rhs: Vector3): Vector3 {.noSideEffect, 
    importcpp: "CrossProduct", header: "Vector3.h".}
proc abs*(this: Vector3): Vector3 {.noSideEffect, importcpp: "Abs", 
                                    header: "Vector3.h".}
proc lerp*(this: Vector3; rhs: Vector3; t: cfloat): Vector3 {.noSideEffect, 
    importcpp: "Lerp", header: "Vector3.h".}
proc equals*(this: Vector3; rhs: Vector3): bool {.noSideEffect, 
    importcpp: "Equals", header: "Vector3.h".}
proc angle*(this: Vector3; rhs: Vector3): cfloat {.noSideEffect, 
    importcpp: "Angle", header: "Vector3.h".}
proc isNaN*(this: Vector3): bool {.noSideEffect, importcpp: "IsNaN", 
                                   header: "Vector3.h".}
proc normalized*(this: Vector3): Vector3 {.noSideEffect, 
    importcpp: "Normalized", header: "Vector3.h".}
proc data*(this: Vector3): ptr cfloat {.noSideEffect, importcpp: "Data", 
                                        header: "Vector3.h".}
proc toString*(this: Vector3): UrString {.noSideEffect, importcpp: "ToString", 
    header: "Vector3.h".}

proc **(lhs: cfloat; rhs: Vector3): Vector3 {.inline.}