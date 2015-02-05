

import 
  resource, tileMapDefs2D

discard "forward decl of Sprite2D"
discard "forward decl of Texture2D"
discard "forward decl of TmxFile2D"
discard "forward decl of XMLElement"
discard "forward decl of XMLFile"
type 
  TmxLayer2D* {.importc: "Urho3D::TmxLayer2D", header: "TmxFile2D.h".} = object of RefCounted
    tmxFile* {.importc: "tmxFile_".}: WeakPtr[TmxFile2D]
    `type`* {.importc: "type_".}: TileMapLayerType2D
    name* {.importc: "name_".}: UrString
    width* {.importc: "width_".}: cint
    height* {.importc: "height_".}: cint
    visible* {.importc: "visible_".}: bool
    propertySet* {.importc: "propertySet_".}: SharedPtr[PropertySet2D]


proc constructTmxLayer2D*(tmxFile: ptr TmxFile2D; `type`: TileMapLayerType2D): TmxLayer2D {.
    importcpp: "Urho3D::TmxLayer2D(@)", header: "TmxFile2D.h".}
proc destroyTmxLayer2D*(this: var TmxLayer2D) {.importcpp: "#.~TmxLayer2D()", 
    header: "TmxFile2D.h".}
proc getTmxFile*(this: TmxLayer2D): ptr TmxFile2D {.noSideEffect, 
    importcpp: "GetTmxFile", header: "TmxFile2D.h".}
proc getType*(this: TmxLayer2D): TileMapLayerType2D {.noSideEffect, 
    importcpp: "GetType", header: "TmxFile2D.h".}
proc getName*(this: TmxLayer2D): UrString {.noSideEffect, importcpp: "GetName", 
    header: "TmxFile2D.h".}
proc getWidth*(this: TmxLayer2D): cint {.noSideEffect, importcpp: "GetWidth", 
    header: "TmxFile2D.h".}
proc getHeight*(this: TmxLayer2D): cint {.noSideEffect, importcpp: "GetHeight", 
    header: "TmxFile2D.h".}
proc isVisible*(this: TmxLayer2D): bool {.noSideEffect, importcpp: "IsVisible", 
    header: "TmxFile2D.h".}
proc hasProperty*(this: TmxLayer2D; name: UrString): bool {.noSideEffect, 
    importcpp: "HasProperty", header: "TmxFile2D.h".}
proc getProperty*(this: TmxLayer2D; name: UrString): UrString {.noSideEffect, 
    importcpp: "GetProperty", header: "TmxFile2D.h".}

type 
  TmxTileLayer2D* {.importc: "Urho3D::TmxTileLayer2D", header: "TmxFile2D.h".} = object of TmxLayer2D
    tiles* {.importc: "tiles_".}: Vector[SharedPtr[Tile2D]]


proc constructTmxTileLayer2D*(tmxFile: ptr TmxFile2D): TmxTileLayer2D {.
    importcpp: "Urho3D::TmxTileLayer2D(@)", header: "TmxFile2D.h".}
proc load*(this: var TmxTileLayer2D; element: XMLElement; info: TileMapInfo2D): bool {.
    importcpp: "Load", header: "TmxFile2D.h".}
proc getTile*(this: TmxTileLayer2D; x: cint; y: cint): ptr Tile2D {.
    noSideEffect, importcpp: "GetTile", header: "TmxFile2D.h".}

type 
  TmxObjectGroup2D* {.importc: "Urho3D::TmxObjectGroup2D", header: "TmxFile2D.h".} = object of TmxLayer2D
    objects* {.importc: "objects_".}: Vector[SharedPtr[TileMapObject2D]]


proc constructTmxObjectGroup2D*(tmxFile: ptr TmxFile2D): TmxObjectGroup2D {.
    importcpp: "Urho3D::TmxObjectGroup2D(@)", header: "TmxFile2D.h".}
proc load*(this: var TmxObjectGroup2D; element: XMLElement; info: TileMapInfo2D): bool {.
    importcpp: "Load", header: "TmxFile2D.h".}
proc getNumObjects*(this: TmxObjectGroup2D): cuint {.noSideEffect, 
    importcpp: "GetNumObjects", header: "TmxFile2D.h".}
