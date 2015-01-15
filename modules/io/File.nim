

import 
  arrayPtr, deserializer, serializer, UrObject

when defined(ANDROID): 

type 
  FileMode* = enum 
    FILE_READ = 0, FILE_WRITE, FILE_READWRITE


discard "forward decl of PackageFile"
type 
  File* {.importc: "Urho3D::File", header: "File.h".} = object of UrObject
    fileName* {.importc: "fileName_".}: UrString
    mode* {.importc: "mode_".}: FileMode
    handle* {.importc: "handle_".}: pointer
    assetHandle* {.importc: "assetHandle_".}: ptr SDL_RWops
    readBuffer* {.importc: "readBuffer_".}: SharedArrayPtr[cuchar]
    inputBuffer* {.importc: "inputBuffer_".}: SharedArrayPtr[cuchar]
    readBufferOffset* {.importc: "readBufferOffset_".}: cuint
    readBufferSize* {.importc: "readBufferSize_".}: cuint
    offset* {.importc: "offset_".}: cuint
    checksum* {.importc: "checksum_".}: cuint
    compressed* {.importc: "compressed_".}: bool
    readSyncNeeded* {.importc: "readSyncNeeded_".}: bool
    writeSyncNeeded* {.importc: "writeSyncNeeded_".}: bool


proc getType*(this: File): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "File.h".}
proc getBaseType*(this: File): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "File.h".}
proc getTypeName*(this: File): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "File.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::File::GetTypeStatic(@)", header: "File.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::File::GetTypeNameStatic(@)", header: "File.h".}
proc constructFile*(context: ptr Context): File {.importcpp: "Urho3D::File(@)", 
    header: "File.h".}
proc constructFile*(context: ptr Context; fileName: UrString; 
                    mode: FileMode = file_Read): File {.
    importcpp: "Urho3D::File(@)", header: "File.h".}
proc constructFile*(context: ptr Context; package: ptr PackageFile; 
                    fileName: UrString): File {.importcpp: "Urho3D::File(@)", 
    header: "File.h".}
proc destroyFile*(this: var File) {.importcpp: "#.~File()", header: "File.h".}
proc read*(this: var File; dest: pointer; size: cuint): cuint {.
    importcpp: "Read", header: "File.h".}
proc seek*(this: var File; position: cuint): cuint {.importcpp: "Seek", 
    header: "File.h".}
proc write*(this: var File; data: pointer; size: cuint): cuint {.
    importcpp: "Write", header: "File.h".}
proc getName*(this: File): UrString {.noSideEffect, importcpp: "GetName", 
                                      header: "File.h".}
proc getChecksum*(this: var File): cuint {.importcpp: "GetChecksum", 
    header: "File.h".}
proc open*(this: var File; fileName: UrString; mode: FileMode = file_Read): bool {.
    importcpp: "Open", header: "File.h".}
proc open*(this: var File; package: ptr PackageFile; fileName: UrString): bool {.
    importcpp: "Open", header: "File.h".}
proc close*(this: var File) {.importcpp: "Close", header: "File.h".}
proc flush*(this: var File) {.importcpp: "Flush", header: "File.h".}
proc setName*(this: var File; name: UrString) {.importcpp: "SetName", 
    header: "File.h".}
proc getMode*(this: File): FileMode {.noSideEffect, importcpp: "GetMode", 
                                      header: "File.h".}
proc isOpen*(this: File): bool {.noSideEffect, importcpp: "IsOpen", 
                                 header: "File.h".}
proc getHandle*(this: File): pointer {.noSideEffect, importcpp: "GetHandle", 
                                       header: "File.h".}
proc isPackaged*(this: File): bool {.noSideEffect, importcpp: "IsPackaged", 
                                     header: "File.h".}