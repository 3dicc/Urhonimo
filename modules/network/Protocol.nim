


var MSG_IDENTITY* {.importc: "MSG_IDENTITY", header: "Protocol.h".}: cint = 0x00000005


var MSG_CONTROLS* {.importc: "MSG_CONTROLS", header: "Protocol.h".}: cint = 0x00000006


var MSG_SCENELOADED* {.importc: "MSG_SCENELOADED", header: "Protocol.h".}: cint = 0x00000007


var MSG_REQUESTPACKAGE* {.importc: "MSG_REQUESTPACKAGE", header: "Protocol.h".}: cint = 0x00000008


var MSG_PACKAGEDATA* {.importc: "MSG_PACKAGEDATA", header: "Protocol.h".}: cint = 0x00000009


var MSG_LOADSCENE* {.importc: "MSG_LOADSCENE", header: "Protocol.h".}: cint = 0x0000000A


var MSG_SCENECHECKSUMERROR* {.importc: "MSG_SCENECHECKSUMERROR", 
                              header: "Protocol.h".}: cint = 0x0000000B


var MSG_CREATENODE* {.importc: "MSG_CREATENODE", header: "Protocol.h".}: cint = 0x0000000C


var MSG_NODEDELTAUPDATE* {.importc: "MSG_NODEDELTAUPDATE", header: "Protocol.h".}: cint = 0x0000000D


var MSG_NODELATESTDATA* {.importc: "MSG_NODELATESTDATA", header: "Protocol.h".}: cint = 0x0000000E


var MSG_REMOVENODE* {.importc: "MSG_REMOVENODE", header: "Protocol.h".}: cint = 0x0000000F


var MSG_CREATECOMPONENT* {.importc: "MSG_CREATECOMPONENT", header: "Protocol.h".}: cint = 0x00000010


var MSG_COMPONENTDELTAUPDATE* {.importc: "MSG_COMPONENTDELTAUPDATE", 
                                header: "Protocol.h".}: cint = 0x00000011


var MSG_COMPONENTLATESTDATA* {.importc: "MSG_COMPONENTLATESTDATA", 
                               header: "Protocol.h".}: cint = 0x00000012


var MSG_REMOVECOMPONENT* {.importc: "MSG_REMOVECOMPONENT", header: "Protocol.h".}: cint = 0x00000013


var MSG_REMOTEEVENT* {.importc: "MSG_REMOTEEVENT", header: "Protocol.h".}: cint = 0x00000014


var MSG_REMOTENODEEVENT* {.importc: "MSG_REMOTENODEEVENT", header: "Protocol.h".}: cint = 0x00000015


var MSG_PACKAGEINFO* {.importc: "MSG_PACKAGEINFO", header: "Protocol.h".}: cint = 0x00000016


var CONTROLS_CONTENT_ID* {.importc: "CONTROLS_CONTENT_ID", header: "Protocol.h".}: cuint = 1


var PACKAGE_FRAGMENT_SIZE* {.importc: "PACKAGE_FRAGMENT_SIZE", 
                             header: "Protocol.h".}: cuint = 1024
