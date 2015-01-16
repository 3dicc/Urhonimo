

import 
  borderImage


type 
  WindowDragMode* = enum 
    DRAG_NONE, DRAG_MOVE, DRAG_RESIZE_TOPLEFT, DRAG_RESIZE_TOP, 
    DRAG_RESIZE_TOPRIGHT, DRAG_RESIZE_RIGHT, DRAG_RESIZE_BOTTOMRIGHT, 
    DRAG_RESIZE_BOTTOM, DRAG_RESIZE_BOTTOMLEFT, DRAG_RESIZE_LEFT



type 
  Window* {.importc: "Urho3D::Window", header: "Window.h".} = object of BorderImage
    movable* {.importc: "movable_".}: bool
    resizable* {.importc: "resizable_".}: bool
    fixedWidthResizing* {.importc: "fixedWidthResizing_".}: bool
    fixedHeightResizing* {.importc: "fixedHeightResizing_".}: bool
    resizeBorder* {.importc: "resizeBorder_".}: IntRect
    dragMode* {.importc: "dragMode_".}: WindowDragMode
    dragBeginCursor* {.importc: "dragBeginCursor_".}: IntVector2
    dragBeginPosition* {.importc: "dragBeginPosition_".}: IntVector2
    dragBeginSize* {.importc: "dragBeginSize_".}: IntVector2
    modal* {.importc: "modal_".}: bool
    modalAutoDismiss* {.importc: "modalAutoDismiss_".}: bool
    modalShadeColor* {.importc: "modalShadeColor_".}: Color
    modalFrameColor* {.importc: "modalFrameColor_".}: Color
    modalFrameSize* {.importc: "modalFrameSize_".}: IntVector2


proc getType*(this: Window): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Window.h".}
proc getBaseType*(this: Window): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Window.h".}
proc getTypeName*(this: Window): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Window.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Window::GetTypeStatic(@)", header: "Window.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Window::GetTypeNameStatic(@)", header: "Window.h".}
proc constructWindow*(context: ptr Context): Window {.
    importcpp: "Urho3D::Window(@)", header: "Window.h".}
proc destroyWindow*(this: var Window) {.importcpp: "#.~Window()", 
                                        header: "Window.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Window::RegisterObject(@)", header: "Window.h".}
proc getBatches*(this: var Window; batches: var PODVector[UIBatch]; 
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "Window.h".}
proc onHover*(this: var Window; position: IntVector2; 
              screenPosition: IntVector2; buttons: cint; qualifiers: cint; 
              cursor: ptr Cursor) {.importcpp: "OnHover", header: "Window.h".}
proc onDragBegin*(this: var Window; position: IntVector2; 
                  screenPosition: IntVector2; buttons: cint; qualifiers: cint; 
                  cursor: ptr Cursor) {.importcpp: "OnDragBegin", 
                                        header: "Window.h".}
proc onDragMove*(this: var Window; position: IntVector2; 
                 screenPosition: IntVector2; deltaPos: IntVector2; 
                 buttons: cint; qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnDragMove", header: "Window.h".}
proc onDragEnd*(this: var Window; position: IntVector2; 
                screenPosition: IntVector2; dragButtons: cint; buttons: cint; 
                cursor: ptr Cursor) {.importcpp: "OnDragEnd", header: "Window.h".}
proc onDragCancel*(this: var Window; position: IntVector2; 
                   screenPosition: IntVector2; dragButtons: cint; buttons: cint; 
                   cursor: ptr Cursor) {.importcpp: "OnDragCancel", 
    header: "Window.h".}
proc setMovable*(this: var Window; enable: bool) {.importcpp: "SetMovable", 
    header: "Window.h".}
proc setResizable*(this: var Window; enable: bool) {.importcpp: "SetResizable", 
    header: "Window.h".}
proc setFixedWidthResizing*(this: var Window; enable: bool) {.
    importcpp: "SetFixedWidthResizing", header: "Window.h".}
proc setFixedHeightResizing*(this: var Window; enable: bool) {.
    importcpp: "SetFixedHeightResizing", header: "Window.h".}
proc setResizeBorder*(this: var Window; rect: IntRect) {.
    importcpp: "SetResizeBorder", header: "Window.h".}
proc setModal*(this: var Window; modal: bool) {.importcpp: "SetModal", 
    header: "Window.h".}
proc setModalShadeColor*(this: var Window; color: Color) {.
    importcpp: "SetModalShadeColor", header: "Window.h".}
proc setModalFrameColor*(this: var Window; color: Color) {.
    importcpp: "SetModalFrameColor", header: "Window.h".}
proc setModalFrameSize*(this: var Window; size: IntVector2) {.
    importcpp: "SetModalFrameSize", header: "Window.h".}
proc setModalAutoDismiss*(this: var Window; enable: bool) {.
    importcpp: "SetModalAutoDismiss", header: "Window.h".}
proc isMovable*(this: Window): bool {.noSideEffect, importcpp: "IsMovable", 
                                      header: "Window.h".}
proc isResizable*(this: Window): bool {.noSideEffect, importcpp: "IsResizable", 
                                        header: "Window.h".}
proc getFixedWidthResizing*(this: Window): bool {.noSideEffect, 
    importcpp: "GetFixedWidthResizing", header: "Window.h".}
proc getFixedHeightResizing*(this: Window): bool {.noSideEffect, 
    importcpp: "GetFixedHeightResizing", header: "Window.h".}
proc getResizeBorder*(this: Window): IntRect {.noSideEffect, 
    importcpp: "GetResizeBorder", header: "Window.h".}
proc isModal*(this: Window): bool {.noSideEffect, importcpp: "IsModal", 
                                    header: "Window.h".}
proc getModalShadeColor*(this: Window): Color {.noSideEffect, 
    importcpp: "GetModalShadeColor", header: "Window.h".}
proc getModalFrameColor*(this: Window): Color {.noSideEffect, 
    importcpp: "GetModalFrameColor", header: "Window.h".}
proc getModalFrameSize*(this: Window): IntVector2 {.noSideEffect, 
    importcpp: "GetModalFrameSize", header: "Window.h".}
proc getModalAutoDismiss*(this: Window): bool {.noSideEffect, 
    importcpp: "GetModalAutoDismiss", header: "Window.h".}