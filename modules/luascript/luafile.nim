

import 
  arrayPtr, resource

discard "forward decl of lua_State"

type 
  LuaFile* {.importc: "Urho3D::LuaFile", header: "LuaFile.h".} = object of Resource
    size* {.importc: "size_".}: cuint
    data* {.importc: "data_".}: SharedArrayPtr[char]
    hasLoaded* {.importc: "hasLoaded_".}: bool
    hasExecuted* {.importc: "hasExecuted_".}: bool


proc getType*(this: LuaFile): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "LuaFile.h".}
proc getBaseType*(this: LuaFile): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "LuaFile.h".}
proc getTypeName*(this: LuaFile): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "LuaFile.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::LuaFile::GetTypeStatic(@)", header: "LuaFile.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::LuaFile::GetTypeNameStatic(@)", header: "LuaFile.h".}
proc constructLuaFile*(context: ptr Context): LuaFile {.
    importcpp: "Urho3D::LuaFile(@)", header: "LuaFile.h".}
proc destroyLuaFile*(this: var LuaFile) {.importcpp: "#.~LuaFile()", 
    header: "LuaFile.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::LuaFile::RegisterObject(@)", header: "LuaFile.h".}
proc beginLoad*(this: var LuaFile; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "LuaFile.h".}
proc save*(this: LuaFile; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "LuaFile.h".}
proc loadChunk*(this: var LuaFile; luaState: ptr LuaState): bool {.
    importcpp: "LoadChunk", header: "LuaFile.h".}
proc loadAndExecute*(this: var LuaFile; luaState: ptr LuaState): bool {.
    importcpp: "LoadAndExecute", header: "LuaFile.h".}