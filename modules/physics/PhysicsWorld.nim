

import 
  boundingBox, component, hashSet, sphere, vector3, vectorBuffer,
  rigidbody, serializer, xmlelement, quaternion, stringhash, urstr, urobject,
  debugrenderer, vector, ray, collisionshape, model

discard "forward decl of btCollisionConfiguration"
discard "forward decl of btCollisionShape"
discard "forward decl of btBroadphaseInterface"
discard "forward decl of btConstraintSolver"
discard "forward decl of btDiscreteDynamicsWorld"
discard "forward decl of btDispatcher"
discard "forward decl of btDynamicsWorld"
discard "forward decl of btPersistentManifold"
discard "forward decl of CollisionShape"
discard "forward decl of Deserializer"
discard "forward decl of Constraint"
discard "forward decl of Model"
discard "forward decl of Node"
discard "forward decl of Ray"
discard "forward decl of RigidBody"
discard "forward decl of Scene"
discard "forward decl of Serializer"
discard "forward decl of XMLElement"
discard "forward decl of CollisionGeometryData"
type 
  PhysicsRaycastResult* {.importc: "Urho3D::PhysicsRaycastResult", 
                          header: "PhysicsWorld.h".} = object 
    position* {.importc: "position_".}: Vector3
    normal* {.importc: "normal_".}: Vector3
    distance* {.importc: "distance_".}: cfloat
    body* {.importc: "body_".}: ptr RigidBody


proc constructPhysicsRaycastResult*(): PhysicsRaycastResult {.
    importcpp: "Urho3D::PhysicsRaycastResult(@)", header: "PhysicsWorld.h".}

type 
  DelayedWorldTransform* {.importc: "Urho3D::DelayedWorldTransform", 
                           header: "PhysicsWorld.h".} = object 
    rigidBody* {.importc: "rigidBody_".}: ptr RigidBody
    parentRigidBody* {.importc: "parentRigidBody_".}: ptr RigidBody
    worldPosition* {.importc: "worldPosition_".}: Vector3
    worldRotation* {.importc: "worldRotation_".}: Quaternion


var DEFAULT_MAX_NETWORK_ANGULAR_VELOCITY* {.
    importc: "DEFAULT_MAX_NETWORK_ANGULAR_VELOCITY", header: "PhysicsWorld.h".}: cfloat = 100.0


type 
  PhysicsWorld* {.importc: "Urho3D::PhysicsWorld", header: "PhysicsWorld.h".} = object of Component
    when false:
      collisionConfiguration* {.importc: "collisionConfiguration_".}: ptr BtCollisionConfiguration
      collisionDispatcher* {.importc: "collisionDispatcher_".}: ptr BtDispatcher
      broadphase* {.importc: "broadphase_".}: ptr BtBroadphaseInterface
      solver* {.importc: "solver_".}: ptr BtConstraintSolver
      world* {.importc: "world_".}: ptr BtDiscreteDynamicsWorld
      scene* {.importc: "scene_".}: WeakPtr[Scene]
      rigidBodies* {.importc: "rigidBodies_".}: PODVector[ptr RigidBody]
      collisionShapes* {.importc: "collisionShapes_".}: PODVector[
          ptr CollisionShape]
      constraints* {.importc: "constraints_".}: PODVector[ptr Constraint]
      currentCollisions* {.importc: "currentCollisions_".}: HashMap[
          Pair[WeakPtr[RigidBody], WeakPtr[RigidBody]], ptr BtPersistentManifold]
      previousCollisions* {.importc: "previousCollisions_".}: HashMap[
          Pair[WeakPtr[RigidBody], WeakPtr[RigidBody]], ptr BtPersistentManifold]
      delayedWorldTransforms* {.importc: "delayedWorldTransforms_".}: HashMap[
          ptr RigidBody, DelayedWorldTransform]
      triMeshCache* {.importc: "triMeshCache_".}: HashMap[Pair[ptr Model, cuint], 
          SharedPtr[CollisionGeometryData]]
      convexCache* {.importc: "convexCache_".}: HashMap[Pair[ptr Model, cuint], 
          SharedPtr[CollisionGeometryData]]
      physicsCollisionData* {.importc: "physicsCollisionData_".}: VariantMap
      nodeCollisionData* {.importc: "nodeCollisionData_".}: VariantMap
      contacts* {.importc: "contacts_".}: VectorBuffer
      fps* {.importc: "fps_".}: cuint
      maxSubSteps* {.importc: "maxSubSteps_".}: cint
      timeAcc* {.importc: "timeAcc_".}: cfloat
      maxNetworkAngularVelocity* {.importc: "maxNetworkAngularVelocity_".}: cfloat
      interpolation* {.importc: "interpolation_".}: bool
      internalEdge* {.importc: "internalEdge_".}: bool
      applyingTransforms* {.importc: "applyingTransforms_".}: bool
      debugRenderer* {.importc: "debugRenderer_".}: ptr DebugRenderer
      debugMode* {.importc: "debugMode_".}: cint
      debugDepthTest* {.importc: "debugDepthTest_".}: bool


