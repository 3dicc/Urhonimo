

import 
  vector3, matrix4, boundingbox, plane

discard "forward decl of BoundingBox"
discard "forward decl of Frustum"
discard "forward decl of Plane"
discard "forward decl of Sphere"
type 
  Ray* {.importc: "Urho3D::Ray", header: "Ray.h".} = object 
    origin* {.importc: "origin_".}: Vector3
    direction* {.importc: "direction_".}: Vector3


proc constructRay*(): Ray {.importcpp: "Urho3D::Ray(@)", header: "Ray.h".}
proc constructRay*(origin: Vector3; direction: Vector3): Ray {.
    importcpp: "Urho3D::Ray(@)", header: "Ray.h".}
proc constructRay*(ray: Ray): Ray {.importcpp: "Urho3D::Ray(@)", header: "Ray.h".}
proc `==`*(this: Ray; rhs: Ray): bool {.noSideEffect, importcpp: "# == #", 
                                        header: "Ray.h".}
proc define*(this: var Ray; origin: Vector3; direction: Vector3) {.
    importcpp: "Define", header: "Ray.h".}
proc project*(this: Ray; point: Vector3): Vector3 {.noSideEffect, 
    importcpp: "Project", header: "Ray.h".}
proc distance*(this: Ray; point: Vector3): cfloat {.noSideEffect, 
    importcpp: "Distance", header: "Ray.h".}
proc closestPoint*(this: Ray; ray: Ray): Vector3 {.noSideEffect, 
    importcpp: "ClosestPoint", header: "Ray.h".}
proc hitDistance*(this: Ray; plane: Plane): cfloat {.noSideEffect, 
    importcpp: "HitDistance", header: "Ray.h".}
proc hitDistance*(this: Ray; box: BoundingBox): cfloat {.noSideEffect, 
    importcpp: "HitDistance", header: "Ray.h".}
proc hitDistance*(this: Ray; frustum: Frustum; solidInside: bool = true): cfloat {.
    noSideEffect, importcpp: "HitDistance", header: "Ray.h".}
proc hitDistance*(this: Ray; sphere: Sphere): cfloat {.noSideEffect, 
    importcpp: "HitDistance", header: "Ray.h".}
proc hitDistance*(this: Ray; v0: Vector3; v1: Vector3; v2: Vector3): cfloat {.
    noSideEffect, importcpp: "HitDistance", header: "Ray.h".}
proc hitDistance*(this: Ray; v0: Vector3; v1: Vector3; v2: Vector3; 
                  outNormal: ptr Vector3): cfloat {.noSideEffect, 
    importcpp: "HitDistance", header: "Ray.h".}
proc hitDistance*(this: Ray; vertexData: pointer; vertexSize: cuint; 
                  vertexStart: cuint; vertexCount: cuint; 
                  outNormal: ptr Vector3 = nil): cfloat {.noSideEffect, 
    importcpp: "HitDistance", header: "Ray.h".}
proc hitDistance*(this: Ray; vertexData: pointer; vertexSize: cuint; 
                  indexData: pointer; indexSize: cuint; indexStart: cuint; 
                  indexCount: cuint; outNormal: ptr Vector3 = nil): cfloat {.
    noSideEffect, importcpp: "HitDistance", header: "Ray.h".}
proc insideGeometry*(this: Ray; vertexData: pointer; vertexSize: cuint; 
                     vertexStart: cuint; vertexCount: cuint): bool {.
    noSideEffect, importcpp: "InsideGeometry", header: "Ray.h".}
proc insideGeometry*(this: Ray; vertexData: pointer; vertexSize: cuint; 
                     indexData: pointer; indexSize: cuint; indexStart: cuint; 
                     indexCount: cuint): bool {.noSideEffect, 
    importcpp: "InsideGeometry", header: "Ray.h".}
proc transformed*(this: Ray; transform: Matrix3x4): Ray {.noSideEffect, 
    importcpp: "Transformed", header: "Ray.h".}