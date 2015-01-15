

import 
  component, vectorBuffer

discard "forward decl of btCompoundShape"
discard "forward decl of btRigidBody"
discard "forward decl of CollisionShape"
discard "forward decl of Constraint"
discard "forward decl of PhysicsWorld"
discard "forward decl of SmoothedTransform"
type 
  CollisionEventMode* = enum 
    COLLISION_NEVER = 0, COLLISION_ACTIVE, COLLISION_ALWAYS



type 
  RigidBody* {.importc: "Urho3D::RigidBody", header: "RigidBody.h".} = object of Component
    body* {.importc: "body_".}: ptr BtRigidBody
    compoundShape* {.importc: "compoundShape_".}: ptr BtCompoundShape
    shiftedCompoundShape* {.importc: "shiftedCompoundShape_".}: ptr BtCompoundShape
    physicsWorld* {.importc: "physicsWorld_".}: WeakPtr[PhysicsWorld]
    constraints* {.importc: "constraints_".}: PODVector[ptr Constraint]
    gravityOverride* {.importc: "gravityOverride_".}: Vector3
    centerOfMass* {.importc: "centerOfMass_".}: Vector3
    mass* {.importc: "mass_".}: cfloat
    attrBuffer* {.importc: "attrBuffer_".}: VectorBuffer
    collisionLayer* {.importc: "collisionLayer_".}: cuint
    collisionMask* {.importc: "collisionMask_".}: cuint
    collisionEventMode* {.importc: "collisionEventMode_".}: CollisionEventMode
    lastPosition* {.importc: "lastPosition_".}: Vector3
    lastRotation* {.importc: "lastRotation_".}: Quaternion
    kinematic* {.importc: "kinematic_".}: bool
    trigger* {.importc: "trigger_".}: bool
    useGravity* {.importc: "useGravity_".}: bool
    hasSmoothedTransform* {.importc: "hasSmoothedTransform_".}: bool
    readdBody* {.importc: "readdBody_".}: bool
    inWorld* {.importc: "inWorld_".}: bool
    enableMassUpdate* {.importc: "enableMassUpdate_".}: bool


proc getType*(this: RigidBody): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "RigidBody.h".}
proc getBaseType*(this: RigidBody): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "RigidBody.h".}
proc getTypeName*(this: RigidBody): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "RigidBody.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::RigidBody::GetTypeStatic(@)", header: "RigidBody.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::RigidBody::GetTypeNameStatic(@)", header: "RigidBody.h".}
proc constructRigidBody*(context: ptr Context): RigidBody {.
    importcpp: "Urho3D::RigidBody(@)", header: "RigidBody.h".}
proc destroyRigidBody*(this: var RigidBody) {.importcpp: "#.~RigidBody()", 
    header: "RigidBody.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::RigidBody::RegisterObject(@)", header: "RigidBody.h".}
proc onSetAttribute*(this: var RigidBody; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "RigidBody.h".}
proc applyAttributes*(this: var RigidBody) {.importcpp: "ApplyAttributes", 
    header: "RigidBody.h".}
proc onSetEnabled*(this: var RigidBody) {.importcpp: "OnSetEnabled", 
    header: "RigidBody.h".}
proc getWorldTransform*(this: RigidBody; worldTrans: var BtTransform) {.
    noSideEffect, importcpp: "getWorldTransform", header: "RigidBody.h".}
proc setWorldTransform*(this: var RigidBody; worldTrans: BtTransform) {.
    importcpp: "setWorldTransform", header: "RigidBody.h".}
proc drawDebugGeometry*(this: var RigidBody; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "RigidBody.h".}
proc setMass*(this: var RigidBody; mass: cfloat) {.importcpp: "SetMass", 
    header: "RigidBody.h".}
proc setPosition*(this: var RigidBody; position: Vector3) {.
    importcpp: "SetPosition", header: "RigidBody.h".}
proc setRotation*(this: var RigidBody; rotation: Quaternion) {.
    importcpp: "SetRotation", header: "RigidBody.h".}
proc setTransform*(this: var RigidBody; position: Vector3; rotation: Quaternion) {.
    importcpp: "SetTransform", header: "RigidBody.h".}
proc setLinearVelocity*(this: var RigidBody; velocity: Vector3) {.
    importcpp: "SetLinearVelocity", header: "RigidBody.h".}
proc setLinearFactor*(this: var RigidBody; factor: Vector3) {.
    importcpp: "SetLinearFactor", header: "RigidBody.h".}
proc setLinearRestThreshold*(this: var RigidBody; threshold: cfloat) {.
    importcpp: "SetLinearRestThreshold", header: "RigidBody.h".}
proc setLinearDamping*(this: var RigidBody; damping: cfloat) {.
    importcpp: "SetLinearDamping", header: "RigidBody.h".}
