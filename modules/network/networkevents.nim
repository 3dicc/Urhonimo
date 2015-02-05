

import 
  UrObject


var E_SERVERCONNECTED* {.importc: "E_SERVERCONNECTED", header: "NetworkEvents.h".}: Urho3D.StringHash = "ServerConnected"

discard 

var E_SERVERDISCONNECTED* {.importc: "E_SERVERDISCONNECTED", 
                            header: "NetworkEvents.h".}: Urho3D.StringHash = "ServerDisconnected"

discard 

var E_CONNECTFAILED* {.importc: "E_CONNECTFAILED", header: "NetworkEvents.h".}: Urho3D.StringHash = "ConnectFailed"

discard 

var E_CLIENTCONNECTED* {.importc: "E_CLIENTCONNECTED", header: "NetworkEvents.h".}: Urho3D.StringHash = "ClientConnected"

var P_CONNECTION* {.importc: "P_CONNECTION", header: "NetworkEvents.h".}: Urho3D.StringHash = "Connection"



var E_CLIENTDISCONNECTED* {.importc: "E_CLIENTDISCONNECTED", 
                            header: "NetworkEvents.h".}: Urho3D.StringHash = "ClientDisconnected"

var P_CONNECTION* {.importc: "P_CONNECTION", header: "NetworkEvents.h".}: Urho3D.StringHash = "Connection"



var E_CLIENTIDENTITY* {.importc: "E_CLIENTIDENTITY", header: "NetworkEvents.h".}: Urho3D.StringHash = "ClientIdentity"

var P_CONNECTION* {.importc: "P_CONNECTION", header: "NetworkEvents.h".}: Urho3D.StringHash = "Connection"


var P_ALLOW* {.importc: "P_ALLOW", header: "NetworkEvents.h".}: Urho3D.StringHash = "Allow"



var E_CLIENTSCENELOADED* {.importc: "E_CLIENTSCENELOADED", 
                           header: "NetworkEvents.h".}: Urho3D.StringHash = "ClientSceneLoaded"

var P_CONNECTION* {.importc: "P_CONNECTION", header: "NetworkEvents.h".}: Urho3D.StringHash = "Connection"



var E_NETWORKMESSAGE* {.importc: "E_NETWORKMESSAGE", header: "NetworkEvents.h".}: Urho3D.StringHash = "NetworkMessage"

var P_CONNECTION* {.importc: "P_CONNECTION", header: "NetworkEvents.h".}: Urho3D.StringHash = "Connection"


var P_MESSAGEID* {.importc: "P_MESSAGEID", header: "NetworkEvents.h".}: Urho3D.StringHash = "MessageID"


var P_DATA* {.importc: "P_DATA", header: "NetworkEvents.h".}: Urho3D.StringHash = "Data"



var E_NETWORKUPDATE* {.importc: "E_NETWORKUPDATE", header: "NetworkEvents.h".}: Urho3D.StringHash = "NetworkUpdate"

discard 

var E_NETWORKUPDATESENT* {.importc: "E_NETWORKUPDATESENT", 
                           header: "NetworkEvents.h".}: Urho3D.StringHash = "NetworkUpdateSent"

discard 

var E_NETWORKSCENELOADFAILED* {.importc: "E_NETWORKSCENELOADFAILED", 
                                header: "NetworkEvents.h".}: Urho3D.StringHash = "NetworkSceneLoadFailed"

var P_CONNECTION* {.importc: "P_CONNECTION", header: "NetworkEvents.h".}: Urho3D.StringHash = "Connection"



var E_REMOTEEVENTDATA* {.importc: "E_REMOTEEVENTDATA", header: "NetworkEvents.h".}: Urho3D.StringHash = "RemoteEventData"

var P_CONNECTION* {.importc: "P_CONNECTION", header: "NetworkEvents.h".}: Urho3D.StringHash = "Connection"

