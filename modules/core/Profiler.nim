

import 
  str, thread, timer


type 
  ProfilerBlock* {.importc: "Urho3D::ProfilerBlock", header: "Profiler.h".} = object 
    name* {.importc: "name_".}: cstring
    timer* {.importc: "timer_".}: HiresTimer
    time* {.importc: "time_".}: clonglong
    maxTime* {.importc: "maxTime_".}: clonglong
    count* {.importc: "count_".}: cuint
    parent* {.importc: "parent_".}: ptr ProfilerBlock
    children* {.importc: "children_".}: PODVector[ptr ProfilerBlock]
    frameTime* {.importc: "frameTime_".}: clonglong
    frameMaxTime* {.importc: "frameMaxTime_".}: clonglong
    frameCount* {.importc: "frameCount_".}: cuint
    intervalTime* {.importc: "intervalTime_".}: clonglong
    intervalMaxTime* {.importc: "intervalMaxTime_".}: clonglong
    intervalCount* {.importc: "intervalCount_".}: cuint
    totalTime* {.importc: "totalTime_".}: clonglong
    totalMaxTime* {.importc: "totalMaxTime_".}: clonglong
    totalCount* {.importc: "totalCount_".}: cuint


proc constructProfilerBlock*(parent: ptr ProfilerBlock; name: cstring): ProfilerBlock {.
    importcpp: "Urho3D::ProfilerBlock(@)", header: "Profiler.h".}
proc destroyProfilerBlock*(this: var ProfilerBlock) {.
    importcpp: "#.~ProfilerBlock()", header: "Profiler.h".}
proc begin*(this: var ProfilerBlock) {.importcpp: "Begin", header: "Profiler.h".}
proc `end`*(this: var ProfilerBlock) {.importcpp: "End", header: "Profiler.h".}
proc endFrame*(this: var ProfilerBlock) {.importcpp: "EndFrame", 
    header: "Profiler.h".}
proc beginInterval*(this: var ProfilerBlock) {.importcpp: "BeginInterval", 
    header: "Profiler.h".}
proc getChild*(this: var ProfilerBlock; name: cstring): ptr ProfilerBlock {.
    importcpp: "GetChild", header: "Profiler.h".}

type 
  Profiler* {.importc: "Urho3D::Profiler", header: "Profiler.h".} = object of UrObject
    current* {.importc: "current_".}: ptr ProfilerBlock
    root* {.importc: "root_".}: ptr ProfilerBlock
    intervalFrames* {.importc: "intervalFrames_".}: cuint
    totalFrames* {.importc: "totalFrames_".}: cuint


proc getType*(this: Profiler): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Profiler.h".}
proc getBaseType*(this: Profiler): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Profiler.h".}
proc getTypeName*(this: Profiler): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Profiler.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Profiler::GetTypeStatic(@)", header: "Profiler.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Profiler::GetTypeNameStatic(@)", header: "Profiler.h".}
proc constructProfiler*(context: ptr Context): Profiler {.
    importcpp: "Urho3D::Profiler(@)", header: "Profiler.h".}
proc destroyProfiler*(this: var Profiler) {.importcpp: "#.~Profiler()", 
    header: "Profiler.h".}
proc beginBlock*(this: var Profiler; name: cstring) {.importcpp: "BeginBlock", 
    header: "Profiler.h".}
proc endBlock*(this: var Profiler) {.importcpp: "EndBlock", header: "Profiler.h".}
proc beginFrame*(this: var Profiler) {.importcpp: "BeginFrame", 
                                       header: "Profiler.h".}
proc endFrame*(this: var Profiler) {.importcpp: "EndFrame", header: "Profiler.h".}
proc beginInterval*(this: var Profiler) {.importcpp: "BeginInterval", 
    header: "Profiler.h".}
proc getData*(this: Profiler; showUnused: bool = false; showTotal: bool = false; 
              maxDepth: cuint = m_Max_Unsigned): UrString {.noSideEffect, 
    importcpp: "GetData", header: "Profiler.h".}
proc getCurrentBlock*(this: var Profiler): ptr ProfilerBlock {.
    importcpp: "GetCurrentBlock", header: "Profiler.h".}
proc getRootBlock*(this: var Profiler): ptr ProfilerBlock {.
    importcpp: "GetRootBlock", header: "Profiler.h".}

type 
  AutoProfileBlock* {.importc: "Urho3D::AutoProfileBlock", header: "Profiler.h".} = object 
    profiler* {.importc: "profiler_".}: ptr Profiler


proc constructAutoProfileBlock*(profiler: ptr Profiler; name: cstring): AutoProfileBlock {.
    importcpp: "Urho3D::AutoProfileBlock(@)", header: "Profiler.h".}
proc destroyAutoProfileBlock*(this: var AutoProfileBlock) {.
    importcpp: "#.~AutoProfileBlock()", header: "Profiler.h".}