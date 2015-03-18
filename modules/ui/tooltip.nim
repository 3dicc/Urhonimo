

import
  graphicsDefs, uIElement, ptrs, timer, vector2, stringHash, urstr, urobject


type
  ToolTip* {.importcpp: "Urho3D::ToolTip", header: "ToolTip.h".} = object of UIElement
    target* {.importc: "target_".}: WeakPtr[UIElement]
    delay* {.importc: "delay_".}: cfloat
    parentHovered* {.importc: "parentHovered_".}: bool
    displayAt* {.importc: "displayAt_".}: Timer
    originalPosition* {.importc: "originalPosition_".}: IntVector2


proc getType*(this: ToolTip): StringHash {.noSideEffect,
    importcpp: "GetType", header: "ToolTip.h".}
proc getBaseType*(this: ToolTip): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ToolTip.h".}
proc getTypeName*(this: ToolTip): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ToolTip.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::ToolTip::GetTypeStatic(@)", header: "ToolTip.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::ToolTip::GetTypeNameStatic(@)", header: "ToolTip.h".}
proc constructToolTip*(context: ptr Context): ToolTip {.constructor,
    importcpp: "Urho3D::ToolTip(@)", header: "ToolTip.h".}
proc destroyToolTip*(this: var ToolTip) {.importcpp: "#.~ToolTip()",
    header: "ToolTip.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ToolTip::RegisterObject(@)", header: "ToolTip.h".}
proc update*(this: var ToolTip; timeStep: cfloat) {.importcpp: "Update",
    header: "ToolTip.h".}
proc setDelay*(this: var ToolTip; delay: cfloat) {.importcpp: "SetDelay",
    header: "ToolTip.h".}
proc getDelay*(this: ToolTip): cfloat {.noSideEffect, importcpp: "GetDelay",
                                        header: "ToolTip.h".}
