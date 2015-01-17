

import 
  component, scriptEventListener

discard "forward decl of asIScriptFunction"
discard "forward decl of asIScriptObject"
discard "forward decl of Script"
discard "forward decl of ScriptFile"
type 
  ScriptInstanceMethod* {.importcpp: "Urho3D::ScriptInstanceMethod".} = enum 
    METHOD_START = 0, METHOD_STOP, METHOD_DELAYEDSTART, METHOD_UPDATE, 
    METHOD_POSTUPDATE, METHOD_FIXEDUPDATE, METHOD_FIXEDPOSTUPDATE, METHOD_LOAD, 
    METHOD_SAVE, METHOD_READNETWORKUPDATE, METHOD_WRITENETWORKUPDATE, 
    METHOD_APPLYATTRIBUTES, METHOD_TRANSFORMCHANGED, MAX_SCRIPT_METHODS



type 
  ScriptInstance* {.importc: "Urho3D::ScriptInstance", 
                    header: "ScriptInstance.h".} = object of Component
    script* {.importc: "script_".}: SharedPtr[Script]
    scriptFile* {.importc: "scriptFile_".}: WeakPtr[ScriptFile]
    scriptObject* {.importc: "scriptObject_".}: ptr AsIScriptObject
    className* {.importc: "className_".}: UrString
    methods* {.importc: "methods_".}: array[max_Script_Methods, 
        ptr AsIScriptFunction]
    delayedCalls* {.importc: "delayedCalls_".}: Vector[DelayedCall]
    attributeInfos* {.importc: "attributeInfos_".}: Vector[AttributeInfo]
    idAttributes* {.importc: "idAttributes_".}: HashMap[ptr AttributeInfo, cuint]
    subscribed* {.importc: "subscribed_".}: bool
    subscribedPostFixed* {.importc: "subscribedPostFixed_".}: bool


proc getType*(this: ScriptInstance): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ScriptInstance.h".}
proc getBaseType*(this: ScriptInstance): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ScriptInstance.h".}
proc getTypeName*(this: ScriptInstance): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ScriptInstance.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ScriptInstance::GetTypeStatic(@)", 
    header: "ScriptInstance.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ScriptInstance::GetTypeNameStatic(@)", 
    header: "ScriptInstance.h".}
proc constructScriptInstance*(context: ptr Context): ScriptInstance {.
    importcpp: "Urho3D::ScriptInstance(@)", header: "ScriptInstance.h".}
proc destroyScriptInstance*(this: var ScriptInstance) {.
    importcpp: "#.~ScriptInstance()", header: "ScriptInstance.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ScriptInstance::RegisterObject(@)", 
    header: "ScriptInstance.h".}
proc onSetAttribute*(this: var ScriptInstance; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "ScriptInstance.h".}
proc onGetAttribute*(this: ScriptInstance; attr: AttributeInfo; 
                     dest: var Variant) {.noSideEffect, 
    importcpp: "OnGetAttribute", header: "ScriptInstance.h".}
proc getAttributes*(this: ScriptInstance): ptr Vector[AttributeInfo] {.
    noSideEffect, importcpp: "GetAttributes", header: "ScriptInstance.h".}
proc applyAttributes*(this: var ScriptInstance) {.importcpp: "ApplyAttributes", 
    header: "ScriptInstance.h".}
proc onSetEnabled*(this: var ScriptInstance) {.importcpp: "OnSetEnabled", 
    header: "ScriptInstance.h".}
proc addEventHandler*(this: var ScriptInstance; eventType: StringHash; 
                      handlerName: UrString) {.importcpp: "AddEventHandler", 
    header: "ScriptInstance.h".}
proc addEventHandler*(this: var ScriptInstance; sender: ptr UrObject; 
                      eventType: StringHash; handlerName: UrString) {.
    importcpp: "AddEventHandler", header: "ScriptInstance.h".}
proc removeEventHandler*(this: var ScriptInstance; eventType: StringHash) {.
    importcpp: "RemoveEventHandler", header: "ScriptInstance.h".}
proc removeEventHandler*(this: var ScriptInstance; sender: ptr UrObject; 
                         eventType: StringHash) {.
    importcpp: "RemoveEventHandler", header: "ScriptInstance.h".}
proc removeEventHandlers*(this: var ScriptInstance; sender: ptr UrObject) {.
    importcpp: "RemoveEventHandlers", header: "ScriptInstance.h".}
proc removeEventHandlers*(this: var ScriptInstance) {.
    importcpp: "RemoveEventHandlers", header: "ScriptInstance.h".}
proc removeEventHandlersExcept*(this: var ScriptInstance; 
                                exceptions: PODVector[StringHash]) {.
    importcpp: "RemoveEventHandlersExcept", header: "ScriptInstance.h".}
