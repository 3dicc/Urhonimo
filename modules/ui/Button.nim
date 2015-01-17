

import 
  uielement, vector2, stringHash, urstr, urobject, vector, rect


type 
  Button* {.importc: "Urho3D::Button", header: "Button.h".} = object of BorderImage
    pressedOffset* {.importc: "pressedOffset_".}: IntVector2
    pressedChildOffset* {.importc: "pressedChildOffset_".}: IntVector2
    repeatDelay* {.importc: "repeatDelay_".}: cfloat
    repeatRate* {.importc: "repeatRate_".}: cfloat
    repeatTimer* {.importc: "repeatTimer_".}: cfloat
    pressed* {.importc: "pressed_".}: bool


proc getType*(this: Button): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Button.h".}
proc getBaseType*(this: Button): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Button.h".}
proc getTypeName*(this: Button): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Button.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Button::GetTypeStatic(@)", header: "Button.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Button::GetTypeNameStatic(@)", header: "Button.h".}
proc constructButton*(context: ptr Context): Button {.
    importcpp: "Urho3D::Button(@)", header: "Button.h".}
proc destroyButton*(this: var Button) {.importcpp: "#.~Button()", 
                                        header: "Button.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Button::RegisterObject(@)", header: "Button.h".}
proc update*(this: var Button; timeStep: cfloat) {.importcpp: "Update", 
    header: "Button.h".}
proc getBatches*(this: var Button; batches: var PODVector[UIBatch]; 
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "Button.h".}
proc onClickBegin*(this: var Button; position: IntVector2; 
                   screenPosition: IntVector2; button: cint; buttons: cint; 
                   qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnClickBegin", header: "Button.h".}
proc onClickEnd*(this: var Button; position: IntVector2; 
                 screenPosition: IntVector2; button: cint; buttons: cint; 
                 qualifiers: cint; cursor: ptr Cursor; 
                 beginElement: ptr UIElement) {.importcpp: "OnClickEnd", 
    header: "Button.h".}
proc onDragMove*(this: var Button; position: IntVector2; 
                 screenPosition: IntVector2; buttons: cint; qualifiers: cint; 
                 cursor: ptr Cursor) {.importcpp: "OnDragMove", 
                                       header: "Button.h".}
proc onKey*(this: var Button; key: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnKey", header: "Button.h".}
proc setPressedOffset*(this: var Button; offset: IntVector2) {.
    importcpp: "SetPressedOffset", header: "Button.h".}
proc setPressedOffset*(this: var Button; x: cint; y: cint) {.
    importcpp: "SetPressedOffset", header: "Button.h".}
proc setPressedChildOffset*(this: var Button; offset: IntVector2) {.
    importcpp: "SetPressedChildOffset", header: "Button.h".}
proc setPressedChildOffset*(this: var Button; x: cint; y: cint) {.
    importcpp: "SetPressedChildOffset", header: "Button.h".}
proc setRepeat*(this: var Button; delay: cfloat; rate: cfloat) {.
    importcpp: "SetRepeat", header: "Button.h".}
proc setRepeatDelay*(this: var Button; delay: cfloat) {.
    importcpp: "SetRepeatDelay", header: "Button.h".}
proc setRepeatRate*(this: var Button; rate: cfloat) {.
    importcpp: "SetRepeatRate", header: "Button.h".}
proc getPressedOffset*(this: Button): IntVector2 {.noSideEffect, 
    importcpp: "GetPressedOffset", header: "Button.h".}
proc getPressedChildOffset*(this: Button): IntVector2 {.noSideEffect, 
    importcpp: "GetPressedChildOffset", header: "Button.h".}
proc getRepeatDelay*(this: Button): cfloat {.noSideEffect, 
    importcpp: "GetRepeatDelay", header: "Button.h".}
proc getRepeatRate*(this: Button): cfloat {.noSideEffect, 
    importcpp: "GetRepeatRate", header: "Button.h".}
proc isPressed*(this: Button): bool {.noSideEffect, importcpp: "IsPressed", 
                                      header: "Button.h".}