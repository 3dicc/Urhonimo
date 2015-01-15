

import 
  component

discard "forward decl of Camera"
discard "forward decl of RigidBody2D"
type 
  PhysicsRaycastResult2D* {.importc: "Urho3D::PhysicsRaycastResult2D", 
                            header: "PhysicsWorld2D.h".} = object 
    position* {.importc: "position_".}: Vector2
    normal* {.importc: "normal_".}: Vector2
    distance* {.importc: "distance_".}: cfloat
    body* {.importc: "body_".}: ptr RigidBody2D


proc constructPhysicsRaycastResult2D*(): PhysicsRaycastResult2D {.
    importcpp: "Urho3D::PhysicsRaycastResult2D(@)", header: "PhysicsWorld2D.h".}

type 
  PhysicsWorld2D* {.importc: "Urho3D::PhysicsWorld2D", 
                    header: "PhysicsWorld2D.h".} = object of Component
    world* {.importc: "world_".}: ptr B2World
    gravity* {.importc: "gravity_".}: Vector2
    velocityIterations* {.importc: "velocityIterations_".}: cint
    positionIterations* {.importc: "positionIterations_".}: cint
    scene* {.importc: "scene_".}: WeakPtr[Scene]
    debugRenderer* {.importc: "debugRenderer_".}: ptr DebugRenderer
    debugDepthTest* {.importc: "debugDepthTest_".}: bool
    physicsSteping* {.importc: "physicsSteping_".}: bool
    applyingTransforms* {.importc: "applyingTransforms_".}: bool
    rigidBodies* {.importc: "rigidBodies_".}: Vector[WeakPtr[RigidBody2D]]
    beginContactInfos* {.importc: "beginContactInfos_".}: Vector[ContactInfo]
    endContactInfos* {.importc: "endContactInfos_".}: Vector[ContactInfo]


proc getType*(this: PhysicsWorld2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "PhysicsWorld2D.h".}
proc getBaseType*(this: PhysicsWorld2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "PhysicsWorld2D.h".}
proc getTypeName*(this: PhysicsWorld2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "PhysicsWorld2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::PhysicsWorld2D::GetTypeStatic(@)", 
    header: "PhysicsWorld2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::PhysicsWorld2D::GetTypeNameStatic(@)", 
    header: "PhysicsWorld2D.h".}
proc constructPhysicsWorld2D*(scontext: ptr Context): PhysicsWorld2D {.
    importcpp: "Urho3D::PhysicsWorld2D(@)", header: "PhysicsWorld2D.h".}
proc destroyPhysicsWorld2D*(this: var PhysicsWorld2D) {.
    importcpp: "#.~PhysicsWorld2D()", header: "PhysicsWorld2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::PhysicsWorld2D::RegisterObject(@)", 
    header: "PhysicsWorld2D.h".}
proc drawDebugGeometry*(this: var PhysicsWorld2D; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "PhysicsWorld2D.h".}
proc beginContact*(this: var PhysicsWorld2D; contact: ptr B2Contact) {.
    importcpp: "BeginContact", header: "PhysicsWorld2D.h".}
proc endContact*(this: var PhysicsWorld2D; contact: ptr B2Contact) {.
    importcpp: "EndContact", header: "PhysicsWorld2D.h".}
proc drawPolygon*(this: var PhysicsWorld2D; vertices: ptr B2Vec2; 
                  vertexCount: int32; color: B2Color) {.
    importcpp: "DrawPolygon", header: "PhysicsWorld2D.h".}
proc drawSolidPolygon*(this: var PhysicsWorld2D; vertices: ptr B2Vec2; 
                       vertexCount: int32; color: B2Color) {.
    importcpp: "DrawSolidPolygon", header: "PhysicsWorld2D.h".}
proc drawCircle*(this: var PhysicsWorld2D; center: B2Vec2; radius: float32; 
                 color: B2Color) {.importcpp: "DrawCircle", 
                                   header: "PhysicsWorld2D.h".}
proc drawSolidCircle*(this: var PhysicsWorld2D; center: B2Vec2; radius: float32; 
                      axis: B2Vec2; color: B2Color) {.
    importcpp: "DrawSolidCircle", header: "PhysicsWorld2D.h".}
proc drawSegment*(this: var PhysicsWorld2D; p1: B2Vec2; p2: B2Vec2; 
                  color: B2Color) {.importcpp: "DrawSegment", 
                                    header: "PhysicsWorld2D.h".}
proc drawTransform*(this: var PhysicsWorld2D; xf: B2Transform) {.
    importcpp: "DrawTransform", header: "PhysicsWorld2D.h".}
proc update*(this: var PhysicsWorld2D; timeStep: cfloat) {.importcpp: "Update", 
    header: "PhysicsWorld2D.h".}
proc drawDebugGeometry*(this: var PhysicsWorld2D) {.
    importcpp: "DrawDebugGeometry", header: "PhysicsWorld2D.h".}
proc setDrawShape*(this: var PhysicsWorld2D; drawShape: bool) {.
    importcpp: "SetDrawShape", header: "PhysicsWorld2D.h".}
proc setDrawJoint*(this: var PhysicsWorld2D; drawJoint: bool) {.
    importcpp: "SetDrawJoint", header: "PhysicsWorld2D.h".}
proc setDrawAabb*(this: var PhysicsWorld2D; drawAabb: bool) {.
    importcpp: "SetDrawAabb", header: "PhysicsWorld2D.h".}
proc setDrawPair*(this: var PhysicsWorld2D; drawPair: bool) {.
    importcpp: "SetDrawPair", header: "PhysicsWorld2D.h".}
