

import
  rect, vector3, vector, plane, matrix3, matrix4, mathdefs, urstr

const NUM_FRUSTUM_PLANES*: cuint = 6
const NUM_FRUSTUM_VERTICES*: cuint = 8

type
  BoundingBox* {.importcpp: "Urho3D::BoundingBox", header: "BoundingBox.h".} = object
    min* {.importc: "min_".}: Vector3
    max* {.importc: "max_".}: Vector3
    defined* {.importc: "defined_".}: bool
  Sphere* {.importcpp: "Urho3D::Sphere", header: "Sphere.h".} = object
    center* {.importc: "center_".}: Vector3
    radius* {.importc: "radius_".}: cfloat
    defined* {.importc: "defined_".}: bool
  Polyhedron* {.importcpp: "Urho3D::Polyhedron", header: "Polyhedron.h".} = object
    faces* {.importc: "faces_".}: Vector[PODVector[Vector3]]
    clippedVertices* {.importc: "clippedVertices_".}: PODVector[Vector3]
    outFace* {.importc: "outFace_".}: PODVector[Vector3]
  FrustumPlane* {.importcpp: "Urho3D::FrustumPlane".} = enum
    PLANE_NEAR = 0, PLANE_LEFT, PLANE_RIGHT, PLANE_UP, PLANE_DOWN, PLANE_FAR
  Frustum* {.importcpp: "Urho3D::Frustum", header: "Frustum.h".} = object
    planes* {.importc: "planes_".}: array[Num_Frustum_Planes, Plane]
    vertices* {.importc: "vertices_".}: array[Num_Frustum_Vertices, Vector3]


proc constructBoundingBox*(): BoundingBox {.importcpp: "Urho3D::BoundingBox(@)",
    header: "BoundingBox.h", constructor.}
proc constructBoundingBox*(box: BoundingBox): BoundingBox {.constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc constructBoundingBox*(rect: Rect): BoundingBox {.constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc constructBoundingBox*(min: Vector3; max: Vector3): BoundingBox {.
  constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc constructBoundingBox*(min: cfloat; max: cfloat): BoundingBox {.constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc constructBoundingBox*(vertices: ptr Vector3; count: cuint): BoundingBox {.constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc constructBoundingBox*(frustum: Frustum): BoundingBox {.constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc constructBoundingBox*(poly: Polyhedron): BoundingBox {.constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc constructBoundingBox*(sphere: Sphere): BoundingBox {.constructor,
    importcpp: "Urho3D::BoundingBox(@)", header: "BoundingBox.h".}
proc `==`*(this: BoundingBox; rhs: BoundingBox): bool {.noSideEffect,
    importcpp: "# == #", header: "BoundingBox.h".}
proc define*(this: var BoundingBox; box: BoundingBox) {.importcpp: "Define",
    header: "BoundingBox.h".}
proc define*(this: var BoundingBox; rect: Rect) {.importcpp: "Define",
    header: "BoundingBox.h".}
proc define*(this: var BoundingBox; min: Vector3; max: Vector3) {.
    importcpp: "Define", header: "BoundingBox.h".}
proc define*(this: var BoundingBox; min: cfloat; max: cfloat) {.
    importcpp: "Define", header: "BoundingBox.h".}
proc define*(this: var BoundingBox; point: Vector3) {.importcpp: "Define",
    header: "BoundingBox.h".}
proc merge*(this: var BoundingBox; point: Vector3) {.importcpp: "Merge",
    header: "BoundingBox.h".}
proc merge*(this: var BoundingBox; box: BoundingBox) {.importcpp: "Merge",
    header: "BoundingBox.h".}
proc define*(this: var BoundingBox; vertices: ptr Vector3; count: cuint) {.
    importcpp: "Define", header: "BoundingBox.h".}
proc define*(this: var BoundingBox; frustum: Frustum) {.importcpp: "Define",
    header: "BoundingBox.h".}
proc define*(this: var BoundingBox; poly: Polyhedron) {.importcpp: "Define",
    header: "BoundingBox.h".}
proc define*(this: var BoundingBox; sphere: Sphere) {.importcpp: "Define",
    header: "BoundingBox.h".}
proc merge*(this: var BoundingBox; vertices: ptr Vector3; count: cuint) {.
    importcpp: "Merge", header: "BoundingBox.h".}
proc merge*(this: var BoundingBox; frustum: Frustum) {.importcpp: "Merge",
    header: "BoundingBox.h".}
proc merge*(this: var BoundingBox; poly: Polyhedron) {.importcpp: "Merge",
    header: "BoundingBox.h".}
proc merge*(this: var BoundingBox; sphere: Sphere) {.importcpp: "Merge",
    header: "BoundingBox.h".}
proc clip*(this: var BoundingBox; box: BoundingBox) {.importcpp: "Clip",
    header: "BoundingBox.h".}
proc transform*(this: var BoundingBox; transform: Matrix3) {.
    importcpp: "Transform", header: "BoundingBox.h".}
proc transform*(this: var BoundingBox; transform: Matrix3x4) {.
    importcpp: "Transform", header: "BoundingBox.h".}
proc clear*(this: var BoundingBox) {.importcpp: "Clear", header: "BoundingBox.h".}
proc center*(this: BoundingBox): Vector3 {.noSideEffect, importcpp: "Center",
    header: "BoundingBox.h".}
proc size*(this: BoundingBox): Vector3 {.noSideEffect, importcpp: "Size",
    header: "BoundingBox.h".}
proc halfSize*(this: BoundingBox): Vector3 {.noSideEffect,
    importcpp: "HalfSize", header: "BoundingBox.h".}
proc transformed*(this: BoundingBox; transform: Matrix3): BoundingBox {.
    noSideEffect, importcpp: "Transformed", header: "BoundingBox.h".}
proc transformed*(this: BoundingBox; transform: Matrix3x4): BoundingBox {.
    noSideEffect, importcpp: "Transformed", header: "BoundingBox.h".}
proc projected*(this: BoundingBox; projection: Matrix4): Rect {.noSideEffect,
    importcpp: "Projected", header: "BoundingBox.h".}
proc isInside*(this: BoundingBox; point: Vector3): Intersection {.noSideEffect,
    importcpp: "IsInside", header: "BoundingBox.h".}
proc isInside*(this: BoundingBox; box: BoundingBox): Intersection {.
    noSideEffect, importcpp: "IsInside", header: "BoundingBox.h".}
proc isInsideFast*(this: BoundingBox; box: BoundingBox): Intersection {.
    noSideEffect, importcpp: "IsInsideFast", header: "BoundingBox.h".}
proc isInside*(this: BoundingBox; sphere: Sphere): Intersection {.noSideEffect,
    importcpp: "IsInside", header: "BoundingBox.h".}
proc isInsideFast*(this: BoundingBox; sphere: Sphere): Intersection {.
    noSideEffect, importcpp: "IsInsideFast", header: "BoundingBox.h".}
proc toString*(this: BoundingBox): UrString {.noSideEffect,
    importcpp: "ToString", header: "BoundingBox.h".}
