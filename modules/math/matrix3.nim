

import 
  vector3, urstr


type 
  Matrix3* {.importc: "Urho3D::Matrix3", header: "Matrix3.h".} = object 
    m00* {.importc: "m00_".}: cfloat
    m01* {.importc: "m01_".}: cfloat
    m02* {.importc: "m02_".}: cfloat
    m10* {.importc: "m10_".}: cfloat
    m11* {.importc: "m11_".}: cfloat
    m12* {.importc: "m12_".}: cfloat
    m20* {.importc: "m20_".}: cfloat
    m21* {.importc: "m21_".}: cfloat
    m22* {.importc: "m22_".}: cfloat


proc constructMatrix3*(): Matrix3 {.importcpp: "Urho3D::Matrix3(@)", 
                                    header: "Matrix3.h".}
proc constructMatrix3*(matrix: Matrix3): Matrix3 {.
    importcpp: "Urho3D::Matrix3(@)", header: "Matrix3.h".}
proc constructMatrix3*(v00: cfloat; v01: cfloat; v02: cfloat; v10: cfloat; 
                       v11: cfloat; v12: cfloat; v20: cfloat; v21: cfloat; 
                       v22: cfloat): Matrix3 {.importcpp: "Urho3D::Matrix3(@)", 
    header: "Matrix3.h".}
proc constructMatrix3*(data: ptr cfloat): Matrix3 {.
    importcpp: "Urho3D::Matrix3(@)", header: "Matrix3.h".}
proc `==`*(this: Matrix3; rhs: Matrix3): bool {.noSideEffect, 
    importcpp: "# == #", header: "Matrix3.h".}
proc `*`*(this: Matrix3; rhs: Vector3): Vector3 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3.h".}
proc `+`*(this: Matrix3; rhs: Matrix3): Matrix3 {.noSideEffect, 
    importcpp: "# + #", header: "Matrix3.h".}
proc `-`*(this: Matrix3; rhs: Matrix3): Matrix3 {.noSideEffect, 
    importcpp: "# - #", header: "Matrix3.h".}
proc `*`*(this: Matrix3; rhs: cfloat): Matrix3 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3.h".}
proc `*`*(this: Matrix3; rhs: Matrix3): Matrix3 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3.h".}
proc setScale*(this: var Matrix3; scale: Vector3) {.importcpp: "SetScale", 
    header: "Matrix3.h".}
proc setScale*(this: var Matrix3; scale: cfloat) {.importcpp: "SetScale", 
    header: "Matrix3.h".}
proc scale*(this: Matrix3): Vector3 {.noSideEffect, importcpp: "Scale", 
                                      header: "Matrix3.h".}
proc transpose*(this: Matrix3): Matrix3 {.noSideEffect, importcpp: "Transpose", 
    header: "Matrix3.h".}
proc scaled*(this: Matrix3; scale: Vector3): Matrix3 {.noSideEffect, 
    importcpp: "Scaled", header: "Matrix3.h".}
proc equals*(this: Matrix3; rhs: Matrix3): bool {.noSideEffect, 
    importcpp: "Equals", header: "Matrix3.h".}
proc inverse*(this: Matrix3): Matrix3 {.noSideEffect, importcpp: "Inverse", 
                                        header: "Matrix3.h".}
proc data*(this: Matrix3): ptr cfloat {.noSideEffect, importcpp: "Data", 
                                        header: "Matrix3.h".}
proc toString*(this: Matrix3): UrString {.noSideEffect, importcpp: "ToString", 
    header: "Matrix3.h".}
proc bulkTranspose*(dest: ptr cfloat; src: ptr cfloat; count: cuint) {.
    importcpp: "Urho3D::Matrix3::BulkTranspose(@)", header: "Matrix3.h".}

proc `*`*(lhs: cfloat; rhs: Matrix3): Matrix3 {.
    importcpp: "# * #", header: "Matrix3.h".}