

import 
  UrObject

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


proc getType*(this: MessageBox): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "MessageBox.h".}
proc getBaseType*(this: MessageBox): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "MessageBox.h".}
proc getTypeName*(this: MessageBox): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "MessageBox.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::MessageBox::GetTypeStatic(@)", header: "MessageBox.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::MessageBox::GetTypeNameStatic(@)", 
    header: "MessageBox.h".}
proc constructMessageBox*(context: ptr Context; 
                          messageString: UrString = UrString.empty; 
                          titleString: UrString = UrString.empty; 
                          layoutFile: ptr XMLFile = 0; 
                          styleFile: ptr XMLFile = 0): MessageBox {.
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