proc setAngularVelocity*(this: var RigidBody; angularVelocity: Vector3) {.
    importcpp: "SetAngularVelocity", header: "RigidBody.h".}
proc setAngularFactor*(this: var RigidBody; factor: Vector3) {.
    importcpp: "SetAngularFactor", header: "RigidBody.h".}
proc setAngularRestThreshold*(this: var RigidBody; threshold: cfloat) {.
    importcpp: "SetAngularRestThreshold", header: "RigidBody.h".}
proc setAngularDamping*(this: var RigidBody; factor: cfloat) {.
    importcpp: "SetAngularDamping", header: "RigidBody.h".}
proc setFriction*(this: var RigidBody; friction: cfloat) {.
    importcpp: "SetFriction", header: "RigidBody.h".}
proc setAnisotropicFriction*(this: var RigidBody; friction: Vector3) {.
    importcpp: "SetAnisotropicFriction", header: "RigidBody.h".}
proc setRollingFriction*(this: var RigidBody; friction: cfloat) {.
    importcpp: "SetRollingFriction", header: "RigidBody.h".}
proc setRestitution*(this: var RigidBody; restitution: cfloat) {.
    importcpp: "SetRestitution", header: "RigidBody.h".}
proc setContactProcessingThreshold*(this: var RigidBody; threshold: cfloat) {.
    importcpp: "SetContactProcessingThreshold", header: "RigidBody.h".}
proc setCcdRadius*(this: var RigidBody; radius: cfloat) {.
    importcpp: "SetCcdRadius", header: "RigidBody.h".}
proc setCcdMotionThreshold*(this: var RigidBody; threshold: cfloat) {.
    importcpp: "SetCcdMotionThreshold", header: "RigidBody.h".}
proc setUseGravity*(this: var RigidBody; enable: bool) {.
    importcpp: "SetUseGravity", header: "RigidBody.h".}
proc setGravityOverride*(this: var RigidBody; gravity: Vector3) {.
    importcpp: "SetGravityOverride", header: "RigidBody.h".}
proc setKinematic*(this: var RigidBody; enable: bool) {.
    importcpp: "SetKinematic", header: "RigidBody.h".}
proc setTrigger*(this: var RigidBody; enable: bool) {.importcpp: "SetTrigger", 
    header: "RigidBody.h".}
proc setCollisionLayer*(this: var RigidBody; layer: cuint) {.
    importcpp: "SetCollisionLayer", header: "RigidBody.h".}
proc setCollisionMask*(this: var RigidBody; mask: cuint) {.
    importcpp: "SetCollisionMask", header: "RigidBody.h".}
proc setCollisionLayerAndMask*(this: var RigidBody; layer: cuint; mask: cuint) {.
    importcpp: "SetCollisionLayerAndMask", header: "RigidBody.h".}
proc setCollisionEventMode*(this: var RigidBody; mode: CollisionEventMode) {.
    importcpp: "SetCollisionEventMode", header: "RigidBody.h".}
proc applyForce*(this: var RigidBody; force: Vector3) {.importcpp: "ApplyForce", 
    header: "RigidBody.h".}
proc applyForce*(this: var RigidBody; force: Vector3; position: Vector3) {.
    importcpp: "ApplyForce", header: "RigidBody.h".}
proc applyTorque*(this: var RigidBody; torque: Vector3) {.
    importcpp: "ApplyTorque", header: "RigidBody.h".}
proc applyImpulse*(this: var RigidBody; impulse: Vector3) {.
    importcpp: "ApplyImpulse", header: "RigidBody.h".}
proc applyImpulse*(this: var RigidBody; impulse: Vector3; position: Vector3) {.
    importcpp: "ApplyImpulse", header: "RigidBody.h".}
proc applyTorqueImpulse*(this: var RigidBody; torque: Vector3) {.
    importcpp: "ApplyTorqueImpulse", header: "RigidBody.h".}
proc resetForces*(this: var RigidBody) {.importcpp: "ResetForces", 
    header: "RigidBody.h".}
proc activate*(this: var RigidBody) {.importcpp: "Activate", 
                                      header: "RigidBody.h".}
proc reAddBodyToWorld*(this: var RigidBody) {.importcpp: "ReAddBodyToWorld", 
    header: "RigidBody.h".}
proc disableMassUpdate*(this: var RigidBody) {.importcpp: "DisableMassUpdate", 
    header: "RigidBody.h".}
proc enableMassUpdate*(this: var RigidBody) {.importcpp: "EnableMassUpdate", 
    header: "RigidBody.h".}
proc getPhysicsWorld*(this: RigidBody): ptr PhysicsWorld {.noSideEffect, 
    importcpp: "GetPhysicsWorld", header: "RigidBody.h".}
proc getBody*(this: RigidBody): ptr BtRigidBody {.noSideEffect, 
    importcpp: "GetBody", header: "RigidBody.h".}
