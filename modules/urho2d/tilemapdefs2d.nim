

import
  refCounted, sprite2D

discard "forward decl of XMLElement"
type
  Orientation2D* {.importcpp: "Urho3D::Orientation2D".} = enum
    O_ORTHOGONAL = 0, O_ISOMETRIC, O_STAGGERED



type
  TileMapInfo2D* {.importcpp: "Urho3D::TileMapInfo2D", header: "TileMapDefs2D.h".} = object
    orientation* {.importc: "orientation_".}: Orientation2D
    width* {.importc: "width_".}: cint
    height* {.importc: "height_".}: cint
    tileWidth* {.importc: "tileWidth_".}: cfloat
    tileHeight* {.importc: "tileHeight_".}: cfloat


proc getMapWidth*(this: TileMapInfo2D): cfloat {.noSideEffect,
    importcpp: "GetMapWidth", header: "TileMapDefs2D.h".}
proc getMapHeight*(this: TileMapInfo2D): cfloat {.noSideEffect,
    importcpp: "GetMapHeight", header: "TileMapDefs2D.h".}
proc convertPosition*(this: TileMapInfo2D; position: Vector2): Vector2 {.
    noSideEffect, importcpp: "ConvertPosition", header: "TileMapDefs2D.h".}
proc tileIndexToPosition*(this: TileMapInfo2D; x: cint; y: cint): Vector2 {.
    noSideEffect, importcpp: "TileIndexToPosition", header: "TileMapDefs2D.h".}
proc positionToTileIndex*(this: TileMapInfo2D; x: var cint; y: var cint;
                          positon: Vector2): bool {.noSideEffect,
    importcpp: "PositionToTileIndex", header: "TileMapDefs2D.h".}

type
  TileMapLayerType2D* {.importcpp: "Urho3D::TileMapLayerType2D".} = enum
    LT_TILE_LAYER = 0, LT_OBJECT_GROUP, LT_IMAGE_LAYER, LT_INVALID = 0x0000FFFF



type
  TileMapObjectType2D* {.importcpp: "Urho3D::TileMapObjectType2D".} = enum
    OT_RECTANGLE = 0, OT_ELLIPSE, OT_POLYGON, OT_POLYLINE, OT_TILE,
    OT_INVALID = 0x0000FFFF



type
  PropertySet2D* {.importcpp: "Urho3D::PropertySet2D", header: "TileMapDefs2D.h".} = object of RefCounted
    nameToValueMapping* {.importc: "nameToValueMapping_".}: HashMap[UrString,
        UrString]


proc constructPropertySet2D*(): PropertySet2D {.constructor,
    importcpp: "Urho3D::PropertySet2D(@)", header: "TileMapDefs2D.h".}
proc destroyPropertySet2D*(this: var PropertySet2D) {.
    importcpp: "#.~PropertySet2D()", header: "TileMapDefs2D.h".}
proc load*(this: var PropertySet2D; element: XMLElement) {.importcpp: "Load",
    header: "TileMapDefs2D.h".}
proc hasProperty*(this: PropertySet2D; name: UrString): bool {.noSideEffect,
    importcpp: "HasProperty", header: "TileMapDefs2D.h".}
proc getProperty*(this: PropertySet2D; name: UrString): UrString {.noSideEffect,
    importcpp: "GetProperty", header: "TileMapDefs2D.h".}

type
  Tile2D* {.importcpp: "Urho3D::Tile2D", header: "TileMapDefs2D.h".} = object of RefCounted
    gid* {.importc: "gid_".}: cint
    sprite* {.importc: "sprite_".}: SharedPtr[Sprite2D]
    propertySet* {.importc: "propertySet_".}: SharedPtr[PropertySet2D]


proc constructTile2D*(): Tile2D {.importcpp: "Urho3D::Tile2D(@)", constructor,
                                  header: "TileMapDefs2D.h".}
proc getGid*(this: Tile2D): cint {.noSideEffect, importcpp: "GetGid",
                                   header: "TileMapDefs2D.h".}
proc getSprite*(this: Tile2D): ptr Sprite2D {.noSideEffect,
    importcpp: "GetSprite", header: "TileMapDefs2D.h".}
proc hasProperty*(this: Tile2D; name: UrString): bool {.noSideEffect,
    importcpp: "HasProperty", header: "TileMapDefs2D.h".}
proc getProperty*(this: Tile2D; name: UrString): UrString {.noSideEffect,
    importcpp: "GetProperty", header: "TileMapDefs2D.h".}

type
  TileMapObject2D* {.importcpp: "Urho3D::TileMapObject2D",
                     header: "TileMapDefs2D.h".} = object of RefCounted
    objectType* {.importc: "objectType_".}: TileMapObjectType2D
    name* {.importc: "name_".}: UrString
    `type`* {.importc: "type_".}: UrString
    position* {.importc: "position_".}: Vector2
    size* {.importc: "size_".}: Vector2
    points* {.importc: "points_".}: Vector[Vector2]
    gid* {.importc: "gid_".}: cint
    sprite* {.importc: "sprite_".}: SharedPtr[Sprite2D]
    propertySet* {.importc: "propertySet_".}: SharedPtr[PropertySet2D]


proc constructTileMapObject2D*(): TileMapObject2D {.
    constructor, importcpp: "Urho3D::TileMapObject2D(@)", header: "TileMapDefs2D.h".}
proc getObjectType*(this: TileMapObject2D): TileMapObjectType2D {.noSideEffect,
    importcpp: "GetObjectType", header: "TileMapDefs2D.h".}
proc getName*(this: TileMapObject2D): UrString {.noSideEffect,
    importcpp: "GetName", header: "TileMapDefs2D.h".}
proc getType*(this: TileMapObject2D): UrString {.noSideEffect,
    importcpp: "GetType", header: "TileMapDefs2D.h".}
proc getPosition*(this: TileMapObject2D): Vector2 {.noSideEffect,
    importcpp: "GetPosition", header: "TileMapDefs2D.h".}
proc getSize*(this: TileMapObject2D): Vector2 {.noSideEffect,
    importcpp: "GetSize", header: "TileMapDefs2D.h".}
proc getNumPoints*(this: TileMapObject2D): cuint {.noSideEffect,
    importcpp: "GetNumPoints", header: "TileMapDefs2D.h".}
proc getPoint*(this: TileMapObject2D; index: cuint): Vector2 {.noSideEffect,
    importcpp: "GetPoint", header: "TileMapDefs2D.h".}
proc getTileGid*(this: TileMapObject2D): cint {.noSideEffect,
    importcpp: "GetTileGid", header: "TileMapDefs2D.h".}
proc getTileSprite*(this: TileMapObject2D): ptr Sprite2D {.noSideEffect,
    importcpp: "GetTileSprite", header: "TileMapDefs2D.h".}
proc hasProperty*(this: TileMapObject2D; name: UrString): bool {.noSideEffect,
    importcpp: "HasProperty", header: "TileMapDefs2D.h".}
proc getProperty*(this: TileMapObject2D; name: UrString): UrString {.
    noSideEffect, importcpp: "GetProperty", header: "TileMapDefs2D.h".}
