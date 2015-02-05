

import 
  boundingBox, component, graphicsDefs, ray, matrix4, vector2, plane,
  stringHash, urstr, urobject, vector3, quaternion, vector4

var DEFAULT_NEARCLIP* {.importc: "DEFAULT_NEARCLIP", header: "Camera.h".}: cfloat #= 0.1
var DEFAULT_FARCLIP* {.importc: "DEFAULT_FARCLIP", header: "Camera.h".}: cfloat #= 1000.0
var DEFAULT_CAMERA_FOV* {.importc: "DEFAULT_CAMERA_FOV", header: "Camera.h".}: cfloat #= 45.0
var DEFAULT_ORTHOSIZE* {.importc: "DEFAULT_ORTHOSIZE", header: "Camera.h".}: cfloat #= 20.0
var VO_NONE* {.importc: "VO_NONE", header: "Camera.h".}: cuint #= 0x00000000
var VO_LOW_MATERIAL_QUALITY* {.importc: "VO_LOW_MATERIAL_QUALITY", 
                               header: "Camera.h".}: cuint #= 0x00000001
var VO_DISABLE_SHADOWS* {.importc: "VO_DISABLE_SHADOWS", header: "Camera.h".}: cuint #= 0x00000002
var VO_DISABLE_OCCLUSION* {.importc: "VO_DISABLE_OCCLUSION", header: "Camera.h".}: cuint #= 0x00000004


type 
  Camera* {.importc: "Urho3D::Camera", header: "Camera.h".} = object of Component
    view* {.importc: "view_".}: Matrix3x4
    projection* {.importc: "projection_".}: Matrix4
    frustum* {.importc: "frustum_".}: Frustum
    viewDirty* {.importc: "viewDirty_".}: bool
    projectionDirty* {.importc: "projectionDirty_".}: bool
    frustumDirty* {.importc: "frustumDirty_".}: bool
    orthographic* {.importc: "orthographic_".}: bool
    nearClip* {.importc: "nearClip_".}: cfloat
    farClip* {.importc: "farClip_".}: cfloat
    fov* {.importc: "fov_".}: cfloat
    orthoSize* {.importc: "orthoSize_".}: cfloat
    aspectRatio* {.importc: "aspectRatio_".}: cfloat
    zoom* {.importc: "zoom_".}: cfloat
    lodBias* {.importc: "lodBias_".}: cfloat
    viewMask* {.importc: "viewMask_".}: cuint
    viewOverrideFlags* {.importc: "viewOverrideFlags_".}: cuint
    fillMode* {.importc: "fillMode_".}: FillMode
    projectionOffset* {.importc: "projectionOffset_".}: Vector2
    reflectionPlane* {.importc: "reflectionPlane_".}: Plane
    clipPlane* {.importc: "clipPlane_".}: Plane
    reflectionMatrix* {.importc: "reflectionMatrix_".}: Matrix3x4
    autoAspectRatio* {.importc: "autoAspectRatio_".}: bool
    flipVertical* {.importc: "flipVertical_".}: bool
    useReflection* {.importc: "useReflection_".}: bool
    useClipping* {.importc: "useClipping_".}: bool


proc getType*(this: Camera): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Camera.h".}
proc getBaseType*(this: Camera): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Camera.h".}
proc getTypeName*(this: Camera): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Camera.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Camera::GetTypeStatic(@)", header: "Camera.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Camera::GetTypeNameStatic(@)", header: "Camera.h".}
proc constructCamera*(context: ptr Context): Camera {.
    importcpp: "Urho3D::Camera(@)", header: "Camera.h".}
proc destroyCamera*(this: var Camera) {.importcpp: "#.~Camera()", 
                                        header: "Camera.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Camera::RegisterObject(@)", header: "Camera.h".}

proc setNearClip*(this: var Camera; nearClip: cfloat) {.
    importcpp: "SetNearClip", header: "Camera.h".}
proc setFarClip*(this: var Camera; farClip: cfloat) {.importcpp: "SetFarClip", 
    header: "Camera.h".}
proc setFov*(this: var Camera; fov: cfloat) {.importcpp: "SetFov", 
    header: "Camera.h".}
proc setOrthoSize*(this: var Camera; orthoSize: cfloat) {.
    importcpp: "SetOrthoSize", header: "Camera.h".}