proc getCompoundShape*(this: RigidBody): ptr BtCompoundShape {.noSideEffect, 
    importcpp: "GetCompoundShape", header: "RigidBody.h".}
proc getMass*(this: RigidBody): cfloat {.noSideEffect, importcpp: "GetMass", 
    header: "RigidBody.h".}
proc getPosition*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetPosition", header: "RigidBody.h".}
proc getRotation*(this: RigidBody): Quaternion {.noSideEffect, 
    importcpp: "GetRotation", header: "RigidBody.h".}
proc getLinearVelocity*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetLinearVelocity", header: "RigidBody.h".}
proc getLinearFactor*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetLinearFactor", header: "RigidBody.h".}
proc getVelocityAtPoint*(this: RigidBody; position: Vector3): Vector3 {.
    noSideEffect, importcpp: "GetVelocityAtPoint", header: "RigidBody.h".}
proc getLinearRestThreshold*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetLinearRestThreshold", header: "RigidBody.h".}
proc getLinearDamping*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetLinearDamping", header: "RigidBody.h".}
proc getAngularVelocity*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetAngularVelocity", header: "RigidBody.h".}
proc getAngularFactor*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetAngularFactor", header: "RigidBody.h".}
proc getAngularRestThreshold*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetAngularRestThreshold", header: "RigidBody.h".}
proc getAngularDamping*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetAngularDamping", header: "RigidBody.h".}
proc getFriction*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetFriction", header: "RigidBody.h".}
proc getAnisotropicFriction*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetAnisotropicFriction", header: "RigidBody.h".}
proc getRollingFriction*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetRollingFriction", header: "RigidBody.h".}
proc getRestitution*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetRestitution", header: "RigidBody.h".}
proc getContactProcessingThreshold*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetContactProcessingThreshold", header: "RigidBody.h".}
proc getCcdRadius*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetCcdRadius", header: "RigidBody.h".}
proc getCcdMotionThreshold*(this: RigidBody): cfloat {.noSideEffect, 
    importcpp: "GetCcdMotionThreshold", header: "RigidBody.h".}
proc getUseGravity*(this: RigidBody): bool {.noSideEffect, 
    importcpp: "GetUseGravity", header: "RigidBody.h".}
proc getGravityOverride*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetGravityOverride", header: "RigidBody.h".}
proc getCenterOfMass*(this: RigidBody): Vector3 {.noSideEffect, 
    importcpp: "GetCenterOfMass", header: "RigidBody.h".}
proc isKinematic*(this: RigidBody): bool {.noSideEffect, 
    importcpp: "IsKinematic", header: "RigidBody.h".}
proc isTrigger*(this: RigidBody): bool {.noSideEffect, importcpp: "IsTrigger", 
    header: "RigidBody.h".}
proc isActive*(this: RigidBody): bool {.noSideEffect, importcpp: "IsActive", 
                                        header: "RigidBody.h".}
proc getCollisionLayer*(this: RigidBody): cuint {.noSideEffect, 
    importcpp: "GetCollisionLayer", header: "RigidBody.h".}
proc getCollisionMask*(this: RigidBody): cuint {.noSideEffect, 
    importcpp: "GetCollisionMask", header: "RigidBody.h".}
proc getCollisionEventMode*(this: RigidBody): CollisionEventMode {.noSideEffect, 
    importcpp: "GetCollisionEventMode", header: "RigidBody.h".}
proc getCollidingBodies*(this: RigidBody; result: var PODVector[ptr RigidBody]) {.
    noSideEffect, importcpp: "GetCollidingBodies", header: "RigidBody.h".}
proc applyWorldTransform*(this: var RigidBody; newWorldPosition: Vector3; 
                          newWorldRotation: Quaternion) {.
    importcpp: "ApplyWorldTransform", header: "RigidBody.h".}
proc updateMass*(this: var RigidBody) {.importcpp: "UpdateMass", 
                                        header: "RigidBody.h".}
proc updateGravity*(this: var RigidBody) {.importcpp: "UpdateGravity", 
    header: "RigidBody.h".}
proc setNetAngularVelocityAttr*(this: var RigidBody; value: PODVector[cuchar]) {.
    importcpp: "SetNetAngularVelocityAttr", header: "RigidBody.h".}
proc getNetAngularVelocityAttr*(this: RigidBody): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetNetAngularVelocityAttr", header: "RigidBody.h".}
proc addConstraint*(this: var RigidBody; constraint: ptr Constraint) {.
    importcpp: "AddConstraint", header: "RigidBody.h".}
proc removeConstraint*(this: var RigidBody; constraint: ptr Constraint) {.
    importcpp: "RemoveConstraint", header: "RigidBody.h".}
proc releaseBody*(this: var RigidBody) {.importcpp: "ReleaseBody", 
    header: "RigidBody.h".}