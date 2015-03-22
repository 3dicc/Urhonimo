

import
  component, debugRenderer, mathDefs, node, ptrs, variant, vector, vector3,
  spline


type
  SplinePath* {.importcpp: "Urho3D::SplinePath", header: "SplinePath.h".} = object of Component
    spline* {.importc: "spline_".}: Spline
    speed* {.importc: "speed_".}: cfloat
    elapsedTime* {.importc: "elapsedTime_".}: cfloat
    traveled* {.importc: "traveled_".}: cfloat
    length* {.importc: "length_".}: cfloat
    dirty* {.importc: "dirty_".}: bool
    controlledNode* {.importc: "controlledNode_".}: WeakPtr[Node]
    controlPoints* {.importc: "controlPoints_".}: Vector[WeakPtr[Node]]
    controlPointIdsAttr* {.importc: "controlPointIdsAttr_".}: VariantVector
    controlledIdAttr* {.importc: "controlledIdAttr_".}: cuint


proc getType*(this: SplinePath): StringHash {.noSideEffect,
    importcpp: "GetType", header: "SplinePath.h".}
proc getBaseType*(this: SplinePath): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "SplinePath.h".}
proc getTypeName*(this: SplinePath): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "SplinePath.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::SplinePath::GetTypeStatic(@)", header: "SplinePath.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::SplinePath::GetTypeNameStatic(@)",
    header: "SplinePath.h".}
proc constructSplinePath*(context: ptr Context): SplinePath {.constructor,
    importcpp: "Urho3D::SplinePath(@)", header: "SplinePath.h".}
proc destroySplinePath*(this: var SplinePath) {.importcpp: "#.~SplinePath()",
    header: "SplinePath.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::SplinePath::RegisterObject(@)", header: "SplinePath.h".}
proc applyAttributes*(this: var SplinePath) {.importcpp: "ApplyAttributes",
    header: "SplinePath.h".}
proc drawDebugGeometry*(this: var SplinePath; debug: ptr DebugRenderer;
                        depthTest: bool) {.importcpp: "DrawDebugGeometry",
    header: "SplinePath.h".}
proc addControlPoint*(this: var SplinePath; point: ptr Node;
                      index: cuint = m_Max_Unsigned) {.
    importcpp: "AddControlPoint", header: "SplinePath.h".}
proc removeControlPoint*(this: var SplinePath; point: ptr Node) {.
    importcpp: "RemoveControlPoint", header: "SplinePath.h".}
proc clearControlPoints*(this: var SplinePath) {.
    importcpp: "ClearControlPoints", header: "SplinePath.h".}
proc setInterpolationMode*(this: var SplinePath;
                           interpolationMode: InterpolationMode) {.
    importcpp: "SetInterpolationMode", header: "SplinePath.h".}
proc setSpeed*(this: var SplinePath; speed: cfloat) {.importcpp: "SetSpeed",
    header: "SplinePath.h".}
proc setPosition*(this: var SplinePath; factor: cfloat) {.
    importcpp: "SetPosition", header: "SplinePath.h".}
proc setControlledNode*(this: var SplinePath; controlled: ptr Node) {.
    importcpp: "SetControlledNode", header: "SplinePath.h".}
proc getInterpolationMode*(this: SplinePath): InterpolationMode {.noSideEffect,
    importcpp: "GetInterpolationMode", header: "SplinePath.h".}
proc getSpeed*(this: SplinePath): cfloat {.noSideEffect, importcpp: "GetSpeed",
    header: "SplinePath.h".}
proc getPosition*(this: SplinePath): Vector3 {.noSideEffect,
    importcpp: "GetPosition", header: "SplinePath.h".}
proc getControlledNode*(this: SplinePath): ptr Node {.noSideEffect,
    importcpp: "GetControlledNode", header: "SplinePath.h".}
proc getPoint*(this: SplinePath; factor: cfloat): Vector3 {.noSideEffect,
    importcpp: "GetPoint", header: "SplinePath.h".}
proc move*(this: var SplinePath; timeStep: cfloat) {.importcpp: "Move",
    header: "SplinePath.h".}
proc reset*(this: var SplinePath) {.importcpp: "Reset", header: "SplinePath.h".}
proc isFinished*(this: SplinePath): bool {.noSideEffect,
    importcpp: "IsFinished", header: "SplinePath.h".}
proc setControlPointIdsAttr*(this: var SplinePath; value: VariantVector) {.
    importcpp: "SetControlPointIdsAttr", header: "SplinePath.h".}
proc getControlPointIdsAttr*(this: SplinePath): VariantVector {.noSideEffect,
    importcpp: "GetControlPointIdsAttr", header: "SplinePath.h".}
proc setControlledIdAttr*(this: var SplinePath; value: cuint) {.
    importcpp: "SetControlledIdAttr", header: "SplinePath.h".}
proc getControlledIdAttr*(this: SplinePath): cuint {.noSideEffect,
    importcpp: "GetControlledIdAttr", header: "SplinePath.h".}
