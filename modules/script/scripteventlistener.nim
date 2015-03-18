

import
  UrObject

discard "forward decl of asILockableSharedBool"
discard "forward decl of asIScriptFunction"
discard "forward decl of asIScriptObject"

type
  DelayedCall* {.importcpp: "Urho3D::DelayedCall", header: "ScriptEventListener.h".} = object
    period* {.importc: "period_".}: cfloat
    delay* {.importc: "delay_".}: cfloat
    repeat* {.importc: "repeat_".}: bool
    declaration* {.importc: "declaration_".}: UrString
    parameters* {.importc: "parameters_".}: VariantVector



type
  ScriptEventListener* {.importcpp: "Urho3D::ScriptEventListener",
                         header: "ScriptEventListener.h".} = object


proc destroyScriptEventListener*(this: var ScriptEventListener) {.
    importcpp: "#.~ScriptEventListener()", header: "ScriptEventListener.h".}
proc addEventHandler*(this: var ScriptEventListener; eventType: StringHash;
                      handlerName: UrString) {.importcpp: "AddEventHandler",
    header: "ScriptEventListener.h".}
proc addEventHandler*(this: var ScriptEventListener; sender: ptr UrObject;
                      eventType: StringHash; handlerName: UrString) {.
    importcpp: "AddEventHandler", header: "ScriptEventListener.h".}
proc removeEventHandler*(this: var ScriptEventListener; eventType: StringHash) {.
    importcpp: "RemoveEventHandler", header: "ScriptEventListener.h".}
proc removeEventHandler*(this: var ScriptEventListener; sender: ptr UrObject;
                         eventType: StringHash) {.
    importcpp: "RemoveEventHandler", header: "ScriptEventListener.h".}
proc removeEventHandlers*(this: var ScriptEventListener; sender: ptr UrObject) {.
    importcpp: "RemoveEventHandlers", header: "ScriptEventListener.h".}
proc removeEventHandlers*(this: var ScriptEventListener) {.
    importcpp: "RemoveEventHandlers", header: "ScriptEventListener.h".}
proc removeEventHandlersExcept*(this: var ScriptEventListener;
                                exceptions: PODVector[StringHash]) {.
    importcpp: "RemoveEventHandlersExcept", header: "ScriptEventListener.h".}
