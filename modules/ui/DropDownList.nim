

import 
  menu,
  uielement, vector2, stringHash, urstr, urobject, vector, rect, ptrs, listview

discard "forward decl of ListView"
type 
  DropDownList* {.importc: "Urho3D::DropDownList", header: "DropDownList.h".} = object of Menu
    listView* {.importc: "listView_".}: SharedPtr[ListView]
    placeholder* {.importc: "placeholder_".}: SharedPtr[UIElement]
    resizePopup* {.importc: "resizePopup_".}: bool
    selectionAttr* {.importc: "selectionAttr_".}: cuint


proc getType*(this: DropDownList): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "DropDownList.h".}
proc getBaseType*(this: DropDownList): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "DropDownList.h".}
proc getTypeName*(this: DropDownList): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "DropDownList.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::DropDownList::GetTypeStatic(@)", 
    header: "DropDownList.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::DropDownList::GetTypeNameStatic(@)", 
    header: "DropDownList.h".}
proc constructDropDownList*(context: ptr Context): DropDownList {.
    importcpp: "Urho3D::DropDownList(@)", header: "DropDownList.h".}
proc destroyDropDownList*(this: var DropDownList) {.
    importcpp: "#.~DropDownList()", header: "DropDownList.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::DropDownList::RegisterObject(@)", 
    header: "DropDownList.h".}
proc applyAttributes*(this: var DropDownList) {.importcpp: "ApplyAttributes", 
    header: "DropDownList.h".}
proc getBatches*(this: var DropDownList; batches: var PODVector[UIBatch]; 
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "DropDownList.h".}
proc onShowPopup*(this: var DropDownList) {.importcpp: "OnShowPopup", 
    header: "DropDownList.h".}
proc onHidePopup*(this: var DropDownList) {.importcpp: "OnHidePopup", 
    header: "DropDownList.h".}
proc onSetEditable*(this: var DropDownList) {.importcpp: "OnSetEditable", 
    header: "DropDownList.h".}
proc addItem*(this: var DropDownList; item: ptr UIElement) {.
    importcpp: "AddItem", header: "DropDownList.h".}
proc insertItem*(this: var DropDownList; index: cuint; item: ptr UIElement) {.
    importcpp: "InsertItem", header: "DropDownList.h".}
proc removeItem*(this: var DropDownList; item: ptr UIElement) {.
    importcpp: "RemoveItem", header: "DropDownList.h".}
proc removeItem*(this: var DropDownList; index: cuint) {.
    importcpp: "RemoveItem", header: "DropDownList.h".}
proc removeAllItems*(this: var DropDownList) {.importcpp: "RemoveAllItems", 
    header: "DropDownList.h".}
proc setSelection*(this: var DropDownList; index: cuint) {.
    importcpp: "SetSelection", header: "DropDownList.h".}
proc setPlaceholderText*(this: var DropDownList; text: UrString) {.
    importcpp: "SetPlaceholderText", header: "DropDownList.h".}
proc setResizePopup*(this: var DropDownList; enable: bool) {.
    importcpp: "SetResizePopup", header: "DropDownList.h".}
proc getNumItems*(this: DropDownList): cuint {.noSideEffect, 
    importcpp: "GetNumItems", header: "DropDownList.h".}
proc getItem*(this: DropDownList; index: cuint): ptr UIElement {.noSideEffect, 
    importcpp: "GetItem", header: "DropDownList.h".}
proc getItems*(this: DropDownList): PODVector[ptr UIElement] {.noSideEffect, 
    importcpp: "GetItems", header: "DropDownList.h".}
proc getSelection*(this: DropDownList): cuint {.noSideEffect, 
    importcpp: "GetSelection", header: "DropDownList.h".}
proc getSelectedItem*(this: DropDownList): ptr UIElement {.noSideEffect, 
    importcpp: "GetSelectedItem", header: "DropDownList.h".}
proc getListView*(this: DropDownList): ptr ListView {.noSideEffect, 
    importcpp: "GetListView", header: "DropDownList.h".}
proc getPlaceholder*(this: DropDownList): ptr UIElement {.noSideEffect, 
    importcpp: "GetPlaceholder", header: "DropDownList.h".}
proc getPlaceholderText*(this: DropDownList): UrString {.noSideEffect, 
    importcpp: "GetPlaceholderText", header: "DropDownList.h".}
proc getResizePopup*(this: DropDownList): bool {.noSideEffect, 
    importcpp: "GetResizePopup", header: "DropDownList.h".}
proc setSelectionAttr*(this: var DropDownList; index: cuint) {.
    importcpp: "SetSelectionAttr", header: "DropDownList.h".}