proc setOrthoSize*(this: var Camera; orthoSize: Vector2) {.
    importcpp: "SetOrthoSize", header: "Camera.h".}
proc setAspectRatio*(this: var Camera; aspectRatio: cfloat) {.
    importcpp: "SetAspectRatio", header: "Camera.h".}
proc setFillMode*(this: var Camera; mode: FillMode) {.importcpp: "SetFillMode", 
    header: "Camera.h".}
proc setZoom*(this: var Camera; zoom: cfloat) {.importcpp: "SetZoom", 
    header: "Camera.h".}
proc setLodBias*(this: var Camera; bias: cfloat) {.importcpp: "SetLodBias", 
    header: "Camera.h".}
proc setViewMask*(this: var Camera; mask: cuint) {.importcpp: "SetViewMask", 
    header: "Camera.h".}
proc setViewOverrideFlags*(this: var Camera; flags: cuint) {.
    importcpp: "SetViewOverrideFlags", header: "Camera.h".}
proc setOrthographic*(this: var Camera; enable: bool) {.
    importcpp: "SetOrthographic", header: "Camera.h".}
proc setAutoAspectRatio*(this: var Camera; enable: bool) {.
    importcpp: "SetAutoAspectRatio", header: "Camera.h".}
proc setProjectionOffset*(this: var Camera; offset: Vector2) {.
    importcpp: "SetProjectionOffset", header: "Camera.h".}
proc setUseReflection*(this: var Camera; enable: bool) {.
    importcpp: "SetUseReflection", header: "Camera.h".}
proc setReflectionPlane*(this: var Camera; plane: Plane) {.
    importcpp: "SetReflectionPlane", header: "Camera.h".}
proc setUseClipping*(this: var Camera; enable: bool) {.
    importcpp: "SetUseClipping", header: "Camera.h".}
proc setClipPlane*(this: var Camera; plane: Plane) {.importcpp: "SetClipPlane", 
    header: "Camera.h".}
proc setFlipVertical*(this: var Camera; enable: bool) {.
    importcpp: "SetFlipVertical", header: "Camera.h".}
proc getFarClip*(this: Camera): cfloat {.noSideEffect, importcpp: "GetFarClip", 
    header: "Camera.h".}
proc getNearClip*(this: Camera): cfloat {.noSideEffect, 
    importcpp: "GetNearClip", header: "Camera.h".}
proc getFov*(this: Camera): cfloat {.noSideEffect, importcpp: "GetFov", 
                                     header: "Camera.h".}
proc getOrthoSize*(this: Camera): cfloat {.noSideEffect, 
    importcpp: "GetOrthoSize", header: "Camera.h".}
proc getAspectRatio*(this: Camera): cfloat {.noSideEffect, 
    importcpp: "GetAspectRatio", header: "Camera.h".}
proc getZoom*(this: Camera): cfloat {.noSideEffect, importcpp: "GetZoom", 
                                      header: "Camera.h".}
proc getLodBias*(this: Camera): cfloat {.noSideEffect, importcpp: "GetLodBias", 
    header: "Camera.h".}
proc getViewMask*(this: Camera): cuint {.noSideEffect, importcpp: "GetViewMask", 
    header: "Camera.h".}
proc getViewOverrideFlags*(this: Camera): cuint {.noSideEffect, 
    importcpp: "GetViewOverrideFlags", header: "Camera.h".}
proc getFillMode*(this: Camera): FillMode {.noSideEffect, 
    importcpp: "GetFillMode", header: "Camera.h".}
proc isOrthographic*(this: Camera): bool {.noSideEffect, 
    importcpp: "IsOrthographic", header: "Camera.h".}
proc getAutoAspectRatio*(this: Camera): bool {.noSideEffect, 
    importcpp: "GetAutoAspectRatio", header: "Camera.h".}
proc getFrustum*(this: Camera): Frustum {.noSideEffect, importcpp: "GetFrustum", 
    header: "Camera.h".}
proc getProjection*(this: Camera): Matrix4 {.noSideEffect, 
    importcpp: "GetProjection", header: "Camera.h".}
proc getProjection*(this: Camera; apiSpecific: bool): Matrix4 {.noSideEffect, 
    importcpp: "GetProjection", header: "Camera.h".}
proc getView*(this: Camera): Matrix3x4 {.noSideEffect, importcpp: "GetView", 
    header: "Camera.h".}
