

import 
  boundingBox, arrayPtr, component, quaternion

discard "forward decl of btBvhTriangleMeshShape"
discard "forward decl of btCollisionShape"
discard "forward decl of btCompoundShape"
discard "forward decl of btTriangleMesh"
discard "forward decl of btTriangleInfoMap"
discard "forward decl of CustomGeometry"
discard "forward decl of Geometry"
discard "forward decl of Model"
discard "forward decl of PhysicsWorld"
discard "forward decl of RigidBody"
discard "forward decl of Terrain"
discard "forward decl of TriangleMeshInterface"
type 
  ShapeType* {.importcpp: "Urho3D::ShapeType".} = enum 
    SHAPE_BOX = 0, SHAPE_SPHERE, SHAPE_STATICPLANE, SHAPE_CYLINDER, 
    SHAPE_CAPSULE, SHAPE_CONE, SHAPE_TRIANGLEMESH, SHAPE_CONVEXHULL, 
    SHAPE_TERRAIN



type 
  CollisionGeometryData* {.importc: "Urho3D::CollisionGeometryData", 
                           header: "CollisionShape.h".} = object of RefCounted
  


type 
  TriangleMeshData* {.importc: "Urho3D::TriangleMeshData", 
                      header: "CollisionShape.h".} = object of CollisionGeometryData
    meshInterface* {.importc: "meshInterface_".}: ptr TriangleMeshInterface
    shape* {.importc: "shape_".}: ptr BtBvhTriangleMeshShape
    infoMap* {.importc: "infoMap_".}: ptr BtTriangleInfoMap


proc constructTriangleMeshData*(model: ptr Model; lodLevel: cuint): TriangleMeshData {.
    importcpp: "Urho3D::TriangleMeshData(@)", header: "CollisionShape.h".}
proc constructTriangleMeshData*(custom: ptr CustomGeometry): TriangleMeshData {.
    importcpp: "Urho3D::TriangleMeshData(@)", header: "CollisionShape.h".}
proc destroyTriangleMeshData*(this: var TriangleMeshData) {.
    importcpp: "#.~TriangleMeshData()", header: "CollisionShape.h".}

type 
  ConvexData* {.importc: "Urho3D::ConvexData", header: "CollisionShape.h".} = object of CollisionGeometryData
    vertexData* {.importc: "vertexData_".}: SharedArrayPtr[Vector3]
    vertexCount* {.importc: "vertexCount_".}: cuint
    indexData* {.importc: "indexData_".}: SharedArrayPtr[cuint]
    indexCount* {.importc: "indexCount_".}: cuint


proc constructConvexData*(model: ptr Model; lodLevel: cuint): ConvexData {.
    importcpp: "Urho3D::ConvexData(@)", header: "CollisionShape.h".}
proc constructConvexData*(custom: ptr CustomGeometry): ConvexData {.
    importcpp: "Urho3D::ConvexData(@)", header: "CollisionShape.h".}
proc destroyConvexData*(this: var ConvexData) {.importcpp: "#.~ConvexData()", 
    header: "CollisionShape.h".}
proc buildHull*(this: var ConvexData; vertices: PODVector[Vector3]) {.
    importcpp: "BuildHull", header: "CollisionShape.h".}

type 
  HeightfieldData* {.importc: "Urho3D::HeightfieldData", 
                     header: "CollisionShape.h".} = object of CollisionGeometryData
    heightData* {.importc: "heightData_".}: SharedArrayPtr[cfloat]
    spacing* {.importc: "spacing_".}: Vector3
    size* {.importc: "size_".}: IntVector2
    minHeight* {.importc: "minHeight_".}: cfloat
    maxHeight* {.importc: "maxHeight_".}: cfloat


proc constructHeightfieldData*(terrain: ptr Terrain): HeightfieldData {.
    importcpp: "Urho3D::HeightfieldData(@)", header: "CollisionShape.h".}
proc destroyHeightfieldData*(this: var HeightfieldData) {.
    importcpp: "#.~HeightfieldData()", header: "CollisionShape.h".}

