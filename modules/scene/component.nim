

import 
  animatable, stringhash, urstr, variant, matrix4, vector3, quaternion, vector,
  ptrs, connection, vectorbuffer, xmlelement, hashset, hashmap, packagefile,
  mutex, urobject, serializer

discard "forward decl of DebugRenderer"
discard "forward decl of Scene"
discard "forward decl of ComponentReplicationState"

type 
  CreateMode* {.importcpp: "Urho3D::CreateMode".} = enum 
    REPLICATED = 0, LOCAL = 1
  TransformSpace* {.importcpp: "Urho3D::TransformSpace".} = enum 
    TS_LOCAL = 0, TS_PARENT, TS_WORLD

  Node* {.importcpp: "Urho3D::Node", header: "Node.h".} = object of Animatable
    networkUpdate* {.importc: "networkUpdate_".}: bool
    vars* {.importc: "vars_".}: VariantMap
    worldTransform* {.importc: "worldTransform_".}: Matrix3x4
    dirty* {.importc: "dirty_".}: bool
    enabled* {.importc: "enabled_".}: bool
    enabledPrev* {.importc: "enabledPrev_".}: bool
    parent* {.importc: "parent_".}: ptr Node
    scene* {.importc: "scene_".}: ptr Scene
    id* {.importc: "id_".}: cuint
    position* {.importc: "position_".}: Vector3
    rotation* {.importc: "rotation_".}: Quaternion
    scale* {.importc: "scale_".}: Vector3
    worldRotation* {.importc: "worldRotation_".}: Quaternion
    components* {.importc: "components_".}: Vector[SharedPtr[Component]]
    children* {.importc: "children_".}: Vector[SharedPtr[Node]]
    listeners* {.importc: "listeners_".}: Vector[WeakPtr[Component]]
    dependencyNodes* {.importc: "dependencyNodes_".}: PODVector[ptr Node]
    owner* {.importc: "owner_".}: ptr Connection
    name* {.importc: "name_".}: UrString
    nameHash* {.importc: "nameHash_".}: StringHash
    attrBuffer* {.importc: "attrBuffer_".}: VectorBuffer

  Component* {.importcpp: "Urho3D::Component", header: "Component.h".} = object of Animatable
    #node* {.importc: "node_".}: ptr Node # is protected!
    id* {.importc: "id_".}: cuint
    networkUpdate* {.importc: "networkUpdate_".}: bool
    enabled* {.importc: "enabled_".}: bool

  LoadMode* {.importcpp: "Urho3D::LoadMode".} = enum 
    LOAD_RESOURCES_ONLY = 0, LOAD_SCENE, LOAD_SCENE_AND_RESOURCES

  AsyncProgress* {.importcpp: "Urho3D::AsyncProgress", header: "Scene.h".} = object 
    file* {.importc: "file_".}: SharedPtr[File]
    xmlFile* {.importc: "xmlFile_".}: SharedPtr[XMLFile]
    xmlElement* {.importc: "xmlElement_".}: XMLElement
    mode* {.importc: "mode_".}: LoadMode
    resources* {.importc: "resources_".}: HashSet[StringHash]
    loadedResources* {.importc: "loadedResources_".}: cuint
    totalResources* {.importc: "totalResources_".}: cuint
    loadedNodes* {.importc: "loadedNodes_".}: cuint
    totalNodes* {.importc: "totalNodes_".}: cuint

  Scene* {.importcpp: "Urho3D::Scene", header: "Scene.h".} = object of Node
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

  SceneResolver* {.importcpp: "Urho3D::SceneResolver", header: "SceneResolver.h".} = object 
    nodes* {.importc: "nodes_".}: HashMap[cuint, WeakPtr[Node]]
    components* {.importc: "components_".}: HashMap[cuint, WeakPtr[Component]]

proc getType*(this: Component): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Component.h".}
proc getBaseType*(this: Component): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Component.h".}
proc getTypeName*(this: Component): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Component.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Component::GetTypeStatic(@)", header: "Component.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Component::GetTypeNameStatic(@)", header: "Component.h".}
proc getBaseTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Component::GetBaseTypeStatic(@)", header: "Component.h".}
proc constructComponent*(context: ptr Context): Component {.
    importcpp: "Urho3D::Component(@)", header: "Component.h".}
proc destroyComponent*(this: var Component) {.importcpp: "#.~Component()", 
    header: "Component.h".}
proc onSetEnabled*(this: var Component) {.importcpp: "OnSetEnabled", 
    header: "Component.h".}
proc save*(this: Component; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Component.h".}
proc saveXML*(this: Component; dest: var XMLElement): bool {.noSideEffect, 
    importcpp: "SaveXML", header: "Component.h".}
proc markNetworkUpdate*(this: var Component) {.importcpp: "MarkNetworkUpdate", 
    header: "Component.h".}
proc getDependencyNodes*(this: var Component; dest: var PODVector[ptr Node]) {.
    importcpp: "GetDependencyNodes", header: "Component.h".}

proc setEnabled*(this: var Component; enable: bool) {.importcpp: "SetEnabled", 
    header: "Component.h".}
proc remove*(this: var Component) {.importcpp: "Remove", header: "Component.h".}
proc getID*(this: Component): cuint {.noSideEffect, importcpp: "GetID", 
                                      header: "Component.h".}
proc getNode*(this: Component): ptr Node {.noSideEffect, importcpp: "GetNode", 
    header: "Component.h".}
proc getScene*(this: Component): ptr Scene {.noSideEffect, 
    importcpp: "GetScene", header: "Component.h".}
proc isEnabled*(this: Component): bool {.noSideEffect, importcpp: "IsEnabled", 
    header: "Component.h".}
proc isEnabledEffective*(this: Component): bool {.noSideEffect, 
    importcpp: "IsEnabledEffective", header: "Component.h".}
proc getComponent*(this: Component; `type`: StringHash): ptr Component {.
    noSideEffect, importcpp: "GetComponent", header: "Component.h".}
proc getComponents*(this: Component; dest: var PODVector[ptr Component]; 
                    `type`: StringHash) {.noSideEffect, 
    importcpp: "GetComponents", header: "Component.h".}
proc getComponentFromComponent*[T](this: Component): ptr T {.noSideEffect, 
    importcpp: "#.GetComponent<'*0>(@)", header: "Component.h".}
proc getComponents*[T](this: Component; dest: var PODVector[ptr T]) {.
    noSideEffect, importcpp: "GetComponents", header: "Component.h".}
proc addReplicationState*(this: var Component; 
                          state: ptr ComponentReplicationState) {.
    importcpp: "AddReplicationState", header: "Component.h".}
proc prepareNetworkUpdate*(this: var Component) {.
    importcpp: "PrepareNetworkUpdate", header: "Component.h".}
proc cleanupConnection*(this: var Component; connection: ptr Connection) {.
    importcpp: "CleanupConnection", header: "Component.h".}
proc getComponent*[T](): ptr T {.
    importcpp: "Component::GetComponent<'*0>(@)", header: "Component.h".}
proc getComponents*[T](dest: var PODVector[ptr T]) {.
    importcpp: "Component::GetComponents(@)", header: "Component.h".}
