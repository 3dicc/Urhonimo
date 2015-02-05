

import 
  arrayPtr, hashSet, resource, scriptEventListener

discard "forward decl of asIObjectType"
discard "forward decl of asIScriptContext"
discard "forward decl of asIScriptEngine"
discard "forward decl of asIScriptFunction"
discard "forward decl of asIScriptModule"
discard "forward decl of asIScriptObject"
discard "forward decl of Script"
discard "forward decl of ScriptEventInvoker"
discard "forward decl of ScriptInstance"
discard "forward decl of Variant"
type 
  ScriptFile* {.importc: "Urho3D::ScriptFile", header: "ScriptFile.h".} = object of Resource
    script* {.importc: "script_".}: SharedPtr[Script]
    scriptModule* {.importc: "scriptModule_".}: ptr AsIScriptModule
    compiled* {.importc: "compiled_".}: bool
    subscribed* {.importc: "subscribed_".}: bool
    includeFiles* {.importc: "includeFiles_".}: HashSet[UrString]
    validClasses* {.importc: "validClasses_".}: HashMap[ptr AsIObjectType, bool]
    functions* {.importc: "functions_".}: HashMap[UrString, 
        ptr AsIScriptFunction]
    methods* {.importc: "methods_".}: HashMap[ptr AsIObjectType, 
        HashMap[UrString, ptr AsIScriptFunction]]
    delayedCalls* {.importc: "delayedCalls_".}: Vector[DelayedCall]
    eventInvokers* {.importc: "eventInvokers_".}: HashMap[ptr AsIScriptObject, 
        SharedPtr[ScriptEventInvoker]]
    loadByteCode* {.importc: "loadByteCode_".}: SharedArrayPtr[cuchar]
    loadByteCodeSize* {.importc: "loadByteCodeSize_".}: cuint


proc getType*(this: ScriptFile): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ScriptFile.h".}
proc getBaseType*(this: ScriptFile): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ScriptFile.h".}
proc getTypeName*(this: ScriptFile): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ScriptFile.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ScriptFile::GetTypeStatic(@)", header: "ScriptFile.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ScriptFile::GetTypeNameStatic(@)", 
    header: "ScriptFile.h".}
proc constructScriptFile*(context: ptr Context): ScriptFile {.
    importcpp: "Urho3D::ScriptFile(@)", header: "ScriptFile.h".}
proc destroyScriptFile*(this: var ScriptFile) {.importcpp: "#.~ScriptFile()", 
    header: "ScriptFile.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ScriptFile::RegisterObject(@)", header: "ScriptFile.h".}
proc beginLoad*(this: var ScriptFile; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "ScriptFile.h".}
proc endLoad*(this: var ScriptFile): bool {.importcpp: "EndLoad", 
    header: "ScriptFile.h".}
proc addEventHandler*(this: var ScriptFile; eventType: StringHash; 
                      handlerName: UrString) {.importcpp: "AddEventHandler", 
    header: "ScriptFile.h".}
proc addEventHandler*(this: var ScriptFile; sender: ptr UrObject; 
                      eventType: StringHash; handlerName: UrString) {.
    importcpp: "AddEventHandler", header: "ScriptFile.h".}
proc removeEventHandler*(this: var ScriptFile; eventType: StringHash) {.
    importcpp: "RemoveEventHandler", header: "ScriptFile.h".}
proc removeEventHandler*(this: var ScriptFile; sender: ptr UrObject; 
                         eventType: StringHash) {.
    importcpp: "RemoveEventHandler", header: "ScriptFile.h".}
proc removeEventHandlers*(this: var ScriptFile; sender: ptr UrObject) {.
    importcpp: "RemoveEventHandlers", header: "ScriptFile.h".}
proc removeEventHandlers*(this: var ScriptFile) {.
    importcpp: "RemoveEventHandlers", header: "ScriptFile.h".}
proc removeEventHandlersExcept*(this: var ScriptFile; 
                                exceptions: PODVector[StringHash]) {.
    importcpp: "RemoveEventHandlersExcept", header: "ScriptFile.h".}
proc execute*(this: var ScriptFile; declaration: UrString; 
              parameters: VariantVector = variant.emptyVariantVector; 
              unprepare: bool = true): bool {.importcpp: "Execute", 
    header: "ScriptFile.h".}
