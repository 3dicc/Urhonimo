

import
  quaternion, vector3, vector4, matrix3, urstr

type
  Matrix3x4* {.importcpp: "Urho3D::Matrix3x4", header: "Matrix3x4.h".} = object
    m00* {.importc: "m00_".}: cfloat
    m01* {.importc: "m01_".}: cfloat
    m02* {.importc: "m02_".}: cfloat
    m03* {.importc: "m03_".}: cfloat
    m10* {.importc: "m10_".}: cfloat
    m11* {.importc: "m11_".}: cfloat
    m12* {.importc: "m12_".}: cfloat
    m13* {.importc: "m13_".}: cfloat
    m20* {.importc: "m20_".}: cfloat
    m21* {.importc: "m21_".}: cfloat
    m22* {.importc: "m22_".}: cfloat
    m23* {.importc: "m23_".}: cfloat

type
  Matrix4* {.importcpp: "Urho3D::Matrix4", header: "Matrix4.h".} = object
    m00* {.importc: "m00_".}: cfloat
    m01* {.importc: "m01_".}: cfloat
    m02* {.importc: "m02_".}: cfloat
    m03* {.importc: "m03_".}: cfloat
    m10* {.importc: "m10_".}: cfloat
    m11* {.importc: "m11_".}: cfloat
    m12* {.importc: "m12_".}: cfloat
    m13* {.importc: "m13_".}: cfloat
    m20* {.importc: "m20_".}: cfloat
    m21* {.importc: "m21_".}: cfloat
    m22* {.importc: "m22_".}: cfloat
    m23* {.importc: "m23_".}: cfloat
    m30* {.importc: "m30_".}: cfloat
    m31* {.importc: "m31_".}: cfloat
    m32* {.importc: "m32_".}: cfloat
    m33* {.importc: "m33_".}: cfloat


proc constructMatrix4*(): Matrix4 {.importcpp: "Urho3D::Matrix4(@)",
                                    header: "Matrix4.h", constructor.}
proc constructMatrix4*(matrix: Matrix4): Matrix4 {.constructor,
    importcpp: "Urho3D::Matrix4(@)", header: "Matrix4.h".}
proc constructMatrix4*(matrix: Matrix3): Matrix4 {.constructor,
    importcpp: "Urho3D::Matrix4(@)", header: "Matrix4.h".}
proc constructMatrix4*(v00: cfloat; v01: cfloat; v02: cfloat; v03: cfloat;
                       v10: cfloat; v11: cfloat; v12: cfloat; v13: cfloat;
                       v20: cfloat; v21: cfloat; v22: cfloat; v23: cfloat;
                       v30: cfloat; v31: cfloat; v32: cfloat; v33: cfloat): Matrix4 {.
    importcpp: "Urho3D::Matrix4(@)", header: "Matrix4.h", constructor.}
proc constructMatrix4*(data: ptr cfloat): Matrix4 {.constructor,
    importcpp: "Urho3D::Matrix4(@)", header: "Matrix4.h".}
proc `==`*(this: Matrix4; rhs: Matrix4): bool {.noSideEffect,
    importcpp: "(# == #)", header: "Matrix4.h".}
proc `*`*(this: Matrix4; rhs: Vector3): Vector3 {.noSideEffect,
    importcpp: "(# * #)", header: "Matrix4.h".}
proc `*`*(this: Matrix4; rhs: Vector4): Vector4 {.noSideEffect,
    importcpp: "(# * #)", header: "Matrix4.h".}
proc `+`*(this: Matrix4; rhs: Matrix4): Matrix4 {.noSideEffect,
    importcpp: "(# + #)", header: "Matrix4.h".}
proc `-`*(this: Matrix4; rhs: Matrix4): Matrix4 {.noSideEffect,
    importcpp: "(# - #)", header: "Matrix4.h".}
proc `*`*(this: Matrix4; rhs: cfloat): Matrix4 {.noSideEffect,
    importcpp: "(# * #)", header: "Matrix4.h".}
proc `*`*(this: Matrix4; rhs: Matrix4): Matrix4 {.noSideEffect,
    importcpp: "(# * #)", header: "Matrix4.h".}
proc `*`*(this: Matrix4; rhs: Matrix3x4): Matrix4 {.noSideEffect,
    importcpp: "(# * #)", header: "Matrix4.h".}
proc setTranslation*(this: var Matrix4; translation: Vector3) {.
    importcpp: "SetTranslation", header: "Matrix4.h".}
proc setRotation*(this: var Matrix4; rotation: Matrix3) {.
    importcpp: "SetRotation", header: "Matrix4.h".}
proc setScale*(this: var Matrix4; scale: Vector3) {.importcpp: "SetScale",
    header: "Matrix4.h".}
proc setScale*(this: var Matrix4; scale: cfloat) {.importcpp: "SetScale",
    header: "Matrix4.h".}
proc toMatrix3*(this: Matrix4): Matrix3 {.noSideEffect, importcpp: "ToMatrix3",
    header: "Matrix4.h".}
proc rotationMatrix*(this: Matrix4): Matrix3 {.noSideEffect,
    importcpp: "RotationMatrix", header: "Matrix4.h".}
proc translation*(this: Matrix4): Vector3 {.noSideEffect,
    importcpp: "Translation", header: "Matrix4.h".}
proc rotation*(this: Matrix4): Quaternion {.noSideEffect, importcpp: "Rotation",
    header: "Matrix4.h".}
proc scale*(this: Matrix4): Vector3 {.noSideEffect, importcpp: "Scale",
                                      header: "Matrix4.h".}
proc transpose*(this: Matrix4): Matrix4 {.noSideEffect, importcpp: "Transpose",
    header: "Matrix4.h".}
proc equals*(this: Matrix4; rhs: Matrix4): bool {.noSideEffect,
    importcpp: "Equals", header: "Matrix4.h".}
proc decompose*(this: Matrix4; translation: var Vector3;
                rotation: var Quaternion; scale: var Vector3) {.noSideEffect,
    importcpp: "Decompose", header: "Matrix4.h".}
proc inverse*(this: Matrix4): Matrix4 {.noSideEffect, importcpp: "Inverse",
                                        header: "Matrix4.h".}
proc data*(this: Matrix4): ptr cfloat {.noSideEffect, importcpp: "Data",
                                        header: "Matrix4.h".}
proc toString*(this: Matrix4): UrString {.noSideEffect, importcpp: "ToString",
    header: "Matrix4.h".}
proc bulkTranspose*(dest: ptr cfloat; src: ptr cfloat; count: cuint) {.
    importcpp: "Urho3D::Matrix4::BulkTranspose(@)", header: "Matrix4.h".}

proc `*`*(lhs: cfloat; rhs: Matrix4): Matrix4 {.
    importcpp: "(# * #)", header: "Matrix4.h".}
