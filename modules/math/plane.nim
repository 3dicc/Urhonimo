

import 
  vector3, vector4, matrix3, matrix4


type 
  Plane* {.importc: "Urho3D::Plane", header: "Plane.h".} = object 
    normal* {.importc: "normal_".}: Vector3
    absNormal* {.importc: "absNormal_".}: Vector3
    d* {.importc: "d_".}: cfloat


proc constructPlane*(): Plane {.importcpp: "Urho3D::Plane(@)", header: "Plane.h".}
proc constructPlane*(plane: Plane): Plane {.importcpp: "Urho3D::Plane(@)", 
    header: "Plane.h".}
proc constructPlane*(v0: Vector3; v1: Vector3; v2: Vector3): Plane {.
    importcpp: "Urho3D::Plane(@)", header: "Plane.h".}
proc constructPlane*(normal: Vector3; point: Vector3): Plane {.
    importcpp: "Urho3D::Plane(@)", header: "Plane.h".}
proc constructPlane*(plane: Vector4): Plane {.importcpp: "Urho3D::Plane(@)", 
    header: "Plane.h".}
proc define*(this: var Plane; v0: Vector3; v1: Vector3; v2: Vector3) {.
    importcpp: "Define", header: "Plane.h".}
proc define*(this: var Plane; normal: Vector3; point: Vector3) {.
    importcpp: "Define", header: "Plane.h".}
proc define*(this: var Plane; plane: Vector4) {.importcpp: "Define", 
    header: "Plane.h".}
proc transform*(this: var Plane; transform: Matrix3) {.importcpp: "Transform", 
    header: "Plane.h".}
proc transform*(this: var Plane; transform: Matrix3x4) {.importcpp: "Transform", 
    header: "Plane.h".}
proc transform*(this: var Plane; transform: Matrix4) {.importcpp: "Transform", 
    header: "Plane.h".}
proc project*(this: Plane; point: Vector3): Vector3 {.noSideEffect, 
    importcpp: "Project", header: "Plane.h".}
proc distance*(this: Plane; point: Vector3): cfloat {.noSideEffect, 
    importcpp: "Distance", header: "Plane.h".}
proc reflect*(this: Plane; direction: Vector3): Vector3 {.noSideEffect, 
    importcpp: "Reflect", header: "Plane.h".}
proc reflectionMatrix*(this: Plane): Matrix3x4 {.noSideEffect, 
    importcpp: "ReflectionMatrix", header: "Plane.h".}
proc transformed*(this: Plane; transform: Matrix3): Plane {.noSideEffect, 
    importcpp: "Transformed", header: "Plane.h".}
proc transformed*(this: Plane; transform: Matrix3x4): Plane {.noSideEffect, 
    importcpp: "Transformed", header: "Plane.h".}
proc transformed*(this: Plane; transform: Matrix4): Plane {.noSideEffect, 
    importcpp: "Transformed", header: "Plane.h".}
proc toVector4*(this: Plane): Vector4 {.noSideEffect, importcpp: "ToVector4", 
                                        header: "Plane.h".}