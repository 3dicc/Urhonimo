

import 
  boundingBox, drawable, frustum, ray, sphere

discard "forward decl of Drawable"
discard "forward decl of Node"
type 
  OctreeQuery* {.importc: "Urho3D::OctreeQuery", header: "OctreeQuery.h".} = object 
    result* {.importc: "result_".}: var PODVector[ptr Drawable]
    drawableFlags* {.importc: "drawableFlags_".}: cuchar
    viewMask* {.importc: "viewMask_".}: cuint


proc constructOctreeQuery*(result: var PODVector[ptr Drawable]; 
                           drawableFlags: cuchar; viewMask: cuint): OctreeQuery {.
    importcpp: "Urho3D::OctreeQuery(@)", header: "OctreeQuery.h".}
proc destroyOctreeQuery*(this: var OctreeQuery) {.importcpp: "#.~OctreeQuery()", 
    header: "OctreeQuery.h".}
proc testOctant*(this: var OctreeQuery; box: BoundingBox; inside: bool): Intersection {.
    importcpp: "TestOctant", header: "OctreeQuery.h".}
proc testDrawables*(this: var OctreeQuery; start: ptr ptr Drawable; 
                    `end`: ptr ptr Drawable; inside: bool) {.
    importcpp: "TestDrawables", header: "OctreeQuery.h".}

type 
  PointOctreeQuery* {.importc: "Urho3D::PointOctreeQuery", 
                      header: "OctreeQuery.h".} = object of OctreeQuery
    point* {.importc: "point_".}: Vector3


proc constructPointOctreeQuery*(result: var PODVector[ptr Drawable]; 
                                point: Vector3; 
                                drawableFlags: cuchar = drawable_Any; 
                                viewMask: cuint = default_Viewmask): PointOctreeQuery {.
    importcpp: "Urho3D::PointOctreeQuery(@)", header: "OctreeQuery.h".}
proc testOctant*(this: var PointOctreeQuery; box: BoundingBox; inside: bool): Intersection {.
    importcpp: "TestOctant", header: "OctreeQuery.h".}
proc testDrawables*(this: var PointOctreeQuery; start: ptr ptr Drawable; 
                    `end`: ptr ptr Drawable; inside: bool) {.
    importcpp: "TestDrawables", header: "OctreeQuery.h".}

type 
  SphereOctreeQuery* {.importc: "Urho3D::SphereOctreeQuery", 
                       header: "OctreeQuery.h".} = object of OctreeQuery
    sphere* {.importc: "sphere_".}: Sphere


proc constructSphereOctreeQuery*(result: var PODVector[ptr Drawable]; 
                                 sphere: Sphere; 
                                 drawableFlags: cuchar = drawable_Any; 
                                 viewMask: cuint = default_Viewmask): SphereOctreeQuery {.
    importcpp: "Urho3D::SphereOctreeQuery(@)", header: "OctreeQuery.h".}
proc testOctant*(this: var SphereOctreeQuery; box: BoundingBox; inside: bool): Intersection {.
    importcpp: "TestOctant", header: "OctreeQuery.h".}
proc testDrawables*(this: var SphereOctreeQuery; start: ptr ptr Drawable; 
                    `end`: ptr ptr Drawable; inside: bool) {.
    importcpp: "TestDrawables", header: "OctreeQuery.h".}

type 
  BoxOctreeQuery* {.importc: "Urho3D::BoxOctreeQuery", header: "OctreeQuery.h".} = object of OctreeQuery
    box* {.importc: "box_".}: BoundingBox


proc constructBoxOctreeQuery*(result: var PODVector[ptr Drawable]; 
                              box: BoundingBox; 
                              drawableFlags: cuchar = drawable_Any; 
                              viewMask: cuint = default_Viewmask): BoxOctreeQuery {.
    importcpp: "Urho3D::BoxOctreeQuery(@)", header: "OctreeQuery.h".}
proc testOctant*(this: var BoxOctreeQuery; box: BoundingBox; inside: bool): Intersection {.
    importcpp: "TestOctant", header: "OctreeQuery.h".}
proc testDrawables*(this: var BoxOctreeQuery; start: ptr ptr Drawable; 
                    `end`: ptr ptr Drawable; inside: bool) {.
    importcpp: "TestDrawables", header: "OctreeQuery.h".}

type 
  FrustumOctreeQuery* {.importc: "Urho3D::FrustumOctreeQuery", 
                        header: "OctreeQuery.h".} = object of OctreeQuery
    frustum* {.importc: "frustum_".}: Frustum


proc constructFrustumOctreeQuery*(result: var PODVector[ptr Drawable]; 
                                  frustum: Frustum; 
                                  drawableFlags: cuchar = drawable_Any; 
                                  viewMask: cuint = default_Viewmask): FrustumOctreeQuery {.
    importcpp: "Urho3D::FrustumOctreeQuery(@)", header: "OctreeQuery.h".}
proc testOctant*(this: var FrustumOctreeQuery; box: BoundingBox; inside: bool): Intersection {.
    importcpp: "TestOctant", header: "OctreeQuery.h".}
proc testDrawables*(this: var FrustumOctreeQuery; start: ptr ptr Drawable; 
                    `end`: ptr ptr Drawable; inside: bool) {.
    importcpp: "TestDrawables", header: "OctreeQuery.h".}

type 
  OctreeQueryResult* {.importc: "Urho3D::OctreeQueryResult", 
                       header: "OctreeQuery.h".} = object 
    drawable* {.importc: "drawable_".}: ptr Drawable
    node* {.importc: "node_".}: ptr Node


proc constructOctreeQueryResult*(): OctreeQueryResult {.
    importcpp: "Urho3D::OctreeQueryResult(@)", header: "OctreeQuery.h".}

type 
  RayQueryLevel* {.importcpp: "Urho3D::RayQueryLevel".} = enum 
    RAY_AABB = 0, RAY_OBB, RAY_TRIANGLE



type 
  RayQueryResult* {.importc: "Urho3D::RayQueryResult", header: "OctreeQuery.h".} = object 
    position* {.importc: "position_".}: Vector3
    normal* {.importc: "normal_".}: Vector3
    distance* {.importc: "distance_".}: cfloat
    drawable* {.importc: "drawable_".}: ptr Drawable
    node* {.importc: "node_".}: ptr Node
    subObject* {.importc: "subObject_".}: cuint


proc constructRayQueryResult*(): RayQueryResult {.
    importcpp: "Urho3D::RayQueryResult(@)", header: "OctreeQuery.h".}

type 
  RayOctreeQuery* {.importc: "Urho3D::RayOctreeQuery", header: "OctreeQuery.h".} = object 
    result* {.importc: "result_".}: var PODVector[RayQueryResult]
    ray* {.importc: "ray_".}: Ray
    drawableFlags* {.importc: "drawableFlags_".}: cuchar
    viewMask* {.importc: "viewMask_".}: cuint
    maxDistance* {.importc: "maxDistance_".}: cfloat
    level* {.importc: "level_".}: RayQueryLevel


proc constructRayOctreeQuery*(result: var PODVector[RayQueryResult]; ray: Ray; 
                              level: RayQueryLevel = ray_Triangle; 
                              maxDistance: cfloat = m_Infinity; 
                              drawableFlags: cuchar = drawable_Any; 
                              viewMask: cuint = default_Viewmask): RayOctreeQuery {.
    importcpp: "Urho3D::RayOctreeQuery(@)", header: "OctreeQuery.h".}