proc getObject*(this: TmxObjectGroup2D; index: cuint): ptr TileMapObject2D {.
    noSideEffect, importcpp: "GetObject", header: "TmxFile2D.h".}

type 
  TmxImageLayer2D* {.importc: "Urho3D::TmxImageLayer2D", header: "TmxFile2D.h".} = object of TmxLayer2D
    position* {.importc: "position_".}: Vector2
    source* {.importc: "source_".}: UrString
    sprite* {.importc: "sprite_".}: SharedPtr[Sprite2D]


proc constructTmxImageLayer2D*(tmxFile: ptr TmxFile2D): TmxImageLayer2D {.
    importcpp: "Urho3D::TmxImageLayer2D(@)", header: "TmxFile2D.h".}
proc load*(this: var TmxImageLayer2D; element: XMLElement; info: TileMapInfo2D): bool {.
    importcpp: "Load", header: "TmxFile2D.h".}
proc getPosition*(this: TmxImageLayer2D): Vector2 {.noSideEffect, 
    importcpp: "GetPosition", header: "TmxFile2D.h".}
proc getSource*(this: TmxImageLayer2D): UrString {.noSideEffect, 
    importcpp: "GetSource", header: "TmxFile2D.h".}
proc getSprite*(this: TmxImageLayer2D): ptr Sprite2D {.noSideEffect, 
    importcpp: "GetSprite", header: "TmxFile2D.h".}

type 
  TmxFile2D* {.importc: "Urho3D::TmxFile2D", header: "TmxFile2D.h".} = object of Resource
    loadXMLFile* {.importc: "loadXMLFile_".}: SharedPtr[XMLFile]
    tsxXMLFiles* {.importc: "tsxXMLFiles_".}: HashMap[UrString, 
        SharedPtr[XMLFile]]
    info* {.importc: "info_".}: TileMapInfo2D
    tileSetTextures* {.importc: "tileSetTextures_".}: Vector[
        SharedPtr[Texture2D]]
    gidToSpriteMapping* {.importc: "gidToSpriteMapping_".}: HashMap[cint, 
        SharedPtr[Sprite2D]]
    gidToPropertySetMapping* {.importc: "gidToPropertySetMapping_".}: HashMap[
        cint, SharedPtr[PropertySet2D]]
    layers* {.importc: "layers_".}: Vector[ptr TmxLayer2D]


proc getType*(this: TmxFile2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "TmxFile2D.h".}
proc getBaseType*(this: TmxFile2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "TmxFile2D.h".}
proc getTypeName*(this: TmxFile2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "TmxFile2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::TmxFile2D::GetTypeStatic(@)", header: "TmxFile2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::TmxFile2D::GetTypeNameStatic(@)", header: "TmxFile2D.h".}
proc constructTmxFile2D*(context: ptr Context): TmxFile2D {.
    importcpp: "Urho3D::TmxFile2D(@)", header: "TmxFile2D.h".}
proc destroyTmxFile2D*(this: var TmxFile2D) {.importcpp: "#.~TmxFile2D()", 
    header: "TmxFile2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::TmxFile2D::RegisterObject(@)", header: "TmxFile2D.h".}
proc beginLoad*(this: var TmxFile2D; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "TmxFile2D.h".}
proc endLoad*(this: var TmxFile2D): bool {.importcpp: "EndLoad", 
    header: "TmxFile2D.h".}
proc getInfo*(this: TmxFile2D): TileMapInfo2D {.noSideEffect, 
    importcpp: "GetInfo", header: "TmxFile2D.h".}
proc getTileSprite*(this: TmxFile2D; gid: cint): ptr Sprite2D {.noSideEffect, 
    importcpp: "GetTileSprite", header: "TmxFile2D.h".}
proc getTilePropertySet*(this: TmxFile2D; gid: cint): ptr PropertySet2D {.
    noSideEffect, importcpp: "GetTilePropertySet", header: "TmxFile2D.h".}
proc getNumLayers*(this: TmxFile2D): cuint {.noSideEffect, 
    importcpp: "GetNumLayers", header: "TmxFile2D.h".}
proc getLayer*(this: TmxFile2D; index: cuint): ptr TmxLayer2D {.noSideEffect, 
    importcpp: "GetLayer", header: "TmxFile2D.h".}