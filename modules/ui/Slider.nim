

import 
  uielement, vector2, stringHash, urstr, urobject, vector, rect, ptrs, timer


type 
  Slider* {.importc: "Urho3D::Slider", header: "Slider.h".} = object of BorderImage
    knob* {.importc: "knob_".}: SharedPtr[BorderImage]
    orientation* {.importc: "orientation_".}: Orientation
    range* {.importc: "range_".}: cfloat
    value* {.importc: "value_".}: cfloat
    dragSlider* {.importc: "dragSlider_".}: bool
    dragBeginCursor* {.importc: "dragBeginCursor_".}: IntVector2
    dragBeginPosition* {.importc: "dragBeginPosition_".}: IntVector2
    repeatRate* {.importc: "repeatRate_".}: cfloat
    repeatTimer* {.importc: "repeatTimer_".}: Timer


proc getType*(this: Slider): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Slider.h".}
proc getBaseType*(this: Slider): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Slider.h".}
proc getTypeName*(this: Slider): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Slider.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Slider::GetTypeStatic(@)", header: "Slider.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Slider::GetTypeNameStatic(@)", header: "Slider.h".}
proc constructSlider*(context: ptr Context): Slider {.
    importcpp: "Urho3D::Slider(@)", header: "Slider.h".}
proc destroySlider*(this: var Slider) {.importcpp: "#.~Slider()", 
                                        header: "Slider.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Slider::RegisterObject(@)", header: "Slider.h".}
proc update*(this: var Slider; timeStep: cfloat) {.importcpp: "Update", 
    header: "Slider.h".}
proc onHover*(this: var Slider; position: IntVector2; 
              screenPosition: IntVector2; buttons: cint; qualifiers: cint; 
              cursor: ptr Cursor) {.importcpp: "OnHover", header: "Slider.h".}
proc onClickBegin*(this: var Slider; position: IntVector2; 
                   screenPosition: IntVector2; button: cint; buttons: cint; 
                   qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnClickBegin", header: "Slider.h".}
proc onClickEnd*(this: var Slider; position: IntVector2; 
                 screenPosition: IntVector2; button: cint; buttons: cint; 
                 qualifiers: cint; cursor: ptr Cursor; 
                 beginElement: ptr UIElement) {.importcpp: "OnClickEnd", 
    header: "Slider.h".}
proc onDragBegin*(this: var Slider; position: IntVector2; 
                  screenPosition: IntVector2; buttons: cint; qualifiers: cint; 
                  cursor: ptr Cursor) {.importcpp: "OnDragBegin", 
                                        header: "Slider.h".}
proc onDragMove*(this: var Slider; position: IntVector2; 
                 screenPosition: IntVector2; deltaPos: IntVector2; 
                 buttons: cint; qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnDragMove", header: "Slider.h".}
proc onDragEnd*(this: var Slider; position: IntVector2; 
                screenPosition: IntVector2; dragButtons: cint; buttons: cint; 
                cursor: ptr Cursor) {.importcpp: "OnDragEnd", header: "Slider.h".}
proc onResize*(this: var Slider) {.importcpp: "OnResize", header: "Slider.h".}
proc setOrientation*(this: var Slider; orientation: Orientation) {.
    importcpp: "SetOrientation", header: "Slider.h".}
proc setRange*(this: var Slider; range: cfloat) {.importcpp: "SetRange", 
    header: "Slider.h".}
proc setValue*(this: var Slider; value: cfloat) {.importcpp: "SetValue", 
    header: "Slider.h".}
proc changeValue*(this: var Slider; delta: cfloat) {.importcpp: "ChangeValue", 
    header: "Slider.h".}
proc setRepeatRate*(this: var Slider; rate: cfloat) {.
    importcpp: "SetRepeatRate", header: "Slider.h".}
proc getOrientation*(this: Slider): Orientation {.noSideEffect, 
    importcpp: "GetOrientation", header: "Slider.h".}
proc getRange*(this: Slider): cfloat {.noSideEffect, importcpp: "GetRange", 
                                       header: "Slider.h".}
proc getValue*(this: Slider): cfloat {.noSideEffect, importcpp: "GetValue", 
                                       header: "Slider.h".}
proc getKnob*(this: Slider): ptr BorderImage {.noSideEffect, 
    importcpp: "GetKnob", header: "Slider.h".}
proc getRepeatRate*(this: Slider): cfloat {.noSideEffect, 
    importcpp: "GetRepeatRate", header: "Slider.h".}