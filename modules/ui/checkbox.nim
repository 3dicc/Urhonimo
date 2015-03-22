

import
  uielement, vector2, stringHash, urstr, urobject, vector, rect


type
  CheckBox* {.importcpp: "Urho3D::CheckBox", header: "CheckBox.h".} = object of BorderImage
    checkedOffset* {.importc: "checkedOffset_".}: IntVector2
    checked* {.importc: "checked_".}: bool


proc getType*(this: CheckBox): StringHash {.noSideEffect,
    importcpp: "GetType", header: "CheckBox.h".}
proc getBaseType*(this: CheckBox): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "CheckBox.h".}
proc getTypeName*(this: CheckBox): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "CheckBox.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::CheckBox::GetTypeStatic(@)", header: "CheckBox.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::CheckBox::GetTypeNameStatic(@)", header: "CheckBox.h".}
proc constructCheckBox*(context: ptr Context): CheckBox {.constructor,
    importcpp: "Urho3D::CheckBox(@)", header: "CheckBox.h".}
proc destroyCheckBox*(this: var CheckBox) {.importcpp: "#.~CheckBox()",
    header: "CheckBox.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::CheckBox::RegisterObject(@)", header: "CheckBox.h".}
proc getBatches*(this: var CheckBox; batches: var PODVector[UIBatch];
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "CheckBox.h".}
proc onClickBegin*(this: var CheckBox; position: IntVector2;
                   screenPosition: IntVector2; button: cint; buttons: cint;
                   qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnClickBegin", header: "CheckBox.h".}
proc onKey*(this: var CheckBox; key: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnKey", header: "CheckBox.h".}
proc setChecked*(this: var CheckBox; enable: bool) {.importcpp: "SetChecked",
    header: "CheckBox.h".}
proc setCheckedOffset*(this: var CheckBox; rect: IntVector2) {.
    importcpp: "SetCheckedOffset", header: "CheckBox.h".}
proc setCheckedOffset*(this: var CheckBox; x: cint; y: cint) {.
    importcpp: "SetCheckedOffset", header: "CheckBox.h".}
proc isChecked*(this: CheckBox): bool {.noSideEffect, importcpp: "IsChecked",
                                        header: "CheckBox.h".}
proc getCheckedOffset*(this: CheckBox): IntVector2 {.noSideEffect,
    importcpp: "GetCheckedOffset", header: "CheckBox.h".}
