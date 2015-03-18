

import
  image, texture, ptrs, rect, vector2, uielement, stringhash, urstr, urobject,
  vector, variant

proc constructCursorShapeInfo*(): CursorShapeInfo {.constructor,
    importcpp: "Urho3D::CursorShapeInfo(@)", header: "Cursor.h".}


proc getType*(this: Cursor): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Cursor.h".}
proc getBaseType*(this: Cursor): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Cursor.h".}
proc getTypeName*(this: Cursor): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Cursor.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Cursor::GetTypeStatic(@)", header: "Cursor.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Cursor::GetTypeNameStatic(@)", header: "Cursor.h".}
proc constructCursor*(context: ptr Context): Cursor {.constructor,
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
