

import 
  scrollView


type 
  HighlightMode* = enum 
    HM_NEVER, HM_FOCUS, HM_ALWAYS



type 
  ListView* {.importc: "Urho3D::ListView", header: "ListView.h".} = object of ScrollView
    selections* {.importc: "selections_".}: PODVector[cuint]
    highlightMode* {.importc: "highlightMode_".}: HighlightMode
    multiselect* {.importc: "multiselect_".}: bool
    hierarchyMode* {.importc: "hierarchyMode_".}: bool
    baseIndent* {.importc: "baseIndent_".}: cint
    overlayContainer* {.importc: "overlayContainer_".}: SharedPtr[UIElement]
    clearSelectionOnDefocus* {.importc: "clearSelectionOnDefocus_".}: bool
    selectOnClickEnd* {.importc: "selectOnClickEnd_".}: bool


proc getType*(this: ListView): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ListView.h".}
proc getBaseType*(this: ListView): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ListView.h".}
proc getTypeName*(this: ListView): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ListView.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::ListView::GetTypeStatic(@)", header: "ListView.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::ListView::GetTypeNameStatic(@)", header: "ListView.h".}
proc constructListView*(context: ptr Context): ListView {.
    importcpp: "Urho3D::ListView(@)", header: "ListView.h".}
proc destroyListView*(this: var ListView) {.importcpp: "#.~ListView()", 
    header: "ListView.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ListView::RegisterObject(@)", header: "ListView.h".}
proc onKey*(this: var ListView; key: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnKey", header: "ListView.h".}
proc onResize*(this: var ListView) {.importcpp: "OnResize", header: "ListView.h".}
proc addItem*(this: var ListView; item: ptr UIElement) {.importcpp: "AddItem", 
    header: "ListView.h".}
proc insertItem*(this: var ListView; index: cuint; item: ptr UIElement; 
                 parentItem: ptr UIElement = 0) {.importcpp: "InsertItem", 
    header: "ListView.h".}
proc removeItem*(this: var ListView; item: ptr UIElement; index: cuint = 0) {.
    importcpp: "RemoveItem", header: "ListView.h".}
proc removeItem*(this: var ListView; index: cuint) {.importcpp: "RemoveItem", 
    header: "ListView.h".}
proc removeAllItems*(this: var ListView) {.importcpp: "RemoveAllItems", 
    header: "ListView.h".}
proc setSelection*(this: var ListView; index: cuint) {.
    importcpp: "SetSelection", header: "ListView.h".}
proc setSelections*(this: var ListView; indices: PODVector[cuint]) {.
    importcpp: "SetSelections", header: "ListView.h".}
proc addSelection*(this: var ListView; index: cuint) {.
    importcpp: "AddSelection", header: "ListView.h".}
proc removeSelection*(this: var ListView; index: cuint) {.
    importcpp: "RemoveSelection", header: "ListView.h".}
proc toggleSelection*(this: var ListView; index: cuint) {.
    importcpp: "ToggleSelection", header: "ListView.h".}
proc changeSelection*(this: var ListView; delta: cint; additive: bool = false) {.
    importcpp: "ChangeSelection", header: "ListView.h".}
proc clearSelection*(this: var ListView) {.importcpp: "ClearSelection", 
    header: "ListView.h".}
proc setHighlightMode*(this: var ListView; mode: HighlightMode) {.
    importcpp: "SetHighlightMode", header: "ListView.h".}
proc setMultiselect*(this: var ListView; enable: bool) {.
    importcpp: "SetMultiselect", header: "ListView.h".}
proc setHierarchyMode*(this: var ListView; enable: bool) {.
    importcpp: "SetHierarchyMode", header: "ListView.h".}
proc setBaseIndent*(this: var ListView; baseIndent: cint) {.
    importcpp: "SetBaseIndent", header: "ListView.h".}
proc setClearSelectionOnDefocus*(this: var ListView; enable: bool) {.
    importcpp: "SetClearSelectionOnDefocus", header: "ListView.h".}
proc setSelectOnClickEnd*(this: var ListView; enable: bool) {.
    importcpp: "SetSelectOnClickEnd", header: "ListView.h".}
proc expand*(this: var ListView; index: cuint; enable: bool; 
             recursive: bool = false) {.importcpp: "Expand", 
                                        header: "ListView.h".}
proc toggleExpand*(this: var ListView; index: cuint; recursive: bool = false) {.
    importcpp: "ToggleExpand", header: "ListView.h".}
proc getNumItems*(this: ListView): cuint {.noSideEffect, 
    importcpp: "GetNumItems", header: "ListView.h".}
proc getItem*(this: ListView; index: cuint): ptr UIElement {.noSideEffect, 
    importcpp: "GetItem", header: "ListView.h".}
proc getItems*(this: ListView): PODVector[ptr UIElement] {.noSideEffect, 
    importcpp: "GetItems", header: "ListView.h".}
proc findItem*(this: ListView; item: ptr UIElement): cuint {.noSideEffect, 
    importcpp: "FindItem", header: "ListView.h".}
proc getSelection*(this: ListView): cuint {.noSideEffect, 
    importcpp: "GetSelection", header: "ListView.h".}
proc getSelections*(this: ListView): PODVector[cuint] {.noSideEffect, 
    importcpp: "GetSelections", header: "ListView.h".}
proc copySelectedItemsToClipboard*(this: ListView) {.noSideEffect, 
    importcpp: "CopySelectedItemsToClipboard", header: "ListView.h".}
proc getSelectedItem*(this: ListView): ptr UIElement {.noSideEffect, 
    importcpp: "GetSelectedItem", header: "ListView.h".}
proc getSelectedItems*(this: ListView): PODVector[ptr UIElement] {.noSideEffect, 
    importcpp: "GetSelectedItems", header: "ListView.h".}
proc isSelected*(this: ListView; index: cuint): bool {.noSideEffect, 
    importcpp: "IsSelected", header: "ListView.h".}
proc isExpanded*(this: ListView; index: cuint): bool {.noSideEffect, 
    importcpp: "IsExpanded", header: "ListView.h".}
proc getHighlightMode*(this: ListView): HighlightMode {.noSideEffect, 
    importcpp: "GetHighlightMode", header: "ListView.h".}
proc getMultiselect*(this: ListView): bool {.noSideEffect, 
    importcpp: "GetMultiselect", header: "ListView.h".}
proc getClearSelectionOnDefocus*(this: ListView): bool {.noSideEffect, 
    importcpp: "GetClearSelectionOnDefocus", header: "ListView.h".}
proc getSelectOnClickEnd*(this: ListView): bool {.noSideEffect, 
    importcpp: "GetSelectOnClickEnd", header: "ListView.h".}
proc getHierarchyMode*(this: ListView): bool {.noSideEffect, 
    importcpp: "GetHierarchyMode", header: "ListView.h".}
proc getBaseIndent*(this: ListView): cint {.noSideEffect, 
    importcpp: "GetBaseIndent", header: "ListView.h".}
proc ensureItemVisibility*(this: var ListView; index: cuint) {.
    importcpp: "EnsureItemVisibility", header: "ListView.h".}
proc ensureItemVisibility*(this: var ListView; item: ptr UIElement) {.
    importcpp: "EnsureItemVisibility", header: "ListView.h".}