proc getType*(this: PhysicsWorld): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "PhysicsWorld.h".}
proc getBaseType*(this: PhysicsWorld): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "PhysicsWorld.h".}
proc getTypeName*(this: PhysicsWorld): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "PhysicsWorld.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::PhysicsWorld::GetTypeStatic(@)", 
    header: "PhysicsWorld.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::PhysicsWorld::GetTypeNameStatic(@)", 
    header: "PhysicsWorld.h".}
proc constructPhysicsWorld*(scontext: ptr Context): PhysicsWorld {.
    importcpp: "Urho3D::PhysicsWorld(@)", header: "PhysicsWorld.h".}
proc destroyPhysicsWorld*(this: var PhysicsWorld) {.
    importcpp: "#.~PhysicsWorld()", header: "PhysicsWorld.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::PhysicsWorld::RegisterObject(@)", 
    header: "PhysicsWorld.h".}

when false:
  proc isVisible*(this: var PhysicsWorld; aabbMin: BtVector3; aabbMax: BtVector3): bool {.
      importcpp: "isVisible", header: "PhysicsWorld.h".}
  proc drawLine*(this: var PhysicsWorld; `from`: BtVector3; to: BtVector3; 
                 color: BtVector3) {.importcpp: "drawLine", 
                                     header: "PhysicsWorld.h".}
  proc drawContactPoint*(this: var PhysicsWorld; pointOnB: BtVector3; 
                         normalOnB: BtVector3; distance: BtScalar; lifeTime: cint; 
                         color: BtVector3) {.importcpp: "drawContactPoint", 
      header: "PhysicsWorld.h".}
  proc draw3dText*(this: var PhysicsWorld; location: BtVector3; 
                   textString: cstring) {.importcpp: "draw3dText", 
                                          header: "PhysicsWorld.h".}

proc reportErrorWarning*(this: var PhysicsWorld; warningString: cstring) {.
    importcpp: "reportErrorWarning", header: "PhysicsWorld.h".}
proc setDebugMode*(this: var PhysicsWorld; debugMode: cint) {.
    importcpp: "setDebugMode", header: "PhysicsWorld.h".}
proc getDebugMode*(this: PhysicsWorld): cint {.noSideEffect, 
    importcpp: "getDebugMode", header: "PhysicsWorld.h".}
proc drawDebugGeometry*(this: var PhysicsWorld; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "PhysicsWorld.h".}
proc update*(this: var PhysicsWorld; timeStep: cfloat) {.importcpp: "Update", 
    header: "PhysicsWorld.h".}
proc updateCollisions*(this: var PhysicsWorld) {.importcpp: "UpdateCollisions", 
    header: "PhysicsWorld.h".}
proc setFps*(this: var PhysicsWorld; fps: cint) {.importcpp: "SetFps", 
    header: "PhysicsWorld.h".}
proc setGravity*(this: var PhysicsWorld; gravity: Vector3) {.
    importcpp: "SetGravity", header: "PhysicsWorld.h".}
