

import 
  vector3, vector4, matrix3, matrix4, quaternion, urstr

proc constructMatrix3x4*(): Matrix3x4 {.importcpp: "Urho3D::Matrix3x4(@)", 
                                        header: "Matrix3x4.h".}
proc constructMatrix3x4*(matrix: Matrix3x4): Matrix3x4 {.
    importcpp: "Urho3D::Matrix3x4(@)", header: "Matrix3x4.h".}
proc constructMatrix3x4*(matrix: Matrix3): Matrix3x4 {.
    importcpp: "Urho3D::Matrix3x4(@)", header: "Matrix3x4.h".}
proc constructMatrix3x4*(matrix: Matrix4): Matrix3x4 {.
    importcpp: "Urho3D::Matrix3x4(@)", header: "Matrix3x4.h".}
proc constructMatrix3x4*(v00: cfloat; v01: cfloat; v02: cfloat; v03: cfloat; 
                         v10: cfloat; v11: cfloat; v12: cfloat; v13: cfloat; 
                         v20: cfloat; v21: cfloat; v22: cfloat; v23: cfloat): Matrix3x4 {.
    importcpp: "Urho3D::Matrix3x4(@)", header: "Matrix3x4.h".}
proc constructMatrix3x4*(data: ptr cfloat): Matrix3x4 {.
    importcpp: "Urho3D::Matrix3x4(@)", header: "Matrix3x4.h".}
proc constructMatrix3x4*(translation: Vector3; rotation: Quaternion; 
                         scale: cfloat): Matrix3x4 {.
    importcpp: "Urho3D::Matrix3x4(@)", header: "Matrix3x4.h".}
proc constructMatrix3x4*(translation: Vector3; rotation: Quaternion; 
                         scale: Vector3): Matrix3x4 {.
    importcpp: "Urho3D::Matrix3x4(@)", header: "Matrix3x4.h".}
proc `==`*(this: Matrix3x4; rhs: Matrix3x4): bool {.noSideEffect, 
    importcpp: "# == #", header: "Matrix3x4.h".}
proc `*`*(this: Matrix3x4; rhs: Vector3): Vector3 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3x4.h".}
proc `*`*(this: Matrix3x4; rhs: Vector4): Vector3 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3x4.h".}
proc `+`*(this: Matrix3x4; rhs: Matrix3x4): Matrix3x4 {.noSideEffect, 
    importcpp: "# + #", header: "Matrix3x4.h".}
proc `-`*(this: Matrix3x4; rhs: Matrix3x4): Matrix3x4 {.noSideEffect, 
    importcpp: "# - #", header: "Matrix3x4.h".}
proc `*`*(this: Matrix3x4; rhs: cfloat): Matrix3x4 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3x4.h".}
proc `*`*(this: Matrix3x4; rhs: Matrix3x4): Matrix3x4 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3x4.h".}
proc `*`*(this: Matrix3x4; rhs: Matrix4): Matrix4 {.noSideEffect, 
    importcpp: "# * #", header: "Matrix3x4.h".}
proc setTranslation*(this: var Matrix3x4; translation: Vector3) {.
    importcpp: "SetTranslation", header: "Matrix3x4.h".}
proc setRotation*(this: var Matrix3x4; rotation: Matrix3) {.
    importcpp: "SetRotation", header: "Matrix3x4.h".}
proc setScale*(this: var Matrix3x4; scale: Vector3) {.importcpp: "SetScale", 
    header: "Matrix3x4.h".}
proc setScale*(this: var Matrix3x4; scale: cfloat) {.importcpp: "SetScale", 
    header: "Matrix3x4.h".}
proc toMatrix3*(this: Matrix3x4): Matrix3 {.noSideEffect, 
    importcpp: "ToMatrix3", header: "Matrix3x4.h".}
proc toMatrix4*(this: Matrix3x4): Matrix4 {.noSideEffect, 
    importcpp: "ToMatrix4", header: "Matrix3x4.h".}
proc rotationMatrix*(this: Matrix3x4): Matrix3 {.noSideEffect, 
    importcpp: "RotationMatrix", header: "Matrix3x4.h".}
proc translation*(this: Matrix3x4): Vector3 {.noSideEffect, 
    importcpp: "Translation", header: "Matrix3x4.h".}
proc rotation*(this: Matrix3x4): Quaternion {.noSideEffect, 
    importcpp: "Rotation", header: "Matrix3x4.h".}
proc scale*(this: Matrix3x4): Vector3 {.noSideEffect, importcpp: "Scale", 
                                        header: "Matrix3x4.h".}
proc equals*(this: Matrix3x4; rhs: Matrix3x4): bool {.noSideEffect, 
    importcpp: "Equals", header: "Matrix3x4.h".}
proc decompose*(this: Matrix3x4; translation: var Vector3; 
                rotation: var Quaternion; scale: var Vector3) {.noSideEffect, 
    importcpp: "Decompose", header: "Matrix3x4.h".}
proc inverse*(this: Matrix3x4): Matrix3x4 {.noSideEffect, importcpp: "Inverse", 
    header: "Matrix3x4.h".}
proc data*(this: Matrix3x4): ptr cfloat {.noSideEffect, importcpp: "Data", 
    header: "Matrix3x4.h".}
proc toString*(this: Matrix3x4): UrString {.noSideEffect, importcpp: "ToString", 
    header: "Matrix3x4.h".}

proc `*`*(lhs: cfloat; rhs: Matrix3x4): Matrix3x4  {.noSideEffect, importcpp: "# * #", 
    header: "Matrix3x4.h".}