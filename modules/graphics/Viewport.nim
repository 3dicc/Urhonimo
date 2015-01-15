

import 
  UrObject, `ptr`, ray, rect, vector2

discard "forward decl of Camera"
discard "forward decl of RenderPath"
discard "forward decl of Scene"
discard "forward decl of XMLFile"
discard "forward decl of View"
type 
  Viewport* {.importc: "Urho3D::Viewport", header: "Viewport.h".} = object of UrObject
    scene* {.importc: "scene_".}: WeakPtr[Scene]
    camera* {.importc: "camera_".}: WeakPtr[Camera]
    rect* {.importc: "rect_".}: IntRect
    renderPath* {.importc: "renderPath_".}: SharedPtr[RenderPath]
    view* {.importc: "view_".}: SharedPtr[View]
    drawDebug* {.importc: "drawDebug_".}: bool


proc getType*(this: Viewport): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Viewport.h".}
proc getBaseType*(this: Viewport): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Viewport.h".}
proc getTypeName*(this: Viewport): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Viewport.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Viewport::GetTypeStatic(@)", header: "Viewport.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Viewport::GetTypeNameStatic(@)", header: "Viewport.h".}
proc constructViewport*(context: ptr Context): Viewport {.
    importcpp: "Urho3D::Viewport(@)", header: "Viewport.h".}
proc constructViewport*(context: ptr Context; scene: ptr Scene; 
                        camera: ptr Camera; renderPath: ptr RenderPath = 0): Viewport {.
    importcpp: "Urho3D::Viewport(@)", header: "Viewport.h".}
proc constructViewport*(context: ptr Context; scene: ptr Scene; 
                        camera: ptr Camera; rect: IntRect; 
                        renderPath: ptr RenderPath = 0): Viewport {.
    importcpp: "Urho3D::Viewport(@)", header: "Viewport.h".}
proc destroyViewport*(this: var Viewport) {.importcpp: "#.~Viewport()", 
    header: "Viewport.h".}
proc setScene*(this: var Viewport; scene: ptr Scene) {.importcpp: "SetScene", 
    header: "Viewport.h".}
proc setCamera*(this: var Viewport; camera: ptr Camera) {.
    importcpp: "SetCamera", header: "Viewport.h".}
proc setRect*(this: var Viewport; rect: IntRect) {.importcpp: "SetRect", 
    header: "Viewport.h".}
proc setRenderPath*(this: var Viewport; path: ptr RenderPath) {.
    importcpp: "SetRenderPath", header: "Viewport.h".}
proc setRenderPath*(this: var Viewport; file: ptr XMLFile) {.
    importcpp: "SetRenderPath", header: "Viewport.h".}
proc setDrawDebug*(this: var Viewport; enable: bool) {.
    importcpp: "SetDrawDebug", header: "Viewport.h".}
proc getScene*(this: Viewport): ptr Scene {.noSideEffect, importcpp: "GetScene", 
    header: "Viewport.h".}
proc getCamera*(this: Viewport): ptr Camera {.noSideEffect, 
    importcpp: "GetCamera", header: "Viewport.h".}
proc getView*(this: Viewport): ptr View {.noSideEffect, importcpp: "GetView", 
    header: "Viewport.h".}
proc getRect*(this: Viewport): IntRect {.noSideEffect, importcpp: "GetRect", 
    header: "Viewport.h".}
proc getRenderPath*(this: Viewport): ptr RenderPath {.noSideEffect, 
    importcpp: "GetRenderPath", header: "Viewport.h".}
proc getDrawDebug*(this: Viewport): bool {.noSideEffect, 
    importcpp: "GetDrawDebug", header: "Viewport.h".}
proc getScreenRay*(this: Viewport; x: cint; y: cint): Ray {.noSideEffect, 
    importcpp: "GetScreenRay", header: "Viewport.h".}
proc worldToScreenPoint*(this: Viewport; worldPos: Vector3): IntVector2 {.
    noSideEffect, importcpp: "WorldToScreenPoint", header: "Viewport.h".}
proc screenToWorldPoint*(this: Viewport; x: cint; y: cint; depth: cfloat): Vector3 {.
    noSideEffect, importcpp: "ScreenToWorldPoint", header: "Viewport.h".}
proc allocateView*(this: var Viewport) {.importcpp: "AllocateView", 
    header: "Viewport.h".}