

import 
  boundingBox, matrix3x4, plane, rect, sphere


type 
  FrustumPlane* = enum 
    PLANE_NEAR = 0, PLANE_LEFT, PLANE_RIGHT, PLANE_UP, PLANE_DOWN, PLANE_FAR


var NUM_FRUSTUM_PLANES* {.importc: "NUM_FRUSTUM_PLANES", header: "Frustum.h".}: cuint = 6

var NUM_FRUSTUM_VERTICES* {.importc: "NUM_FRUSTUM_VERTICES", header: "Frustum.h".}: cuint = 8


type 
  Frustum* {.importc: "Urho3D::Frustum", header: "Frustum.h".} = object 
    planes* {.importc: "planes_".}: array[num_Frustum_Planes, Plane]
    vertices* {.importc: "vertices_".}: array[num_Frustum_Vertices, Vector3]


proc constructFrustum*(): Frustum {.importcpp: "Urho3D::Frustum(@)", 
                                    header: "Frustum.h".}
proc constructFrustum*(frustum: Frustum): Frustum {.
    importcpp: "Urho3D::Frustum(@)", header: "Frustum.h".}
proc define*(this: var Frustum; fov: cfloat; aspectRatio: cfloat; zoom: cfloat; 
             nearZ: cfloat; farZ: cfloat; 
             transform: Matrix3x4 = matrix3x4.identity) {.importcpp: "Define", 
    header: "Frustum.h".}
proc define*(this: var Frustum; near: Vector3; far: Vector3; 
             transform: Matrix3x4 = matrix3x4.identity) {.importcpp: "Define", 
    header: "Frustum.h".}
proc define*(this: var Frustum; box: BoundingBox; 
             transform: Matrix3x4 = matrix3x4.identity) {.importcpp: "Define", 
    header: "Frustum.h".}
proc defineOrtho*(this: var Frustum; orthoSize: cfloat; aspectRatio: cfloat; 
                  zoom: cfloat; nearZ: cfloat; farZ: cfloat; 
                  transform: Matrix3x4 = matrix3x4.identity) {.
    importcpp: "DefineOrtho", header: "Frustum.h".}
proc transform*(this: var Frustum; transform: Matrix3) {.importcpp: "Transform", 
    header: "Frustum.h".}
proc transform*(this: var Frustum; transform: Matrix3x4) {.
    importcpp: "Transform", header: "Frustum.h".}
proc isInside*(this: Frustum; point: Vector3): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Frustum.h".}
proc isInside*(this: Frustum; sphere: Sphere): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Frustum.h".}
proc isInsideFast*(this: Frustum; sphere: Sphere): Intersection {.noSideEffect, 
    importcpp: "IsInsideFast", header: "Frustum.h".}
proc isInside*(this: Frustum; box: BoundingBox): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Frustum.h".}
proc isInsideFast*(this: Frustum; box: BoundingBox): Intersection {.
    noSideEffect, importcpp: "IsInsideFast", header: "Frustum.h".}
proc distance*(this: Frustum; point: Vector3): cfloat {.noSideEffect, 
    importcpp: "Distance", header: "Frustum.h".}
proc transformed*(this: Frustum; transform: Matrix3): Frustum {.noSideEffect, 
    importcpp: "Transformed", header: "Frustum.h".}
proc transformed*(this: Frustum; transform: Matrix3x4): Frustum {.noSideEffect, 
    importcpp: "Transformed", header: "Frustum.h".}
proc projected*(this: Frustum; transform: Matrix4): Rect {.noSideEffect, 
    importcpp: "Projected", header: "Frustum.h".}
proc updatePlanes*(this: var Frustum) {.importcpp: "UpdatePlanes", 
                                        header: "Frustum.h".}