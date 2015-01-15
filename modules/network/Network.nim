

import 
  connection, hashSet, UrObject, vectorBuffer

discard "forward decl of HttpRequest"
discard "forward decl of MemoryBuffer"
discard "forward decl of Scene"
proc makeHash*[T](value: ptr KNet.MessageConnection): cuint

type 
  Network* {.importc: "Urho3D::Network", header: "Network.h".} = object of UrObject
    network* {.importc: "network_".}: ptr KNet.Network
    serverConnection* {.importc: "serverConnection_".}: SharedPtr[Connection]
    clientConnections* {.importc: "clientConnections_".}: HashMap[
        ptr KNet.MessageConnection, SharedPtr[Connection]]
    allowedRemoteEvents* {.importc: "allowedRemoteEvents_".}: HashSet[StringHash]
    blacklistedRemoteEvents* {.importc: "blacklistedRemoteEvents_".}: HashSet[
        StringHash]
    networkScenes* {.importc: "networkScenes_".}: HashSet[ptr Scene]
    updateFps* {.importc: "updateFps_".}: cint
    updateInterval* {.importc: "updateInterval_".}: cfloat
    updateAcc* {.importc: "updateAcc_".}: cfloat
    packageCacheDir* {.importc: "packageCacheDir_".}: UrString


proc getType*(this: Network): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Network.h".}
proc getBaseType*(this: Network): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Network.h".}
proc getTypeName*(this: Network): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Network.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Network::GetTypeStatic(@)", header: "Network.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Network::GetTypeNameStatic(@)", header: "Network.h".}
proc constructNetwork*(context: ptr Context): Network {.
    importcpp: "Urho3D::Network(@)", header: "Network.h".}
proc destroyNetwork*(this: var Network) {.importcpp: "#.~Network()", 
    header: "Network.h".}
proc handleMessage*(this: var Network; source: ptr KNet.MessageConnection; 
                    packetId: KNet.PacketIdT; msgId: KNet.MessageIdT; 
                    data: cstring; numBytes: csize) {.
    importcpp: "HandleMessage", header: "Network.h".}
proc computeContentID*(this: var Network; msgId: KNet.MessageIdT; data: cstring; 
                       numBytes: csize): U32 {.importcpp: "ComputeContentID", 
    header: "Network.h".}
proc newConnectionEstablished*(this: var Network; 
                               connection: ptr KNet.MessageConnection) {.
    importcpp: "NewConnectionEstablished", header: "Network.h".}
proc clientDisconnected*(this: var Network; 
                         connection: ptr KNet.MessageConnection) {.
    importcpp: "ClientDisconnected", header: "Network.h".}
proc connect*(this: var Network; address: UrString; port: cushort; 
              scene: ptr Scene; identity: VariantMap = variant.emptyVariantMap): bool {.
    importcpp: "Connect", header: "Network.h".}
proc disconnect*(this: var Network; waitMSec: cint = 0) {.
    importcpp: "Disconnect", header: "Network.h".}
proc startServer*(this: var Network; port: cushort): bool {.
    importcpp: "StartServer", header: "Network.h".}
proc stopServer*(this: var Network) {.importcpp: "StopServer", 
                                      header: "Network.h".}
proc broadcastMessage*(this: var Network; msgID: cint; reliable: bool; 
                       inOrder: bool; msg: VectorBuffer; contentID: cuint = 0) {.
    importcpp: "BroadcastMessage", header: "Network.h".}
proc broadcastMessage*(this: var Network; msgID: cint; reliable: bool; 
                       inOrder: bool; data: ptr cuchar; numBytes: cuint; 
                       contentID: cuint = 0) {.importcpp: "BroadcastMessage", 
    header: "Network.h".}
proc broadcastRemoteEvent*(this: var Network; eventType: StringHash; 
                           inOrder: bool; 
                           eventData: VariantMap = variant.emptyVariantMap) {.
    importcpp: "BroadcastRemoteEvent", header: "Network.h".}
proc broadcastRemoteEvent*(this: var Network; scene: ptr Scene; 
                           eventType: StringHash; inOrder: bool; 
                           eventData: VariantMap = variant.emptyVariantMap) {.
    importcpp: "BroadcastRemoteEvent", header: "Network.h".}
proc broadcastRemoteEvent*(this: var Network; node: ptr Node; 
                           eventType: StringHash; inOrder: bool; 
                           eventData: VariantMap = variant.emptyVariantMap) {.
    importcpp: "BroadcastRemoteEvent", header: "Network.h".}
proc setUpdateFps*(this: var Network; fps: cint) {.importcpp: "SetUpdateFps", 
    header: "Network.h".}
proc registerRemoteEvent*(this: var Network; eventType: StringHash) {.
    importcpp: "RegisterRemoteEvent", header: "Network.h".}
proc unregisterRemoteEvent*(this: var Network; eventType: StringHash) {.
    importcpp: "UnregisterRemoteEvent", header: "Network.h".}
proc unregisterAllRemoteEvents*(this: var Network) {.
    importcpp: "UnregisterAllRemoteEvents", header: "Network.h".}
proc setPackageCacheDir*(this: var Network; path: UrString) {.
    importcpp: "SetPackageCacheDir", header: "Network.h".}
proc sendPackageToClients*(this: var Network; scene: ptr Scene; 
                           package: ptr PackageFile) {.
    importcpp: "SendPackageToClients", header: "Network.h".}
proc makeHttpRequest*(this: var Network; url: UrString; 
                      verb: UrString = UrString.empty; 
                      headers: Vector[UrString] = vector[UrString](); 
                      postData: UrString = UrString.empty): SharedPtr[
    HttpRequest] {.importcpp: "MakeHttpRequest", header: "Network.h".}
proc getUpdateFps*(this: Network): cint {.noSideEffect, 
    importcpp: "GetUpdateFps", header: "Network.h".}
proc getConnection*(this: Network; connection: ptr KNet.MessageConnection): ptr Connection {.
    noSideEffect, importcpp: "GetConnection", header: "Network.h".}
proc getServerConnection*(this: Network): ptr Connection {.noSideEffect, 
    importcpp: "GetServerConnection", header: "Network.h".}
proc getClientConnections*(this: Network): Vector[SharedPtr[Connection]] {.
    noSideEffect, importcpp: "GetClientConnections", header: "Network.h".}
proc isServerRunning*(this: Network): bool {.noSideEffect, 
    importcpp: "IsServerRunning", header: "Network.h".}
proc checkRemoteEvent*(this: Network; eventType: StringHash): bool {.
    noSideEffect, importcpp: "CheckRemoteEvent", header: "Network.h".}
proc getPackageCacheDir*(this: Network): UrString {.noSideEffect, 
    importcpp: "GetPackageCacheDir", header: "Network.h".}
proc update*(this: var Network; timeStep: cfloat) {.importcpp: "Update", 
    header: "Network.h".}
proc postUpdate*(this: var Network; timeStep: cfloat) {.importcpp: "PostUpdate", 
    header: "Network.h".}

proc registerNetworkLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterNetworkLibrary(@)", header: "Network.h".}