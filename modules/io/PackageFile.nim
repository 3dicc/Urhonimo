

import 
  UrObject


type 
  PackageEntry* {.importc: "Urho3D::PackageEntry", header: "PackageFile.h".} = object 
    offset* {.importc: "offset_".}: cuint
    size* {.importc: "size_".}: cuint
    checksum* {.importc: "checksum_".}: cuint



type 
  PackageFile* {.importc: "Urho3D::PackageFile", header: "PackageFile.h".} = object of UrObject
    entries* {.importc: "entries_".}: HashMap[UrString, PackageEntry]
    fileName* {.importc: "fileName_".}: UrString
    nameHash* {.importc: "nameHash_".}: StringHash
    totalSize* {.importc: "totalSize_".}: cuint
    checksum* {.importc: "checksum_".}: cuint
    compressed* {.importc: "compressed_".}: bool


proc getType*(this: PackageFile): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "PackageFile.h".}
proc getBaseType*(this: PackageFile): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "PackageFile.h".}
proc getTypeName*(this: PackageFile): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "PackageFile.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::PackageFile::GetTypeStatic(@)", header: "PackageFile.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::PackageFile::GetTypeNameStatic(@)", 
    header: "PackageFile.h".}
proc constructPackageFile*(context: ptr Context): PackageFile {.
    importcpp: "Urho3D::PackageFile(@)", header: "PackageFile.h".}
proc constructPackageFile*(context: ptr Context; fileName: UrString; 
                           startOffset: cuint = 0): PackageFile {.
    importcpp: "Urho3D::PackageFile(@)", header: "PackageFile.h".}
proc destroyPackageFile*(this: var PackageFile) {.importcpp: "#.~PackageFile()", 
    header: "PackageFile.h".}
proc open*(this: var PackageFile; fileName: UrString; startOffset: cuint = 0): bool {.
    importcpp: "Open", header: "PackageFile.h".}
proc exists*(this: PackageFile; fileName: UrString): bool {.noSideEffect, 
    importcpp: "Exists", header: "PackageFile.h".}
proc getEntry*(this: PackageFile; fileName: UrString): ptr PackageEntry {.
    noSideEffect, importcpp: "GetEntry", header: "PackageFile.h".}
proc getEntries*(this: PackageFile): HashMap[UrString, PackageEntry] {.
    noSideEffect, importcpp: "GetEntries", header: "PackageFile.h".}
proc getName*(this: PackageFile): UrString {.noSideEffect, importcpp: "GetName", 
    header: "PackageFile.h".}
proc getNameHash*(this: PackageFile): StringHash {.noSideEffect, 
    importcpp: "GetNameHash", header: "PackageFile.h".}
proc getNumFiles*(this: PackageFile): cuint {.noSideEffect, 
    importcpp: "GetNumFiles", header: "PackageFile.h".}
proc getTotalSize*(this: PackageFile): cuint {.noSideEffect, 
    importcpp: "GetTotalSize", header: "PackageFile.h".}
proc getChecksum*(this: PackageFile): cuint {.noSideEffect, 
    importcpp: "GetChecksum", header: "PackageFile.h".}
proc isCompressed*(this: PackageFile): bool {.noSideEffect, 
    importcpp: "IsCompressed", header: "PackageFile.h".}
proc getEntryNames*(this: PackageFile): Vector[UrString] {.noSideEffect, 
    importcpp: "GetEntryNames", header: "PackageFile.h".}