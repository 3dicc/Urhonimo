

import 
  component

discard "forward decl of lua_State"
discard "forward decl of LuaFile"
discard "forward decl of LuaFunction"
discard "forward decl of LuaScript"
type 
  LuaScriptObjectMethod* = enum 
    LSOM_START = 0, LSOM_STOP, LSOM_UPDATE, LSOM_POSTUPDATE, LSOM_FIXEDUPDATE, 
    LSOM_FIXEDPOSTUPDATE, LSOM_LOAD, LSOM_SAVE, LSOM_READNETWORKUPDATE, 
    LSOM_WRITENETWORKUPDATE, LSOM_APPLYATTRIBUTES, LSOM_TRANSFORMCHANGED, 
    MAX_LUA_SCRIPT_OBJECT_METHODS



type 
  LuaScriptInstance* {.importc: "Urho3D::LuaScriptInstance", 
                       header: "LuaScriptInstance.h".} = object of Component
    luaScript* {.importc: "luaScript_".}: ptr LuaScript
    luaState* {.importc: "luaState_".}: ptr LuaState
    scriptFile* {.importc: "scriptFile_".}: SharedPtr[LuaFile]
    scriptObjectType* {.importc: "scriptObjectType_".}: UrString
    attributeInfos* {.importc: "attributeInfos_".}: Vector[AttributeInfo]
    scriptObjectRef* {.importc: "scriptObjectRef_".}: cint
    scriptObjectMethods* {.importc: "scriptObjectMethods_".}: array[
        max_Lua_Script_Object_Methods, WeakPtr[LuaFunction]]
    eventTypeToFunctionMap* {.importc: "eventTypeToFunctionMap_".}: HashMap[
        StringHash, WeakPtr[LuaFunction]]
    objectToEventTypeToFunctionMap* {.importc: "objectToEventTypeToFunctionMap_".}: HashMap[
        ptr UrObject, HashMap[StringHash, WeakPtr[LuaFunction]]]


proc getType*(this: LuaScriptInstance): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "LuaScriptInstance.h".}
proc getBaseType*(this: LuaScriptInstance): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "LuaScriptInstance.h".}
proc getTypeName*(this: LuaScriptInstance): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "LuaScriptInstance.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::LuaScriptInstance::GetTypeStatic(@)", 
    header: "LuaScriptInstance.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::LuaScriptInstance::GetTypeNameStatic(@)", 
    header: "LuaScriptInstance.h".}
proc constructLuaScriptInstance*(context: ptr Context): LuaScriptInstance {.
    importcpp: "Urho3D::LuaScriptInstance(@)", header: "LuaScriptInstance.h".}
proc destroyLuaScriptInstance*(this: var LuaScriptInstance) {.
    importcpp: "#.~LuaScriptInstance()", header: "LuaScriptInstance.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::LuaScriptInstance::RegisterObject(@)", 
    header: "LuaScriptInstance.h".}
proc onSetAttribute*(this: var LuaScriptInstance; attr: AttributeInfo; 
                     src: Variant) {.importcpp: "OnSetAttribute", 
                                     header: "LuaScriptInstance.h".}
proc onGetAttribute*(this: LuaScriptInstance; attr: AttributeInfo; 
                     dest: var Variant) {.noSideEffect, 
    importcpp: "OnGetAttribute", header: "LuaScriptInstance.h".}
proc getAttributes*(this: LuaScriptInstance): ptr Vector[AttributeInfo] {.
    noSideEffect, importcpp: "GetAttributes", header: "LuaScriptInstance.h".}
proc applyAttributes*(this: var LuaScriptInstance) {.
    importcpp: "ApplyAttributes", header: "LuaScriptInstance.h".}
proc onSetEnabled*(this: var LuaScriptInstance) {.importcpp: "OnSetEnabled", 
    header: "LuaScriptInstance.h".}
proc createObject*(this: var LuaScriptInstance; scriptObjectType: UrString): bool {.
    importcpp: "CreateObject", header: "LuaScriptInstance.h".}
