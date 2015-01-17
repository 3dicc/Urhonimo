

import 
  animatable, vector2, xmlelement, texture, stringHash, urobject,
  color, graphicsDefs, rect, urstr, vector, ptrs, variant, matrix4, image,
  deserializer, serializer

type 
  HorizontalAlignment* = enum 
    HA_LEFT = 0, HA_CENTER, HA_RIGHT
  VerticalAlignment* = enum 
    VA_TOP = 0, VA_CENTER, VA_BOTTOM
  Corner* = enum 
    C_TOPLEFT = 0, C_TOPRIGHT, C_BOTTOMLEFT, C_BOTTOMRIGHT, 
    MAX_UIELEMENT_CORNERS
  Orientation* = enum 
    O_HORIZONTAL = 0, O_VERTICAL
  FocusMode* = enum 
    FM_NOTFOCUSABLE = 0, FM_RESETFOCUS, FM_FOCUSABLE, FM_FOCUSABLE_DEFOCUSABLE
  LayoutMode* = enum 
    LM_FREE = 0, LM_HORIZONTAL, LM_VERTICAL
  TraversalMode* = enum 
    TM_BREADTH_FIRST = 0, TM_DEPTH_FIRST
  CursorShape* = enum 
    CS_NORMAL = 0, CS_RESIZEVERTICAL, CS_RESIZEDIAGONAL_TOPRIGHT, 
    CS_RESIZEHORIZONTAL, CS_RESIZEDIAGONAL_TOPLEFT, CS_ACCEPTDROP, 
    CS_REJECTDROP, CS_BUSY, CS_MAX_SHAPES

var DD_DISABLED* {.importc: "DD_DISABLED", header: "UIElement.h".}: cuint #= 0x00000000
var DD_SOURCE* {.importc: "DD_SOURCE", header: "UIElement.h".}: cuint #= 0x00000001
var DD_TARGET* {.importc: "DD_TARGET", header: "UIElement.h".}: cuint #= 0x00000002
var DD_SOURCE_AND_TARGET* {.importc: "DD_SOURCE_AND_TARGET", 
                            header: "UIElement.h".}: cuint #= 0x00000003