proc setMaxSubSteps*(this: var PhysicsWorld; num: cint) {.
    importcpp: "SetMaxSubSteps", header: "PhysicsWorld.h".}
proc setNumIterations*(this: var PhysicsWorld; num: cint) {.
    importcpp: "SetNumIterations", header: "PhysicsWorld.h".}
proc setInterpolation*(this: var PhysicsWorld; enable: bool) {.
    importcpp: "SetInterpolation", header: "PhysicsWorld.h".}
proc setInternalEdge*(this: var PhysicsWorld; enable: bool) {.
    importcpp: "SetInternalEdge", header: "PhysicsWorld.h".}
proc setSplitImpulse*(this: var PhysicsWorld; enable: bool) {.
    importcpp: "SetSplitImpulse", header: "PhysicsWorld.h".}
proc setMaxNetworkAngularVelocity*(this: var PhysicsWorld; velocity: cfloat) {.
    importcpp: "SetMaxNetworkAngularVelocity", header: "PhysicsWorld.h".}
proc raycast*(this: var PhysicsWorld; 
              result: var PODVector[PhysicsRaycastResult]; ray: Ray; 
              maxDistance: cfloat; collisionMask: cuint) {.
    importcpp: "Raycast", header: "PhysicsWorld.h".}
proc raycastSingle*(this: var PhysicsWorld; result: var PhysicsRaycastResult; 
                    ray: Ray; maxDistance: cfloat; 
                    collisionMask: cuint) {.
    importcpp: "RaycastSingle", header: "PhysicsWorld.h".}
proc sphereCast*(this: var PhysicsWorld; result: var PhysicsRaycastResult; 
                 ray: Ray; radius: cfloat; maxDistance: cfloat; 
                 collisionMask: cuint) {.
    importcpp: "SphereCast", header: "PhysicsWorld.h".}
proc convexCast*(this: var PhysicsWorld; result: var PhysicsRaycastResult; 
                 shape: ptr CollisionShape; startPos: Vector3; 
                 startRot: Quaternion; endPos: Vector3; endRot: Quaternion; 
                 collisionMask: cuint) {.
    importcpp: "ConvexCast", header: "PhysicsWorld.h".}
#proc convexCast*(this: var PhysicsWorld; result: var PhysicsRaycastResult; 
#                 shape: ptr BtCollisionShape; startPos: Vector3; 
#                 startRot: Quaternion; endPos: Vector3; endRot: Quaternion; 
#                 collisionMask: cuint) {.
#    importcpp: "ConvexCast", header: "PhysicsWorld.h".}
proc removeCachedGeometry*(this: var PhysicsWorld; model: ptr Model) {.
    importcpp: "RemoveCachedGeometry", header: "PhysicsWorld.h".}
proc getRigidBodies*(this: var PhysicsWorld; 
                     result: var PODVector[ptr RigidBody]; sphere: Sphere; 
                     collisionMask: cuint) {.
    importcpp: "GetRigidBodies", header: "PhysicsWorld.h".}
proc getRigidBodies*(this: var PhysicsWorld; 
                     result: var PODVector[ptr RigidBody]; box: BoundingBox; 
                     collisionMask: cuint) {.
    importcpp: "GetRigidBodies", header: "PhysicsWorld.h".}
proc getRigidBodies*(this: var PhysicsWorld; 
                     result: var PODVector[ptr RigidBody]; body: ptr RigidBody) {.
    importcpp: "GetRigidBodies", header: "PhysicsWorld.h".}
proc getGravity*(this: PhysicsWorld): Vector3 {.noSideEffect, 
    importcpp: "GetGravity", header: "PhysicsWorld.h".}
proc getMaxSubSteps*(this: PhysicsWorld): cint {.noSideEffect, 
    importcpp: "GetMaxSubSteps", header: "PhysicsWorld.h".}
proc getNumIterations*(this: PhysicsWorld): cint {.noSideEffect, 
    importcpp: "GetNumIterations", header: "PhysicsWorld.h".}
proc getInterpolation*(this: PhysicsWorld): bool {.noSideEffect, 
    importcpp: "GetInterpolation", header: "PhysicsWorld.h".}
