

import 
  arrayPtr, deserializer, serializer, UrObject, packagefile, urstr, stringHash

type 
  FileMode* {.importcpp: "Urho3D::FileMode".} = enum 
    FILE_READ = 0, FILE_WRITE, FILE_READWRITE
  UrFile* {.importc: "Urho3D::File", header: "File.h".} = object of UrObject
    fileName* {.importc: "fileName_".}: UrString
    mode* {.importc: "mode_".}: FileMode
    handle* {.importc: "handle_".}: pointer
    #assetHandle* {.importc: "assetHandle_".}: ptr SDL_RWops
    readBuffer* {.importc: "readBuffer_".}: SharedArrayPtr[cuchar]
    inputBuffer* {.importc: "inputBuffer_".}: SharedArrayPtr[cuchar]
    readBufferOffset* {.importc: "readBufferOffset_".}: cuint
    readBufferSize* {.importc: "readBufferSize_".}: cuint
    offset* {.importc: "offset_".}: cuint
    checksum* {.importc: "checksum_".}: cuint
    compressed* {.importc: "compressed_".}: bool
    readSyncNeeded* {.importc: "readSyncNeeded_".}: bool
    writeSyncNeeded* {.importc: "writeSyncNeeded_".}: bool

#converter toSer*(x: ptr UrFile): ptr Serializer {.
#  importcpp: "(@)", header: "File.h".}
#converter toDeser*(x: ptr UrFile): ptr Deserializer {.
#  importcpp: "(@)", header: "File.h".}

proc getType*(this: UrFile): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "File.h".}
proc getBaseType*(this: UrFile): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "File.h".}
proc getTypeName*(this: UrFile): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "File.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::File::GetTypeStatic(@)", header: "File.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::File::GetTypeNameStatic(@)", header: "File.h".}
proc constructFile*(context: ptr Context): UrFile {.importcpp: "Urho3D::File(@)", 
    header: "File.h".}
proc constructFile*(context: ptr Context; fileName: UrString; 
                    mode: FileMode = FILE_READ): UrFile {.
    importcpp: "Urho3D::File(@)", header: "File.h".}
proc constructFile*(context: ptr Context; package: ptr PackageFile; 
                    fileName: UrString): UrFile {.importcpp: "Urho3D::File(@)", 
    header: "File.h".}
proc destroyFile*(this: var UrFile) {.importcpp: "#.~File()", header: "File.h".}
proc read*(this: var UrFile; dest: pointer; size: cuint): cuint {.
    importcpp: "Read", header: "File.h".}
proc seek*(this: var UrFile; position: cuint): cuint {.importcpp: "Seek", 
    header: "File.h".}
proc write*(this: var UrFile; data: pointer; size: cuint): cuint {.
    importcpp: "Write", header: "File.h".}
proc getName*(this: UrFile): UrString {.noSideEffect, importcpp: "GetName", 
                                      header: "File.h".}
proc getChecksum*(this: var UrFile): cuint {.importcpp: "GetChecksum", 
    header: "File.h".}
proc open*(this: var UrFile; fileName: UrString; mode: FileMode = FILE_READ): bool {.
    importcpp: "Open", header: "File.h".}
proc open*(this: var UrFile; package: ptr PackageFile; fileName: UrString): bool {.
    importcpp: "Open", header: "File.h".}
proc close*(this: var UrFile) {.importcpp: "Close", header: "File.h".}
proc flush*(this: var UrFile) {.importcpp: "Flush", header: "File.h".}
proc setName*(this: var UrFile; name: UrString) {.importcpp: "SetName", 
    header: "File.h".}
proc getMode*(this: UrFile): FileMode {.noSideEffect, importcpp: "GetMode", 
                                      header: "File.h".}
proc isOpen*(this: UrFile): bool {.noSideEffect, importcpp: "IsOpen", 
                                 header: "File.h".}
proc getHandle*(this: UrFile): pointer {.noSideEffect, importcpp: "GetHandle", 
                                       header: "File.h".}
proc isPackaged*(this: UrFile): bool {.noSideEffect, importcpp: "IsPackaged", 
                                     header: "File.h".}