

import 
  vector3


type 
  Vector4* {.importc: "Urho3D::Vector4", header: "Vector4.h".} = object 
    x* {.importc: "x_".}: cfloat
    y* {.importc: "y_".}: cfloat
    z* {.importc: "z_".}: cfloat
    w* {.importc: "w_".}: cfloat


proc constructVector4*(): Vector4 {.importcpp: "Urho3D::Vector4(@)", 
                                    header: "Vector4.h".}
proc constructVector4*(vector: Vector4): Vector4 {.
    importcpp: "Urho3D::Vector4(@)", header: "Vector4.h".}
proc constructVector4*(vector: Vector3; w: cfloat): Vector4 {.
    importcpp: "Urho3D::Vector4(@)", header: "Vector4.h".}
proc constructVector4*(x: cfloat; y: cfloat; z: cfloat; w: cfloat): Vector4 {.
    importcpp: "Urho3D::Vector4(@)", header: "Vector4.h".}
proc constructVector4*(data: ptr cfloat): Vector4 {.
    importcpp: "Urho3D::Vector4(@)", header: "Vector4.h".}
proc `==`*(this: Vector4; rhs: Vector4): bool {.noSideEffect, 
    importcpp: "# == #", header: "Vector4.h".}
proc `+`*(this: Vector4; rhs: Vector4): Vector4 {.noSideEffect, 
    importcpp: "# + #", header: "Vector4.h".}
proc `-`*(this: Vector4): Vector4 {.noSideEffect, importcpp: "- #", 
                                    header: "Vector4.h".}
proc `-`*(this: Vector4; rhs: Vector4): Vector4 {.noSideEffect, 
    importcpp: "# - #", header: "Vector4.h".}
proc `*`*(this: Vector4; rhs: cfloat): Vector4 {.noSideEffect, 
    importcpp: "# * #", header: "Vector4.h".}
proc `*`*(this: Vector4; rhs: Vector4): Vector4 {.noSideEffect, 
    importcpp: "# * #", header: "Vector4.h".}
proc `/`*(this: Vector4; rhs: cfloat): Vector4 {.noSideEffect, 
    importcpp: "# / #", header: "Vector4.h".}
proc `/`*(this: Vector4; rhs: Vector4): Vector4 {.noSideEffect, 
    importcpp: "# / #", header: "Vector4.h".}
proc `+=`*(this: var Vector4; rhs: Vector4) {.importcpp: "# += #", 
    header: "Vector4.h".}
proc `-=`*(this: var Vector4; rhs: Vector4) {.importcpp: "# -= #", 
    header: "Vector4.h".}
proc `*=`*(this: var Vector4; rhs: cfloat) {.importcpp: "# *= #", 
    header: "Vector4.h".}
proc `*=`*(this: var Vector4; rhs: Vector4) {.importcpp: "# *= #", 
    header: "Vector4.h".}
proc `/=`*(this: var Vector4; rhs: cfloat) {.importcpp: "# /= #", 
    header: "Vector4.h".}
proc `/=`*(this: var Vector4; rhs: Vector4) {.importcpp: "# /= #", 
    header: "Vector4.h".}
proc dotProduct*(this: Vector4; rhs: Vector4): cfloat {.noSideEffect, 
    importcpp: "DotProduct", header: "Vector4.h".}
proc absDotProduct*(this: Vector4; rhs: Vector4): cfloat {.noSideEffect, 
    importcpp: "AbsDotProduct", header: "Vector4.h".}
proc abs*(this: Vector4): Vector4 {.noSideEffect, importcpp: "Abs", 
                                    header: "Vector4.h".}
proc lerp*(this: Vector4; rhs: Vector4; t: cfloat): Vector4 {.noSideEffect, 
    importcpp: "Lerp", header: "Vector4.h".}
proc equals*(this: Vector4; rhs: Vector4): bool {.noSideEffect, 
    importcpp: "Equals", header: "Vector4.h".}
proc isNaN*(this: Vector4): bool {.noSideEffect, importcpp: "IsNaN", 
                                   header: "Vector4.h".}
proc data*(this: Vector4): ptr cfloat {.noSideEffect, importcpp: "Data", 
                                        header: "Vector4.h".}
proc toString*(this: Vector4): UrString {.noSideEffect, importcpp: "ToString", 
    header: "Vector4.h".}

proc **(lhs: cfloat; rhs: Vector4): Vector4 {.inline.}