discard "forward decl of Cursor"
discard "forward decl of ResourceCache"
type 
  UIElement* {.importc: "Urho3D::UIElement", header: "UIElement.h".} = object of Animatable
    name* {.importc: "name_".}: UrString
    children* {.importc: "children_".}: Vector[SharedPtr[UIElement]]
    parent* {.importc: "parent_".}: ptr UIElement
    clipBorder* {.importc: "clipBorder_".}: IntRect
    color* {.importc: "color_".}: array[Max_Uielement_Corners, Color]
    vars* {.importc: "vars_".}: VariantMap
    priority* {.importc: "priority_".}: cint
    bringToFront* {.importc: "bringToFront_".}: bool
    bringToBack* {.importc: "bringToBack_".}: bool
    clipChildren* {.importc: "clipChildren_".}: bool
    sortChildren* {.importc: "sortChildren_".}: bool
    useDerivedOpacity* {.importc: "useDerivedOpacity_".}: bool
    enabled* {.importc: "enabled_".}: bool
    enabledPrev* {.importc: "enabledPrev_".}: bool
    editable* {.importc: "editable_".}: bool
    selected* {.importc: "selected_".}: bool
    visible* {.importc: "visible_".}: bool
    hovering* {.importc: "hovering_".}: bool
    internal* {.importc: "internal_".}: bool
    focusMode* {.importc: "focusMode_".}: FocusMode
    dragDropMode* {.importc: "dragDropMode_".}: cuint
    layoutMode* {.importc: "layoutMode_".}: LayoutMode
    layoutSpacing* {.importc: "layoutSpacing_".}: cint
    layoutBorder* {.importc: "layoutBorder_".}: IntRect
    layoutFlexScale* {.importc: "layoutFlexScale_".}: Vector2
    resizeNestingLevel* {.importc: "resizeNestingLevel_".}: cuint
    layoutNestingLevel* {.importc: "layoutNestingLevel_".}: cuint
    layoutMinSize* {.importc: "layoutMinSize_".}: cint
    layoutMaxSize* {.importc: "layoutMaxSize_".}: cint
    indent* {.importc: "indent_".}: cint
    indentSpacing* {.importc: "indentSpacing_".}: cint
    position* {.importc: "position_".}: IntVector2
    screenPosition* {.importc: "screenPosition_".}: IntVector2
    positionDirty* {.importc: "positionDirty_".}: bool
    appliedStyle* {.importc: "appliedStyle_".}: UrString
    dragButtonCombo* {.importc: "dragButtonCombo_".}: cint
    dragButtonCount* {.importc: "dragButtonCount_".}: cuint
    size* {.importc: "size_".}: IntVector2
    minSize* {.importc: "minSize_".}: IntVector2
    maxSize* {.importc: "maxSize_".}: IntVector2
    childOffset* {.importc: "childOffset_".}: IntVector2
    horizontalAlignment* {.importc: "horizontalAlignment_".}: HorizontalAlignment
    verticalAlignment* {.importc: "verticalAlignment_".}: VerticalAlignment
    opacity* {.importc: "opacity_".}: cfloat
    derivedOpacity* {.importc: "derivedOpacity_".}: cfloat
    derivedColor* {.importc: "derivedColor_".}: Color
    opacityDirty* {.importc: "opacityDirty_".}: bool
    derivedColorDirty* {.importc: "derivedColorDirty_".}: bool
    sortOrderDirty* {.importc: "sortOrderDirty_".}: bool
    colorGradient* {.importc: "colorGradient_".}: bool
    defaultStyle* {.importc: "defaultStyle_".}: SharedPtr[XMLFile]
    traversalMode* {.importc: "traversalMode_".}: TraversalMode
    elementEventSender* {.importc: "elementEventSender_".}: bool

  UIBatch* {.importc: "Urho3D::UIBatch", header: "UIBatch.h".} = object 
    element* {.importc: "element_".}: ptr UIElement
    blendMode* {.importc: "blendMode_".}: BlendMode
    scissor* {.importc: "scissor_".}: IntRect
    texture* {.importc: "texture_".}: ptr Texture
    invTextureSize* {.importc: "invTextureSize_".}: Vector2
    color* {.importc: "color_".}: cuint
    vertexData* {.importc: "vertexData_".}: ptr PODVector[cfloat]
    vertexStart* {.importc: "vertexStart_".}: cuint
    vertexEnd* {.importc: "vertexEnd_".}: cuint
    useGradient* {.importc: "useGradient_".}: bool
  BorderImage* {.importc: "Urho3D::BorderImage", header: "BorderImage.h".} = object of UIElement
    texture* {.importc: "texture_".}: SharedPtr[Texture]
    imageRect* {.importc: "imageRect_".}: IntRect
    border* {.importc: "border_".}: IntRect
    imageBorder* {.importc: "imageBorder_".}: IntRect
    hoverOffset* {.importc: "hoverOffset_".}: IntVector2
    blendMode* {.importc: "blendMode_".}: BlendMode
    tiled* {.importc: "tiled_".}: bool


  Cursor* {.importc: "Urho3D::Cursor", header: "Cursor.h".} = object of BorderImage
    shape* {.importc: "shape_".}: CursorShape
    shapeInfos* {.importc: "shapeInfos_".}: array[CS_Max_Shapes, CursorShapeInfo]
    useSystemShapes* {.importc: "useSystemShapes_".}: bool
    osShapeDirty* {.importc: "osShapeDirty_".}: bool
  CursorShapeInfo* {.importc: "Urho3D::CursorShapeInfo", header: "Cursor.h".} = object 
    image* {.importc: "image_".}: SharedPtr[Image]
    texture* {.importc: "texture_".}: SharedPtr[Texture]
    imageRect* {.importc: "imageRect_".}: IntRect
    hotSpot* {.importc: "hotSpot_".}: IntVector2
    #osCursor* {.importc: "osCursor_".}: ptr SDL_Cursor
    systemDefined* {.importc: "systemDefined_".}: bool


var UI_VERTEX_SIZE* {.importc: "UI_VERTEX_SIZE", header: "UIBatch.h".}: cuint #= 6

proc constructUIBatch*(): UIBatch {.importcpp: "Urho3D::UIBatch(@)", 
                                    header: "UIBatch.h".}
proc constructUIBatch*(element: ptr UIElement; blendMode: BlendMode; 
                       scissor: IntRect; texture: ptr Texture; 
                       vertexData: ptr PODVector[cfloat]): UIBatch {.
    importcpp: "Urho3D::UIBatch(@)", header: "UIBatch.h".}
proc setColor*(this: var UIBatch; color: Color; overrideAlpha: bool = false) {.
    importcpp: "SetColor", header: "UIBatch.h".}
proc setDefaultColor*(this: var UIBatch) {.importcpp: "SetDefaultColor", 
    header: "UIBatch.h".}
proc addQuad*(this: var UIBatch; x: cint; y: cint; width: cint; height: cint; 
              texOffsetX: cint; texOffsetY: cint; texWidth: cint = 0; 
              texHeight: cint = 0) {.importcpp: "AddQuad", header: "UIBatch.h".}
