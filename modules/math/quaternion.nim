

import
  matrix3, vector3, urstr


type
  Quaternion* {.importc: "Urho3D::Quaternion", header: "Quaternion.h".} = object
    w* {.importc: "w_".}: cfloat
    x* {.importc: "x_".}: cfloat
    y* {.importc: "y_".}: cfloat
    z* {.importc: "z_".}: cfloat

var Identity* {.importc: "Urho3D::Quaternion::IDENTITY",
                header: "Quaternion.h".}: Quaternion

proc constructQuaternion*(): Quaternion {.importcpp: "Urho3D::Quaternion(@)",
    header: "Quaternion.h".}
proc constructQuaternion*(quat: Quaternion): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(w: cfloat; x: cfloat; y: cfloat; z: cfloat): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(data: ptr cfloat): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(angle: cfloat; axis: Vector3): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(angle: cfloat): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(x: cfloat; y: cfloat; z: cfloat): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(start: Vector3; `end`: Vector3): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(xAxis: Vector3; yAxis: Vector3; zAxis: Vector3): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc constructQuaternion*(matrix: Matrix3): Quaternion {.
    importcpp: "Urho3D::Quaternion(@)", header: "Quaternion.h".}
proc `+=`*(this: var Quaternion; rhs: Quaternion) {.importcpp: "(# += #)",
    header: "Quaternion.h".}
proc `*=`*(this: var Quaternion; rhs: cfloat) {.importcpp: "(# *= #)",
    header: "Quaternion.h".}
proc `==`*(this: Quaternion; rhs: Quaternion): bool {.noSideEffect,
    importcpp: "(# == #)", header: "Quaternion.h".}
proc `*`*(this: Quaternion; rhs: cfloat): Quaternion {.noSideEffect,
    importcpp: "(# * #)", header: "Quaternion.h".}
proc `-`*(this: Quaternion): Quaternion {.noSideEffect, importcpp: "(- #)",
    header: "Quaternion.h".}
proc `+`*(this: Quaternion; rhs: Quaternion): Quaternion {.noSideEffect,
    importcpp: "(# + #)", header: "Quaternion.h".}
proc `-`*(this: Quaternion; rhs: Quaternion): Quaternion {.noSideEffect,
    importcpp: "(# - #)", header: "Quaternion.h".}
proc `*`*(this: Quaternion; rhs: Quaternion): Quaternion {.noSideEffect,
    importcpp: "(# * #)", header: "Quaternion.h".}
proc `*`*(this: Quaternion; rhs: Vector3): Vector3 {.noSideEffect,
    importcpp: "(# * #)", header: "Quaternion.h".}
proc fromAngleAxis*(this: var Quaternion; angle: cfloat; axis: Vector3) {.
    importcpp: "FromAngleAxis", header: "Quaternion.h".}
proc fromEulerAngles*(this: var Quaternion; x: cfloat; y: cfloat; z: cfloat) {.
    importcpp: "FromEulerAngles", header: "Quaternion.h".}
proc fromRotationTo*(this: var Quaternion; start: Vector3; `end`: Vector3) {.
    importcpp: "FromRotationTo", header: "Quaternion.h".}
proc fromAxes*(this: var Quaternion; xAxis: Vector3; yAxis: Vector3;
               zAxis: Vector3) {.importcpp: "FromAxes", header: "Quaternion.h".}
proc fromRotationMatrix*(this: var Quaternion; matrix: Matrix3) {.
    importcpp: "FromRotationMatrix", header: "Quaternion.h".}
proc fromLookRotation*(this: var Quaternion; direction: Vector3;
                       up: Vector3 = vector3.UP): bool {.
    importcpp: "FromLookRotation", header: "Quaternion.h".}
proc normalize*(this: var Quaternion) {.importcpp: "Normalize",
                                        header: "Quaternion.h".}
proc normalized*(this: Quaternion): Quaternion {.noSideEffect,
    importcpp: "Normalized", header: "Quaternion.h".}
proc inverse*(this: Quaternion): Quaternion {.noSideEffect,
    importcpp: "Inverse", header: "Quaternion.h".}
proc lengthSquared*(this: Quaternion): cfloat {.noSideEffect,
    importcpp: "LengthSquared", header: "Quaternion.h".}
proc dotProduct*(this: Quaternion; rhs: Quaternion): cfloat {.noSideEffect,
    importcpp: "DotProduct", header: "Quaternion.h".}
proc equals*(this: Quaternion; rhs: Quaternion): bool {.noSideEffect,
    importcpp: "Equals", header: "Quaternion.h".}
proc isNaN*(this: Quaternion): bool {.noSideEffect, importcpp: "IsNaN",
                                      header: "Quaternion.h".}
proc conjugate*(this: Quaternion): Quaternion {.noSideEffect,
    importcpp: "Conjugate", header: "Quaternion.h".}
proc eulerAngles*(this: Quaternion): Vector3 {.noSideEffect,
    importcpp: "EulerAngles", header: "Quaternion.h".}
proc yawAngle*(this: Quaternion): cfloat {.noSideEffect, importcpp: "YawAngle",
    header: "Quaternion.h".}
proc pitchAngle*(this: Quaternion): cfloat {.noSideEffect,
    importcpp: "PitchAngle", header: "Quaternion.h".}
proc rollAngle*(this: Quaternion): cfloat {.noSideEffect,
    importcpp: "RollAngle", header: "Quaternion.h".}
proc rotationMatrix*(this: Quaternion): Matrix3 {.noSideEffect,
    importcpp: "RotationMatrix", header: "Quaternion.h".}
proc slerp*(this: Quaternion; rhs: Quaternion; t: cfloat): Quaternion {.
    noSideEffect, importcpp: "Slerp", header: "Quaternion.h".}
proc nlerp*(this: Quaternion; rhs: Quaternion; t: cfloat;
            shortestPath: bool = false): Quaternion {.noSideEffect,
    importcpp: "Nlerp", header: "Quaternion.h".}
proc data*(this: Quaternion): ptr cfloat {.noSideEffect, importcpp: "Data",
    header: "Quaternion.h".}
proc toString*(this: Quaternion): UrString {.noSideEffect,
    importcpp: "ToString", header: "Quaternion.h".}
