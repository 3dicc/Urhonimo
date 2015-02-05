

import 
  vector, matrix4, boundingbox, ptrs, vertexbuffer, color, component, frustum,
  vector3, component, stringHash, urstr, urobject, vertexbuffer, skeleton,
  drawable, camera, octree

discard "forward decl of BoundingBox"
discard "forward decl of Camera"
discard "forward decl of Polyhedron"
discard "forward decl of Drawable"
discard "forward decl of Light"
discard "forward decl of Matrix3x4"
discard "forward decl of Renderer"
discard "forward decl of Skeleton"
discard "forward decl of Sphere"
discard "forward decl of VertexBuffer"
type 
  DebugLine* {.importc: "Urho3D::DebugLine", header: "DebugRenderer.h".} = object 
    start* {.importc: "start_".}: Vector3
    `end`* {.importc: "end_".}: Vector3
    color* {.importc: "color_".}: cuint


proc constructDebugLine*(): DebugLine {.importcpp: "Urho3D::DebugLine(@)", 
                                        header: "DebugRenderer.h".}
proc constructDebugLine*(start: Vector3; `end`: Vector3; color: cuint): DebugLine {.
    importcpp: "Urho3D::DebugLine(@)", header: "DebugRenderer.h".}

type 
  DebugTriangle* {.importc: "Urho3D::DebugTriangle", header: "DebugRenderer.h".} = object 
    v1* {.importc: "v1_".}: Vector3
    v2* {.importc: "v2_".}: Vector3
    v3* {.importc: "v3_".}: Vector3
    color* {.importc: "color_".}: cuint


proc constructDebugTriangle*(): DebugTriangle {.
    importcpp: "Urho3D::DebugTriangle(@)", header: "DebugRenderer.h".}
proc constructDebugTriangle*(v1: Vector3; v2: Vector3; v3: Vector3; color: cuint): DebugTriangle {.
    importcpp: "Urho3D::DebugTriangle(@)", header: "DebugRenderer.h".}

type 
  DebugRenderer* {.importc: "Urho3D::DebugRenderer", header: "DebugRenderer.h".} = object of Component
    lines* {.importc: "lines_".}: PODVector[DebugLine]
    noDepthLines* {.importc: "noDepthLines_".}: PODVector[DebugLine]
    triangles* {.importc: "triangles_".}: PODVector[DebugTriangle]
    noDepthTriangles* {.importc: "noDepthTriangles_".}: PODVector[DebugTriangle]
    view* {.importc: "view_".}: Matrix3x4
    projection* {.importc: "projection_".}: Matrix4
    frustum* {.importc: "frustum_".}: Frustum
    vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]


proc getType*(this: DebugRenderer): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "DebugRenderer.h".}
proc getBaseType*(this: DebugRenderer): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "DebugRenderer.h".}
proc getTypeName*(this: DebugRenderer): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "DebugRenderer.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::DebugRenderer::GetTypeStatic(@)", 
    header: "DebugRenderer.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::DebugRenderer::GetTypeNameStatic(@)", 
    header: "DebugRenderer.h".}
proc constructDebugRenderer*(context: ptr Context): DebugRenderer {.
    importcpp: "Urho3D::DebugRenderer(@)", header: "DebugRenderer.h".}
proc destroyDebugRenderer*(this: var DebugRenderer) {.
    importcpp: "#.~DebugRenderer()", header: "DebugRenderer.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::DebugRenderer::RegisterObject(@)", 
    header: "DebugRenderer.h".}

proc addLine*(this: var DebugRenderer; start: Vector3; `end`: Vector3; 
              color: Color; depthTest: bool = true) {.importcpp: "AddLine", 
    header: "DebugRenderer.h".}
proc addLine*(this: var DebugRenderer; start: Vector3; `end`: Vector3; 
              color: cuint; depthTest: bool = true) {.importcpp: "AddLine", 
    header: "DebugRenderer.h".}
proc addTriangle*(this: var DebugRenderer; v1: Vector3; v2: Vector3; 
                  v3: Vector3; color: Color; depthTest: bool = true) {.
    importcpp: "AddTriangle", header: "DebugRenderer.h".}
proc addTriangle*(this: var DebugRenderer; v1: Vector3; v2: Vector3; 
                  v3: Vector3; color: cuint; depthTest: bool = true) {.
    importcpp: "AddTriangle", header: "DebugRenderer.h".}
proc addNode*(this: var DebugRenderer; node: ptr Node; scale: cfloat = 1.0; 
              depthTest: bool = true) {.importcpp: "AddNode", 
                                        header: "DebugRenderer.h".}
proc addBoundingBox*(this: var DebugRenderer; box: BoundingBox; color: Color; 
                     depthTest: bool = true) {.importcpp: "AddBoundingBox", 
    header: "DebugRenderer.h".}
proc addBoundingBox*(this: var DebugRenderer; box: BoundingBox; 
                     transform: Matrix3x4; color: Color; depthTest: bool = true) {.
    importcpp: "AddBoundingBox", header: "DebugRenderer.h".}
proc addFrustum*(this: var DebugRenderer; frustum: Frustum; color: Color; 
                 depthTest: bool = true) {.importcpp: "AddFrustum", 
    header: "DebugRenderer.h".}
proc addPolyhedron*(this: var DebugRenderer; poly: Polyhedron; color: Color; 
                    depthTest: bool = true) {.importcpp: "AddPolyhedron", 
    header: "DebugRenderer.h".}
proc addSphere*(this: var DebugRenderer; sphere: Sphere; color: Color; 
                depthTest: bool = true) {.importcpp: "AddSphere", 
    header: "DebugRenderer.h".}
proc addSkeleton*(this: var DebugRenderer; skeleton: Skeleton; color: Color; 
                  depthTest: bool = true) {.importcpp: "AddSkeleton", 
    header: "DebugRenderer.h".}
proc addTriangleMesh*(this: var DebugRenderer; vertexData: pointer; 
                      vertexSize: cuint; indexData: pointer; indexSize: cuint; 
                      indexStart: cuint; indexCount: cuint; 
                      transform: Matrix3x4; color: Color; depthTest: bool = true) {.
    importcpp: "AddTriangleMesh", header: "DebugRenderer.h".}
proc render*(this: var DebugRenderer) {.importcpp: "Render", 
                                        header: "DebugRenderer.h".}
proc getView*(this: DebugRenderer): Matrix3x4 {.noSideEffect, 
    importcpp: "GetView", header: "DebugRenderer.h".}
proc getProjection*(this: DebugRenderer): Matrix4 {.noSideEffect, 
    importcpp: "GetProjection", header: "DebugRenderer.h".}
proc getFrustum*(this: DebugRenderer): Frustum {.noSideEffect, 
    importcpp: "GetFrustum", header: "DebugRenderer.h".}
proc isInside*(this: DebugRenderer; box: BoundingBox): bool {.noSideEffect, 
    importcpp: "IsInside", header: "DebugRenderer.h".}

proc drawDebugGeometry*(this: var Component; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Component.h".}

proc drawDebugGeometry*(this: var Drawable; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Drawable.h".}
proc setView*(this: var DebugRenderer; camera: ptr Camera) {.
    importcpp: "SetView", header: "DebugRenderer.h".}
proc drawDebugGeometry*(this: var Camera; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Camera.h".}
proc drawDebugGeometry*(this: var Octant; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Octree.h".}
proc drawDebugGeometry*(this: var Octree; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Octree.h".}