proc setDrawCenterOfMass*(this: var PhysicsWorld2D; drawCenterOfMass: bool) {.
    importcpp: "SetDrawCenterOfMass", header: "PhysicsWorld2D.h".}
proc setAllowSleeping*(this: var PhysicsWorld2D; enable: bool) {.
    importcpp: "SetAllowSleeping", header: "PhysicsWorld2D.h".}
proc setWarmStarting*(this: var PhysicsWorld2D; enable: bool) {.
    importcpp: "SetWarmStarting", header: "PhysicsWorld2D.h".}
proc setContinuousPhysics*(this: var PhysicsWorld2D; enable: bool) {.
    importcpp: "SetContinuousPhysics", header: "PhysicsWorld2D.h".}
proc setSubStepping*(this: var PhysicsWorld2D; enable: bool) {.
    importcpp: "SetSubStepping", header: "PhysicsWorld2D.h".}
proc setGravity*(this: var PhysicsWorld2D; gravity: Vector2) {.
    importcpp: "SetGravity", header: "PhysicsWorld2D.h".}
proc setAutoClearForces*(this: var PhysicsWorld2D; enable: bool) {.
    importcpp: "SetAutoClearForces", header: "PhysicsWorld2D.h".}
proc setVelocityIterations*(this: var PhysicsWorld2D; velocityIterations: cint) {.
    importcpp: "SetVelocityIterations", header: "PhysicsWorld2D.h".}
proc setPositionIterations*(this: var PhysicsWorld2D; positionIterations: cint) {.
    importcpp: "SetPositionIterations", header: "PhysicsWorld2D.h".}
proc addRigidBody*(this: var PhysicsWorld2D; rigidBody: ptr RigidBody2D) {.
    importcpp: "AddRigidBody", header: "PhysicsWorld2D.h".}
proc removeRigidBody*(this: var PhysicsWorld2D; rigidBody: ptr RigidBody2D) {.
    importcpp: "RemoveRigidBody", header: "PhysicsWorld2D.h".}
proc raycast*(this: var PhysicsWorld2D; 
              results: var PODVector[PhysicsRaycastResult2D]; 
              startPoint: Vector2; endPoint: Vector2; 
              collisionMask: cuint = m_Max_Unsigned) {.importcpp: "Raycast", 
    header: "PhysicsWorld2D.h".}
proc raycastSingle*(this: var PhysicsWorld2D; 
                    result: var PhysicsRaycastResult2D; startPoint: Vector2; 
                    endPoint: Vector2; collisionMask: cuint = m_Max_Unsigned) {.
    importcpp: "RaycastSingle", header: "PhysicsWorld2D.h".}
proc getRigidBody*(this: var PhysicsWorld2D; point: Vector2; 
                   collisionMask: cuint = m_Max_Unsigned): ptr RigidBody2D {.
    importcpp: "GetRigidBody", header: "PhysicsWorld2D.h".}
proc getRigidBody*(this: var PhysicsWorld2D; screenX: cint; screenY: cint; 
                   collisionMask: cuint = m_Max_Unsigned): ptr RigidBody2D {.
    importcpp: "GetRigidBody", header: "PhysicsWorld2D.h".}
proc getRigidBodies*(this: var PhysicsWorld2D; 
                     result: var PODVector[ptr RigidBody2D]; aabb: Rect; 
                     collisionMask: cuint = m_Max_Unsigned) {.
    importcpp: "GetRigidBodies", header: "PhysicsWorld2D.h".}
proc getDrawShape*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetDrawShape", header: "PhysicsWorld2D.h".}
proc getDrawJoint*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetDrawJoint", header: "PhysicsWorld2D.h".}
proc getDrawAabb*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetDrawAabb", header: "PhysicsWorld2D.h".}
proc getDrawPair*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetDrawPair", header: "PhysicsWorld2D.h".}
proc getDrawCenterOfMass*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetDrawCenterOfMass", header: "PhysicsWorld2D.h".}
proc getAllowSleeping*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetAllowSleeping", header: "PhysicsWorld2D.h".}
proc getWarmStarting*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetWarmStarting", header: "PhysicsWorld2D.h".}
proc getContinuousPhysics*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetContinuousPhysics", header: "PhysicsWorld2D.h".}
proc getSubStepping*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetSubStepping", header: "PhysicsWorld2D.h".}
proc getAutoClearForces*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "GetAutoClearForces", header: "PhysicsWorld2D.h".}
proc getGravity*(this: PhysicsWorld2D): Vector2 {.noSideEffect, 
    importcpp: "GetGravity", header: "PhysicsWorld2D.h".}
proc getVelocityIterations*(this: PhysicsWorld2D): cint {.noSideEffect, 
    importcpp: "GetVelocityIterations", header: "PhysicsWorld2D.h".}
proc getPositionIterations*(this: PhysicsWorld2D): cint {.noSideEffect, 
    importcpp: "GetPositionIterations", header: "PhysicsWorld2D.h".}
proc getWorld*(this: var PhysicsWorld2D): ptr B2World {.importcpp: "GetWorld", 
    header: "PhysicsWorld2D.h".}
proc setApplyingTransforms*(this: var PhysicsWorld2D; enable: bool) {.
    importcpp: "SetApplyingTransforms", header: "PhysicsWorld2D.h".}
proc isApplyingTransforms*(this: PhysicsWorld2D): bool {.noSideEffect, 
    importcpp: "IsApplyingTransforms", header: "PhysicsWorld2D.h".}