
import
  uielement, vector2, stringHash, urstr, urobject, vector, rect, ptrs, scrollbar


discard "forward decl of BorderImage"
discard "forward decl of ScrollBar"
type
  ScrollView* {.importcpp: "Urho3D::ScrollView", header: "ScrollView.h".} = object of UIElement
    contentElement* {.importc: "contentElement_".}: SharedPtr[UIElement]
    horizontalScrollBar* {.importc: "horizontalScrollBar_".}: SharedPtr[
        ScrollBar]
    verticalScrollBar* {.importc: "verticalScrollBar_".}: SharedPtr[ScrollBar]
    scrollPanel* {.importc: "scrollPanel_".}: SharedPtr[BorderImage]
    viewPosition* {.importc: "viewPosition_".}: IntVector2
    viewSize* {.importc: "viewSize_".}: IntVector2
    viewPositionAttr* {.importc: "viewPositionAttr_".}: IntVector2
    touchScrollSpeed* {.importc: "touchScrollSpeed_".}: Vector2
    touchScrollSpeedMax* {.importc: "touchScrollSpeedMax_".}: Vector2
    pageStep* {.importc: "pageStep_".}: cfloat
    scrollBarsAutoVisible* {.importc: "scrollBarsAutoVisible_".}: bool
    ignoreEvents* {.importc: "ignoreEvents_".}: bool
    resizeContentWidth* {.importc: "resizeContentWidth_".}: bool
    scrollDeceleration* {.importc: "scrollDeceleration_".}: cfloat
    scrollSnapEpsilon* {.importc: "scrollSnapEpsilon_".}: cfloat
    scrollTouchDown* {.importc: "scrollTouchDown_".}: bool
    barScrolling* {.importc: "barScrolling_".}: bool
    autoDisableChildren* {.importc: "autoDisableChildren_".}: bool
    scrollChildrenDisable* {.importc: "scrollChildrenDisable_".}: bool
    touchDistanceSum* {.importc: "touchDistanceSum_".}: cfloat
    autoDisableThreshold* {.importc: "autoDisableThreshold_".}: cfloat


proc getType*(this: ScrollView): StringHash {.noSideEffect,
    importcpp: "GetType", header: "ScrollView.h".}
proc getBaseType*(this: ScrollView): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "ScrollView.h".}
proc getTypeName*(this: ScrollView): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "ScrollView.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::ScrollView::GetTypeStatic(@)", header: "ScrollView.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::ScrollView::GetTypeNameStatic(@)",
    header: "ScrollView.h".}
proc constructScrollView*(context: ptr Context): ScrollView {.constructor,
    importcpp: "Urho3D::ScrollView(@)", header: "ScrollView.h".}
proc destroyScrollView*(this: var ScrollView) {.importcpp: "#.~ScrollView()",
    header: "ScrollView.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ScrollView::RegisterObject(@)", header: "ScrollView.h".}
proc update*(this: var ScrollView; timeStep: cfloat) {.importcpp: "Update",
    header: "ScrollView.h".}
proc applyAttributes*(this: var ScrollView) {.importcpp: "ApplyAttributes",
    header: "ScrollView.h".}
proc onWheel*(this: var ScrollView; delta: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnWheel", header: "ScrollView.h".}
proc onKey*(this: var ScrollView; key: cint; buttons: cint; qualifiers: cint) {.
    importcpp: "OnKey", header: "ScrollView.h".}
proc onResize*(this: var ScrollView) {.importcpp: "OnResize",
                                       header: "ScrollView.h".}
proc setContentElement*(this: var ScrollView; element: ptr UIElement) {.
    importcpp: "SetContentElement", header: "ScrollView.h".}
proc setViewPosition*(this: var ScrollView; position: IntVector2) {.
    importcpp: "SetViewPosition", header: "ScrollView.h".}
proc setViewPosition*(this: var ScrollView; x: cint; y: cint) {.
    importcpp: "SetViewPosition", header: "ScrollView.h".}
proc setScrollBarsVisible*(this: var ScrollView; horizontal: bool;
                           vertical: bool) {.importcpp: "SetScrollBarsVisible",
    header: "ScrollView.h".}
proc setScrollBarsAutoVisible*(this: var ScrollView; enable: bool) {.
    importcpp: "SetScrollBarsAutoVisible", header: "ScrollView.h".}
proc setScrollStep*(this: var ScrollView; step: cfloat) {.
    importcpp: "SetScrollStep", header: "ScrollView.h".}
proc setPageStep*(this: var ScrollView; step: cfloat) {.
    importcpp: "SetPageStep", header: "ScrollView.h".}
proc setScrollDeceleration*(this: var ScrollView; deceleration: cfloat) {.
    importcpp: "SetScrollDeceleration", header: "ScrollView.h".}
proc setScrollSnapEpsilon*(this: var ScrollView; snap: cfloat) {.
    importcpp: "SetScrollSnapEpsilon", header: "ScrollView.h".}
proc setAutoDisableChildren*(this: var ScrollView; disable: bool) {.
    importcpp: "SetAutoDisableChildren", header: "ScrollView.h".}
proc setAutoDisableThreshold*(this: var ScrollView; amount: cfloat) {.
    importcpp: "SetAutoDisableThreshold", header: "ScrollView.h".}
proc getViewPosition*(this: ScrollView): IntVector2 {.noSideEffect,
    importcpp: "GetViewPosition", header: "ScrollView.h".}
proc getContentElement*(this: ScrollView): ptr UIElement {.noSideEffect,
    importcpp: "GetContentElement", header: "ScrollView.h".}
proc getHorizontalScrollBar*(this: ScrollView): ptr ScrollBar {.noSideEffect,
    importcpp: "GetHorizontalScrollBar", header: "ScrollView.h".}
proc getVerticalScrollBar*(this: ScrollView): ptr ScrollBar {.noSideEffect,
    importcpp: "GetVerticalScrollBar", header: "ScrollView.h".}
proc getScrollPanel*(this: ScrollView): ptr BorderImage {.noSideEffect,
    importcpp: "GetScrollPanel", header: "ScrollView.h".}
proc getScrollBarsAutoVisible*(this: ScrollView): bool {.noSideEffect,
    importcpp: "GetScrollBarsAutoVisible", header: "ScrollView.h".}
proc getScrollStep*(this: ScrollView): cfloat {.noSideEffect,
    importcpp: "GetScrollStep", header: "ScrollView.h".}
proc getPageStep*(this: ScrollView): cfloat {.noSideEffect,
    importcpp: "GetPageStep", header: "ScrollView.h".}
proc getScrollDeceleration*(this: ScrollView): cfloat {.noSideEffect,
    importcpp: "GetScrollDeceleration", header: "ScrollView.h".}
proc getScrollSnapEpsilon*(this: ScrollView): cfloat {.noSideEffect,
    importcpp: "GetScrollSnapEpsilon", header: "ScrollView.h".}
proc getAutoDisableChildren*(this: ScrollView): bool {.noSideEffect,
    importcpp: "GetAutoDisableChildren", header: "ScrollView.h".}
proc getAutoDisableThreshold*(this: ScrollView): cfloat {.noSideEffect,
    importcpp: "GetAutoDisableThreshold", header: "ScrollView.h".}
proc setViewPositionAttr*(this: var ScrollView; value: IntVector2) {.
    importcpp: "SetViewPositionAttr", header: "ScrollView.h".}
