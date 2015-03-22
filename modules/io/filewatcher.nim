

import
  list, mutex, UrObject, thread, timer

discard "forward decl of FileSystem"
type
  FileWatcher* {.importcpp: "Urho3D::FileWatcher", header: "FileWatcher.h".} = object of UrObject
    fileSystem* {.importc: "fileSystem_".}: SharedPtr[FileSystem]
    path* {.importc: "path_".}: UrString
    changes* {.importc: "changes_".}: HashMap[UrString, Timer]
    changesMutex* {.importc: "changesMutex_".}: Mutex
    delay* {.importc: "delay_".}: cfloat
    watchSubDirs* {.importc: "watchSubDirs_".}: bool


proc getType*(this: FileWatcher): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "FileWatcher.h".}
proc getBaseType*(this: FileWatcher): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "FileWatcher.h".}
proc getTypeName*(this: FileWatcher): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "FileWatcher.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::FileWatcher::GetTypeStatic(@)", header: "FileWatcher.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::FileWatcher::GetTypeNameStatic(@)",
    header: "FileWatcher.h".}
proc constructFileWatcher*(context: ptr Context): FileWatcher {.constructor,
    importcpp: "Urho3D::FileWatcher(@)", header: "FileWatcher.h".}
proc destroyFileWatcher*(this: var FileWatcher) {.importcpp: "#.~FileWatcher()",
    header: "FileWatcher.h".}
proc threadFunction*(this: var FileWatcher) {.importcpp: "ThreadFunction",
    header: "FileWatcher.h".}
proc startWatching*(this: var FileWatcher; pathName: UrString;
                    watchSubDirs: bool): bool {.importcpp: "StartWatching",
    header: "FileWatcher.h".}
proc stopWatching*(this: var FileWatcher) {.importcpp: "StopWatching",
    header: "FileWatcher.h".}
proc setDelay*(this: var FileWatcher; interval: cfloat) {.importcpp: "SetDelay",
    header: "FileWatcher.h".}
proc addChange*(this: var FileWatcher; fileName: UrString) {.
    importcpp: "AddChange", header: "FileWatcher.h".}
proc getNextChange*(this: var FileWatcher; dest: var UrString): bool {.
    importcpp: "GetNextChange", header: "FileWatcher.h".}
proc getPath*(this: FileWatcher): UrString {.noSideEffect, importcpp: "GetPath",
    header: "FileWatcher.h".}
proc getDelay*(this: FileWatcher): cfloat {.noSideEffect, importcpp: "GetDelay",
    header: "FileWatcher.h".}
