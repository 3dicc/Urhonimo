

import 
  component, vector3

discard "forward decl of btTypedConstraint"

type 
  ConstraintType* {.importcpp: "Urho3D::ConstraintType".} = enum 
    CONSTRAINT_POINT = 0, CONSTRAINT_HINGE, CONSTRAINT_SLIDER, 
    CONSTRAINT_CONETWIST


discard "forward decl of PhysicsWorld"
discard "forward decl of RigidBody"
type 
  Constraint* {.importc: "Urho3D::Constraint", header: "Constraint.h".} = object of Component
    physicsWorld* {.importc: "physicsWorld_".}: WeakPtr[PhysicsWorld]
    ownBody* {.importc: "ownBody_".}: WeakPtr[RigidBody]
    otherBody* {.importc: "otherBody_".}: WeakPtr[RigidBody]
    constraint* {.importc: "constraint_".}: ptr BtTypedConstraint
    constraintType* {.importc: "constraintType_".}: ConstraintType
    position* {.importc: "position_".}: Vector3
    rotation* {.importc: "rotation_".}: Quaternion
    otherPosition* {.importc: "otherPosition_".}: Vector3
    otherRotation* {.importc: "otherRotation_".}: Quaternion
    cachedWorldScale* {.importc: "cachedWorldScale_".}: Vector3
    highLimit* {.importc: "highLimit_".}: Vector2
    lowLimit* {.importc: "lowLimit_".}: Vector2
    erp* {.importc: "erp_".}: cfloat
    cfm* {.importc: "cfm_".}: cfloat
    otherBodyNodeID* {.importc: "otherBodyNodeID_".}: cint
    disableCollision* {.importc: "disableCollision_".}: bool
    recreateConstraint* {.importc: "recreateConstraint_".}: bool
    framesDirty* {.importc: "framesDirty_".}: bool


proc getType*(this: Constraint): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Constraint.h".}
proc getBaseType*(this: Constraint): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Constraint.h".}
proc getTypeName*(this: Constraint): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Constraint.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Constraint::GetTypeStatic(@)", header: "Constraint.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Constraint::GetTypeNameStatic(@)", 
    header: "Constraint.h".}
proc constructConstraint*(context: ptr Context): Constraint {.
    importcpp: "Urho3D::Constraint(@)", header: "Constraint.h".}
proc destroyConstraint*(this: var Constraint) {.importcpp: "#.~Constraint()", 
    header: "Constraint.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Constraint::RegisterObject(@)", header: "Constraint.h".}
proc onSetAttribute*(this: var Constraint; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "Constraint.h".}
proc applyAttributes*(this: var Constraint) {.importcpp: "ApplyAttributes", 
    header: "Constraint.h".}
proc onSetEnabled*(this: var Constraint) {.importcpp: "OnSetEnabled", 
    header: "Constraint.h".}
proc getDependencyNodes*(this: var Constraint; dest: var PODVector[ptr Node]) {.
    importcpp: "GetDependencyNodes", header: "Constraint.h".}
proc drawDebugGeometry*(this: var Constraint; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Constraint.h".}
proc setConstraintType*(this: var Constraint; `type`: ConstraintType) {.
    importcpp: "SetConstraintType", header: "Constraint.h".}
proc setOtherBody*(this: var Constraint; body: ptr RigidBody) {.
    importcpp: "SetOtherBody", header: "Constraint.h".}
proc setPosition*(this: var Constraint; position: Vector3) {.
    importcpp: "SetPosition", header: "Constraint.h".}
proc setRotation*(this: var Constraint; rotation: Quaternion) {.
    importcpp: "SetRotation", header: "Constraint.h".}
proc setAxis*(this: var Constraint; axis: Vector3) {.importcpp: "SetAxis", 
    header: "Constraint.h".}
proc setOtherPosition*(this: var Constraint; position: Vector3) {.
    importcpp: "SetOtherPosition", header: "Constraint.h".}
proc setOtherRotation*(this: var Constraint; rotation: Quaternion) {.
    importcpp: "SetOtherRotation", header: "Constraint.h".}
proc setOtherAxis*(this: var Constraint; axis: Vector3) {.
    importcpp: "SetOtherAxis", header: "Constraint.h".}
proc setWorldPosition*(this: var Constraint; position: Vector3) {.
    importcpp: "SetWorldPosition", header: "Constraint.h".}
proc setHighLimit*(this: var Constraint; limit: Vector2) {.
    importcpp: "SetHighLimit", header: "Constraint.h".}
proc setLowLimit*(this: var Constraint; limit: Vector2) {.
    importcpp: "SetLowLimit", header: "Constraint.h".}
proc setERP*(this: var Constraint; erp: cfloat) {.importcpp: "SetERP", 
    header: "Constraint.h".}
proc setCFM*(this: var Constraint; cfm: cfloat) {.importcpp: "SetCFM", 
    header: "Constraint.h".}
proc setDisableCollision*(this: var Constraint; disable: bool) {.
    importcpp: "SetDisableCollision", header: "Constraint.h".}
proc getPhysicsWorld*(this: Constraint): ptr PhysicsWorld {.noSideEffect, 
    importcpp: "GetPhysicsWorld", header: "Constraint.h".}
proc getConstraint*(this: Constraint): ptr BtTypedConstraint {.noSideEffect, 
    importcpp: "GetConstraint", header: "Constraint.h".}
proc getConstraintType*(this: Constraint): ConstraintType {.noSideEffect, 
    importcpp: "GetConstraintType", header: "Constraint.h".}
proc getOwnBody*(this: Constraint): ptr RigidBody {.noSideEffect, 
    importcpp: "GetOwnBody", header: "Constraint.h".}
proc getOtherBody*(this: Constraint): ptr RigidBody {.noSideEffect, 
    importcpp: "GetOtherBody", header: "Constraint.h".}
proc getPosition*(this: Constraint): Vector3 {.noSideEffect, 
    importcpp: "GetPosition", header: "Constraint.h".}
proc getRotation*(this: Constraint): Quaternion {.noSideEffect, 
    importcpp: "GetRotation", header: "Constraint.h".}
proc getOtherPosition*(this: Constraint): Vector3 {.noSideEffect, 
    importcpp: "GetOtherPosition", header: "Constraint.h".}
proc getOtherRotation*(this: Constraint): Quaternion {.noSideEffect, 
    importcpp: "GetOtherRotation", header: "Constraint.h".}
proc getWorldPosition*(this: Constraint): Vector3 {.noSideEffect, 
    importcpp: "GetWorldPosition", header: "Constraint.h".}
proc getHighLimit*(this: Constraint): Vector2 {.noSideEffect, 
    importcpp: "GetHighLimit", header: "Constraint.h".}
proc getLowLimit*(this: Constraint): Vector2 {.noSideEffect, 
    importcpp: "GetLowLimit", header: "Constraint.h".}
proc getERP*(this: Constraint): cfloat {.noSideEffect, importcpp: "GetERP", 
    header: "Constraint.h".}
proc getCFM*(this: Constraint): cfloat {.noSideEffect, importcpp: "GetCFM", 
    header: "Constraint.h".}
proc getDisableCollision*(this: Constraint): bool {.noSideEffect, 
    importcpp: "GetDisableCollision", header: "Constraint.h".}
proc releaseConstraint*(this: var Constraint) {.importcpp: "ReleaseConstraint", 
    header: "Constraint.h".}
proc applyFrames*(this: var Constraint) {.importcpp: "ApplyFrames", 
    header: "Constraint.h".}