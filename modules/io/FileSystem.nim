

import 
  hashSet, list, UrObject

discard "forward decl of AsyncExecRequest"
var SCAN_FILES* {.importc: "SCAN_FILES", header: "FileSystem.h".}: cuint = 0x00000001


var SCAN_DIRS* {.importc: "SCAN_DIRS", header: "FileSystem.h".}: cuint = 0x00000002


var SCAN_HIDDEN* {.importc: "SCAN_HIDDEN", header: "FileSystem.h".}: cuint = 0x00000004


type 
  FileSystem* {.importc: "Urho3D::FileSystem", header: "FileSystem.h".} = object of UrObject
    allowedPaths* {.importc: "allowedPaths_".}: HashSet[UrString]
    programDir* {.importc: "programDir_".}: UrString
    asyncExecQueue* {.importc: "asyncExecQueue_".}: List[ptr AsyncExecRequest]
    nextAsyncExecID* {.importc: "nextAsyncExecID_".}: cuint
    executeConsoleCommands* {.importc: "executeConsoleCommands_".}: bool


proc getType*(this: FileSystem): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "FileSystem.h".}
proc getBaseType*(this: FileSystem): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "FileSystem.h".}
proc getTypeName*(this: FileSystem): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "FileSystem.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::FileSystem::GetTypeStatic(@)", header: "FileSystem.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::FileSystem::GetTypeNameStatic(@)", 
    header: "FileSystem.h".}
proc constructFileSystem*(context: ptr Context): FileSystem {.
    importcpp: "Urho3D::FileSystem(@)", header: "FileSystem.h".}
proc destroyFileSystem*(this: var FileSystem) {.importcpp: "#.~FileSystem()", 
    header: "FileSystem.h".}
proc setCurrentDir*(this: var FileSystem; pathName: UrString): bool {.
    importcpp: "SetCurrentDir", header: "FileSystem.h".}
proc createDir*(this: var FileSystem; pathName: UrString): bool {.
    importcpp: "CreateDir", header: "FileSystem.h".}
proc setExecuteConsoleCommands*(this: var FileSystem; enable: bool) {.
    importcpp: "SetExecuteConsoleCommands", header: "FileSystem.h".}
proc systemCommand*(this: var FileSystem; commandLine: UrString; 
                    redirectStdOutToLog: bool = false): cint {.
    importcpp: "SystemCommand", header: "FileSystem.h".}
proc systemRun*(this: var FileSystem; fileName: UrString; 
                arguments: Vector[UrString]): cint {.importcpp: "SystemRun", 
    header: "FileSystem.h".}
proc systemCommandAsync*(this: var FileSystem; commandLine: UrString): cuint {.
    importcpp: "SystemCommandAsync", header: "FileSystem.h".}
proc systemRunAsync*(this: var FileSystem; fileName: UrString; 
                     arguments: Vector[UrString]): cuint {.
    importcpp: "SystemRunAsync", header: "FileSystem.h".}
proc systemOpen*(this: var FileSystem; fileName: UrString; 
                 mode: UrString = UrString.empty): bool {.
    importcpp: "SystemOpen", header: "FileSystem.h".}
proc copy*(this: var FileSystem; srcFileName: UrString; destFileName: UrString): bool {.
    importcpp: "Copy", header: "FileSystem.h".}
proc rename*(this: var FileSystem; srcFileName: UrString; destFileName: UrString): bool {.
    importcpp: "Rename", header: "FileSystem.h".}
proc delete*(this: var FileSystem; fileName: UrString): bool {.
    importcpp: "Delete", header: "FileSystem.h".}
proc registerPath*(this: var FileSystem; pathName: UrString) {.
    importcpp: "RegisterPath", header: "FileSystem.h".}
proc setLastModifiedTime*(this: var FileSystem; fileName: UrString; 
                          newTime: cuint): bool {.
    importcpp: "SetLastModifiedTime", header: "FileSystem.h".}
proc getCurrentDir*(this: FileSystem): UrString {.noSideEffect, 
    importcpp: "GetCurrentDir", header: "FileSystem.h".}
