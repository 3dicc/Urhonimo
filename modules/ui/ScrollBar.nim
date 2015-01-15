

import 
  uIElement

discard "forward decl of Button"
discard "forward decl of Slider"
type 
  ScrollBar* {.importc: "Urho3D::ScrollBar", header: "ScrollBar.h".} = object of UIElement
    backButton* {.importc: "backButton_".}: SharedPtr[Button]
    forwardButton* {.importc: "forwardButton_".}: SharedPtr[Button]
    slider* {.importc: "slider_".}: SharedPtr[Slider]
    scrollStep* {.importc: "scrollStep_".}: cfloat
    stepFactor* {.importc: "stepFactor_".}: cfloat
    leftRect* {.importc: "leftRect_".}: IntRect
    rightRect* {.importc: "rightRect_".}: IntRect
    upRect* {.importc: "upRect_".}: IntRect
    downRect* {.importc: "downRect_".}: IntRect


proc getType*(this: ScrollBar): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ScrollBar.h".}
proc getBaseType*(this: ScrollBar): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ScrollBar.h".}
proc getTypeName*(this: ScrollBar): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ScrollBar.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ScrollBar::GetTypeStatic(@)", header: "ScrollBar.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ScrollBar::GetTypeNameStatic(@)", header: "ScrollBar.h".}
proc constructScrollBar*(context: ptr Context): ScrollBar {.
    importcpp: "Urho3D::ScrollBar(@)", header: "ScrollBar.h".}
proc destroyScrollBar*(this: var ScrollBar) {.importcpp: "#.~ScrollBar()", 
    header: "ScrollBar.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ScrollBar::RegisterObject(@)", header: "ScrollBar.h".}
proc applyAttributes*(this: var ScrollBar) {.importcpp: "ApplyAttributes", 
    header: "ScrollBar.h".}
proc onResize*(this: var ScrollBar) {.importcpp: "OnResize", 
                                      header: "ScrollBar.h".}
proc onSetEditable*(this: var ScrollBar) {.importcpp: "OnSetEditable", 
    header: "ScrollBar.h".}
proc setOrientation*(this: var ScrollBar; orientation: Orientation) {.
    importcpp: "SetOrientation", header: "ScrollBar.h".}
proc setRange*(this: var ScrollBar; range: cfloat) {.importcpp: "SetRange", 
    header: "ScrollBar.h".}
proc setValue*(this: var ScrollBar; value: cfloat) {.importcpp: "SetValue", 
    header: "ScrollBar.h".}
proc changeValue*(this: var ScrollBar; delta: cfloat) {.
    importcpp: "ChangeValue", header: "ScrollBar.h".}
proc setScrollStep*(this: var ScrollBar; step: cfloat) {.
    importcpp: "SetScrollStep", header: "ScrollBar.h".}
proc setStepFactor*(this: var ScrollBar; factor: cfloat) {.
    importcpp: "SetStepFactor", header: "ScrollBar.h".}
proc stepBack*(this: var ScrollBar) {.importcpp: "StepBack", 
                                      header: "ScrollBar.h".}
proc stepForward*(this: var ScrollBar) {.importcpp: "StepForward", 
    header: "ScrollBar.h".}
proc getOrientation*(this: ScrollBar): Orientation {.noSideEffect, 
    importcpp: "GetOrientation", header: "ScrollBar.h".}
proc getRange*(this: ScrollBar): cfloat {.noSideEffect, importcpp: "GetRange", 
    header: "ScrollBar.h".}
proc getValue*(this: ScrollBar): cfloat {.noSideEffect, importcpp: "GetValue", 
    header: "ScrollBar.h".}
proc getScrollStep*(this: ScrollBar): cfloat {.noSideEffect, 
    importcpp: "GetScrollStep", header: "ScrollBar.h".}
proc getStepFactor*(this: ScrollBar): cfloat {.noSideEffect, 
    importcpp: "GetStepFactor", header: "ScrollBar.h".}
proc getEffectiveScrollStep*(this: ScrollBar): cfloat {.noSideEffect, 
    importcpp: "GetEffectiveScrollStep", header: "ScrollBar.h".}
proc getBackButton*(this: ScrollBar): ptr Button {.noSideEffect, 
    importcpp: "GetBackButton", header: "ScrollBar.h".}
proc getForwardButton*(this: ScrollBar): ptr Button {.noSideEffect, 
    importcpp: "GetForwardButton", header: "ScrollBar.h".}
proc getSlider*(this: ScrollBar): ptr Slider {.noSideEffect, 
    importcpp: "GetSlider", header: "ScrollBar.h".}