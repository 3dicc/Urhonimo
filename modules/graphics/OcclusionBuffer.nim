

import 
  arrayPtr, frustum, UrObject, graphicsDefs, timer

discard "forward decl of BoundingBox"
discard "forward decl of Camera"
discard "forward decl of IndexBuffer"
discard "forward decl of IntRect"
discard "forward decl of VertexBuffer"
discard "forward decl of Edge"
discard "forward decl of Gradients"
type 
  DepthValue* {.importc: "Urho3D::DepthValue", header: "OcclusionBuffer.h".} = object 
    min* {.importc: "min_".}: cint
    max* {.importc: "max_".}: cint


var OCCLUSION_MIN_SIZE* {.importc: "OCCLUSION_MIN_SIZE", 
                          header: "OcclusionBuffer.h".}: cint = 8

var OCCLUSION_DEFAULT_MAX_TRIANGLES* {.importc: "OCCLUSION_DEFAULT_MAX_TRIANGLES", 
                                       header: "OcclusionBuffer.h".}: cint = 5000

var OCCLUSION_RELATIVE_BIAS* {.importc: "OCCLUSION_RELATIVE_BIAS", 
                               header: "OcclusionBuffer.h".}: cfloat = 1e-005

var OCCLUSION_FIXED_BIAS* {.importc: "OCCLUSION_FIXED_BIAS", 
                            header: "OcclusionBuffer.h".}: cint = 16

var OCCLUSION_X_SCALE* {.importc: "OCCLUSION_X_SCALE", 
                         header: "OcclusionBuffer.h".}: cfloat = 65536.0

var OCCLUSION_Z_SCALE* {.importc: "OCCLUSION_Z_SCALE", 
                         header: "OcclusionBuffer.h".}: cfloat = 16777216.0


type 
  OcclusionBuffer* {.importc: "Urho3D::OcclusionBuffer", 
                     header: "OcclusionBuffer.h".} = object of UrObject
    buffer* {.importc: "buffer_".}: ptr cint
    width* {.importc: "width_".}: cint
    height* {.importc: "height_".}: cint
    numTriangles* {.importc: "numTriangles_".}: cuint
    maxTriangles* {.importc: "maxTriangles_".}: cuint
    cullMode* {.importc: "cullMode_".}: CullMode
    depthHierarchyDirty* {.importc: "depthHierarchyDirty_".}: bool
    reverseCulling* {.importc: "reverseCulling_".}: bool
    view* {.importc: "view_".}: Matrix3x4
    projection* {.importc: "projection_".}: Matrix4
    viewProj* {.importc: "viewProj_".}: Matrix4
    useTimer* {.importc: "useTimer_".}: Timer
    nearClip* {.importc: "nearClip_".}: cfloat
    farClip* {.importc: "farClip_".}: cfloat
    scaleX* {.importc: "scaleX_".}: cfloat
    scaleY* {.importc: "scaleY_".}: cfloat
    offsetX* {.importc: "offsetX_".}: cfloat
    offsetY* {.importc: "offsetY_".}: cfloat
    projOffsetScaleX* {.importc: "projOffsetScaleX_".}: cfloat
    projOffsetScaleY* {.importc: "projOffsetScaleY_".}: cfloat
    fullBuffer* {.importc: "fullBuffer_".}: SharedArrayPtr[cint]
    mipBuffers* {.importc: "mipBuffers_".}: Vector[SharedArrayPtr[DepthValue]]


proc getType*(this: OcclusionBuffer): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "OcclusionBuffer.h".}
proc getBaseType*(this: OcclusionBuffer): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "OcclusionBuffer.h".}
proc getTypeName*(this: OcclusionBuffer): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "OcclusionBuffer.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::OcclusionBuffer::GetTypeStatic(@)", 
    header: "OcclusionBuffer.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::OcclusionBuffer::GetTypeNameStatic(@)", 
    header: "OcclusionBuffer.h".}