proc createObject*(this: var LuaScriptInstance; scriptFile: ptr LuaFile; 
                   scriptObjectType: UrString): bool {.
    importcpp: "CreateObject", header: "LuaScriptInstance.h".}
proc setScriptFile*(this: var LuaScriptInstance; scriptFile: ptr LuaFile) {.
    importcpp: "SetScriptFile", header: "LuaScriptInstance.h".}
proc setScriptObjectType*(this: var LuaScriptInstance; 
                          scriptObjectType: UrString) {.
    importcpp: "SetScriptObjectType", header: "LuaScriptInstance.h".}
proc setScriptDataAttr*(this: var LuaScriptInstance; data: PODVector[cuchar]) {.
    importcpp: "SetScriptDataAttr", header: "LuaScriptInstance.h".}
proc setScriptNetworkDataAttr*(this: var LuaScriptInstance; 
                               data: PODVector[cuchar]) {.
    importcpp: "SetScriptNetworkDataAttr", header: "LuaScriptInstance.h".}
proc scriptSubscribeToEvent*(this: var LuaScriptInstance; eventName: UrString; 
                             functionIndex: cint) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScriptInstance.h".}
proc scriptSubscribeToEvent*(this: var LuaScriptInstance; eventName: UrString; 
                             functionName: UrString) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScriptInstance.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScriptInstance; 
                                 eventName: UrString) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScriptInstance.h".}
proc scriptUnsubscribeFromAllEvents*(this: var LuaScriptInstance) {.
    importcpp: "ScriptUnsubscribeFromAllEvents", header: "LuaScriptInstance.h".}
proc scriptSubscribeToEvent*(this: var LuaScriptInstance; sender: pointer; 
                             eventName: UrString; functionIndex: cint) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScriptInstance.h".}
proc scriptSubscribeToEvent*(this: var LuaScriptInstance; sender: pointer; 
                             eventName: UrString; functionName: UrString) {.
    importcpp: "ScriptSubscribeToEvent", header: "LuaScriptInstance.h".}
proc scriptUnsubscribeFromEvent*(this: var LuaScriptInstance; sender: pointer; 
                                 eventName: UrString) {.
    importcpp: "ScriptUnsubscribeFromEvent", header: "LuaScriptInstance.h".}
proc scriptUnsubscribeFromEvents*(this: var LuaScriptInstance; sender: pointer) {.
    importcpp: "ScriptUnsubscribeFromEvents", header: "LuaScriptInstance.h".}
proc getScriptFile*(this: LuaScriptInstance): ptr LuaFile {.noSideEffect, 
    importcpp: "GetScriptFile", header: "LuaScriptInstance.h".}
proc getScriptObjectType*(this: LuaScriptInstance): UrString {.noSideEffect, 
    importcpp: "GetScriptObjectType", header: "LuaScriptInstance.h".}
proc getScriptObjectRef*(this: LuaScriptInstance): cint {.noSideEffect, 
    importcpp: "GetScriptObjectRef", header: "LuaScriptInstance.h".}
proc getScriptDataAttr*(this: LuaScriptInstance): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetScriptDataAttr", header: "LuaScriptInstance.h".}
proc getScriptNetworkDataAttr*(this: LuaScriptInstance): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetScriptNetworkDataAttr", 
    header: "LuaScriptInstance.h".}
proc getScriptObjectFunction*(this: LuaScriptInstance; functionName: UrString): WeakPtr[
    LuaFunction] {.noSideEffect, importcpp: "GetScriptObjectFunction", 
                   header: "LuaScriptInstance.h".}
proc setScriptFileAttr*(this: var LuaScriptInstance; value: ResourceRef) {.
    importcpp: "SetScriptFileAttr", header: "LuaScriptInstance.h".}
proc getScriptFileAttr*(this: LuaScriptInstance): ResourceRef {.noSideEffect, 
    importcpp: "GetScriptFileAttr", header: "LuaScriptInstance.h".}