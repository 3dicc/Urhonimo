

import 
  boundingBox, matrix4, matrix3x4, vector3, matrix3, plane, rect, mathdefs

proc constructFrustum*(): Frustum {.importcpp: "Urho3D::Frustum(@)", 
                                    header: "Frustum.h".}
proc constructFrustum*(frustum: Frustum): Frustum {.
    importcpp: "Urho3D::Frustum(@)", header: "Frustum.h".}
proc define*(this: var Frustum; fov: cfloat; aspectRatio: cfloat; zoom: cfloat; 
             nearZ: cfloat; farZ: cfloat; 
             transform: Matrix3x4) {.importcpp: "Define", 
    header: "Frustum.h".}
proc define*(this: var Frustum; near: Vector3; far: Vector3; 
             transform: Matrix3x4) {.importcpp: "Define", 
    header: "Frustum.h".}
proc define*(this: var Frustum; box: BoundingBox; 
             transform: Matrix3x4) {.importcpp: "Define", 
    header: "Frustum.h".}
proc defineOrtho*(this: var Frustum; orthoSize: cfloat; aspectRatio: cfloat; 
                  zoom: cfloat; nearZ: cfloat; farZ: cfloat; 
                  transform: Matrix3x4) {.
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