proc execute*(this: var ScriptFile; function: ptr AsIScriptFunction; 
              parameters: VariantVector = variant.emptyVariantVector; 
              unprepare: bool = true): bool {.importcpp: "Execute", 
    header: "ScriptFile.h".}
proc execute*(this: var ScriptFile; `object`: ptr AsIScriptObject; 
              declaration: UrString; 
              parameters: VariantVector = variant.emptyVariantVector; 
              unprepare: bool = true): bool {.importcpp: "Execute", 
    header: "ScriptFile.h".}
proc execute*(this: var ScriptFile; `object`: ptr AsIScriptObject; 
              `method`: ptr AsIScriptFunction; 
              parameters: VariantVector = variant.emptyVariantVector; 
              unprepare: bool = true): bool {.importcpp: "Execute", 
    header: "ScriptFile.h".}
proc delayedExecute*(this: var ScriptFile; delay: cfloat; repeat: bool; 
                     declaration: UrString; 
                     parameters: VariantVector = variant.emptyVariantVector) {.
    importcpp: "DelayedExecute", header: "ScriptFile.h".}
proc clearDelayedExecute*(this: var ScriptFile; 
                          declaration: UrString = UrString.empty) {.
    importcpp: "ClearDelayedExecute", header: "ScriptFile.h".}
proc createObject*(this: var ScriptFile; className: UrString; 
                   useInterface: bool = false): ptr AsIScriptObject {.
    importcpp: "CreateObject", header: "ScriptFile.h".}
proc saveByteCode*(this: var ScriptFile; dest: var Serializer): bool {.
    importcpp: "SaveByteCode", header: "ScriptFile.h".}
proc getScriptModule*(this: ScriptFile): ptr AsIScriptModule {.noSideEffect, 
    importcpp: "GetScriptModule", header: "ScriptFile.h".}
proc getFunction*(this: var ScriptFile; declaration: UrString): ptr AsIScriptFunction {.
    importcpp: "GetFunction", header: "ScriptFile.h".}
proc getMethod*(this: var ScriptFile; `object`: ptr AsIScriptObject; 
                declaration: UrString): ptr AsIScriptFunction {.
    importcpp: "GetMethod", header: "ScriptFile.h".}
proc isCompiled*(this: ScriptFile): bool {.noSideEffect, 
    importcpp: "IsCompiled", header: "ScriptFile.h".}
proc cleanupEventInvoker*(this: var ScriptFile; `object`: ptr AsIScriptObject) {.
    importcpp: "CleanupEventInvoker", header: "ScriptFile.h".}

type 
  ScriptEventInvoker* {.importc: "Urho3D::ScriptEventInvoker", 
                        header: "ScriptFile.h".} = object of UrObject
    file* {.importc: "file_".}: ptr ScriptFile
    sharedBool* {.importc: "sharedBool_".}: ptr AsILockableSharedBool
    `object`* {.importc: "object_".}: ptr AsIScriptObject


proc getType*(this: ScriptEventInvoker): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ScriptFile.h".}
proc getBaseType*(this: ScriptEventInvoker): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ScriptFile.h".}
proc getTypeName*(this: ScriptEventInvoker): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ScriptFile.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ScriptEventInvoker::GetTypeStatic(@)", 
    header: "ScriptFile.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ScriptEventInvoker::GetTypeNameStatic(@)", 
    header: "ScriptFile.h".}
proc constructScriptEventInvoker*(file: ptr ScriptFile; 
                                  `object`: ptr AsIScriptObject = 0): ScriptEventInvoker {.
    importcpp: "Urho3D::ScriptEventInvoker(@)", header: "ScriptFile.h".}
proc destroyScriptEventInvoker*(this: var ScriptEventInvoker) {.
    importcpp: "#.~ScriptEventInvoker()", header: "ScriptFile.h".}
proc getObject*(this: ScriptEventInvoker): ptr AsIScriptObject {.noSideEffect, 
    importcpp: "GetObject", header: "ScriptFile.h".}
proc isObjectAlive*(this: ScriptEventInvoker): bool {.noSideEffect, 
    importcpp: "IsObjectAlive", header: "ScriptFile.h".}
proc handleScriptEvent*(this: var ScriptEventInvoker; eventType: StringHash; 
                        eventData: var VariantMap) {.
    importcpp: "HandleScriptEvent", header: "ScriptFile.h".}

proc getScriptContextFile*(): ptr ScriptFile {.
    importcpp: "Urho3D::GetScriptContextFile(@)", header: "ScriptFile.h".}