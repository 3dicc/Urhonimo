

import 
  UrObject, cursor, uIBatch

discard "forward decl of Cursor"
discard "forward decl of Graphics"
discard "forward decl of ResourceCache"
discard "forward decl of Timer"
discard "forward decl of UIBatch"
discard "forward decl of UIElement"
discard "forward decl of VertexBuffer"
discard "forward decl of XMLElement"
discard "forward decl of XMLFile"
type 
  Ui* {.importc: "Urho3D::UI", header: "UI.h".} = object of UrObject
    graphics* {.importc: "graphics_".}: WeakPtr[Graphics]
    rootElement* {.importc: "rootElement_".}: SharedPtr[UIElement]
    rootModalElement* {.importc: "rootModalElement_".}: SharedPtr[UIElement]
    cursor* {.importc: "cursor_".}: SharedPtr[Cursor]
    focusElement* {.importc: "focusElement_".}: WeakPtr[UIElement]
    batches* {.importc: "batches_".}: PODVector[UIBatch]
    vertexData* {.importc: "vertexData_".}: PODVector[cfloat]
    debugDrawBatches* {.importc: "debugDrawBatches_".}: PODVector[UIBatch]
    debugVertexData* {.importc: "debugVertexData_".}: PODVector[cfloat]
    vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]
    debugVertexBuffer* {.importc: "debugVertexBuffer_".}: SharedPtr[VertexBuffer]
    tempElements* {.importc: "tempElements_".}: PODVector[ptr UIElement]
    clipBoard* {.importc: "clipBoard_".}: UrString
    doubleClickInterval* {.importc: "doubleClickInterval_".}: cfloat
    dragBeginInterval* {.importc: "dragBeginInterval_".}: cfloat
    defaultToolTipDelay* {.importc: "defaultToolTipDelay_".}: cfloat
    dragBeginDistance* {.importc: "dragBeginDistance_".}: cint
    mouseButtons* {.importc: "mouseButtons_".}: cint
    lastMouseButtons* {.importc: "lastMouseButtons_".}: cint
    qualifiers* {.importc: "qualifiers_".}: cint
    maxFontTextureSize* {.importc: "maxFontTextureSize_".}: cint
    initialized* {.importc: "initialized_".}: bool
    usingTouchInput* {.importc: "usingTouchInput_".}: bool
    nonFocusedMouseWheel* {.importc: "nonFocusedMouseWheel_".}: bool
    useSystemClipboard* {.importc: "useSystemClipboard_".}: bool
    useScreenKeyboard* {.importc: "useScreenKeyboard_".}: bool
    useMutableGlyphs* {.importc: "useMutableGlyphs_".}: bool
    forceAutoHint* {.importc: "forceAutoHint_".}: bool
    nonModalBatchSize* {.importc: "nonModalBatchSize_".}: cuint
    clickTimer* {.importc: "clickTimer_".}: Timer
    doubleClickElement* {.importc: "doubleClickElement_".}: WeakPtr[UIElement]
    hoveredElements* {.importc: "hoveredElements_".}: HashMap[
        WeakPtr[UIElement], bool]
    dragElements* {.importc: "dragElements_".}: HashMap[WeakPtr[UIElement], 
        ptr DragData]
    dragElementsCount* {.importc: "dragElementsCount_".}: cint
    dragConfirmedCount* {.importc: "dragConfirmedCount_".}: cint
    touchDragElements* {.importc: "touchDragElements_".}: HashMap[
        WeakPtr[UIElement], cint]
    dragElementsConfirmed* {.importc: "dragElementsConfirmed_".}: Vector[
        ptr UIElement]


proc getType*(this: Ui): Urho3D.StringHash {.noSideEffect, importcpp: "GetType", 
    header: "UI.h".}
