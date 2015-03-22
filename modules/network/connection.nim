

import
  controls, hashSet, UrObject, timer, vectorBuffer, vector, attribute, variant,
  ptrs, animatable, stringHash, hashmap, urstr, vector3, quaternion,
  memorybuffer, packagefile

discard "forward decl of File"
discard "forward decl of MemoryBuffer"
discard "forward decl of Node"
discard "forward decl of Scene"
discard "forward decl of Serializable"
discard "forward decl of PackageFile"

const MAX_NETWORK_ATTRIBUTES = 64

#var MAX_NETWORK_ATTRIBUTES* {.importc: "MAX_NETWORK_ATTRIBUTES",
#                              header: "ReplicationState.h".}: cuint #= 64

discard "forward decl of Component"
discard "forward decl of Connection"
discard "forward decl of Node"
discard "forward decl of Scene"
discard "forward decl of ReplicationState"
discard "forward decl of ComponentReplicationState"
discard "forward decl of NodeReplicationState"
discard "forward decl of SceneReplicationState"
type
  DirtyBits* {.importcpp: "Urho3D::DirtyBits", header: "ReplicationState.h".} = object
    data* {.importc: "data_".}: array[MAX_NETWORK_ATTRIBUTES div 8, cuchar]
    count* {.importc: "count_".}: cuchar

type
  NetworkState* {.importcpp: "Urho3D::NetworkState", header: "ReplicationState.h".} = object
    attributes* {.importc: "attributes_".}: ptr Vector[AttributeInfo]
    currentValues* {.importc: "currentValues_".}: Vector[Variant]
    previousValues* {.importc: "previousValues_".}: Vector[Variant]
    replicationStates* {.importc: "replicationStates_".}: PODVector[
        ptr ReplicationState]
    previousVars* {.importc: "previousVars_".}: VariantMap

  ReplicationState* {.importcpp: "Urho3D::ReplicationState",
                      header: "ReplicationState.h", inheritable.} = object
    connection* {.importc: "connection_".}: ptr Connection

  ComponentReplicationState* {.importcpp: "Urho3D::ComponentReplicationState",
                               header: "ReplicationState.h".} = object of ReplicationState
    nodeState* {.importc: "nodeState_".}: ptr NodeReplicationState
    component* {.importc: "component_".}: WeakPtr[Animatable] # WeakPtr[Component]
    dirtyAttributes* {.importc: "dirtyAttributes_".}: DirtyBits

  NodeReplicationState* {.importcpp: "Urho3D::NodeReplicationState",
                          header: "ReplicationState.h".} = object of ReplicationState
    sceneState* {.importc: "sceneState_".}: ptr SceneReplicationState
    node* {.importc: "node_".}: WeakPtr[Animatable] # WeakPtr[Node]
    dirtyAttributes* {.importc: "dirtyAttributes_".}: DirtyBits
    dirtyVars* {.importc: "dirtyVars_".}: HashSet[StringHash]
    componentStates* {.importc: "componentStates_".}: HashMap[cuint,
        ComponentReplicationState]
    priorityAcc* {.importc: "priorityAcc_".}: cfloat
    markedDirty* {.importc: "markedDirty_".}: bool

  SceneReplicationState* {.importcpp: "Urho3D::SceneReplicationState",
                           header: "ReplicationState.h".} = object of ReplicationState
    nodeStates* {.importc: "nodeStates_".}: HashMap[cuint, NodeReplicationState]
    dirtyNodes* {.importc: "dirtyNodes_".}: HashSet[cuint]

  RemoteEvent* {.importcpp: "Urho3D::RemoteEvent", header: "Connection.h".} = object
    senderID* {.importc: "senderID_".}: cuint
    eventType* {.importc: "eventType_".}: StringHash
    eventData* {.importc: "eventData_".}: VariantMap
    inOrder* {.importc: "inOrder_".}: bool

  PackageDownload* {.importcpp: "Urho3D::PackageDownload", header: "Connection.h".} = object
    file* {.importc: "file_".}: SharedPtr[File]
    receivedFragments* {.importc: "receivedFragments_".}: HashSet[cuint]
    name* {.importc: "name_".}: UrString
    totalFragments* {.importc: "totalFragments_".}: cuint
    checksum* {.importc: "checksum_".}: cuint
    initiated* {.importc: "initiated_".}: bool

  ObserverPositionSendMode* {.importcpp: "Urho3D::ObserverPositionSendMode".} = enum
    OPSM_NONE = 0, OPSM_POSITION, OPSM_POSITION_ROTATION
  PackageUpload* {.importcpp: "Urho3D::PackageUpload", header: "Connection.h".} = object
    file* {.importc: "file_".}: SharedPtr[File]
    fragment* {.importc: "fragment_".}: cuint
    totalFragments* {.importc: "totalFragments_".}: cuint
  Connection* {.importcpp: "Urho3D::Connection", header: "Connection.h".} = object of UrObject
    controls* {.importc: "controls_".}: Controls
    identity* {.importc: "identity_".}: VariantMap
    connection* {.importc: "connection_".}: pointer #KNet.SharedPtr[KNet.MessageConnection]
    scene* {.importc: "scene_".}: WeakPtr[Animatable] # WeakPtr[Scene]
    sceneState* {.importc: "sceneState_".}: SceneReplicationState
    downloads* {.importc: "downloads_".}: HashMap[StringHash, PackageDownload]
    uploads* {.importc: "uploads_".}: HashMap[StringHash, PackageUpload]
    nodeLatestData* {.importc: "nodeLatestData_".}: HashMap[cuint,
        PODVector[cuchar]]
    componentLatestData* {.importc: "componentLatestData_".}: HashMap[cuint,
        PODVector[cuchar]]
    nodesToProcess* {.importc: "nodesToProcess_".}: HashSet[cuint]
    msg* {.importc: "msg_".}: VectorBuffer
    remoteEvents* {.importc: "remoteEvents_".}: Vector[RemoteEvent]
    sceneFileName* {.importc: "sceneFileName_".}: UrString
    statsTimer* {.importc: "statsTimer_".}: Timer
    address* {.importc: "address_".}: UrString
    port* {.importc: "port_".}: cushort
    position* {.importc: "position_".}: Vector3
    rotation* {.importc: "rotation_".}: Quaternion
    sendMode* {.importc: "sendMode_".}: ObserverPositionSendMode
    isClient* {.importc: "isClient_".}: bool
    connectPending* {.importc: "connectPending_".}: bool
    sceneLoaded* {.importc: "sceneLoaded_".}: bool
    logStatistics* {.importc: "logStatistics_".}: bool


