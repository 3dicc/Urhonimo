

import 
  component, tileMapDefs2D

discard "forward decl of TileMapLayer2D"
discard "forward decl of TmxFile2D"
type 
  TileMap2D* {.importc: "Urho3D::TileMap2D", header: "TileMap2D.h".} = object of Component
    tmxFile* {.importc: "tmxFile_".}: SharedPtr[TmxFile2D]
    info* {.importc: "info_".}: TileMapInfo2D
    layers* {.importc: "layers_".}: Vector[SharedPtr[TileMapLayer2D]]


proc getType*(this: TileMap2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "TileMap2D.h".}
proc getBaseType*(this: TileMap2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "TileMap2D.h".}
proc getTypeName*(this: TileMap2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "TileMap2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::TileMap2D::GetTypeStatic(@)", header: "TileMap2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::TileMap2D::GetTypeNameStatic(@)", header: "TileMap2D.h".}
proc constructTileMap2D*(context: ptr Context): TileMap2D {.
    importcpp: "Urho3D::TileMap2D(@)", header: "TileMap2D.h".}
proc destroyTileMap2D*(this: var TileMap2D) {.importcpp: "#.~TileMap2D()", 
    header: "TileMap2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::TileMap2D::RegisterObject(@)", header: "TileMap2D.h".}
proc drawDebugGeometry*(this: var TileMap2D; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "TileMap2D.h".}
proc setTmxFile*(this: var TileMap2D; tmxFile: ptr TmxFile2D) {.
    importcpp: "SetTmxFile", header: "TileMap2D.h".}
proc drawDebugGeometry*(this: var TileMap2D) {.importcpp: "DrawDebugGeometry", 
    header: "TileMap2D.h".}
proc getTmxFile*(this: TileMap2D): ptr TmxFile2D {.noSideEffect, 
    importcpp: "GetTmxFile", header: "TileMap2D.h".}
proc getInfo*(this: TileMap2D): TileMapInfo2D {.noSideEffect, 
    importcpp: "GetInfo", header: "TileMap2D.h".}
proc getNumLayers*(this: TileMap2D): cuint {.noSideEffect, 
    importcpp: "GetNumLayers", header: "TileMap2D.h".}
proc getLayer*(this: TileMap2D; index: cuint): ptr TileMapLayer2D {.
    noSideEffect, importcpp: "GetLayer", header: "TileMap2D.h".}
proc tileIndexToPosition*(this: TileMap2D; x: cint; y: cint): Vector2 {.
    noSideEffect, importcpp: "TileIndexToPosition", header: "TileMap2D.h".}
proc positionToTileIndex*(this: TileMap2D; x: var cint; y: var cint; 
                          position: Vector2): bool {.noSideEffect, 
    importcpp: "PositionToTileIndex", header: "TileMap2D.h".}
proc setTmxFileAttr*(this: var TileMap2D; value: ResourceRef) {.
    importcpp: "SetTmxFileAttr", header: "TileMap2D.h".}
proc getTmxFileAttr*(this: TileMap2D): ResourceRef {.noSideEffect, 
    importcpp: "GetTmxFileAttr", header: "TileMap2D.h".}