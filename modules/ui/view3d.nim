

import
  window

discard "forward decl of Camera"
discard "forward decl of Node"
discard "forward decl of Scene"
discard "forward decl of Texture2D"
discard "forward decl of Viewport"
type
  View3D* {.importcpp: "Urho3D::View3D", header: "View3D.h".} = object of Window
    renderTexture* {.importc: "renderTexture_".}: SharedPtr[Texture2D]
    depthTexture* {.importc: "depthTexture_".}: SharedPtr[Texture2D]
    viewport* {.importc: "viewport_".}: SharedPtr[Viewport]
    scene* {.importc: "scene_".}: SharedPtr[Scene]
    cameraNode* {.importc: "cameraNode_".}: SharedPtr[Node]
    rttFormat* {.importc: "rttFormat_".}: cuint
    autoUpdate* {.importc: "autoUpdate_".}: bool


proc getType*(this: View3D): StringHash {.noSideEffect,
    importcpp: "GetType", header: "View3D.h".}
proc getBaseType*(this: View3D): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "View3D.h".}
proc getTypeName*(this: View3D): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "View3D.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::View3D::GetTypeStatic(@)", header: "View3D.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::View3D::GetTypeNameStatic(@)", header: "View3D.h".}
proc constructView3D*(context: ptr Context): View3D {.constructor,
    importcpp: "Urho3D::View3D(@)", header: "View3D.h".}
proc destroyView3D*(this: var View3D) {.importcpp: "#.~View3D()",
                                        header: "View3D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::View3D::RegisterObject(@)", header: "View3D.h".}
proc onResize*(this: var View3D) {.importcpp: "OnResize", header: "View3D.h".}
proc setView*(this: var View3D; scene: ptr Scene; camera: ptr Camera) {.
    importcpp: "SetView", header: "View3D.h".}
proc setFormat*(this: var View3D; format: cuint) {.importcpp: "SetFormat",
    header: "View3D.h".}
proc setAutoUpdate*(this: var View3D; enable: bool) {.
    importcpp: "SetAutoUpdate", header: "View3D.h".}
proc queueUpdate*(this: var View3D) {.importcpp: "QueueUpdate",
                                      header: "View3D.h".}
proc getFormat*(this: View3D): cuint {.noSideEffect, importcpp: "GetFormat",
                                       header: "View3D.h".}
proc getAutoUpdate*(this: View3D): bool {.noSideEffect,
    importcpp: "GetAutoUpdate", header: "View3D.h".}
proc getScene*(this: View3D): ptr Scene {.noSideEffect, importcpp: "GetScene",
    header: "View3D.h".}
proc getCameraNode*(this: View3D): ptr Node {.noSideEffect,
    importcpp: "GetCameraNode", header: "View3D.h".}
proc getRenderTexture*(this: View3D): ptr Texture2D {.noSideEffect,
    importcpp: "GetRenderTexture", header: "View3D.h".}
proc getDepthTexture*(this: View3D): ptr Texture2D {.noSideEffect,
    importcpp: "GetDepthTexture", header: "View3D.h".}
proc getViewport*(this: View3D): ptr Viewport {.noSideEffect,
    importcpp: "GetViewport", header: "View3D.h".}