proc getFrustumSize*(this: Camera; near: var Vector3; far: var Vector3) {.
    noSideEffect, importcpp: "GetFrustumSize", header: "Camera.h".}
proc getHalfViewSize*(this: Camera): cfloat {.noSideEffect, 
    importcpp: "GetHalfViewSize", header: "Camera.h".}
proc getSplitFrustum*(this: Camera; nearClip: cfloat; farClip: cfloat): Frustum {.
    noSideEffect, importcpp: "GetSplitFrustum", header: "Camera.h".}
proc getViewSpaceFrustum*(this: Camera): Frustum {.noSideEffect, 
    importcpp: "GetViewSpaceFrustum", header: "Camera.h".}
proc getViewSpaceSplitFrustum*(this: Camera; nearClip: cfloat; farClip: cfloat): Frustum {.
    noSideEffect, importcpp: "GetViewSpaceSplitFrustum", header: "Camera.h".}
proc getScreenRay*(this: Camera; x: cfloat; y: cfloat): Ray {.noSideEffect, 
    importcpp: "GetScreenRay", header: "Camera.h".}
proc worldToScreenPoint*(this: Camera; worldPos: Vector3): Vector2 {.
    noSideEffect, importcpp: "WorldToScreenPoint", header: "Camera.h".}
proc screenToWorldPoint*(this: Camera; screenPos: Vector3): Vector3 {.
    noSideEffect, importcpp: "ScreenToWorldPoint", header: "Camera.h".}
proc getProjectionOffset*(this: Camera): Vector2 {.noSideEffect, 
    importcpp: "GetProjectionOffset", header: "Camera.h".}
proc getUseReflection*(this: Camera): bool {.noSideEffect, 
    importcpp: "GetUseReflection", header: "Camera.h".}
proc getReflectionPlane*(this: Camera): Plane {.noSideEffect, 
    importcpp: "GetReflectionPlane", header: "Camera.h".}
proc getUseClipping*(this: Camera): bool {.noSideEffect, 
    importcpp: "GetUseClipping", header: "Camera.h".}
proc getClipPlane*(this: Camera): Plane {.noSideEffect, 
    importcpp: "GetClipPlane", header: "Camera.h".}
proc getFlipVertical*(this: Camera): bool {.noSideEffect, 
    importcpp: "GetFlipVertical", header: "Camera.h".}
proc getReverseCulling*(this: Camera): bool {.noSideEffect, 
    importcpp: "GetReverseCulling", header: "Camera.h".}
proc getDistance*(this: Camera; worldPos: Vector3): cfloat {.noSideEffect, 
    importcpp: "GetDistance", header: "Camera.h".}
proc getDistanceSquared*(this: Camera; worldPos: Vector3): cfloat {.
    noSideEffect, importcpp: "GetDistanceSquared", header: "Camera.h".}
proc getLodDistance*(this: Camera; distance: cfloat; scale: cfloat; bias: cfloat): cfloat {.
    noSideEffect, importcpp: "GetLodDistance", header: "Camera.h".}
proc getFaceCameraRotation*(this: var Camera; position: Vector3; 
                            rotation: Quaternion; mode: FaceCameraMode): Quaternion {.
    importcpp: "GetFaceCameraRotation", header: "Camera.h".}
proc getEffectiveWorldTransform*(this: Camera): Matrix3x4 {.noSideEffect, 
    importcpp: "GetEffectiveWorldTransform", header: "Camera.h".}
proc isProjectionValid*(this: Camera): bool {.noSideEffect, 
    importcpp: "IsProjectionValid", header: "Camera.h".}
proc setAspectRatioInternal*(this: var Camera; aspectRatio: cfloat) {.
    importcpp: "SetAspectRatioInternal", header: "Camera.h".}
proc setReflectionPlaneAttr*(this: var Camera; value: Vector4) {.
    importcpp: "SetReflectionPlaneAttr", header: "Camera.h".}
proc getReflectionPlaneAttr*(this: Camera): Vector4 {.noSideEffect, 
    importcpp: "GetReflectionPlaneAttr", header: "Camera.h".}
proc setClipPlaneAttr*(this: var Camera; value: Vector4) {.
    importcpp: "SetClipPlaneAttr", header: "Camera.h".}
proc getClipPlaneAttr*(this: Camera): Vector4 {.noSideEffect, 
    importcpp: "GetClipPlaneAttr", header: "Camera.h".}

