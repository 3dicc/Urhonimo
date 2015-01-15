

import 
  UrObject, timer

discard "forward decl of Console"
discard "forward decl of DebugHud"
type 
  Engine* {.importc: "Urho3D::Engine", header: "Engine.h".} = object of UrObject
    frameTimer* {.importc: "frameTimer_".}: HiresTimer
    lastTimeSteps* {.importc: "lastTimeSteps_".}: PODVector[cfloat]
    timeStep* {.importc: "timeStep_".}: cfloat
    timeStepSmoothing* {.importc: "timeStepSmoothing_".}: cuint
    minFps* {.importc: "minFps_".}: cuint
    maxFps* {.importc: "maxFps_".}: cuint
    maxInactiveFps* {.importc: "maxInactiveFps_".}: cuint
    pauseMinimized* {.importc: "pauseMinimized_".}: bool
    autoExit* {.importc: "autoExit_".}: bool
    initialized* {.importc: "initialized_".}: bool
    exiting* {.importc: "exiting_".}: bool
    headless* {.importc: "headless_".}: bool
    audioPaused* {.importc: "audioPaused_".}: bool


proc getType*(this: Engine): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Engine.h".}
proc getBaseType*(this: Engine): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Engine.h".}
proc getTypeName*(this: Engine): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Engine.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Engine::GetTypeStatic(@)", header: "Engine.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Engine::GetTypeNameStatic(@)", header: "Engine.h".}
proc constructEngine*(context: ptr Context): Engine {.
    importcpp: "Urho3D::Engine(@)", header: "Engine.h".}
proc destroyEngine*(this: var Engine) {.importcpp: "#.~Engine()", 
                                        header: "Engine.h".}
proc initialize*(this: var Engine; parameters: VariantMap): bool {.
    importcpp: "Initialize", header: "Engine.h".}
proc runFrame*(this: var Engine) {.importcpp: "RunFrame", header: "Engine.h".}
proc createConsole*(this: var Engine): ptr Console {.importcpp: "CreateConsole", 
    header: "Engine.h".}
proc createDebugHud*(this: var Engine): ptr DebugHud {.
    importcpp: "CreateDebugHud", header: "Engine.h".}
proc setMinFps*(this: var Engine; fps: cint) {.importcpp: "SetMinFps", 
    header: "Engine.h".}
proc setMaxFps*(this: var Engine; fps: cint) {.importcpp: "SetMaxFps", 
    header: "Engine.h".}
proc setMaxInactiveFps*(this: var Engine; fps: cint) {.
    importcpp: "SetMaxInactiveFps", header: "Engine.h".}
proc setTimeStepSmoothing*(this: var Engine; frames: cint) {.
    importcpp: "SetTimeStepSmoothing", header: "Engine.h".}
proc setPauseMinimized*(this: var Engine; enable: bool) {.
    importcpp: "SetPauseMinimized", header: "Engine.h".}
proc setAutoExit*(this: var Engine; enable: bool) {.importcpp: "SetAutoExit", 
    header: "Engine.h".}
proc setNextTimeStep*(this: var Engine; seconds: cfloat) {.
    importcpp: "SetNextTimeStep", header: "Engine.h".}
proc exit*(this: var Engine) {.importcpp: "Exit", header: "Engine.h".}
proc dumpProfiler*(this: var Engine) {.importcpp: "DumpProfiler", 
                                       header: "Engine.h".}
proc dumpResources*(this: var Engine; dumpFileName: bool = false) {.
    importcpp: "DumpResources", header: "Engine.h".}
proc dumpMemory*(this: var Engine) {.importcpp: "DumpMemory", header: "Engine.h".}
proc getNextTimeStep*(this: Engine): cfloat {.noSideEffect, 
    importcpp: "GetNextTimeStep", header: "Engine.h".}
proc getMinFps*(this: Engine): cint {.noSideEffect, importcpp: "GetMinFps", 
                                      header: "Engine.h".}
proc getMaxFps*(this: Engine): cint {.noSideEffect, importcpp: "GetMaxFps", 
                                      header: "Engine.h".}
proc getMaxInactiveFps*(this: Engine): cint {.noSideEffect, 
    importcpp: "GetMaxInactiveFps", header: "Engine.h".}
proc getTimeStepSmoothing*(this: Engine): cint {.noSideEffect, 
    importcpp: "GetTimeStepSmoothing", header: "Engine.h".}
proc getPauseMinimized*(this: Engine): bool {.noSideEffect, 
    importcpp: "GetPauseMinimized", header: "Engine.h".}
proc getAutoExit*(this: Engine): bool {.noSideEffect, importcpp: "GetAutoExit", 
                                        header: "Engine.h".}
proc isInitialized*(this: Engine): bool {.noSideEffect, 
    importcpp: "IsInitialized", header: "Engine.h".}
proc isExiting*(this: Engine): bool {.noSideEffect, importcpp: "IsExiting", 
                                      header: "Engine.h".}
proc isHeadless*(this: Engine): bool {.noSideEffect, importcpp: "IsHeadless", 
                                       header: "Engine.h".}
proc update*(this: var Engine) {.importcpp: "Update", header: "Engine.h".}
proc render*(this: var Engine) {.importcpp: "Render", header: "Engine.h".}
proc applyFrameLimit*(this: var Engine) {.importcpp: "ApplyFrameLimit", 
    header: "Engine.h".}
proc parseParameters*(arguments: Vector[UrString]): VariantMap {.
    importcpp: "Urho3D::Engine::ParseParameters(@)", header: "Engine.h".}
proc hasParameter*(parameters: VariantMap; parameter: UrString): bool {.
    importcpp: "Urho3D::Engine::HasParameter(@)", header: "Engine.h".}
proc getParameter*(parameters: VariantMap; parameter: UrString; 
                   defaultValue: Variant = variant.empty): Variant {.
    importcpp: "Urho3D::Engine::GetParameter(@)", header: "Engine.h".}