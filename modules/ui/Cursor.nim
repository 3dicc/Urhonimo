

import 
  borderImage, image, texture


type 
  CursorShape* = enum 
    CS_NORMAL = 0, CS_RESIZEVERTICAL, CS_RESIZEDIAGONAL_TOPRIGHT, 
    CS_RESIZEHORIZONTAL, CS_RESIZEDIAGONAL_TOPLEFT, CS_ACCEPTDROP, 
    CS_REJECTDROP, CS_BUSY, CS_MAX_SHAPES



type 
  CursorShapeInfo* {.importc: "Urho3D::CursorShapeInfo", header: "Cursor.h".} = object 
    image* {.importc: "image_".}: SharedPtr[Image]
    texture* {.importc: "texture_".}: SharedPtr[Texture]
    imageRect* {.importc: "imageRect_".}: IntRect
    hotSpot* {.importc: "hotSpot_".}: IntVector2
    osCursor* {.importc: "osCursor_".}: ptr SDL_Cursor
    systemDefined* {.importc: "systemDefined_".}: bool


proc constructCursorShapeInfo*(): CursorShapeInfo {.
    importcpp: "Urho3D::CursorShapeInfo(@)", header: "Cursor.h".}

type 
  Cursor* {.importc: "Urho3D::Cursor", header: "Cursor.h".} = object of BorderImage
    shape* {.importc: "shape_".}: CursorShape
    shapeInfos* {.importc: "shapeInfos_".}: array[cs_Max_Shapes, CursorShapeInfo]
    useSystemShapes* {.importc: "useSystemShapes_".}: bool
    osShapeDirty* {.importc: "osShapeDirty_".}: bool


proc getType*(this: Cursor): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Cursor.h".}
proc getBaseType*(this: Cursor): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Cursor.h".}
proc getTypeName*(this: Cursor): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Cursor.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Cursor::GetTypeStatic(@)", header: "Cursor.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Cursor::GetTypeNameStatic(@)", header: "Cursor.h".}
proc constructCursor*(context: ptr Context): Cursor {.
    importcpp: "Urho3D::Cursor(@)", header: "Cursor.h".}
proc destroyCursor*(this: var Cursor) {.importcpp: "#.~Cursor()", 
                                        header: "Cursor.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Cursor::RegisterObject(@)", header: "Cursor.h".}
proc getBatches*(this: var Cursor; batches: var PODVector[UIBatch]; 
                 vertexData: var PODVector[cfloat]; currentScissor: IntRect) {.
    importcpp: "GetBatches", header: "Cursor.h".}
proc defineShape*(this: var Cursor; shape: CursorShape; image: ptr Image; 
                  imageRect: IntRect; hotSpot: IntVector2) {.
    importcpp: "DefineShape", header: "Cursor.h".}
proc setShape*(this: var Cursor; shape: CursorShape) {.importcpp: "SetShape", 
    header: "Cursor.h".}
proc setUseSystemShapes*(this: var Cursor; enable: bool) {.
    importcpp: "SetUseSystemShapes", header: "Cursor.h".}
proc getShape*(this: Cursor): CursorShape {.noSideEffect, importcpp: "GetShape", 
    header: "Cursor.h".}
proc getUseSystemShapes*(this: Cursor): bool {.noSideEffect, 
    importcpp: "GetUseSystemShapes", header: "Cursor.h".}
proc setShapesAttr*(this: var Cursor; value: VariantVector) {.
    importcpp: "SetShapesAttr", header: "Cursor.h".}
proc getShapesAttr*(this: Cursor): VariantVector {.noSideEffect, 
    importcpp: "GetShapesAttr", header: "Cursor.h".}
proc applyOSCursorShape*(this: var Cursor) {.importcpp: "ApplyOSCursorShape", 
    header: "Cursor.h".}