proc constructPackageDownload*(): PackageDownload {.constructor,
    importcpp: "Urho3D::PackageDownload(@)", header: "Connection.h".}

proc constructPackageUpload*(): PackageUpload {.constructor,
    importcpp: "Urho3D::PackageUpload(@)", header: "Connection.h".}


proc getType*(this: Connection): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Connection.h".}
proc getBaseType*(this: Connection): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Connection.h".}
proc getTypeName*(this: Connection): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Connection.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Connection::GetTypeStatic(@)", header: "Connection.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Connection::GetTypeNameStatic(@)",
    header: "Connection.h".}
proc constructConnection*(context: ptr Context; isClient: bool;
                          connection: pointer
                          #KNet.SharedPtr[KNet.MessageConnection]
                          ): Connection {.constructor,
    importcpp: "Urho3D::Connection(@)", header: "Connection.h".}
proc destroyConnection*(this: var Connection) {.importcpp: "#.~Connection()",
    header: "Connection.h".}
proc sendMessage*(this: var Connection; msgID: cint; reliable: bool;
                  inOrder: bool; msg: VectorBuffer; contentID: cuint = 0) {.
    importcpp: "SendMessage", header: "Connection.h".}
proc sendMessage*(this: var Connection; msgID: cint; reliable: bool;
                  inOrder: bool; data: ptr cuchar; numBytes: cuint;
                  contentID: cuint = 0) {.importcpp: "SendMessage",
    header: "Connection.h".}
proc sendRemoteEvent*(this: var Connection; eventType: StringHash;
                      inOrder: bool;
                      eventData: VariantMap) {.
    importcpp: "SendRemoteEvent", header: "Connection.h".}
proc sendRemoteEvent*(this: var Connection; node: ptr Animatable; # Node;
                      eventType: StringHash; inOrder: bool;
                      eventData: VariantMap) {.
    importcpp: "SendRemoteEvent", header: "Connection.h".}