proc getBaseType*(this: Ui): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "UI.h".}
proc getTypeName*(this: Ui): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "UI.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::UI::GetTypeStatic(@)", header: "UI.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::UI::GetTypeNameStatic(@)", header: "UI.h".}
proc constructUI*(context: ptr Context): Ui {.importcpp: "Urho3D::UI(@)", 
    header: "UI.h".}
proc destroyUI*(this: var Ui) {.importcpp: "#.~UI()", header: "UI.h".}
proc setCursor*(this: var Ui; cursor: ptr Cursor) {.importcpp: "SetCursor", 
    header: "UI.h".}
proc setFocusElement*(this: var Ui; element: ptr UIElement; byKey: bool = false) {.
    importcpp: "SetFocusElement", header: "UI.h".}
proc setModalElement*(this: var Ui; modalElement: ptr UIElement; enable: bool): bool {.
    importcpp: "SetModalElement", header: "UI.h".}
proc clear*(this: var Ui) {.importcpp: "Clear", header: "UI.h".}
proc update*(this: var Ui; timeStep: cfloat) {.importcpp: "Update", 
    header: "UI.h".}
proc renderUpdate*(this: var Ui) {.importcpp: "RenderUpdate", header: "UI.h".}
proc render*(this: var Ui) {.importcpp: "Render", header: "UI.h".}
proc debugDraw*(this: var Ui; element: ptr UIElement) {.importcpp: "DebugDraw", 
    header: "UI.h".}
proc loadLayout*(this: var Ui; source: var Deserializer; 
                 styleFile: ptr XMLFile = 0): SharedPtr[UIElement] {.
    importcpp: "LoadLayout", header: "UI.h".}
proc loadLayout*(this: var Ui; file: ptr XMLFile; styleFile: ptr XMLFile = 0): SharedPtr[
    UIElement] {.importcpp: "LoadLayout", header: "UI.h".}
proc saveLayout*(this: var Ui; dest: var Serializer; element: ptr UIElement): bool {.
    importcpp: "SaveLayout", header: "UI.h".}
proc setClipboardText*(this: var Ui; text: UrString) {.
    importcpp: "SetClipboardText", header: "UI.h".}
proc setDoubleClickInterval*(this: var Ui; interval: cfloat) {.
    importcpp: "SetDoubleClickInterval", header: "UI.h".}
proc setDragBeginInterval*(this: var Ui; interval: cfloat) {.
    importcpp: "SetDragBeginInterval", header: "UI.h".}
proc setDragBeginDistance*(this: var Ui; pixels: cint) {.
    importcpp: "SetDragBeginDistance", header: "UI.h".}
proc setDefaultToolTipDelay*(this: var Ui; delay: cfloat) {.
    importcpp: "SetDefaultToolTipDelay", header: "UI.h".}
proc setMaxFontTextureSize*(this: var Ui; size: cint) {.
    importcpp: "SetMaxFontTextureSize", header: "UI.h".}
proc setNonFocusedMouseWheel*(this: var Ui; nonFocusedMouseWheel: bool) {.
    importcpp: "SetNonFocusedMouseWheel", header: "UI.h".}
proc setUseSystemClipboard*(this: var Ui; enable: bool) {.
    importcpp: "SetUseSystemClipboard", header: "UI.h".}
proc setUseScreenKeyboard*(this: var Ui; enable: bool) {.
    importcpp: "SetUseScreenKeyboard", header: "UI.h".}
proc setUseMutableGlyphs*(this: var Ui; enable: bool) {.
    importcpp: "SetUseMutableGlyphs", header: "UI.h".}
proc setForceAutoHint*(this: var Ui; enable: bool) {.
    importcpp: "SetForceAutoHint", header: "UI.h".}
proc getRoot*(this: Ui): ptr UIElement {.noSideEffect, importcpp: "GetRoot", 
    header: "UI.h".}
proc getRootModalElement*(this: Ui): ptr UIElement {.noSideEffect, 
    importcpp: "GetRootModalElement", header: "UI.h".}