proc addQuad*(this: var UIBatch; transform: Matrix3x4; x: cint; y: cint; 
              width: cint; height: cint; texOffsetX: cint; texOffsetY: cint; 
              texWidth: cint = 0; texHeight: cint = 0) {.importcpp: "AddQuad", 
    header: "UIBatch.h".}
proc addQuad*(this: var UIBatch; x: cint; y: cint; width: cint; height: cint; 
              texOffsetX: cint; texOffsetY: cint; texWidth: cint; 
              texHeight: cint; tiled: bool) {.importcpp: "AddQuad", 
    header: "UIBatch.h".}
proc merge*(this: var UIBatch; batch: UIBatch): bool {.importcpp: "Merge", 
    header: "UIBatch.h".}
proc getInterpolatedColor*(this: var UIBatch; x: cint; y: cint): cuint {.
    importcpp: "GetInterpolatedColor", header: "UIBatch.h".}
proc addOrMerge*(batch: UIBatch; batches: var PODVector[UIBatch]) {.
    importcpp: "Urho3D::UIBatch::AddOrMerge(@)", header: "UIBatch.h".}
    
proc getType*(this: UIElement): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "UIElement.h".}
proc getBaseType*(this: UIElement): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "UIElement.h".}
proc getTypeName*(this: UIElement): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "UIElement.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::UIElement::GetTypeStatic(@)", header: "UIElement.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::UIElement::GetTypeNameStatic(@)", header: "UIElement.h".}
proc getBaseTypeStatic*(): StringHash {.
    importcpp: "Urho3D::UIElement::GetBaseTypeStatic(@)", header: "UIElement.h".}
proc constructUIElement*(context: ptr Context): UIElement {.
    importcpp: "Urho3D::UIElement(@)", header: "UIElement.h".}
proc destroyUIElement*(this: var UIElement) {.importcpp: "#.~UIElement()", 
    header: "UIElement.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::UIElement::RegisterObject(@)", header: "UIElement.h".}
proc applyAttributes*(this: var UIElement) {.importcpp: "ApplyAttributes", 
    header: "UIElement.h".}
proc loadXML*(this: var UIElement; source: XMLElement; 
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML", 
    header: "UIElement.h".}
proc loadXML*(this: var UIElement; source: XMLElement; styleFile: ptr XMLFile; 
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML", 
    header: "UIElement.h".}
proc loadChildXML*(this: var UIElement; childElem: XMLElement; 
                   styleFile: ptr XMLFile = nil; setInstanceDefault: bool = false): bool {.
    importcpp: "LoadChildXML", header: "UIElement.h".}
proc saveXML*(this: UIElement; dest: var XMLElement): bool {.noSideEffect, 
    importcpp: "SaveXML", header: "UIElement.h".}
proc update*(this: var UIElement; timeStep: cfloat) {.importcpp: "Update", 
    header: "UIElement.h".}
proc isWithinScissor*(this: var UIElement; currentScissor: IntRect): bool {.
    importcpp: "IsWithinScissor", header: "UIElement.h".}
proc getScreenPosition*(this: UIElement): IntVector2 {.noSideEffect, 
    importcpp: "GetScreenPosition", header: "UIElement.h".}
proc getBatches*(this: var UIElement; batches: var PODVector[UIBatch]; 
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "UIElement.h".}
proc getDebugDrawBatches*(this: var UIElement; batches: var PODVector[UIBatch]; 
                          vertexData: var PODVector[cfloat]; 
                          currentScissor: IntRect) {.
    importcpp: "GetDebugDrawBatches", header: "UIElement.h".}
proc onHover*(this: var UIElement; position: IntVector2; 
              screenPosition: IntVector2; buttons: cint; qualifiers: cint; 
              cursor: ptr Cursor) {.importcpp: "OnHover", header: "UIElement.h".}
