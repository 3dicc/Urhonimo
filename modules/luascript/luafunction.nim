

import
  refCounted

discard "forward decl of lua_State"
discard "forward decl of LuaScript"
discard "forward decl of LuaScriptInstance"
type
  LuaFunction* {.importcpp: "Urho3D::LuaFunction", header: "LuaFunction.h".} = object of RefCounted
    luaState* {.importc: "luaState_".}: ptr LuaState
    functionRef* {.importc: "functionRef_".}: cint
    needUnref* {.importc: "needUnref_".}: bool
    stackTop* {.importc: "stackTop_".}: cint
    numArguments* {.importc: "numArguments_".}: cint


proc constructLuaFunction*(lusState: ptr LuaState; functionRef: cint;
                           needUnref: bool = true): LuaFunction {.
    importcpp: "Urho3D::LuaFunction(@)", header: "LuaFunction.h", constructor.}
proc destroyLuaFunction*(this: var LuaFunction) {.importcpp: "#.~LuaFunction()",
    header: "LuaFunction.h".}
proc isValid*(this: LuaFunction): bool {.noSideEffect, importcpp: "IsValid",
    header: "LuaFunction.h".}
proc beginCall*(this: var LuaFunction): bool {.importcpp: "BeginCall",
    header: "LuaFunction.h".}
proc beginCall*(this: var LuaFunction; instance: ptr LuaScriptInstance): bool {.
    importcpp: "BeginCall", header: "LuaFunction.h".}
proc endCall*(this: var LuaFunction; numReturns: cint = 0): bool {.
    importcpp: "EndCall", header: "LuaFunction.h".}
proc pushInt*(this: var LuaFunction; value: cint) {.importcpp: "PushInt",
    header: "LuaFunction.h".}
proc pushBool*(this: var LuaFunction; value: bool) {.importcpp: "PushBool",
    header: "LuaFunction.h".}
proc pushFloat*(this: var LuaFunction; value: cfloat) {.importcpp: "PushFloat",
    header: "LuaFunction.h".}
proc pushString*(this: var LuaFunction; string: UrString) {.
    importcpp: "PushString", header: "LuaFunction.h".}
proc pushUserType*(this: var LuaFunction; userType: pointer; typeName: cstring) {.
    importcpp: "PushUserType", header: "LuaFunction.h".}
proc pushUserType*[T](this: var LuaFunction; userType: ptr T) {.
    importcpp: "PushUserType", header: "LuaFunction.h".}
proc pushUserType*[T](this: var LuaFunction; userType: T) {.
    importcpp: "PushUserType", header: "LuaFunction.h".}
proc pushUserType*[T](this: var LuaFunction; userType: ptr T; typeName: cstring) {.
    importcpp: "PushUserType", header: "LuaFunction.h".}
proc pushUserType*[T](this: var LuaFunction; userType: T; typeName: cstring) {.
    importcpp: "PushUserType", header: "LuaFunction.h".}
proc pushVariant*(this: var LuaFunction; variant: Variant): bool {.
    importcpp: "PushVariant", header: "LuaFunction.h".}
proc pushLuaTable*(this: var LuaFunction; tableName: UrString): bool {.
    importcpp: "PushLuaTable", header: "LuaFunction.h".}
proc getFunctionRef*(this: LuaFunction): cint {.noSideEffect,
    importcpp: "GetFunctionRef", header: "LuaFunction.h".}
