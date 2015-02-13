

import 
  UrObject, timer, urstr, stringHash, xmlelement, font, ptrs, text, variant

import hashmap except Node

discard "forward decl of Engine"
discard "forward decl of Font"
discard "forward decl of Text"
var DEBUGHUD_SHOW_NONE* {.importc: "DEBUGHUD_SHOW_NONE", header: "DebugHud.h".}: cuint #= 0x00000000
var DEBUGHUD_SHOW_STATS* {.importc: "DEBUGHUD_SHOW_STATS", header: "DebugHud.h".}: cuint #= 0x00000001
var DEBUGHUD_SHOW_MODE* {.importc: "DEBUGHUD_SHOW_MODE", header: "DebugHud.h".}: cuint #= 0x00000002
var DEBUGHUD_SHOW_PROFILER* {.importc: "DEBUGHUD_SHOW_PROFILER", 
                              header: "DebugHud.h".}: cuint #= 0x00000004
var DEBUGHUD_SHOW_ALL* {.importc: "DEBUGHUD_SHOW_ALL", header: "DebugHud.h".}: cuint #= 0x00000007


type 
  DebugHud* {.importc: "Urho3D::DebugHud", header: "DebugHud.h".} = object of UrObject
    statsText* {.importc: "statsText_".}: SharedPtr[Text]
    modeText* {.importc: "modeText_".}: SharedPtr[Text]
    profilerText* {.importc: "profilerText_".}: SharedPtr[Text]
    appStats* {.importc: "appStats_".}: HashMap[UrString, UrString]
    profilerTimer* {.importc: "profilerTimer_".}: Timer
    profilerMaxDepth* {.importc: "profilerMaxDepth_".}: cuint
    profilerInterval* {.importc: "profilerInterval_".}: cuint
    useRendererStats* {.importc: "useRendererStats_".}: bool
    mode* {.importc: "mode_".}: cuint


proc getType*(this: DebugHud): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "DebugHud.h".}
proc getBaseType*(this: DebugHud): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "DebugHud.h".}
proc getTypeName*(this: DebugHud): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "DebugHud.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::DebugHud::GetTypeStatic(@)", header: "DebugHud.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::DebugHud::GetTypeNameStatic(@)", header: "DebugHud.h".}
proc constructDebugHud*(context: ptr Context): DebugHud {.
    importcpp: "Urho3D::DebugHud(@)", header: "DebugHud.h".}
proc destroyDebugHud*(this: var DebugHud) {.importcpp: "#.~DebugHud()", 
    header: "DebugHud.h".}
proc update*(this: var DebugHud) {.importcpp: "Update", header: "DebugHud.h".}
proc setDefaultStyle*(this: var DebugHud; style: ptr XMLFile) {.
    importcpp: "SetDefaultStyle", header: "DebugHud.h".}
proc setMode*(this: var DebugHud; mode: cuint) {.importcpp: "SetMode", 
    header: "DebugHud.h".}
proc setProfilerMaxDepth*(this: var DebugHud; depth: cuint) {.
    importcpp: "SetProfilerMaxDepth", header: "DebugHud.h".}
proc setProfilerInterval*(this: var DebugHud; interval: cfloat) {.
    importcpp: "SetProfilerInterval", header: "DebugHud.h".}
proc setUseRendererStats*(this: var DebugHud; enable: bool) {.
    importcpp: "SetUseRendererStats", header: "DebugHud.h".}
proc toggle*(this: var DebugHud; mode: cuint) {.importcpp: "Toggle", 
    header: "DebugHud.h".}
proc toggleAll*(this: var DebugHud) {.importcpp: "ToggleAll", 
                                      header: "DebugHud.h".}
proc getDefaultStyle*(this: DebugHud): ptr XMLFile {.noSideEffect, 
    importcpp: "GetDefaultStyle", header: "DebugHud.h".}
proc getStatsText*(this: DebugHud): ptr Text {.noSideEffect, 
    importcpp: "GetStatsText", header: "DebugHud.h".}
proc getModeText*(this: DebugHud): ptr Text {.noSideEffect, 
    importcpp: "GetModeText", header: "DebugHud.h".}
proc getProfilerText*(this: DebugHud): ptr Text {.noSideEffect, 
    importcpp: "GetProfilerText", header: "DebugHud.h".}
proc getMode*(this: DebugHud): cuint {.noSideEffect, importcpp: "GetMode", 
                                       header: "DebugHud.h".}
proc getProfilerMaxDepth*(this: DebugHud): cuint {.noSideEffect, 
    importcpp: "GetProfilerMaxDepth", header: "DebugHud.h".}
proc getProfilerInterval*(this: DebugHud): cfloat {.noSideEffect, 
    importcpp: "GetProfilerInterval", header: "DebugHud.h".}
proc getUseRendererStats*(this: DebugHud): bool {.noSideEffect, 
    importcpp: "GetUseRendererStats", header: "DebugHud.h".}
proc setAppStats*(this: var DebugHud; label: UrString; stats: Variant) {.
    importcpp: "SetAppStats", header: "DebugHud.h".}
proc setAppStats*(this: var DebugHud; label: UrString; stats: UrString) {.
    importcpp: "SetAppStats", header: "DebugHud.h".}
proc resetAppStats*(this: var DebugHud; label: UrString): bool {.
    importcpp: "ResetAppStats", header: "DebugHud.h".}
proc clearAppStats*(this: var DebugHud) {.importcpp: "ClearAppStats", 
    header: "DebugHud.h".}