proc onClickBegin*(this: var UIElement; position: IntVector2; 
                   screenPosition: IntVector2; button: cint; buttons: cint; 
                   qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnClickBegin", header: "UIElement.h".}
proc onClickEnd*(this: var UIElement; position: IntVector2; 
                 screenPosition: IntVector2; button: cint; buttons: cint; 
                 qualifiers: cint; cursor: ptr Cursor; 
                 beginElement: ptr UIElement) {.importcpp: "OnClickEnd", 
    header: "UIElement.h".}
proc onDoubleClick*(this: var UIElement; position: IntVector2; 
                    screenPosition: IntVector2; button: cint; buttons: cint; 
                    qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnDoubleClick", header: "UIElement.h".}
proc onDragBegin*(this: var UIElement; position: IntVector2; 
                  screenPosition: IntVector2; buttons: cint; qualifiers: cint; 
                  cursor: ptr Cursor) {.importcpp: "OnDragBegin", 
                                        header: "UIElement.h".}
proc onDragMove*(this: var UIElement; position: IntVector2; 
                 screenPosition: IntVector2; deltaPos: IntVector2; 
                 buttons: cint; qualifiers: cint; cursor: ptr Cursor) {.
    importcpp: "OnDragMove", header: "UIElement.h".}
proc onDragEnd*(this: var UIElement; position: IntVector2; 
                screenPosition: IntVector2; dragButtons: cint; 
                releaseButton: cint; cursor: ptr Cursor) {.
    importcpp: "OnDragEnd", header: "UIElement.h".}
proc onDragCancel*(this: var UIElement; position: IntVector2; 
                   screenPosition: IntVector2; dragButtons: cint; 
                   cancelButton: cint; cursor: ptr Cursor) {.
    importcpp: "OnDragCancel", header: "UIElement.h".}
proc onDragDropTest*(this: var UIElement; source: ptr UIElement): bool {.
    importcpp: "OnDragDropTest", header: "UIElement.h".}
proc onDragDropFinish*(this: var UIElement; source: ptr UIElement): bool {.
    importcpp: "OnDragDropFinish", header: "UIElement.h".}
proc onWheel*(this: var UIElement; delta: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnWheel", header: "UIElement.h".}
proc onKey*(this: var UIElement; key: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnKey", header: "UIElement.h".}
proc onTextInput*(this: var UIElement; text: UrString; buttons: cint; 
                  qualifiers: cint) {.importcpp: "OnTextInput", 
                                      header: "UIElement.h".}
proc onResize*(this: var UIElement) {.importcpp: "OnResize", 
                                      header: "UIElement.h".}
proc onPositionSet*(this: var UIElement) {.importcpp: "OnPositionSet", 
    header: "UIElement.h".}
proc onSetEditable*(this: var UIElement) {.importcpp: "OnSetEditable", 
    header: "UIElement.h".}
proc onIndentSet*(this: var UIElement) {.importcpp: "OnIndentSet", 
    header: "UIElement.h".}
proc loadXML*(this: var UIElement; source: var Deserializer): bool {.
    importcpp: "LoadXML", header: "UIElement.h".}
proc saveXML*(this: UIElement; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "SaveXML", header: "UIElement.h".}
proc filterAttributes*(this: UIElement; dest: var XMLElement): bool {.
    noSideEffect, importcpp: "FilterAttributes", header: "UIElement.h".}
proc setName*(this: var UIElement; name: UrString) {.importcpp: "SetName", 
    header: "UIElement.h".}
proc setPosition*(this: var UIElement; position: IntVector2) {.
    importcpp: "SetPosition", header: "UIElement.h".}
proc setPosition*(this: var UIElement; x: cint; y: cint) {.
    importcpp: "SetPosition", header: "UIElement.h".}
proc setSize*(this: var UIElement; size: IntVector2) {.importcpp: "SetSize", 
    header: "UIElement.h".}
proc setSize*(this: var UIElement; width: cint; height: cint) {.
    importcpp: "SetSize", header: "UIElement.h".}
proc setWidth*(this: var UIElement; width: cint) {.importcpp: "SetWidth", 
    header: "UIElement.h".}
proc setHeight*(this: var UIElement; height: cint) {.importcpp: "SetHeight", 
    header: "UIElement.h".}
proc setMinSize*(this: var UIElement; minSize: IntVector2) {.
    importcpp: "SetMinSize", header: "UIElement.h".}
proc setMinSize*(this: var UIElement; width: cint; height: cint) {.
    importcpp: "SetMinSize", header: "UIElement.h".}
proc setMinWidth*(this: var UIElement; width: cint) {.importcpp: "SetMinWidth", 
    header: "UIElement.h".}
proc setMinHeight*(this: var UIElement; height: cint) {.
    importcpp: "SetMinHeight", header: "UIElement.h".}
proc setMaxSize*(this: var UIElement; maxSize: IntVector2) {.
    importcpp: "SetMaxSize", header: "UIElement.h".}
proc setMaxSize*(this: var UIElement; width: cint; height: cint) {.
    importcpp: "SetMaxSize", header: "UIElement.h".}
proc setMaxWidth*(this: var UIElement; width: cint) {.importcpp: "SetMaxWidth", 
    header: "UIElement.h".}
proc setMaxHeight*(this: var UIElement; height: cint) {.
    importcpp: "SetMaxHeight", header: "UIElement.h".}
proc setFixedSize*(this: var UIElement; size: IntVector2) {.
    importcpp: "SetFixedSize", header: "UIElement.h".}
proc setFixedSize*(this: var UIElement; width: cint; height: cint) {.
    importcpp: "SetFixedSize", header: "UIElement.h".}
proc setFixedWidth*(this: var UIElement; width: cint) {.
    importcpp: "SetFixedWidth", header: "UIElement.h".}
proc setFixedHeight*(this: var UIElement; height: cint) {.
    importcpp: "SetFixedHeight", header: "UIElement.h".}
proc setAlignment*(this: var UIElement; hAlign: HorizontalAlignment; 
                   vAlign: VerticalAlignment) {.importcpp: "SetAlignment", 
    header: "UIElement.h".}
proc setHorizontalAlignment*(this: var UIElement; align: HorizontalAlignment) {.
    importcpp: "SetHorizontalAlignment", header: "UIElement.h".}
proc setVerticalAlignment*(this: var UIElement; align: VerticalAlignment) {.
    importcpp: "SetVerticalAlignment", header: "UIElement.h".}
proc setClipBorder*(this: var UIElement; rect: IntRect) {.
    importcpp: "SetClipBorder", header: "UIElement.h".}
proc setColor*(this: var UIElement; color: Color) {.importcpp: "SetColor", 
    header: "UIElement.h".}
proc setColor*(this: var UIElement; corner: Corner; color: Color) {.
    importcpp: "SetColor", header: "UIElement.h".}
proc setPriority*(this: var UIElement; priority: cint) {.
    importcpp: "SetPriority", header: "UIElement.h".}
proc setOpacity*(this: var UIElement; opacity: cfloat) {.
    importcpp: "SetOpacity", header: "UIElement.h".}
proc setBringToFront*(this: var UIElement; enable: bool) {.
    importcpp: "SetBringToFront", header: "UIElement.h".}
proc setBringToBack*(this: var UIElement; enable: bool) {.
    importcpp: "SetBringToBack", header: "UIElement.h".}
proc setClipChildren*(this: var UIElement; enable: bool) {.
    importcpp: "SetClipChildren", header: "UIElement.h".}
proc setSortChildren*(this: var UIElement; enable: bool) {.
    importcpp: "SetSortChildren", header: "UIElement.h".}
proc setUseDerivedOpacity*(this: var UIElement; enable: bool) {.
    importcpp: "SetUseDerivedOpacity", header: "UIElement.h".}
proc setEnabled*(this: var UIElement; enable: bool) {.importcpp: "SetEnabled", 
    header: "UIElement.h".}
proc setDeepEnabled*(this: var UIElement; enable: bool) {.
    importcpp: "SetDeepEnabled", header: "UIElement.h".}
proc resetDeepEnabled*(this: var UIElement) {.importcpp: "ResetDeepEnabled", 
    header: "UIElement.h".}
proc setEnabledRecursive*(this: var UIElement; enable: bool) {.
    importcpp: "SetEnabledRecursive", header: "UIElement.h".}
proc setEditable*(this: var UIElement; enable: bool) {.importcpp: "SetEditable", 
    header: "UIElement.h".}
proc setFocus*(this: var UIElement; enable: bool) {.importcpp: "SetFocus", 
    header: "UIElement.h".}
proc setSelected*(this: var UIElement; enable: bool) {.importcpp: "SetSelected", 
    header: "UIElement.h".}
proc setVisible*(this: var UIElement; enable: bool) {.importcpp: "SetVisible", 
    header: "UIElement.h".}
proc setFocusMode*(this: var UIElement; mode: FocusMode) {.
    importcpp: "SetFocusMode", header: "UIElement.h".}
proc setDragDropMode*(this: var UIElement; mode: cuint) {.
    importcpp: "SetDragDropMode", header: "UIElement.h".}
proc setStyle*(this: var UIElement; styleName: UrString; file: ptr XMLFile = nil): bool {.
    importcpp: "SetStyle", header: "UIElement.h".}
proc setStyle*(this: var UIElement; element: XMLElement): bool {.
    importcpp: "SetStyle", header: "UIElement.h".}
proc setStyleAuto*(this: var UIElement; file: ptr XMLFile = nil): bool {.
    importcpp: "SetStyleAuto", header: "UIElement.h".}
proc setDefaultStyle*(this: var UIElement; style: ptr XMLFile) {.
    importcpp: "SetDefaultStyle", header: "UIElement.h".}
proc setLayout*(this: var UIElement; mode: LayoutMode; spacing: cint = 0; 
                border: IntRect) {.importcpp: "SetLayout", 
    header: "UIElement.h".}
proc setLayoutMode*(this: var UIElement; mode: LayoutMode) {.
    importcpp: "SetLayoutMode", header: "UIElement.h".}
proc setLayoutSpacing*(this: var UIElement; spacing: cint) {.
    importcpp: "SetLayoutSpacing", header: "UIElement.h".}
proc setLayoutBorder*(this: var UIElement; border: IntRect) {.
    importcpp: "SetLayoutBorder", header: "UIElement.h".}
proc setLayoutFlexScale*(this: var UIElement; scale: Vector2) {.
    importcpp: "SetLayoutFlexScale", header: "UIElement.h".}
proc setIndent*(this: var UIElement; indent: cint) {.importcpp: "SetIndent", 
    header: "UIElement.h".}
proc setIndentSpacing*(this: var UIElement; indentSpacing: cint) {.
    importcpp: "SetIndentSpacing", header: "UIElement.h".}
proc updateLayout*(this: var UIElement) {.importcpp: "UpdateLayout", 
    header: "UIElement.h".}
proc disableLayoutUpdate*(this: var UIElement) {.
    importcpp: "DisableLayoutUpdate", header: "UIElement.h".}
proc enableLayoutUpdate*(this: var UIElement) {.importcpp: "EnableLayoutUpdate", 
    header: "UIElement.h".}
proc bringToFront*(this: var UIElement) {.importcpp: "BringToFront", 
    header: "UIElement.h".}
proc createChild*(this: var UIElement; `type`: StringHash; 
                  name: UrString; index: cuint = cuint(-1)): ptr UIElement {.
    importcpp: "CreateChild", header: "UIElement.h".}
proc addChild*(this: var UIElement; element: ptr UIElement) {.
    importcpp: "AddChild", header: "UIElement.h".}
proc insertChild*(this: var UIElement; index: cuint; element: ptr UIElement) {.
    importcpp: "InsertChild", header: "UIElement.h".}
proc removeChild*(this: var UIElement; element: ptr UIElement; index: cuint = 0) {.
    importcpp: "RemoveChild", header: "UIElement.h".}
proc removeChildAtIndex*(this: var UIElement; index: cuint) {.
    importcpp: "RemoveChildAtIndex", header: "UIElement.h".}
proc removeAllChildren*(this: var UIElement) {.importcpp: "RemoveAllChildren", 
    header: "UIElement.h".}
proc remove*(this: var UIElement) {.importcpp: "Remove", header: "UIElement.h".}
proc findChild*(this: UIElement; element: ptr UIElement): cuint {.noSideEffect, 
    importcpp: "FindChild", header: "UIElement.h".}
proc setParent*(this: var UIElement; parent: ptr UIElement; 
                index: cuint = cuint(-1)) {.importcpp: "SetParent", 
    header: "UIElement.h".}
proc setVar*(this: var UIElement; key: StringHash; value: Variant) {.
    importcpp: "SetVar", header: "UIElement.h".}
proc setInternal*(this: var UIElement; enable: bool) {.importcpp: "SetInternal", 
    header: "UIElement.h".}
proc setTraversalMode*(this: var UIElement; traversalMode: TraversalMode) {.
    importcpp: "SetTraversalMode", header: "UIElement.h".}
proc setElementEventSender*(this: var UIElement; flag: bool) {.
    importcpp: "SetElementEventSender", header: "UIElement.h".}
proc createChild*[T](this: var UIElement; name: UrString; 
                     index: cuint = cuint(-1)): ptr T {.
    importcpp: "CreateChild", header: "UIElement.h".}
proc getName*(this: UIElement): UrString {.noSideEffect, importcpp: "GetName", 
    header: "UIElement.h".}
proc getPosition*(this: UIElement): IntVector2 {.noSideEffect, 
    importcpp: "GetPosition", header: "UIElement.h".}
proc getSize*(this: UIElement): IntVector2 {.noSideEffect, importcpp: "GetSize", 
    header: "UIElement.h".}
proc getWidth*(this: UIElement): cint {.noSideEffect, importcpp: "GetWidth", 
                                        header: "UIElement.h".}
proc getHeight*(this: UIElement): cint {.noSideEffect, importcpp: "GetHeight", 
    header: "UIElement.h".}
proc getMinSize*(this: UIElement): IntVector2 {.noSideEffect, 
    importcpp: "GetMinSize", header: "UIElement.h".}
proc getMinWidth*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetMinWidth", header: "UIElement.h".}
proc getMinHeight*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetMinHeight", header: "UIElement.h".}
proc getMaxSize*(this: UIElement): IntVector2 {.noSideEffect, 
    importcpp: "GetMaxSize", header: "UIElement.h".}
proc getMaxWidth*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetMaxWidth", header: "UIElement.h".}
proc getMaxHeight*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetMaxHeight", header: "UIElement.h".}
proc isFixedSize*(this: UIElement): bool {.noSideEffect, 
    importcpp: "IsFixedSize", header: "UIElement.h".}
proc isFixedWidth*(this: UIElement): bool {.noSideEffect, 
    importcpp: "IsFixedWidth", header: "UIElement.h".}
proc isFixedHeight*(this: UIElement): bool {.noSideEffect, 
    importcpp: "IsFixedHeight", header: "UIElement.h".}
proc getChildOffset*(this: UIElement): IntVector2 {.noSideEffect, 
    importcpp: "GetChildOffset", header: "UIElement.h".}
proc getHorizontalAlignment*(this: UIElement): HorizontalAlignment {.
    noSideEffect, importcpp: "GetHorizontalAlignment", header: "UIElement.h".}
proc getVerticalAlignment*(this: UIElement): VerticalAlignment {.noSideEffect, 
    importcpp: "GetVerticalAlignment", header: "UIElement.h".}
proc getClipBorder*(this: UIElement): IntRect {.noSideEffect, 
    importcpp: "GetClipBorder", header: "UIElement.h".}
proc getColor*(this: UIElement; corner: Corner): Color {.noSideEffect, 
    importcpp: "GetColor", header: "UIElement.h".}
proc getPriority*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetPriority", header: "UIElement.h".}
proc getOpacity*(this: UIElement): cfloat {.noSideEffect, 
    importcpp: "GetOpacity", header: "UIElement.h".}
proc getDerivedOpacity*(this: UIElement): cfloat {.noSideEffect, 
    importcpp: "GetDerivedOpacity", header: "UIElement.h".}
proc getBringToFront*(this: UIElement): bool {.noSideEffect, 
    importcpp: "GetBringToFront", header: "UIElement.h".}
proc getBringToBack*(this: UIElement): bool {.noSideEffect, 
    importcpp: "GetBringToBack", header: "UIElement.h".}
proc getClipChildren*(this: UIElement): bool {.noSideEffect, 
    importcpp: "GetClipChildren", header: "UIElement.h".}
proc getSortChildren*(this: UIElement): bool {.noSideEffect, 
    importcpp: "GetSortChildren", header: "UIElement.h".}
proc getUseDerivedOpacity*(this: UIElement): bool {.noSideEffect, 
    importcpp: "GetUseDerivedOpacity", header: "UIElement.h".}
proc hasFocus*(this: UIElement): bool {.noSideEffect, importcpp: "HasFocus", 
                                        header: "UIElement.h".}
proc isEnabled*(this: UIElement): bool {.noSideEffect, importcpp: "IsEnabled", 
    header: "UIElement.h".}
proc isEnabledSelf*(this: UIElement): bool {.noSideEffect, 
    importcpp: "IsEnabledSelf", header: "UIElement.h".}
proc isEditable*(this: UIElement): bool {.noSideEffect, importcpp: "IsEditable", 
    header: "UIElement.h".}
proc isSelected*(this: UIElement): bool {.noSideEffect, importcpp: "IsSelected", 
    header: "UIElement.h".}
proc isVisible*(this: UIElement): bool {.noSideEffect, importcpp: "IsVisible", 
    header: "UIElement.h".}
proc isHovering*(this: UIElement): bool {.noSideEffect, importcpp: "IsHovering", 
    header: "UIElement.h".}
proc isInternal*(this: UIElement): bool {.noSideEffect, importcpp: "IsInternal", 
    header: "UIElement.h".}
proc hasColorGradient*(this: UIElement): bool {.noSideEffect, 
    importcpp: "HasColorGradient", header: "UIElement.h".}
proc getFocusMode*(this: UIElement): FocusMode {.noSideEffect, 
    importcpp: "GetFocusMode", header: "UIElement.h".}
proc getDragDropMode*(this: UIElement): cuint {.noSideEffect, 
    importcpp: "GetDragDropMode", header: "UIElement.h".}
proc getAppliedStyle*(this: UIElement): UrString {.noSideEffect, 
    importcpp: "GetAppliedStyle", header: "UIElement.h".}
proc getDefaultStyle*(this: UIElement; recursiveUp: bool = true): ptr XMLFile {.
    noSideEffect, importcpp: "GetDefaultStyle", header: "UIElement.h".}
proc getLayoutMode*(this: UIElement): LayoutMode {.noSideEffect, 
    importcpp: "GetLayoutMode", header: "UIElement.h".}
proc getLayoutSpacing*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetLayoutSpacing", header: "UIElement.h".}
proc getLayoutBorder*(this: UIElement): IntRect {.noSideEffect, 
    importcpp: "GetLayoutBorder", header: "UIElement.h".}
proc getLayoutFlexScale*(this: UIElement): Vector2 {.noSideEffect, 
    importcpp: "GetLayoutFlexScale", header: "UIElement.h".}
proc getNumChildren*(this: UIElement; recursive: bool = false): cuint {.
    noSideEffect, importcpp: "GetNumChildren", header: "UIElement.h".}
proc getChild*(this: UIElement; index: cuint): ptr UIElement {.noSideEffect, 
    importcpp: "GetChild", header: "UIElement.h".}
proc getChild*(this: UIElement; name: UrString; recursive: bool = false): ptr UIElement {.
    noSideEffect, importcpp: "GetChild", header: "UIElement.h".}
proc getChild*(this: UIElement; key: StringHash; value: Variant; 
               recursive: bool = false): ptr UIElement {.noSideEffect, 
    importcpp: "GetChild", header: "UIElement.h".}
proc getChildren*(this: UIElement): Vector[SharedPtr[UIElement]] {.noSideEffect, 
    importcpp: "GetChildren", header: "UIElement.h".}
proc getChildren*(this: UIElement; dest: var PODVector[ptr UIElement]; 
                  recursive: bool = false) {.noSideEffect, 
    importcpp: "GetChildren", header: "UIElement.h".}
proc getParent*(this: UIElement): ptr UIElement {.noSideEffect, 
    importcpp: "GetParent", header: "UIElement.h".}
proc getRoot*(this: UIElement): ptr UIElement {.noSideEffect, 
    importcpp: "GetRoot", header: "UIElement.h".}
proc getDerivedColor*(this: UIElement): Color {.noSideEffect, 
    importcpp: "GetDerivedColor", header: "UIElement.h".}
proc getVar*(this: UIElement; key: StringHash): Variant {.noSideEffect, 
    importcpp: "GetVar", header: "UIElement.h".}
proc getVars*(this: UIElement): VariantMap {.noSideEffect, importcpp: "GetVars", 
    header: "UIElement.h".}
proc getDragButtonCombo*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetDragButtonCombo", header: "UIElement.h".}
proc getDragButtonCount*(this: UIElement): cuint {.noSideEffect, 
    importcpp: "GetDragButtonCount", header: "UIElement.h".}
proc screenToElement*(this: var UIElement; screenPosition: IntVector2): IntVector2 {.
    importcpp: "ScreenToElement", header: "UIElement.h".}
proc elementToScreen*(this: var UIElement; position: IntVector2): IntVector2 {.
    importcpp: "ElementToScreen", header: "UIElement.h".}
proc isInside*(this: var UIElement; position: IntVector2; isScreen: bool): bool {.
    importcpp: "IsInside", header: "UIElement.h".}
proc isInsideCombined*(this: var UIElement; position: IntVector2; isScreen: bool): bool {.
    importcpp: "IsInsideCombined", header: "UIElement.h".}
proc getCombinedScreenRect*(this: var UIElement): IntRect {.
    importcpp: "GetCombinedScreenRect", header: "UIElement.h".}
proc sortChildren*(this: var UIElement) {.importcpp: "SortChildren", 
    header: "UIElement.h".}
proc getLayoutMinSize*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetLayoutMinSize", header: "UIElement.h".}
proc getLayoutMaxSize*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetLayoutMaxSize", header: "UIElement.h".}
proc getIndent*(this: UIElement): cint {.noSideEffect, importcpp: "GetIndent", 
    header: "UIElement.h".}
proc getIndentSpacing*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetIndentSpacing", header: "UIElement.h".}
proc getIndentWidth*(this: UIElement): cint {.noSideEffect, 
    importcpp: "GetIndentWidth", header: "UIElement.h".}
proc setChildOffset*(this: var UIElement; offset: IntVector2) {.
    importcpp: "SetChildOffset", header: "UIElement.h".}
proc setHovering*(this: var UIElement; enable: bool) {.importcpp: "SetHovering", 
    header: "UIElement.h".}
proc adjustScissor*(this: var UIElement; currentScissor: var IntRect) {.
    importcpp: "AdjustScissor", header: "UIElement.h".}
proc getBatchesWithOffset*(this: var UIElement; offset: var IntVector2; 
                           batches: var PODVector[UIBatch]; 
                           vertexData: var PODVector[cfloat]; 
                           currentScissor: IntRect) {.
    importcpp: "GetBatchesWithOffset", header: "UIElement.h".}
proc getColorAttr*(this: UIElement): Color {.noSideEffect, 
    importcpp: "GetColorAttr", header: "UIElement.h".}
proc getTraversalMode*(this: UIElement): TraversalMode {.noSideEffect, 
    importcpp: "GetTraversalMode", header: "UIElement.h".}
proc isElementEventSender*(this: UIElement): bool {.noSideEffect, 
    importcpp: "IsElementEventSender", header: "UIElement.h".}
proc getElementEventSender*(this: UIElement): ptr UIElement {.noSideEffect, 
    importcpp: "GetElementEventSender", header: "UIElement.h".}

#proc uIElement::CreateChild*[T](name: UrString; index: cuint): ptr T
