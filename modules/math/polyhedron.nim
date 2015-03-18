

import
  vector3, vector, boundingbox, frustum, matrix3, matrix4, plane

discard "forward decl of BoundingBox"
discard "forward decl of Frustum"
discard "forward decl of Matrix3"
discard "forward decl of Matrix3x4"
discard "forward decl of Plane"

proc constructPolyhedron*(): Polyhedron {.importcpp: "Urho3D::Polyhedron(@)",
    header: "Polyhedron.h", constructor.}
proc constructPolyhedron*(polyhedron: Polyhedron): Polyhedron {.constructor,
    importcpp: "Urho3D::Polyhedron(@)", header: "Polyhedron.h".}
proc constructPolyhedron*(faces: Vector[PODVector[Vector3]]): Polyhedron {.
    importcpp: "Urho3D::Polyhedron(@)", header: "Polyhedron.h", constructor.}
proc constructPolyhedron*(box: BoundingBox): Polyhedron {.
    importcpp: "Urho3D::Polyhedron(@)", header: "Polyhedron.h", constructor.}
proc constructPolyhedron*(frustum: Frustum): Polyhedron {.
    importcpp: "Urho3D::Polyhedron(@)", header: "Polyhedron.h", constructor.}
proc destroyPolyhedron*(this: var Polyhedron) {.importcpp: "#.~Polyhedron()",
    header: "Polyhedron.h".}
proc define*(this: var Polyhedron; box: BoundingBox) {.importcpp: "Define",
    header: "Polyhedron.h".}
proc define*(this: var Polyhedron; frustum: Frustum) {.importcpp: "Define",
    header: "Polyhedron.h".}
proc addFace*(this: var Polyhedron; v0: Vector3; v1: Vector3; v2: Vector3) {.
    importcpp: "AddFace", header: "Polyhedron.h".}
proc addFace*(this: var Polyhedron; v0: Vector3; v1: Vector3; v2: Vector3;
              v3: Vector3) {.importcpp: "AddFace", header: "Polyhedron.h".}
proc addFace*(this: var Polyhedron; face: PODVector[Vector3]) {.
    importcpp: "AddFace", header: "Polyhedron.h".}
proc clip*(this: var Polyhedron; plane: Plane) {.importcpp: "Clip",
    header: "Polyhedron.h".}
proc clip*(this: var Polyhedron; box: BoundingBox) {.importcpp: "Clip",
    header: "Polyhedron.h".}
proc clip*(this: var Polyhedron; box: Frustum) {.importcpp: "Clip",
    header: "Polyhedron.h".}
proc clear*(this: var Polyhedron) {.importcpp: "Clear", header: "Polyhedron.h".}
proc transform*(this: var Polyhedron; transform: Matrix3) {.
    importcpp: "Transform", header: "Polyhedron.h".}
proc transform*(this: var Polyhedron; transform: Matrix3x4) {.
    importcpp: "Transform", header: "Polyhedron.h".}
proc transformed*(this: Polyhedron; transform: Matrix3): Polyhedron {.
    noSideEffect, importcpp: "Transformed", header: "Polyhedron.h".}
proc transformed*(this: Polyhedron; transform: Matrix3x4): Polyhedron {.
    noSideEffect, importcpp: "Transformed", header: "Polyhedron.h".}
proc empty*(this: Polyhedron): bool {.noSideEffect, importcpp: "Empty",
                                      header: "Polyhedron.h".}
