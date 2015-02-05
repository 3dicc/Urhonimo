

import 
  context, UrObject

discard "forward decl of lua_State"
var LOGIC_CATEGORY* {.importc: "LOGIC_CATEGORY", header: "LuaScript.h".}: cstring

discard "forward decl of LuaFunction"
discard "forward decl of Scene"
type 
  LuaScript* {.importc: "Urho3D::LuaScript", header: "LuaScript.h".} = object of UrObject
    luaState* {.importc: "luaState_".}: ptr LuaState
    coroutineUpdate* {.importc: "coroutineUpdate_".}: WeakPtr[LuaFunction]
    functionPointerToFunctionMap* {.importc: "functionPointerToFunctionMap_".}: HashMap[
        pointer, SharedPtr[LuaFunction]]
    functionNameToFunctionMap* {.importc: "functionNameToFunctionMap_".}: HashMap[
        UrString, SharedPtr[LuaFunction]]
    eventHandleFunctions* {.importc: "eventHandleFunctions_".}: HashMap[
        StringHash, LuaFunctionVector]
    objectHandleFunctions* {.importc: "objectHandleFunctions_".}: HashMap[
        ptr UrObject, HashMap[StringHash, LuaFunctionVector]]
    internalEvents* {.importc: "internalEvents_".}: PODVector[StringHash]
    executeConsoleCommands* {.importc: "executeConsoleCommands_".}: bool


proc getType*(this: LuaScript): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "LuaScript.h".}
proc getBaseType*(this: LuaScript): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "LuaScript.h".}
proc getTypeName*(this: LuaScript): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "LuaScript.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::LuaScript::GetTypeStatic(@)", header: "LuaScript.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::LuaScript::GetTypeNameStatic(@)", header: "LuaScript.h".}
proc constructLuaScript*(context: ptr Context): LuaScript {.
    importcpp: "Urho3D::LuaScript(@)", header: "LuaScript.h".}
proc destroyLuaScript*(this: var LuaScript) {.importcpp: "#.~LuaScript()", 
    header: "LuaScript.h".}
proc executeFile*(this: var LuaScript; fileName: UrString): bool {.
    importcpp: "ExecuteFile", header: "LuaScript.h".}
proc executeString*(this: var LuaScript; string: UrString): bool {.
    importcpp: "ExecuteString", header: "LuaScript.h".}
proc executeFunction*(this: var LuaScript; functionName: UrString): bool {.
    importcpp: "ExecuteFunction", header: "LuaScript.h".}
proc scriptSendEvent*(this: var LuaScript; eventName: UrString; 
                      eventData: var VariantMap) {.importcpp: "ScriptSendEvent", 
    header: "LuaScript.h".}
proc scriptSubscribeToEvent*(this: var LuaScript; eventName: UrString; 
                             functionIndex: cint) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScript.h".}
proc scriptSubscribeToEvent*(this: var LuaScript; eventName: UrString; 
                             functionName: UrString) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScript; eventName: UrString) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScript; eventName: UrString; 
                                 functionIndex: cint) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScript; eventName: UrString; 
                                 functionName: UrString) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromAllEvents*(this: var LuaScript) {.
    importcpp: "ScriptUnsubscribeFromAllEvents", header: "LuaScript.h".}
proc scriptSubscribeToEvent*(this: var LuaScript; sender: pointer; 
                             eventName: UrString; functionIndex: cint) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScript.h".}
proc scriptSubscribeToEvent*(this: var LuaScript; sender: pointer; 
                             eventName: UrString; functionName: UrString) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScript; sender: pointer; 
                                 eventName: UrString) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScript; sender: pointer; 
                                 eventName: UrString; functionIndex: cint) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScript; sender: pointer; 
                                 eventName: UrString; functionName: UrString) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScript.h".}
proc scriptUnsubscribeFromEvents*(this: var LuaScript; sender: pointer) {.
    importcpp: "ScriptUnsubscribeFromEvents", header: "LuaScript.h".}
proc setExecuteConsoleCommands*(this: var LuaScript; enable: bool) {.
    importcpp: "SetExecuteConsoleCommands", header: "LuaScript.h".}
proc getState*(this: LuaScript): ptr LuaState {.noSideEffect, 
    importcpp: "GetState", header: "LuaScript.h".}
proc getFunction*(this: var LuaScript; functionIndex: cint): WeakPtr[LuaFunction] {.
    importcpp: "GetFunction", header: "LuaScript.h".}
proc getFunction*(this: var LuaScript; functionName: UrString; 
                  silentIfNotfound: bool = false): WeakPtr[LuaFunction] {.
    importcpp: "GetFunction", header: "LuaScript.h".}
proc getExecuteConsoleCommands*(this: LuaScript): bool {.noSideEffect, 
    importcpp: "GetExecuteConsoleCommands", header: "LuaScript.h".}

proc registerLuaScriptLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterLuaScriptLibrary(@)", header: "LuaScript.h".}