

import 
  vector3

discard "forward decl of BoundingBox"
discard "forward decl of Polyhedron"
discard "forward decl of Frustum"
type 
  Sphere* {.importc: "Urho3D::Sphere", header: "Sphere.h".} = object 
    center* {.importc: "center_".}: Vector3
    radius* {.importc: "radius_".}: cfloat
    defined* {.importc: "defined_".}: bool


proc constructSphere*(): Sphere {.importcpp: "Urho3D::Sphere(@)", 
                                  header: "Sphere.h".}
proc constructSphere*(sphere: Sphere): Sphere {.importcpp: "Urho3D::Sphere(@)", 
    header: "Sphere.h".}
proc constructSphere*(center: Vector3; radius: cfloat): Sphere {.
    importcpp: "Urho3D::Sphere(@)", header: "Sphere.h".}
proc constructSphere*(vertices: ptr Vector3; count: cuint): Sphere {.
    importcpp: "Urho3D::Sphere(@)", header: "Sphere.h".}
proc constructSphere*(box: BoundingBox): Sphere {.
    importcpp: "Urho3D::Sphere(@)", header: "Sphere.h".}
proc constructSphere*(frustum: Frustum): Sphere {.
    importcpp: "Urho3D::Sphere(@)", header: "Sphere.h".}
proc constructSphere*(poly: Polyhedron): Sphere {.
    importcpp: "Urho3D::Sphere(@)", header: "Sphere.h".}
proc `==`*(this: Sphere; rhs: Sphere): bool {.noSideEffect, importcpp: "# == #", 
    header: "Sphere.h".}
proc define*(this: var Sphere; sphere: Sphere) {.importcpp: "Define", 
    header: "Sphere.h".}
proc define*(this: var Sphere; center: Vector3; radius: cfloat) {.
    importcpp: "Define", header: "Sphere.h".}
proc define*(this: var Sphere; vertices: ptr Vector3; count: cuint) {.
    importcpp: "Define", header: "Sphere.h".}
proc define*(this: var Sphere; box: BoundingBox) {.importcpp: "Define", 
    header: "Sphere.h".}
proc define*(this: var Sphere; frustum: Frustum) {.importcpp: "Define", 
    header: "Sphere.h".}
proc define*(this: var Sphere; poly: Polyhedron) {.importcpp: "Define", 
    header: "Sphere.h".}
proc merge*(this: var Sphere; point: Vector3) {.importcpp: "Merge", 
    header: "Sphere.h".}
proc merge*(this: var Sphere; vertices: ptr Vector3; count: cuint) {.
    importcpp: "Merge", header: "Sphere.h".}
proc merge*(this: var Sphere; box: BoundingBox) {.importcpp: "Merge", 
    header: "Sphere.h".}
proc merge*(this: var Sphere; frustum: Frustum) {.importcpp: "Merge", 
    header: "Sphere.h".}
proc merge*(this: var Sphere; poly: Polyhedron) {.importcpp: "Merge", 
    header: "Sphere.h".}
proc merge*(this: var Sphere; sphere: Sphere) {.importcpp: "Merge", 
    header: "Sphere.h".}
proc clear*(this: var Sphere) {.importcpp: "Clear", header: "Sphere.h".}
proc isInside*(this: Sphere; point: Vector3): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Sphere.h".}
proc isInside*(this: Sphere; sphere: Sphere): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Sphere.h".}
proc isInsideFast*(this: Sphere; sphere: Sphere): Intersection {.noSideEffect, 
    importcpp: "IsInsideFast", header: "Sphere.h".}
proc isInside*(this: Sphere; box: BoundingBox): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Sphere.h".}
proc isInsideFast*(this: Sphere; box: BoundingBox): Intersection {.noSideEffect, 
    importcpp: "IsInsideFast", header: "Sphere.h".}
proc distance*(this: Sphere; point: Vector3): cfloat {.noSideEffect, 
    importcpp: "Distance", header: "Sphere.h".}