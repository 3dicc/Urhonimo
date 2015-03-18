

import
  mutex, UrObject

discard "forward decl of asIObjectType"
discard "forward decl of asIScriptContext"
discard "forward decl of asIScriptEngine"
discard "forward decl of asIScriptModule"
discard "forward decl of asSMessageInfo"
var LOGIC_CATEGORY* {.importc: "LOGIC_CATEGORY", header: "Script.h".}: cstring

discard "forward decl of Scene"
discard "forward decl of ScriptFile"
discard "forward decl of ScriptInstance"
type
  DumpMode* {.importcpp: "Urho3D::DumpMode".} = enum
    DOXYGEN = 0, C_HEADER, MAX_DUMP_MODES



type
  Script* {.importcpp: "Urho3D::Script", header: "Script.h".} = object of UrObject
    scriptEngine* {.importc: "scriptEngine_".}: ptr AsIScriptEngine
    immediateContext* {.importc: "immediateContext_".}: ptr AsIScriptContext
    defaultScriptFile* {.importc: "defaultScriptFile_".}: WeakPtr[ScriptFile]
    defaultScene* {.importc: "defaultScene_".}: WeakPtr[Scene]
    scriptFileContexts* {.importc: "scriptFileContexts_".}: Vector[
        ptr AsIScriptContext]
    objectTypes* {.importc: "objectTypes_".}: HashMap[cstring, ptr AsIObjectType]
    moduleMutex* {.importc: "moduleMutex_".}: Mutex
    scriptNestingLevel* {.importc: "scriptNestingLevel_".}: cuint
    executeConsoleCommands* {.importc: "executeConsoleCommands_".}: bool


proc getType*(this: Script): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "Script.h".}
proc getBaseType*(this: Script): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Script.h".}
proc getTypeName*(this: Script): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Script.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Script::GetTypeStatic(@)", header: "Script.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Script::GetTypeNameStatic(@)", header: "Script.h".}
proc constructScript*(context: ptr Context): Script {.constructor,
    importcpp: "Urho3D::Script(@)", header: "Script.h".}
proc destroyScript*(this: var Script) {.importcpp: "#.~Script()",
                                        header: "Script.h".}
proc execute*(this: var Script; line: UrString): bool {.importcpp: "Execute",
    header: "Script.h".}
proc setDefaultScriptFile*(this: var Script; file: ptr ScriptFile) {.
    importcpp: "SetDefaultScriptFile", header: "Script.h".}
proc setDefaultScene*(this: var Script; scene: ptr Scene) {.
    importcpp: "SetDefaultScene", header: "Script.h".}
proc setExecuteConsoleCommands*(this: var Script; enable: bool) {.
    importcpp: "SetExecuteConsoleCommands", header: "Script.h".}
proc dumpAPI*(this: var Script; mode: DumpMode = doxygen) {.
    importcpp: "DumpAPI", header: "Script.h".}
proc messageCallback*(this: var Script; msg: ptr AsSMessageInfo) {.
    importcpp: "MessageCallback", header: "Script.h".}
proc exceptionCallback*(this: var Script; context: ptr AsIScriptContext) {.
    importcpp: "ExceptionCallback", header: "Script.h".}
proc getCallStack*(context: ptr AsIScriptContext): UrString {.
    importcpp: "Urho3D::Script::GetCallStack(@)", header: "Script.h".}
proc getScriptEngine*(this: Script): ptr AsIScriptEngine {.noSideEffect,
    importcpp: "GetScriptEngine", header: "Script.h".}
proc getImmediateContext*(this: Script): ptr AsIScriptContext {.noSideEffect,
    importcpp: "GetImmediateContext", header: "Script.h".}
proc getDefaultScriptFile*(this: Script): ptr ScriptFile {.noSideEffect,
    importcpp: "GetDefaultScriptFile", header: "Script.h".}
proc getDefaultScene*(this: Script): ptr Scene {.noSideEffect,
    importcpp: "GetDefaultScene", header: "Script.h".}
proc getExecuteConsoleCommands*(this: Script): bool {.noSideEffect,
    importcpp: "GetExecuteConsoleCommands", header: "Script.h".}
proc clearObjectTypeCache*(this: var Script) {.
    importcpp: "ClearObjectTypeCache", header: "Script.h".}
proc getObjectType*(this: var Script; declaration: cstring): ptr AsIObjectType {.
    importcpp: "GetObjectType", header: "Script.h".}
proc getModuleMutex*(this: var Script): var Mutex {.importcpp: "GetModuleMutex",
    header: "Script.h".}

proc registerScriptLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterScriptLibrary(@)", header: "Script.h".}