proc constructOcclusionBuffer*(context: ptr Context): OcclusionBuffer {.
    importcpp: "Urho3D::OcclusionBuffer(@)", header: "OcclusionBuffer.h".}
proc destroyOcclusionBuffer*(this: var OcclusionBuffer) {.
    importcpp: "#.~OcclusionBuffer()", header: "OcclusionBuffer.h".}
proc setSize*(this: var OcclusionBuffer; width: cint; height: cint): bool {.
    importcpp: "SetSize", header: "OcclusionBuffer.h".}
proc setView*(this: var OcclusionBuffer; camera: ptr Camera) {.
    importcpp: "SetView", header: "OcclusionBuffer.h".}
proc setMaxTriangles*(this: var OcclusionBuffer; triangles: cuint) {.
    importcpp: "SetMaxTriangles", header: "OcclusionBuffer.h".}
proc setCullMode*(this: var OcclusionBuffer; mode: CullMode) {.
    importcpp: "SetCullMode", header: "OcclusionBuffer.h".}
proc reset*(this: var OcclusionBuffer) {.importcpp: "Reset", 
    header: "OcclusionBuffer.h".}
proc clear*(this: var OcclusionBuffer) {.importcpp: "Clear", 
    header: "OcclusionBuffer.h".}
proc draw*(this: var OcclusionBuffer; model: Matrix3x4; vertexData: pointer; 
           vertexSize: cuint; vertexStart: cuint; vertexCount: cuint): bool {.
    importcpp: "Draw", header: "OcclusionBuffer.h".}
proc draw*(this: var OcclusionBuffer; model: Matrix3x4; vertexData: pointer; 
           vertexSize: cuint; indexData: pointer; indexSize: cuint; 
           indexStart: cuint; indexCount: cuint): bool {.importcpp: "Draw", 
    header: "OcclusionBuffer.h".}
proc buildDepthHierarchy*(this: var OcclusionBuffer) {.
    importcpp: "BuildDepthHierarchy", header: "OcclusionBuffer.h".}
proc resetUseTimer*(this: var OcclusionBuffer) {.importcpp: "ResetUseTimer", 
    header: "OcclusionBuffer.h".}
proc getBuffer*(this: OcclusionBuffer): ptr cint {.noSideEffect, 
    importcpp: "GetBuffer", header: "OcclusionBuffer.h".}
proc getView*(this: OcclusionBuffer): Matrix3x4 {.noSideEffect, 
    importcpp: "GetView", header: "OcclusionBuffer.h".}
proc getProjection*(this: OcclusionBuffer): Matrix4 {.noSideEffect, 
    importcpp: "GetProjection", header: "OcclusionBuffer.h".}
proc getWidth*(this: OcclusionBuffer): cint {.noSideEffect, 
    importcpp: "GetWidth", header: "OcclusionBuffer.h".}
proc getHeight*(this: OcclusionBuffer): cint {.noSideEffect, 
    importcpp: "GetHeight", header: "OcclusionBuffer.h".}
proc getNumTriangles*(this: OcclusionBuffer): cuint {.noSideEffect, 
    importcpp: "GetNumTriangles", header: "OcclusionBuffer.h".}
proc getMaxTriangles*(this: OcclusionBuffer): cuint {.noSideEffect, 
    importcpp: "GetMaxTriangles", header: "OcclusionBuffer.h".}
proc getCullMode*(this: OcclusionBuffer): CullMode {.noSideEffect, 
    importcpp: "GetCullMode", header: "OcclusionBuffer.h".}
proc isVisible*(this: OcclusionBuffer; worldSpaceBox: BoundingBox): bool {.
    noSideEffect, importcpp: "IsVisible", header: "OcclusionBuffer.h".}
proc getUseTimer*(this: var OcclusionBuffer): cuint {.importcpp: "GetUseTimer", 
    header: "OcclusionBuffer.h".}