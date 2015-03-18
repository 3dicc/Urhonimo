

import
  component


var SMOOTH_NONE* {.importc: "SMOOTH_NONE", header: "SmoothedTransform.h".}: cuint #= 0
var SMOOTH_POSITION* {.importc: "SMOOTH_POSITION", header: "SmoothedTransform.h".}: cuint #= 1
var SMOOTH_ROTATION* {.importc: "SMOOTH_ROTATION", header: "SmoothedTransform.h".}: cuint #= 2


type
  SmoothedTransform* {.importcpp: "Urho3D::SmoothedTransform",
                       header: "SmoothedTransform.h".} = object of Component
    targetPosition* {.importc: "targetPosition_".}: Vector3
    targetRotation* {.importc: "targetRotation_".}: Quaternion
    smoothingMask* {.importc: "smoothingMask_".}: cuchar
    subscribed* {.importc: "subscribed_".}: bool


proc getType*(this: SmoothedTransform): StringHash {.noSideEffect,
    importcpp: "GetType", header: "SmoothedTransform.h".}
proc getBaseType*(this: SmoothedTransform): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "SmoothedTransform.h".}
proc getTypeName*(this: SmoothedTransform): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "SmoothedTransform.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::SmoothedTransform::GetTypeStatic(@)",
    header: "SmoothedTransform.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::SmoothedTransform::GetTypeNameStatic(@)",
    header: "SmoothedTransform.h".}
proc constructSmoothedTransform*(context: ptr Context): SmoothedTransform {.
    importcpp: "Urho3D::SmoothedTransform(@)", header: "SmoothedTransform.h",
    constructor.}
proc destroySmoothedTransform*(this: var SmoothedTransform) {.
    importcpp: "#.~SmoothedTransform()", header: "SmoothedTransform.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::SmoothedTransform::RegisterObject(@)",
    header: "SmoothedTransform.h".}
proc update*(this: var SmoothedTransform; constant: cfloat;
             squaredSnapThreshold: cfloat) {.importcpp: "Update",
    header: "SmoothedTransform.h".}
proc setTargetPosition*(this: var SmoothedTransform; position: Vector3) {.
    importcpp: "SetTargetPosition", header: "SmoothedTransform.h".}
proc setTargetRotation*(this: var SmoothedTransform; rotation: Quaternion) {.
    importcpp: "SetTargetRotation", header: "SmoothedTransform.h".}
proc setTargetWorldPosition*(this: var SmoothedTransform; position: Vector3) {.
    importcpp: "SetTargetWorldPosition", header: "SmoothedTransform.h".}
proc setTargetWorldRotation*(this: var SmoothedTransform; rotation: Quaternion) {.
    importcpp: "SetTargetWorldRotation", header: "SmoothedTransform.h".}
proc getTargetPosition*(this: SmoothedTransform): Vector3 {.noSideEffect,
    importcpp: "GetTargetPosition", header: "SmoothedTransform.h".}
proc getTargetRotation*(this: SmoothedTransform): Quaternion {.noSideEffect,
    importcpp: "GetTargetRotation", header: "SmoothedTransform.h".}
proc getTargetWorldPosition*(this: SmoothedTransform): Vector3 {.noSideEffect,
    importcpp: "GetTargetWorldPosition", header: "SmoothedTransform.h".}
proc getTargetWorldRotation*(this: SmoothedTransform): Quaternion {.
    noSideEffect, importcpp: "GetTargetWorldRotation",
    header: "SmoothedTransform.h".}
proc isInProgress*(this: SmoothedTransform): bool {.noSideEffect,
    importcpp: "IsInProgress", header: "SmoothedTransform.h".}
