

proc checkMinimalVersion*(major: cint; minor: cint): bool {.
    importcpp: "CheckMinimalVersion(@)", header: "MacFileWatcher.h".}

proc isFileWatcherSupported*(): bool {.importcpp: "IsFileWatcherSupported(@)", 
                                       header: "MacFileWatcher.h".}

proc createFileWatcher*(pathname: cstring; watchSubDirs: bool): pointer {.
    importcpp: "CreateFileWatcher(@)", header: "MacFileWatcher.h".}

proc closeFileWatcher*(watcher: pointer) {.importcpp: "CloseFileWatcher(@)", 
    header: "MacFileWatcher.h".}

proc readFileWatcher*(watcher: pointer): cstring {.
    importcpp: "ReadFileWatcher(@)", header: "MacFileWatcher.h".}