proc setScene*(this: var Connection; newScene: ptr Animatable) {.
    importcpp: "SetScene", header: "Connection.h".}
proc setIdentity*(this: var Connection; identity: VariantMap) {.
    importcpp: "SetIdentity", header: "Connection.h".}
proc setControls*(this: var Connection; newControls: Controls) {.
    importcpp: "SetControls", header: "Connection.h".}
proc setPosition*(this: var Connection; position: Vector3) {.
    importcpp: "SetPosition", header: "Connection.h".}
proc setRotation*(this: var Connection; rotation: Quaternion) {.
    importcpp: "SetRotation", header: "Connection.h".}
proc setConnectPending*(this: var Connection; connectPending: bool) {.
    importcpp: "SetConnectPending", header: "Connection.h".}
proc setLogStatistics*(this: var Connection; enable: bool) {.
    importcpp: "SetLogStatistics", header: "Connection.h".}
proc disconnect*(this: var Connection; waitMSec: cint = 0) {.
    importcpp: "Disconnect", header: "Connection.h".}
proc sendServerUpdate*(this: var Connection) {.importcpp: "SendServerUpdate",
    header: "Connection.h".}
proc sendClientUpdate*(this: var Connection) {.importcpp: "SendClientUpdate",
    header: "Connection.h".}
proc sendRemoteEvents*(this: var Connection) {.importcpp: "SendRemoteEvents",
    header: "Connection.h".}
proc sendPackages*(this: var Connection) {.importcpp: "SendPackages",
    header: "Connection.h".}
proc processPendingLatestData*(this: var Connection) {.
    importcpp: "ProcessPendingLatestData", header: "Connection.h".}
proc processMessage*(this: var Connection; msgID: cint; msg: var MemoryBuffer): bool {.
    importcpp: "ProcessMessage", header: "Connection.h".}
#proc getMessageConnection*(this: Connection): ptr KNet.MessageConnection {.
#    noSideEffect, importcpp: "GetMessageConnection", header: "Connection.h".}
proc getIdentity*(this: var Connection): var VariantMap {.
    importcpp: "GetIdentity", header: "Connection.h".}
proc getScene*(this: Connection): ptr Animatable {.noSideEffect,
    importcpp: "GetScene", header: "Connection.h".}
proc getControls*(this: Connection): Controls {.noSideEffect,
    importcpp: "GetControls", header: "Connection.h".}
proc getPosition*(this: Connection): Vector3 {.noSideEffect,
    importcpp: "GetPosition", header: "Connection.h".}
proc getRotation*(this: Connection): Quaternion {.noSideEffect,
    importcpp: "GetRotation", header: "Connection.h".}
proc isClient*(this: Connection): bool {.noSideEffect, importcpp: "IsClient",
    header: "Connection.h".}
proc isConnected*(this: Connection): bool {.noSideEffect,
    importcpp: "IsConnected", header: "Connection.h".}
proc isConnectPending*(this: Connection): bool {.noSideEffect,
    importcpp: "IsConnectPending", header: "Connection.h".}
proc isSceneLoaded*(this: Connection): bool {.noSideEffect,
    importcpp: "IsSceneLoaded", header: "Connection.h".}
proc getLogStatistics*(this: Connection): bool {.noSideEffect,
    importcpp: "GetLogStatistics", header: "Connection.h".}
proc getAddress*(this: Connection): UrString {.noSideEffect,
    importcpp: "GetAddress", header: "Connection.h".}
proc getPort*(this: Connection): cushort {.noSideEffect, importcpp: "GetPort",
    header: "Connection.h".}
proc toString*(this: Connection): UrString {.noSideEffect,
    importcpp: "ToString", header: "Connection.h".}
proc getNumDownloads*(this: Connection): cuint {.noSideEffect,
    importcpp: "GetNumDownloads", header: "Connection.h".}
proc getDownloadName*(this: Connection): UrString {.noSideEffect,
    importcpp: "GetDownloadName", header: "Connection.h".}
proc getDownloadProgress*(this: Connection): cfloat {.noSideEffect,
    importcpp: "GetDownloadProgress", header: "Connection.h".}
proc sendPackageToClient*(this: var Connection; package: ptr PackageFile) {.
    importcpp: "SendPackageToClient", header: "Connection.h".}
