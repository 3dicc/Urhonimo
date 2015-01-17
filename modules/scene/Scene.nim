

import 
  hashSet, mutex, node, sceneResolver, xMLElement

discard "forward decl of File"
discard "forward decl of PackageFile"
var FIRST_REPLICATED_ID* {.importc: "FIRST_REPLICATED_ID", header: "Scene.h".}: cuint = 0x00000001

var LAST_REPLICATED_ID* {.importc: "LAST_REPLICATED_ID", header: "Scene.h".}: cuint = 0x00FFFFFF

var FIRST_LOCAL_ID* {.importc: "FIRST_LOCAL_ID", header: "Scene.h".}: cuint = 0x01000000

var LAST_LOCAL_ID* {.importc: "LAST_LOCAL_ID", header: "Scene.h".}: cuint = 0xFFFFFFFF


type 
  LoadMode* {.importcpp: "Urho3D::LoadMode".} = enum 
    LOAD_RESOURCES_ONLY = 0, LOAD_SCENE, LOAD_SCENE_AND_RESOURCES



type 
  AsyncProgress* {.importc: "Urho3D::AsyncProgress", header: "Scene.h".} = object 
    file* {.importc: "file_".}: SharedPtr[File]
    xmlFile* {.importc: "xmlFile_".}: SharedPtr[XMLFile]
    xmlElement* {.importc: "xmlElement_".}: XMLElement
    mode* {.importc: "mode_".}: LoadMode
    resources* {.importc: "resources_".}: HashSet[StringHash]
    loadedResources* {.importc: "loadedResources_".}: cuint
    totalResources* {.importc: "totalResources_".}: cuint
    loadedNodes* {.importc: "loadedNodes_".}: cuint
    totalNodes* {.importc: "totalNodes_".}: cuint



type 
  Scene* {.importc: "Urho3D::Scene", header: "Scene.h".} = object of Node
    replicatedNodes* {.importc: "replicatedNodes_".}: HashMap[cuint, ptr Node]
    localNodes* {.importc: "localNodes_".}: HashMap[cuint, ptr Node]
    replicatedComponents* {.importc: "replicatedComponents_".}: HashMap[cuint, 
        ptr Component]
    localComponents* {.importc: "localComponents_".}: HashMap[cuint, 
        ptr Component]
    asyncProgress* {.importc: "asyncProgress_".}: AsyncProgress
    resolver* {.importc: "resolver_".}: SceneResolver
    fileName* {.importc: "fileName_".}: UrString
    requiredPackageFiles* {.importc: "requiredPackageFiles_".}: Vector[
        SharedPtr[PackageFile]]
    varNames* {.importc: "varNames_".}: HashMap[StringHash, UrString]
    networkUpdateNodes* {.importc: "networkUpdateNodes_".}: HashSet[cuint]
    networkUpdateComponents* {.importc: "networkUpdateComponents_".}: HashSet[
        cuint]
    delayedDirtyComponents* {.importc: "delayedDirtyComponents_".}: PODVector[
        ptr Component]
    sceneMutex* {.importc: "sceneMutex_".}: Mutex
    smoothingData* {.importc: "smoothingData_".}: VariantMap
    replicatedNodeID* {.importc: "replicatedNodeID_".}: cuint
    replicatedComponentID* {.importc: "replicatedComponentID_".}: cuint
    localNodeID* {.importc: "localNodeID_".}: cuint
    localComponentID* {.importc: "localComponentID_".}: cuint
    checksum* {.importc: "checksum_".}: cuint
    asyncLoadingMs* {.importc: "asyncLoadingMs_".}: cint
    timeScale* {.importc: "timeScale_".}: cfloat
    elapsedTime* {.importc: "elapsedTime_".}: cfloat
    smoothingConstant* {.importc: "smoothingConstant_".}: cfloat
    snapThreshold* {.importc: "snapThreshold_".}: cfloat
    updateEnabled* {.importc: "updateEnabled_".}: bool
    asyncLoading* {.importc: "asyncLoading_".}: bool
    threadedUpdate* {.importc: "threadedUpdate_".}: bool


proc getType*(this: Scene): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Scene.h".}
proc getBaseType*(this: Scene): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Scene.h".}
proc getTypeName*(this: Scene): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Scene.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Scene::GetTypeStatic(@)", header: "Scene.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Scene::GetTypeNameStatic(@)", header: "Scene.h".}
proc constructScene*(context: ptr Context): Scene {.
    importcpp: "Urho3D::Scene(@)", header: "Scene.h".}