type 
  CollisionShape* {.importc: "Urho3D::CollisionShape", 
                    header: "CollisionShape.h".} = object of Component
    physicsWorld* {.importc: "physicsWorld_".}: WeakPtr[PhysicsWorld]
    rigidBody* {.importc: "rigidBody_".}: WeakPtr[RigidBody]
    model* {.importc: "model_".}: SharedPtr[Model]
    geometry* {.importc: "geometry_".}: SharedPtr[CollisionGeometryData]
    shape* {.importc: "shape_".}: ptr BtCollisionShape
    shapeType* {.importc: "shapeType_".}: ShapeType
    position* {.importc: "position_".}: Vector3
    rotation* {.importc: "rotation_".}: Quaternion
    size* {.importc: "size_".}: Vector3
    cachedWorldScale* {.importc: "cachedWorldScale_".}: Vector3
    lodLevel* {.importc: "lodLevel_".}: cuint
    customGeometryID* {.importc: "customGeometryID_".}: cint
    margin* {.importc: "margin_".}: cfloat
    recreateShape* {.importc: "recreateShape_".}: bool


proc getType*(this: CollisionShape): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "CollisionShape.h".}
proc getBaseType*(this: CollisionShape): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "CollisionShape.h".}
proc getTypeName*(this: CollisionShape): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "CollisionShape.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::CollisionShape::GetTypeStatic(@)", 
    header: "CollisionShape.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::CollisionShape::GetTypeNameStatic(@)", 
    header: "CollisionShape.h".}
proc constructCollisionShape*(context: ptr Context): CollisionShape {.
    importcpp: "Urho3D::CollisionShape(@)", header: "CollisionShape.h".}
proc destroyCollisionShape*(this: var CollisionShape) {.
    importcpp: "#.~CollisionShape()", header: "CollisionShape.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CollisionShape::RegisterObject(@)", 
    header: "CollisionShape.h".}
proc onSetAttribute*(this: var CollisionShape; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "CollisionShape.h".}
proc applyAttributes*(this: var CollisionShape) {.importcpp: "ApplyAttributes", 
    header: "CollisionShape.h".}
proc onSetEnabled*(this: var CollisionShape) {.importcpp: "OnSetEnabled", 
    header: "CollisionShape.h".}
proc drawDebugGeometry*(this: var CollisionShape; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "CollisionShape.h".}
proc setBox*(this: var CollisionShape; size: Vector3; 
             position: Vector3 = vector3.zero; 
             rotation: Quaternion = quaternion.identity) {.importcpp: "SetBox", 
    header: "CollisionShape.h".}
