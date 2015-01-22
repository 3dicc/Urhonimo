

import 
  hashSet except Node

import
  mutex, node, sceneResolver, xMLElement, component, stringHash, urstr,
  urobject, deserializer, serializer, connection, vector3, quaternion,
  packagefile, vector, ptrs

discard "forward decl of File"
discard "forward decl of PackageFile"
var FIRST_REPLICATED_ID* {.importc: "FIRST_REPLICATED_ID", header: "Scene.h".}: cuint #= 0x00000001
var LAST_REPLICATED_ID* {.importc: "LAST_REPLICATED_ID", header: "Scene.h".}: cuint #= 0x00FFFFFF
var FIRST_LOCAL_ID* {.importc: "FIRST_LOCAL_ID", header: "Scene.h".}: cuint #= 0x01000000
var LAST_LOCAL_ID* {.importc: "LAST_LOCAL_ID", header: "Scene.h".}: cuint #= 0xFFFFFFFF


proc getType*(this: Scene): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Scene.h".}
proc getBaseType*(this: Scene): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Scene.h".}
proc getTypeName*(this: Scene): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Scene.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Scene::GetTypeStatic(@)", header: "Scene.h".}
proc getTypeNameStatic*(): UrString {.
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
                mode: LoadMode = Load_Scene_And_Resources): bool {.
    importcpp: "LoadAsync", header: "Scene.h".}
proc loadAsyncXML*(this: var Scene; file: ptr File; 
                   mode: LoadMode = Load_Scene_And_Resources): bool {.
    importcpp: "LoadAsyncXML", header: "Scene.h".}
proc stopAsyncLoading*(this: var Scene) {.importcpp: "StopAsyncLoading", 
    header: "Scene.h".}
proc instantiate*(this: var Scene; source: var Deserializer; position: Vector3; 
                  rotation: Quaternion; mode: CreateMode = Replicated): ptr Node {.
    importcpp: "Instantiate", header: "Scene.h".}
proc instantiateXML*(this: var Scene; source: XMLElement; position: Vector3; 
                     rotation: Quaternion; mode: CreateMode = Replicated): ptr Node {.
    importcpp: "InstantiateXML", header: "Scene.h".}
proc instantiateXML*(this: var Scene; source: var Deserializer; 
                     position: Vector3; rotation: Quaternion; 
                     mode: CreateMode = Replicated): ptr Node {.
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