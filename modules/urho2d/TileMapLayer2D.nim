

import 
  component, tileMapDefs2D

discard "forward decl of DebugRenderer"
discard "forward decl of Node"
discard "forward decl of TileMap2D"
discard "forward decl of TmxImageLayer2D"
discard "forward decl of TmxLayer2D"
discard "forward decl of TmxObjectGroup2D"
discard "forward decl of TmxTileLayer2D"
type 
  TileMapLayer2D* {.importc: "Urho3D::TileMapLayer2D", 
                    header: "TileMapLayer2D.h".} = object of Component
    tileMap* {.importc: "tileMap_".}: WeakPtr[TileMap2D]
    tmxLayer* {.importc: "tmxLayer_".}: ptr TmxLayer2D
    tileLayer* {.importc: "tileLayer_".}: ptr TmxTileLayer2D
    objectGroup* {.importc: "objectGroup_".}: ptr TmxObjectGroup2D
    imageLayer* {.importc: "imageLayer_".}: ptr TmxImageLayer2D
    drawOrder* {.importc: "drawOrder_".}: cint
    visible* {.importc: "visible_".}: bool
    nodes* {.importc: "nodes_".}: Vector[SharedPtr[Node]]


proc getType*(this: TileMapLayer2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "TileMapLayer2D.h".}
proc getBaseType*(this: TileMapLayer2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "TileMapLayer2D.h".}
proc getTypeName*(this: TileMapLayer2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "TileMapLayer2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::TileMapLayer2D::GetTypeStatic(@)", 
    header: "TileMapLayer2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::TileMapLayer2D::GetTypeNameStatic(@)", 
    header: "TileMapLayer2D.h".}
proc constructTileMapLayer2D*(context: ptr Context): TileMapLayer2D {.
    importcpp: "Urho3D::TileMapLayer2D(@)", header: "TileMapLayer2D.h".}
proc destroyTileMapLayer2D*(this: var TileMapLayer2D) {.
    importcpp: "#.~TileMapLayer2D()", header: "TileMapLayer2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::TileMapLayer2D::RegisterObject(@)", 
    header: "TileMapLayer2D.h".}
proc drawDebugGeometry*(this: var TileMapLayer2D; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "TileMapLayer2D.h".}
proc initialize*(this: var TileMapLayer2D; tileMap: ptr TileMap2D; 
                 tmxLayer: ptr TmxLayer2D) {.importcpp: "Initialize", 
    header: "TileMapLayer2D.h".}
proc setDrawOrder*(this: var TileMapLayer2D; drawOrder: cint) {.
    importcpp: "SetDrawOrder", header: "TileMapLayer2D.h".}
proc setVisible*(this: var TileMapLayer2D; visible: bool) {.
    importcpp: "SetVisible", header: "TileMapLayer2D.h".}
proc getTileMap*(this: TileMapLayer2D): ptr TileMap2D {.noSideEffect, 
    importcpp: "GetTileMap", header: "TileMapLayer2D.h".}
proc getTmxLayer*(this: TileMapLayer2D): ptr TmxLayer2D {.noSideEffect, 
    importcpp: "GetTmxLayer", header: "TileMapLayer2D.h".}
proc getDrawOrder*(this: TileMapLayer2D): cint {.noSideEffect, 
    importcpp: "GetDrawOrder", header: "TileMapLayer2D.h".}
proc isVisible*(this: TileMapLayer2D): bool {.noSideEffect, 
    importcpp: "IsVisible", header: "TileMapLayer2D.h".}
proc hasProperty*(this: TileMapLayer2D; name: UrString): bool {.noSideEffect, 
    importcpp: "HasProperty", header: "TileMapLayer2D.h".}
proc getProperty*(this: TileMapLayer2D; name: UrString): UrString {.
    noSideEffect, importcpp: "GetProperty", header: "TileMapLayer2D.h".}
proc getLayerType*(this: TileMapLayer2D): TileMapLayerType2D {.noSideEffect, 
    importcpp: "GetLayerType", header: "TileMapLayer2D.h".}
proc getWidth*(this: TileMapLayer2D): cint {.noSideEffect, 
    importcpp: "GetWidth", header: "TileMapLayer2D.h".}
proc getHeight*(this: TileMapLayer2D): cint {.noSideEffect, 
    importcpp: "GetHeight", header: "TileMapLayer2D.h".}
proc getTileNode*(this: TileMapLayer2D; x: cint; y: cint): ptr Node {.
    noSideEffect, importcpp: "GetTileNode", header: "TileMapLayer2D.h".}
proc getTile*(this: TileMapLayer2D; x: cint; y: cint): ptr Tile2D {.
    noSideEffect, importcpp: "GetTile", header: "TileMapLayer2D.h".}
proc getNumObjects*(this: TileMapLayer2D): cuint {.noSideEffect, 
    importcpp: "GetNumObjects", header: "TileMapLayer2D.h".}
proc getObject*(this: TileMapLayer2D; index: cuint): ptr TileMapObject2D {.
    noSideEffect, importcpp: "GetObject", header: "TileMapLayer2D.h".}
proc getObjectNode*(this: TileMapLayer2D; index: cuint): ptr Node {.
    noSideEffect, importcpp: "GetObjectNode", header: "TileMapLayer2D.h".}
proc getImageNode*(this: TileMapLayer2D): ptr Node {.noSideEffect, 
    importcpp: "GetImageNode", header: "TileMapLayer2D.h".}