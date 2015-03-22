

import
  uielement, vector2, stringHash, urstr, urobject, vector, rect, ptrs, text,
  font

discard "forward decl of Font"
discard "forward decl of Text"
type
  LineEdit* {.importcpp: "Urho3D::LineEdit", header: "LineEdit.h".} = object of BorderImage
    text* {.importc: "text_".}: SharedPtr[Text]
    cursor* {.importc: "cursor_".}: SharedPtr[BorderImage]
    line* {.importc: "line_".}: UrString
    lastFont* {.importc: "lastFont_".}: ptr Font
    lastFontSize* {.importc: "lastFontSize_".}: cint
    cursorPosition* {.importc: "cursorPosition_".}: cuint
    dragBeginCursor* {.importc: "dragBeginCursor_".}: cuint
    cursorBlinkRate* {.importc: "cursorBlinkRate_".}: cfloat
    cursorBlinkTimer* {.importc: "cursorBlinkTimer_".}: cfloat
    maxLength* {.importc: "maxLength_".}: cuint
    echoCharacter* {.importc: "echoCharacter_".}: cuint
    cursorMovable* {.importc: "cursorMovable_".}: bool
    textSelectable* {.importc: "textSelectable_".}: bool
    textCopyable* {.importc: "textCopyable_".}: bool


proc getType*(this: LineEdit): StringHash {.noSideEffect,
    importcpp: "GetType", header: "LineEdit.h".}
proc getBaseType*(this: LineEdit): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "LineEdit.h".}
proc getTypeName*(this: LineEdit): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "LineEdit.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::LineEdit::GetTypeStatic(@)", header: "LineEdit.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::LineEdit::GetTypeNameStatic(@)", header: "LineEdit.h".}
proc constructLineEdit*(context: ptr Context): LineEdit {.
    importcpp: "Urho3D::LineEdit(@)", header: "LineEdit.h", constructor.}
proc destroyLineEdit*(this: var LineEdit) {.importcpp: "#.~LineEdit()",
    header: "LineEdit.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::LineEdit::RegisterObject(@)", header: "LineEdit.h".}
proc applyAttributes*(this: var LineEdit) {.importcpp: "ApplyAttributes",
    header: "LineEdit.h".}
proc update*(this: var LineEdit; timeStep: cfloat) {.importcpp: "Update",
    header: "LineEdit.h".}
proc onClickBegin*(this: var LineEdit; position: IntVector2;
                   screenPosition: IntVector2; button: cint; buttons: cint;
                   qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnClickBegin", header: "LineEdit.h".}
proc onDoubleClick*(this: var LineEdit; position: IntVector2;
                    screenPosition: IntVector2; button: cint; buttons: cint;
                    qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnDoubleClick", header: "LineEdit.h".}
proc onDragBegin*(this: var LineEdit; position: IntVector2;
                  screenPosition: IntVector2; buttons: cint; qualifiers: cint;
                  cursor: ptr Cursor) {.importcpp: "OnDragBegin",
                                        header: "LineEdit.h".}
proc onDragMove*(this: var LineEdit; position: IntVector2;
                 screenPosition: IntVector2; deltaPos: IntVector2;
                 buttons: cint; qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnDragMove", header: "LineEdit.h".}
proc onDragDropTest*(this: var LineEdit; source: ptr UIElement): bool {.
    importcpp: "OnDragDropTest", header: "LineEdit.h".}
proc onDragDropFinish*(this: var LineEdit; source: ptr UIElement): bool {.
    importcpp: "OnDragDropFinish", header: "LineEdit.h".}
proc onKey*(this: var LineEdit; key: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnKey", header: "LineEdit.h".}
proc onTextInput*(this: var LineEdit; text: UrString; buttons: cint;
                  qualifiers: cint) {.importcpp: "OnTextInput",
                                      header: "LineEdit.h".}
proc setText*(this: var LineEdit; text: UrString) {.importcpp: "SetText",
    header: "LineEdit.h".}
proc setCursorPosition*(this: var LineEdit; position: cuint) {.
    importcpp: "SetCursorPosition", header: "LineEdit.h".}
proc setCursorBlinkRate*(this: var LineEdit; rate: cfloat) {.
    importcpp: "SetCursorBlinkRate", header: "LineEdit.h".}
proc setMaxLength*(this: var LineEdit; length: cuint) {.
    importcpp: "SetMaxLength", header: "LineEdit.h".}
proc setEchoCharacter*(this: var LineEdit; c: cuint) {.
    importcpp: "SetEchoCharacter", header: "LineEdit.h".}
proc setCursorMovable*(this: var LineEdit; enable: bool) {.
    importcpp: "SetCursorMovable", header: "LineEdit.h".}
proc setTextSelectable*(this: var LineEdit; enable: bool) {.
    importcpp: "SetTextSelectable", header: "LineEdit.h".}
proc setTextCopyable*(this: var LineEdit; enable: bool) {.
    importcpp: "SetTextCopyable", header: "LineEdit.h".}
proc getText*(this: LineEdit): UrString {.noSideEffect, importcpp: "GetText",
    header: "LineEdit.h".}
proc getCursorPosition*(this: LineEdit): cuint {.noSideEffect,
    importcpp: "GetCursorPosition", header: "LineEdit.h".}
proc getCursorBlinkRate*(this: LineEdit): cfloat {.noSideEffect,
    importcpp: "GetCursorBlinkRate", header: "LineEdit.h".}
proc getMaxLength*(this: LineEdit): cuint {.noSideEffect,
    importcpp: "GetMaxLength", header: "LineEdit.h".}
proc getEchoCharacter*(this: LineEdit): cuint {.noSideEffect,
    importcpp: "GetEchoCharacter", header: "LineEdit.h".}
proc isCursorMovable*(this: LineEdit): bool {.noSideEffect,
    importcpp: "IsCursorMovable", header: "LineEdit.h".}
proc isTextSelectable*(this: LineEdit): bool {.noSideEffect,
    importcpp: "IsTextSelectable", header: "LineEdit.h".}
proc isTextCopyable*(this: LineEdit): bool {.noSideEffect,
    importcpp: "IsTextCopyable", header: "LineEdit.h".}
proc getTextElement*(this: LineEdit): ptr Text {.noSideEffect,
    importcpp: "GetTextElement", header: "LineEdit.h".}
proc getCursor*(this: LineEdit): ptr BorderImage {.noSideEffect,
    importcpp: "GetCursor", header: "LineEdit.h".}
