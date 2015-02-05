

import 
  UrObject, ptrs, text, button, xmlelement, uielement, stringHash, urstr

discard "forward decl of Button"
discard "forward decl of Text"
discard "forward decl of UIElement"
discard "forward decl of XMLFile"
type 
  MessageBox* {.importc: "Urho3D::MessageBox", header: "MessageBox.h".} = object of UrObject
    window* {.importc: "window_".}: SharedPtr[UIElement]
    titleText* {.importc: "titleText_".}: ptr Text
    messageText* {.importc: "messageText_".}: ptr Text
    okButton* {.importc: "okButton_".}: ptr Button


proc getType*(this: MessageBox): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "MessageBox.h".}
proc getBaseType*(this: MessageBox): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "MessageBox.h".}
proc getTypeName*(this: MessageBox): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "MessageBox.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::MessageBox::GetTypeStatic(@)", header: "MessageBox.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::MessageBox::GetTypeNameStatic(@)", 
    header: "MessageBox.h".}
proc constructMessageBox*(context: ptr Context; 
                          messageString: UrString; 
                          titleString: UrString; 
                          layoutFile: ptr XMLFile = nil; 
                          styleFile: ptr XMLFile = nil): MessageBox {.
    importcpp: "Urho3D::MessageBox(@)", header: "MessageBox.h".}
proc destroyMessageBox*(this: var MessageBox) {.importcpp: "#.~MessageBox()", 
    header: "MessageBox.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::MessageBox::RegisterObject(@)", header: "MessageBox.h".}
proc setTitle*(this: var MessageBox; text: UrString) {.importcpp: "SetTitle", 
    header: "MessageBox.h".}
proc setMessage*(this: var MessageBox; text: UrString) {.
    importcpp: "SetMessage", header: "MessageBox.h".}
proc getTitle*(this: MessageBox): UrString {.noSideEffect, 
    importcpp: "GetTitle", header: "MessageBox.h".}
proc getMessage*(this: MessageBox): UrString {.noSideEffect, 
    importcpp: "GetMessage", header: "MessageBox.h".}
proc getWindow*(this: MessageBox): ptr UIElement {.noSideEffect, 
    importcpp: "GetWindow", header: "MessageBox.h".}