proc destroyScene*(this: var Scene) {.importcpp: "#.~Scene()", header: "Scene.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Scene::RegisterObject(@)", header: "Scene.h".}
proc load*(this: var Scene; source: var Deserializer; 
           setInstanceDefault: bool = false): bool {.importcpp: "Load", 
    header: "Scene.h".}
proc save*(this: Scene; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Scene.h".}
proc loadXML*(this: var Scene; source: XMLElement; 
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML", 
    header: "Scene.h".}
proc markNetworkUpdate*(this: var Scene) {.importcpp: "MarkNetworkUpdate", 
    header: "Scene.h".}
proc addReplicationState*(this: var Scene; state: ptr NodeReplicationState) {.
    importcpp: "AddReplicationState", header: "Scene.h".}
proc loadXML*(this: var Scene; source: var Deserializer): bool {.
    importcpp: "LoadXML", header: "Scene.h".}
proc saveXML*(this: Scene; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "SaveXML", header: "Scene.h".}
proc loadAsync*(this: var Scene; file: ptr File; 
                mode: LoadMode = load_Scene_And_Resources): bool {.
    importcpp: "LoadAsync", header: "Scene.h".}
proc loadAsyncXML*(this: var Scene; file: ptr File; 
                   mode: LoadMode = load_Scene_And_Resources): bool {.
    importcpp: "LoadAsyncXML", header: "Scene.h".}
proc stopAsyncLoading*(this: var Scene) {.importcpp: "StopAsyncLoading", 
    header: "Scene.h".}
proc instantiate*(this: var Scene; source: var Deserializer; position: Vector3; 
                  rotation: Quaternion; mode: CreateMode = replicated): ptr Node {.
    importcpp: "Instantiate", header: "Scene.h".}
proc instantiateXML*(this: var Scene; source: XMLElement; position: Vector3; 
                     rotation: Quaternion; mode: CreateMode = replicated): ptr Node {.
    importcpp: "InstantiateXML", header: "Scene.h".}
proc instantiateXML*(this: var Scene; source: var Deserializer; 
                     position: Vector3; rotation: Quaternion; 
                     mode: CreateMode = replicated): ptr Node {.
    importcpp: "InstantiateXML", header: "Scene.h".}
proc clear*(this: var Scene; clearReplicated: bool = true; 
            clearLocal: bool = true) {.importcpp: "Clear", header: "Scene.h".}
proc setUpdateEnabled*(this: var Scene; enable: bool) {.
    importcpp: "SetUpdateEnabled", header: "Scene.h".}
proc setTimeScale*(this: var Scene; scale: cfloat) {.importcpp: "SetTimeScale", 
    header: "Scene.h".}
proc setElapsedTime*(this: var Scene; time: cfloat) {.
    importcpp: "SetElapsedTime", header: "Scene.h".}
proc setSmoothingConstant*(this: var Scene; constant: cfloat) {.
    importcpp: "SetSmoothingConstant", header: "Scene.h".}
proc setSnapThreshold*(this: var Scene; threshold: cfloat) {.
    importcpp: "SetSnapThreshold", header: "Scene.h".}
proc setAsyncLoadingMs*(this: var Scene; ms: cint) {.
    importcpp: "SetAsyncLoadingMs", header: "Scene.h".}
proc addRequiredPackageFile*(this: var Scene; package: ptr PackageFile) {.
    importcpp: "AddRequiredPackageFile", header: "Scene.h".}
proc clearRequiredPackageFiles*(this: var Scene) {.
    importcpp: "ClearRequiredPackageFiles", header: "Scene.h".}
proc registerVar*(this: var Scene; name: UrString) {.importcpp: "RegisterVar", 
    header: "Scene.h".}
proc unregisterVar*(this: var Scene; name: UrString) {.
    importcpp: "UnregisterVar", header: "Scene.h".}
proc unregisterAllVars*(this: var Scene) {.importcpp: "UnregisterAllVars", 
    header: "Scene.h".}
proc getNode*(this: Scene; id: cuint): ptr Node {.noSideEffect, 
    importcpp: "GetNode", header: "Scene.h".}
proc getComponent*(this: Scene; id: cuint): ptr Component {.noSideEffect, 
    importcpp: "GetComponent", header: "Scene.h".}
proc isUpdateEnabled*(this: Scene): bool {.noSideEffect, 
    importcpp: "IsUpdateEnabled", header: "Scene.h".}
proc isAsyncLoading*(this: Scene): bool {.noSideEffect, 
    importcpp: "IsAsyncLoading", header: "Scene.h".}
proc getAsyncProgress*(this: Scene): cfloat {.noSideEffect, 
    importcpp: "GetAsyncProgress", header: "Scene.h".}
proc getAsyncLoadMode*(this: Scene): LoadMode {.noSideEffect, 
    importcpp: "GetAsyncLoadMode", header: "Scene.h".}
proc getFileName*(this: Scene): UrString {.noSideEffect, 
    importcpp: "GetFileName", header: "Scene.h".}
proc getChecksum*(this: Scene): cuint {.noSideEffect, importcpp: "GetChecksum", 
                                        header: "Scene.h".}
proc getTimeScale*(this: Scene): cfloat {.noSideEffect, 
    importcpp: "GetTimeScale", header: "Scene.h".}
proc getElapsedTime*(this: Scene): cfloat {.noSideEffect, 
    importcpp: "GetElapsedTime", header: "Scene.h".}
proc getSmoothingConstant*(this: Scene): cfloat {.noSideEffect, 
    importcpp: "GetSmoothingConstant", header: "Scene.h".}
proc getSnapThreshold*(this: Scene): cfloat {.noSideEffect, 
    importcpp: "GetSnapThreshold", header: "Scene.h".}
proc getAsyncLoadingMs*(this: Scene): cint {.noSideEffect, 
    importcpp: "GetAsyncLoadingMs", header: "Scene.h".}
proc getRequiredPackageFiles*(this: Scene): Vector[SharedPtr[PackageFile]] {.
    noSideEffect, importcpp: "GetRequiredPackageFiles", header: "Scene.h".}
proc getVarName*(this: Scene; hash: StringHash): UrString {.noSideEffect, 
    importcpp: "GetVarName", header: "Scene.h".}
proc update*(this: var Scene; timeStep: cfloat) {.importcpp: "Update", 
    header: "Scene.h".}
proc beginThreadedUpdate*(this: var Scene) {.importcpp: "BeginThreadedUpdate", 
    header: "Scene.h".}
proc endThreadedUpdate*(this: var Scene) {.importcpp: "EndThreadedUpdate", 
    header: "Scene.h".}
proc delayedMarkedDirty*(this: var Scene; component: ptr Component) {.
    importcpp: "DelayedMarkedDirty", header: "Scene.h".}
proc isThreadedUpdate*(this: Scene): bool {.noSideEffect, 
    importcpp: "IsThreadedUpdate", header: "Scene.h".}
proc getFreeNodeID*(this: var Scene; mode: CreateMode): cuint {.
    importcpp: "GetFreeNodeID", header: "Scene.h".}
proc getFreeComponentID*(this: var Scene; mode: CreateMode): cuint {.
    importcpp: "GetFreeComponentID", header: "Scene.h".}
proc nodeAdded*(this: var Scene; node: ptr Node) {.importcpp: "NodeAdded", 
    header: "Scene.h".}
proc nodeRemoved*(this: var Scene; node: ptr Node) {.importcpp: "NodeRemoved", 
    header: "Scene.h".}
proc componentAdded*(this: var Scene; component: ptr Component) {.
    importcpp: "ComponentAdded", header: "Scene.h".}
proc componentRemoved*(this: var Scene; component: ptr Component) {.
    importcpp: "ComponentRemoved", header: "Scene.h".}
proc setVarNamesAttr*(this: var Scene; value: UrString) {.
    importcpp: "SetVarNamesAttr", header: "Scene.h".}
proc getVarNamesAttr*(this: Scene): UrString {.noSideEffect, 
    importcpp: "GetVarNamesAttr", header: "Scene.h".}
proc prepareNetworkUpdate*(this: var Scene) {.importcpp: "PrepareNetworkUpdate", 
    header: "Scene.h".}
proc cleanupConnection*(this: var Scene; connection: ptr Connection) {.
    importcpp: "CleanupConnection", header: "Scene.h".}
proc markNetworkUpdate*(this: var Scene; node: ptr Node) {.
    importcpp: "MarkNetworkUpdate", header: "Scene.h".}
proc markNetworkUpdate*(this: var Scene; component: ptr Component) {.
    importcpp: "MarkNetworkUpdate", header: "Scene.h".}
proc markReplicationDirty*(this: var Scene; node: ptr Node) {.
    importcpp: "MarkReplicationDirty", header: "Scene.h".}

proc registerSceneLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterSceneLibrary(@)", header: "Scene.h".}