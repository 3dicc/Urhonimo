

import 
  UrObject

discard "forward decl of Button"
discard "forward decl of BorderImage"
discard "forward decl of DropDownList"
discard "forward decl of Engine"
discard "forward decl of Font"
discard "forward decl of LineEdit"
discard "forward decl of ListView"
discard "forward decl of Text"
discard "forward decl of UIElement"
discard "forward decl of XMLFile"
type 
  Console* {.importc: "Urho3D::Console", header: "Console.h".} = object of UrObject
    autoVisibleOnError* {.importc: "autoVisibleOnError_".}: bool
    background* {.importc: "background_".}: SharedPtr[BorderImage]
    rowContainer* {.importc: "rowContainer_".}: ptr ListView
    commandLine* {.importc: "commandLine_".}: ptr UIElement
    interpreters* {.importc: "interpreters_".}: ptr DropDownList
    lineEdit* {.importc: "lineEdit_".}: ptr LineEdit
    closeButton* {.importc: "closeButton_".}: SharedPtr[Button]
    commandInterpreter* {.importc: "commandInterpreter_".}: UrString
    history* {.importc: "history_".}: Vector[UrString]
    pendingRows* {.importc: "pendingRows_".}: Vector[Pair[cint, UrString]]
    currentRow* {.importc: "currentRow_".}: UrString
    displayedRows* {.importc: "displayedRows_".}: cuint
    historyRows* {.importc: "historyRows_".}: cuint
    historyPosition* {.importc: "historyPosition_".}: cuint
    printing* {.importc: "printing_".}: bool
    focusOnShow* {.importc: "focusOnShow_".}: bool


proc getType*(this: Console): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Console.h".}
proc getBaseType*(this: Console): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Console.h".}
proc getTypeName*(this: Console): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Console.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Console::GetTypeStatic(@)", header: "Console.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Console::GetTypeNameStatic(@)", header: "Console.h".}
proc constructConsole*(context: ptr Context): Console {.
    importcpp: "Urho3D::Console(@)", header: "Console.h".}
proc destroyConsole*(this: var Console) {.importcpp: "#.~Console()", 
    header: "Console.h".}
proc setDefaultStyle*(this: var Console; style: ptr XMLFile) {.
    importcpp: "SetDefaultStyle", header: "Console.h".}
proc setVisible*(this: var Console; enable: bool) {.importcpp: "SetVisible", 
    header: "Console.h".}
proc toggle*(this: var Console) {.importcpp: "Toggle", header: "Console.h".}
proc setAutoVisibleOnError*(this: var Console; enable: bool) {.
    importcpp: "SetAutoVisibleOnError", header: "Console.h".}
proc setCommandInterpreter*(this: var Console; interpreter: UrString) {.
    importcpp: "SetCommandInterpreter", header: "Console.h".}
proc setNumBufferedRows*(this: var Console; rows: cuint) {.
    importcpp: "SetNumBufferedRows", header: "Console.h".}
proc setNumRows*(this: var Console; rows: cuint) {.importcpp: "SetNumRows", 
    header: "Console.h".}
proc setNumHistoryRows*(this: var Console; rows: cuint) {.
    importcpp: "SetNumHistoryRows", header: "Console.h".}
proc setFocusOnShow*(this: var Console; enable: bool) {.
    importcpp: "SetFocusOnShow", header: "Console.h".}
proc updateElements*(this: var Console) {.importcpp: "UpdateElements", 
    header: "Console.h".}
proc getDefaultStyle*(this: Console): ptr XMLFile {.noSideEffect, 
    importcpp: "GetDefaultStyle", header: "Console.h".}
proc getBackground*(this: Console): ptr BorderImage {.noSideEffect, 
    importcpp: "GetBackground", header: "Console.h".}
proc getLineEdit*(this: Console): ptr LineEdit {.noSideEffect, 
    importcpp: "GetLineEdit", header: "Console.h".}
proc getCloseButton*(this: Console): ptr Button {.noSideEffect, 
    importcpp: "GetCloseButton", header: "Console.h".}
proc isVisible*(this: Console): bool {.noSideEffect, importcpp: "IsVisible", 
                                       header: "Console.h".}
proc isAutoVisibleOnError*(this: Console): bool {.noSideEffect, 
    importcpp: "IsAutoVisibleOnError", header: "Console.h".}
proc getCommandInterpreter*(this: Console): UrString {.noSideEffect, 
    importcpp: "GetCommandInterpreter", header: "Console.h".}
proc getNumBufferedRows*(this: Console): cuint {.noSideEffect, 
    importcpp: "GetNumBufferedRows", header: "Console.h".}
proc getNumRows*(this: Console): cuint {.noSideEffect, importcpp: "GetNumRows", 
    header: "Console.h".}
proc copySelectedRows*(this: Console) {.noSideEffect, 
                                        importcpp: "CopySelectedRows", 
                                        header: "Console.h".}
proc getNumHistoryRows*(this: Console): cuint {.noSideEffect, 
    importcpp: "GetNumHistoryRows", header: "Console.h".}
proc getHistoryPosition*(this: Console): cuint {.noSideEffect, 
    importcpp: "GetHistoryPosition", header: "Console.h".}
proc getHistoryRow*(this: Console; index: cuint): UrString {.noSideEffect, 
    importcpp: "GetHistoryRow", header: "Console.h".}
proc getFocusOnShow*(this: Console): bool {.noSideEffect, 
    importcpp: "GetFocusOnShow", header: "Console.h".}