proc getExecuteConsoleCommands*(this: FileSystem): bool {.noSideEffect, 
    importcpp: "GetExecuteConsoleCommands", header: "FileSystem.h".}
proc hasRegisteredPaths*(this: FileSystem): bool {.noSideEffect, 
    importcpp: "HasRegisteredPaths", header: "FileSystem.h".}
proc checkAccess*(this: FileSystem; pathName: UrString): bool {.noSideEffect, 
    importcpp: "CheckAccess", header: "FileSystem.h".}
proc getLastModifiedTime*(this: FileSystem; fileName: UrString): cuint {.
    noSideEffect, importcpp: "GetLastModifiedTime", header: "FileSystem.h".}
proc fileExists*(this: FileSystem; fileName: UrString): bool {.noSideEffect, 
    importcpp: "FileExists", header: "FileSystem.h".}
proc dirExists*(this: FileSystem; pathName: UrString): bool {.noSideEffect, 
    importcpp: "DirExists", header: "FileSystem.h".}
proc scanDir*(this: FileSystem; result: var Vector[UrString]; 
              pathName: UrString; filter: UrString; flags: cuint; 
              recursive: bool) {.noSideEffect, importcpp: "ScanDir", 
                                 header: "FileSystem.h".}
proc getProgramDir*(this: FileSystem): UrString {.noSideEffect, 
    importcpp: "GetProgramDir", header: "FileSystem.h".}
proc getUserDocumentsDir*(this: FileSystem): UrString {.noSideEffect, 
    importcpp: "GetUserDocumentsDir", header: "FileSystem.h".}
proc getAppPreferencesDir*(this: FileSystem; org: UrString; app: UrString): UrString {.
    noSideEffect, importcpp: "GetAppPreferencesDir", header: "FileSystem.h".}

proc splitPath*(fullPath: UrString; pathName: var UrString; 
                fileName: var UrString; extension: var UrString; 
                lowercaseExtension: bool = true) {.
    importcpp: "Urho3D::SplitPath(@)", header: "FileSystem.h".}

proc getPath*(fullPath: UrString): UrString {.importcpp: "Urho3D::GetPath(@)", 
    header: "FileSystem.h".}

proc getFileName*(fullPath: UrString): UrString {.
    importcpp: "Urho3D::GetFileName(@)", header: "FileSystem.h".}

proc getExtension*(fullPath: UrString; lowercaseExtension: bool = true): UrString {.
    importcpp: "Urho3D::GetExtension(@)", header: "FileSystem.h".}

proc getFileNameAndExtension*(fullPath: UrString; 
                              lowercaseExtension: bool = false): UrString {.
    importcpp: "Urho3D::GetFileNameAndExtension(@)", header: "FileSystem.h".}

proc replaceExtension*(fullPath: UrString; newExtension: UrString): UrString {.
    importcpp: "Urho3D::ReplaceExtension(@)", header: "FileSystem.h".}

proc addTrailingSlash*(pathName: UrString): UrString {.
    importcpp: "Urho3D::AddTrailingSlash(@)", header: "FileSystem.h".}

proc removeTrailingSlash*(pathName: UrString): UrString {.
    importcpp: "Urho3D::RemoveTrailingSlash(@)", header: "FileSystem.h".}

proc getParentPath*(pathName: UrString): UrString {.
    importcpp: "Urho3D::GetParentPath(@)", header: "FileSystem.h".}

proc getInternalPath*(pathName: UrString): UrString {.
    importcpp: "Urho3D::GetInternalPath(@)", header: "FileSystem.h".}

proc getNativePath*(pathName: UrString): UrString {.
    importcpp: "Urho3D::GetNativePath(@)", header: "FileSystem.h".}

proc getWideNativePath*(pathName: UrString): WString {.
    importcpp: "Urho3D::GetWideNativePath(@)", header: "FileSystem.h".}

proc isAbsolutePath*(pathName: UrString): bool {.
    importcpp: "Urho3D::IsAbsolutePath(@)", header: "FileSystem.h".}