proc setSphere*(this: var CollisionShape; diameter: cfloat; 
                position: Vector3 = vector3.zero; 
                rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetSphere", header: "CollisionShape.h".}
proc setStaticPlane*(this: var CollisionShape; position: Vector3 = vector3.zero; 
                     rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetStaticPlane", header: "CollisionShape.h".}
proc setCylinder*(this: var CollisionShape; diameter: cfloat; height: cfloat; 
                  position: Vector3 = vector3.zero; 
                  rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetCylinder", header: "CollisionShape.h".}
proc setCapsule*(this: var CollisionShape; diameter: cfloat; height: cfloat; 
                 position: Vector3 = vector3.zero; 
                 rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetCapsule", header: "CollisionShape.h".}
proc setCone*(this: var CollisionShape; diameter: cfloat; height: cfloat; 
              position: Vector3 = vector3.zero; 
              rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetCone", header: "CollisionShape.h".}
proc setTriangleMesh*(this: var CollisionShape; model: ptr Model; 
                      lodLevel: cuint = 0; scale: Vector3 = vector3.one; 
                      position: Vector3 = vector3.zero; 
                      rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetTriangleMesh", header: "CollisionShape.h".}
proc setCustomTriangleMesh*(this: var CollisionShape; 
                            custom: ptr CustomGeometry; 
                            scale: Vector3 = vector3.one; 
                            position: Vector3 = vector3.zero; 
                            rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetCustomTriangleMesh", header: "CollisionShape.h".}
proc setConvexHull*(this: var CollisionShape; model: ptr Model; 
                    lodLevel: cuint = 0; scale: Vector3 = vector3.one; 
                    position: Vector3 = vector3.zero; 
                    rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetConvexHull", header: "CollisionShape.h".}
proc setCustomConvexHull*(this: var CollisionShape; custom: ptr CustomGeometry; 
                          scale: Vector3 = vector3.one; 
                          position: Vector3 = vector3.zero; 
                          rotation: Quaternion = quaternion.identity) {.
    importcpp: "SetCustomConvexHull", header: "CollisionShape.h".}
proc setTerrain*(this: var CollisionShape) {.importcpp: "SetTerrain", 
    header: "CollisionShape.h".}
proc setShapeType*(this: var CollisionShape; `type`: ShapeType) {.
    importcpp: "SetShapeType", header: "CollisionShape.h".}
proc setSize*(this: var CollisionShape; size: Vector3) {.importcpp: "SetSize", 
    header: "CollisionShape.h".}
proc setPosition*(this: var CollisionShape; position: Vector3) {.
    importcpp: "SetPosition", header: "CollisionShape.h".}
proc setRotation*(this: var CollisionShape; rotation: Quaternion) {.
    importcpp: "SetRotation", header: "CollisionShape.h".}
proc setTransform*(this: var CollisionShape; position: Vector3; 
                   rotation: Quaternion) {.importcpp: "SetTransform", 
    header: "CollisionShape.h".}
proc setMargin*(this: var CollisionShape; margin: cfloat) {.
    importcpp: "SetMargin", header: "CollisionShape.h".}
proc setModel*(this: var CollisionShape; model: ptr Model) {.
    importcpp: "SetModel", header: "CollisionShape.h".}
proc setLodLevel*(this: var CollisionShape; lodLevel: cuint) {.
    importcpp: "SetLodLevel", header: "CollisionShape.h".}
proc getCollisionShape*(this: CollisionShape): ptr BtCollisionShape {.
    noSideEffect, importcpp: "GetCollisionShape", header: "CollisionShape.h".}
proc getGeometryData*(this: CollisionShape): ptr CollisionGeometryData {.
    noSideEffect, importcpp: "GetGeometryData", header: "CollisionShape.h".}
proc getPhysicsWorld*(this: CollisionShape): ptr PhysicsWorld {.noSideEffect, 
    importcpp: "GetPhysicsWorld", header: "CollisionShape.h".}
proc getShapeType*(this: CollisionShape): ShapeType {.noSideEffect, 
    importcpp: "GetShapeType", header: "CollisionShape.h".}
proc getSize*(this: CollisionShape): Vector3 {.noSideEffect, 
    importcpp: "GetSize", header: "CollisionShape.h".}
proc getPosition*(this: CollisionShape): Vector3 {.noSideEffect, 
    importcpp: "GetPosition", header: "CollisionShape.h".}
proc getRotation*(this: CollisionShape): Quaternion {.noSideEffect, 
    importcpp: "GetRotation", header: "CollisionShape.h".}
proc getMargin*(this: CollisionShape): cfloat {.noSideEffect, 
    importcpp: "GetMargin", header: "CollisionShape.h".}
proc getModel*(this: CollisionShape): ptr Model {.noSideEffect, 
    importcpp: "GetModel", header: "CollisionShape.h".}
proc getLodLevel*(this: CollisionShape): cuint {.noSideEffect, 
    importcpp: "GetLodLevel", header: "CollisionShape.h".}
proc getWorldBoundingBox*(this: CollisionShape): BoundingBox {.noSideEffect, 
    importcpp: "GetWorldBoundingBox", header: "CollisionShape.h".}
proc notifyRigidBody*(this: var CollisionShape; updateMass: bool = true) {.
    importcpp: "NotifyRigidBody", header: "CollisionShape.h".}
proc setModelAttr*(this: var CollisionShape; value: ResourceRef) {.
    importcpp: "SetModelAttr", header: "CollisionShape.h".}
proc getModelAttr*(this: CollisionShape): ResourceRef {.noSideEffect, 
    importcpp: "GetModelAttr", header: "CollisionShape.h".}
proc releaseShape*(this: var CollisionShape) {.importcpp: "ReleaseShape", 
    header: "CollisionShape.h".}