proc getCursor*(this: Ui): ptr Cursor {.noSideEffect, importcpp: "GetCursor", 
                                        header: "UI.h".}
proc getCursorPosition*(this: Ui): IntVector2 {.noSideEffect, 
    importcpp: "GetCursorPosition", header: "UI.h".}
proc getElementAt*(this: var Ui; position: IntVector2; enabledOnly: bool = true): ptr UIElement {.
    importcpp: "GetElementAt", header: "UI.h".}
proc getElementAt*(this: var Ui; x: cint; y: cint; enabledOnly: bool = true): ptr UIElement {.
    importcpp: "GetElementAt", header: "UI.h".}
proc getFocusElement*(this: Ui): ptr UIElement {.noSideEffect, 
    importcpp: "GetFocusElement", header: "UI.h".}
proc getFrontElement*(this: Ui): ptr UIElement {.noSideEffect, 
    importcpp: "GetFrontElement", header: "UI.h".}
proc getDragElements*(this: var Ui): Vector[ptr UIElement] {.
    importcpp: "GetDragElements", header: "UI.h".}
proc getNumDragElements*(this: Ui): cuint {.noSideEffect, 
    importcpp: "GetNumDragElements", header: "UI.h".}
proc getDragElement*(this: var Ui; index: cuint): ptr UIElement {.
    importcpp: "GetDragElement", header: "UI.h".}
proc getClipboardText*(this: Ui): UrString {.noSideEffect, 
    importcpp: "GetClipboardText", header: "UI.h".}
proc getDoubleClickInterval*(this: Ui): cfloat {.noSideEffect, 
    importcpp: "GetDoubleClickInterval", header: "UI.h".}
proc getDragBeginInterval*(this: Ui): cfloat {.noSideEffect, 
    importcpp: "GetDragBeginInterval", header: "UI.h".}
proc getDragBeginDistance*(this: Ui): cint {.noSideEffect, 
    importcpp: "GetDragBeginDistance", header: "UI.h".}
proc getDefaultToolTipDelay*(this: Ui): cfloat {.noSideEffect, 
    importcpp: "GetDefaultToolTipDelay", header: "UI.h".}
proc getMaxFontTextureSize*(this: Ui): cint {.noSideEffect, 
    importcpp: "GetMaxFontTextureSize", header: "UI.h".}
proc isNonFocusedMouseWheel*(this: Ui): bool {.noSideEffect, 
    importcpp: "IsNonFocusedMouseWheel", header: "UI.h".}
proc getUseSystemClipboard*(this: Ui): bool {.noSideEffect, 
    importcpp: "GetUseSystemClipboard", header: "UI.h".}
proc getUseScreenKeyboard*(this: Ui): bool {.noSideEffect, 
    importcpp: "GetUseScreenKeyboard", header: "UI.h".}
proc getUseMutableGlyphs*(this: Ui): bool {.noSideEffect, 
    importcpp: "GetUseMutableGlyphs", header: "UI.h".}
proc getForceAutoHint*(this: Ui): bool {.noSideEffect, 
    importcpp: "GetForceAutoHint", header: "UI.h".}
proc hasModalElement*(this: Ui): bool {.noSideEffect, 
                                        importcpp: "HasModalElement", 
                                        header: "UI.h".}
proc isDragging*(this: Ui): bool {.noSideEffect, importcpp: "IsDragging", 
                                   header: "UI.h".}
  type 
    DragData* {.importc: "Urho3D::DragData", header: "UI.h".} = object 
      dragButtons* {.importc: "dragButtons".}: cint
      numDragButtons* {.importc: "numDragButtons".}: cint
      sumPos* {.importc: "sumPos".}: IntVector2
      dragBeginPending* {.importc: "dragBeginPending".}: bool
      dragBeginTimer* {.importc: "dragBeginTimer".}: Timer
      dragBeginSumPos* {.importc: "dragBeginSumPos".}: IntVector2


proc registerUILibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterUILibrary(@)", header: "UI.h".}