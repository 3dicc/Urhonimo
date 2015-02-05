

import 
  list, mutex, UrObject, stringUtils


var LOG_RAW* {.importc: "LOG_RAW", header: "Log.h".}: cint = - 1


var LOG_DEBUG* {.importc: "LOG_DEBUG", header: "Log.h".}: cint = 0


var LOG_INFO* {.importc: "LOG_INFO", header: "Log.h".}: cint = 1


var LOG_WARNING* {.importc: "LOG_WARNING", header: "Log.h".}: cint = 2


var LOG_ERROR* {.importc: "LOG_ERROR", header: "Log.h".}: cint = 3


var LOG_NONE* {.importc: "LOG_NONE", header: "Log.h".}: cint = 4

discard "forward decl of File"
type 
  StoredLogMessage* {.importc: "Urho3D::StoredLogMessage", header: "Log.h".} = object 
    message* {.importc: "message_".}: UrString
    level* {.importc: "level_".}: cint
    error* {.importc: "error_".}: bool


proc constructStoredLogMessage*(): StoredLogMessage {.
    importcpp: "Urho3D::StoredLogMessage(@)", header: "Log.h".}
proc constructStoredLogMessage*(message: UrString; level: cint; error: bool): StoredLogMessage {.
    importcpp: "Urho3D::StoredLogMessage(@)", header: "Log.h".}

type 
  Log* {.importc: "Urho3D::Log", header: "Log.h".} = object of UrObject
    logMutex* {.importc: "logMutex_".}: Mutex
    threadMessages* {.importc: "threadMessages_".}: List[StoredLogMessage]
    logFile* {.importc: "logFile_".}: SharedPtr[File]
    lastMessage* {.importc: "lastMessage_".}: UrString
    level* {.importc: "level_".}: cint
    timeStamp* {.importc: "timeStamp_".}: bool
    inWrite* {.importc: "inWrite_".}: bool
    quiet* {.importc: "quiet_".}: bool


proc getType*(this: Log): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Log.h".}
proc getBaseType*(this: Log): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Log.h".}
proc getTypeName*(this: Log): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Log.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Log::GetTypeStatic(@)", header: "Log.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Log::GetTypeNameStatic(@)", header: "Log.h".}
proc constructLog*(context: ptr Context): Log {.importcpp: "Urho3D::Log(@)", 
    header: "Log.h".}
proc destroyLog*(this: var Log) {.importcpp: "#.~Log()", header: "Log.h".}
proc open*(this: var Log; fileName: UrString) {.importcpp: "Open", 
    header: "Log.h".}
proc close*(this: var Log) {.importcpp: "Close", header: "Log.h".}
proc setLevel*(this: var Log; level: cint) {.importcpp: "SetLevel", 
    header: "Log.h".}
proc setTimeStamp*(this: var Log; enable: bool) {.importcpp: "SetTimeStamp", 
    header: "Log.h".}
proc setQuiet*(this: var Log; quiet: bool) {.importcpp: "SetQuiet", 
    header: "Log.h".}
proc getLevel*(this: Log): cint {.noSideEffect, importcpp: "GetLevel", 
                                  header: "Log.h".}
proc getTimeStamp*(this: Log): bool {.noSideEffect, importcpp: "GetTimeStamp", 
                                      header: "Log.h".}
proc getLastMessage*(this: Log): UrString {.noSideEffect, 
    importcpp: "GetLastMessage", header: "Log.h".}
proc isQuiet*(this: Log): bool {.noSideEffect, importcpp: "IsQuiet", 
                                 header: "Log.h".}
proc write*(level: cint; message: UrString) {.
    importcpp: "Urho3D::Log::Write(@)", header: "Log.h".}
proc writeRaw*(message: UrString; error: bool = false) {.
    importcpp: "Urho3D::Log::WriteRaw(@)", header: "Log.h".}