proc getInternalEdge*(this: PhysicsWorld): bool {.noSideEffect, 
    importcpp: "GetInternalEdge", header: "PhysicsWorld.h".}
proc getSplitImpulse*(this: PhysicsWorld): bool {.noSideEffect, 
    importcpp: "GetSplitImpulse", header: "PhysicsWorld.h".}
proc getFps*(this: PhysicsWorld): cint {.noSideEffect, importcpp: "GetFps", 
    header: "PhysicsWorld.h".}
proc getMaxNetworkAngularVelocity*(this: PhysicsWorld): cfloat {.noSideEffect, 
    importcpp: "GetMaxNetworkAngularVelocity", header: "PhysicsWorld.h".}
proc addRigidBody*(this: var PhysicsWorld; body: ptr RigidBody) {.
    importcpp: "AddRigidBody", header: "PhysicsWorld.h".}
proc removeRigidBody*(this: var PhysicsWorld; body: ptr RigidBody) {.
    importcpp: "RemoveRigidBody", header: "PhysicsWorld.h".}
proc addCollisionShape*(this: var PhysicsWorld; shape: ptr CollisionShape) {.
    importcpp: "AddCollisionShape", header: "PhysicsWorld.h".}
proc removeCollisionShape*(this: var PhysicsWorld; shape: ptr CollisionShape) {.
    importcpp: "RemoveCollisionShape", header: "PhysicsWorld.h".}

when false:
  proc addConstraint*(this: var PhysicsWorld; joint: ptr Constraint) {.
      importcpp: "AddConstraint", header: "PhysicsWorld.h".}
  proc removeConstraint*(this: var PhysicsWorld; joint: ptr Constraint) {.
      importcpp: "RemoveConstraint", header: "PhysicsWorld.h".}

proc addDelayedWorldTransform*(this: var PhysicsWorld; 
                               transform: DelayedWorldTransform) {.
    importcpp: "AddDelayedWorldTransform", header: "PhysicsWorld.h".}
proc drawDebugGeometry*(this: var PhysicsWorld; depthTest: bool) {.
    importcpp: "DrawDebugGeometry", header: "PhysicsWorld.h".}
proc setDebugRenderer*(this: var PhysicsWorld; debug: ptr DebugRenderer) {.
    importcpp: "SetDebugRenderer", header: "PhysicsWorld.h".}
proc setDebugDepthTest*(this: var PhysicsWorld; enable: bool) {.
    importcpp: "SetDebugDepthTest", header: "PhysicsWorld.h".}
#proc getWorld*(this: var PhysicsWorld): ptr BtDiscreteDynamicsWorld {.
#    importcpp: "GetWorld", header: "PhysicsWorld.h".}
proc cleanupGeometryCache*(this: var PhysicsWorld) {.
    importcpp: "CleanupGeometryCache", header: "PhysicsWorld.h".}
#proc getTriMeshCache*(this: var PhysicsWorld): var HashMap[
#    Pair[ptr Model, cuint], SharedPtr[CollisionGeometryData]] {.
#    importcpp: "GetTriMeshCache", header: "PhysicsWorld.h".}
#proc getConvexCache*(this: var PhysicsWorld): var HashMap[
#    Pair[ptr Model, cuint], SharedPtr[CollisionGeometryData]] {.
#    importcpp: "GetConvexCache", header: "PhysicsWorld.h".}
proc setApplyingTransforms*(this: var PhysicsWorld; enable: bool) {.
    importcpp: "SetApplyingTransforms", header: "PhysicsWorld.h".}
proc isApplyingTransforms*(this: PhysicsWorld): bool {.noSideEffect, 
    importcpp: "IsApplyingTransforms", header: "PhysicsWorld.h".}

proc registerPhysicsLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterPhysicsLibrary(@)", header: "PhysicsWorld.h".}

proc getPhysicsWorld*(this: CollisionShape): ptr PhysicsWorld {.noSideEffect, 
    importcpp: "GetPhysicsWorld", header: "CollisionShape.h".}
