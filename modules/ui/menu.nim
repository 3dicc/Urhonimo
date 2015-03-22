

import
  button, ptrs,
  uielement, vector2, stringHash, urstr, urobject, vector, rect, xmlelement


type
  Menu* {.importcpp: "Urho3D::Menu", header: "Menu.h".} = object of Button
    popup* {.importc: "popup_".}: SharedPtr[UIElement]
    popupOffset* {.importc: "popupOffset_".}: IntVector2
    showPopup* {.importc: "showPopup_".}: bool
    acceleratorKey* {.importc: "acceleratorKey_".}: cint
    acceleratorQualifiers* {.importc: "acceleratorQualifiers_".}: cint
    autoPopup* {.importc: "autoPopup_".}: bool


proc getType*(this: Menu): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Menu.h".}
proc getBaseType*(this: Menu): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Menu.h".}
proc getTypeName*(this: Menu): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Menu.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Menu::GetTypeStatic(@)", header: "Menu.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Menu::GetTypeNameStatic(@)", header: "Menu.h".}
proc constructMenu*(context: ptr Context): Menu {.importcpp: "Urho3D::Menu(@)",
    header: "Menu.h", constructor.}
proc destroyMenu*(this: var Menu) {.importcpp: "#.~Menu()", header: "Menu.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Menu::RegisterObject(@)", header: "Menu.h".}
proc loadXML*(this: var Menu; source: XMLElement; styleFile: ptr XMLFile;
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML",
    header: "Menu.h".}
proc saveXML*(this: Menu; dest: var XMLElement): bool {.noSideEffect,
    importcpp: "SaveXML", header: "Menu.h".}
proc update*(this: var Menu; timeStep: cfloat) {.importcpp: "Update",
    header: "Menu.h".}
proc onHover*(this: var Menu; position: IntVector2; screenPosition: IntVector2;
              buttons: cint; qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnHover", header: "Menu.h".}
proc onShowPopup*(this: var Menu) {.importcpp: "OnShowPopup", header: "Menu.h".}
proc onHidePopup*(this: var Menu) {.importcpp: "OnHidePopup", header: "Menu.h".}
proc setPopup*(this: var Menu; element: ptr UIElement) {.importcpp: "SetPopup",
    header: "Menu.h".}
proc setPopupOffset*(this: var Menu; offset: IntVector2) {.
    importcpp: "SetPopupOffset", header: "Menu.h".}
proc setPopupOffset*(this: var Menu; x: cint; y: cint) {.
    importcpp: "SetPopupOffset", header: "Menu.h".}
proc showPopup*(this: var Menu; enable: bool) {.importcpp: "ShowPopup",
    header: "Menu.h".}
proc setAccelerator*(this: var Menu; key: cint; qualifiers: cint) {.
    importcpp: "SetAccelerator", header: "Menu.h".}
proc getPopup*(this: Menu): ptr UIElement {.noSideEffect, importcpp: "GetPopup",
    header: "Menu.h".}
proc getPopupOffset*(this: Menu): IntVector2 {.noSideEffect,
    importcpp: "GetPopupOffset", header: "Menu.h".}
proc getShowPopup*(this: Menu): bool {.noSideEffect, importcpp: "GetShowPopup",
                                       header: "Menu.h".}
proc getAcceleratorKey*(this: Menu): cint {.noSideEffect,
    importcpp: "GetAcceleratorKey", header: "Menu.h".}
proc getAcceleratorQualifiers*(this: Menu): cint {.noSideEffect,
    importcpp: "GetAcceleratorQualifiers", header: "Menu.h".}