proc createObject*(this: var ScriptInstance; scriptFile: ptr ScriptFile; 
                   className: UrString): bool {.importcpp: "CreateObject", 
    header: "ScriptInstance.h".}
proc setScriptFile*(this: var ScriptInstance; scriptFile: ptr ScriptFile) {.
    importcpp: "SetScriptFile", header: "ScriptInstance.h".}
proc setClassName*(this: var ScriptInstance; className: UrString) {.
    importcpp: "SetClassName", header: "ScriptInstance.h".}
proc execute*(this: var ScriptInstance; declaration: UrString; 
              parameters: VariantVector = variant.emptyVariantVector): bool {.
    importcpp: "Execute", header: "ScriptInstance.h".}
proc execute*(this: var ScriptInstance; `method`: ptr AsIScriptFunction; 
              parameters: VariantVector = variant.emptyVariantVector): bool {.
    importcpp: "Execute", header: "ScriptInstance.h".}
proc delayedExecute*(this: var ScriptInstance; delay: cfloat; repeat: bool; 
                     declaration: UrString; 
                     parameters: VariantVector = variant.emptyVariantVector) {.
    importcpp: "DelayedExecute", header: "ScriptInstance.h".}
proc clearDelayedExecute*(this: var ScriptInstance; 
                          declaration: UrString = UrString.empty) {.
    importcpp: "ClearDelayedExecute", header: "ScriptInstance.h".}
proc getScriptFile*(this: ScriptInstance): ptr ScriptFile {.noSideEffect, 
    importcpp: "GetScriptFile", header: "ScriptInstance.h".}
proc getScriptObject*(this: ScriptInstance): ptr AsIScriptObject {.noSideEffect, 
    importcpp: "GetScriptObject", header: "ScriptInstance.h".}
proc getClassName*(this: ScriptInstance): UrString {.noSideEffect, 
    importcpp: "GetClassName", header: "ScriptInstance.h".}
proc setScriptFileAttr*(this: var ScriptInstance; value: ResourceRef) {.
    importcpp: "SetScriptFileAttr", header: "ScriptInstance.h".}
proc setDelayedCallsAttr*(this: var ScriptInstance; value: PODVector[cuchar]) {.
    importcpp: "SetDelayedCallsAttr", header: "ScriptInstance.h".}
proc setFixedUpdateAccAttr*(this: var ScriptInstance; value: cfloat) {.
    importcpp: "SetFixedUpdateAccAttr", header: "ScriptInstance.h".}
proc setScriptDataAttr*(this: var ScriptInstance; data: PODVector[cuchar]) {.
    importcpp: "SetScriptDataAttr", header: "ScriptInstance.h".}
proc setScriptNetworkDataAttr*(this: var ScriptInstance; data: PODVector[cuchar]) {.
    importcpp: "SetScriptNetworkDataAttr", header: "ScriptInstance.h".}
proc getScriptFileAttr*(this: ScriptInstance): ResourceRef {.noSideEffect, 
    importcpp: "GetScriptFileAttr", header: "ScriptInstance.h".}
proc getDelayedCallsAttr*(this: ScriptInstance): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetDelayedCallsAttr", header: "ScriptInstance.h".}
proc getFixedUpdateAccAttr*(this: ScriptInstance): cfloat {.noSideEffect, 
    importcpp: "GetFixedUpdateAccAttr", header: "ScriptInstance.h".}
proc getScriptDataAttr*(this: ScriptInstance): PODVector[cuchar] {.noSideEffect, 
    importcpp: "GetScriptDataAttr", header: "ScriptInstance.h".}
proc getScriptNetworkDataAttr*(this: ScriptInstance): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetScriptNetworkDataAttr", 
    header: "ScriptInstance.h".}

proc getScriptContext*(): ptr Context {.importcpp: "Urho3D::GetScriptContext(@)", 
                                        header: "ScriptInstance.h".}

proc getScriptContextInstance*(): ptr ScriptInstance {.
    importcpp: "Urho3D::GetScriptContextInstance(@)", header: "ScriptInstance.h".}

proc getScriptContextNode*(): ptr Node {.
    importcpp: "Urho3D::GetScriptContextNode(@)", header: "ScriptInstance.h".}

proc getScriptContextScene*(): ptr Scene {.
    importcpp: "Urho3D::GetScriptContextScene(@)", header: "ScriptInstance.h".}

proc getScriptContextEventListener*(): ptr ScriptEventListener {.
    importcpp: "Urho3D::GetScriptContextEventListener(@)", 
    header: "ScriptInstance.h".}

proc getScriptContextEventListenerObject*(): ptr UrObject {.
    importcpp: "Urho3D::GetScriptContextEventListenerObject(@)", 
    header: "ScriptInstance.h".}