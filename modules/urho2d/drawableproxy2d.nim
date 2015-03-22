

import
  drawable, ptrs, vector, frustum, boundingbox, indexbuffer, vertexbuffer,
  material, geometry, stringHash, urstr, urobject

discard "forward decl of Drawable2D"
discard "forward decl of IndexBuffer"
discard "forward decl of VertexBuffer"
type
  DrawableProxy2D* {.importcpp: "Urho3D::DrawableProxy2D",
                     header: "DrawableProxy2D.h".} = object of Drawable
    indexBuffer* {.importc: "indexBuffer_".}: SharedPtr[IndexBuffer]
    vertexBuffer* {.importc: "vertexBuffer_".}: SharedPtr[VertexBuffer]
    materials* {.importc: "materials_".}: Vector[SharedPtr[Material]]
    geometries* {.importc: "geometries_".}: Vector[SharedPtr[Geometry]]
    #drawables* {.importc: "drawables_".}: PODVector[ptr Drawable2D]
    orderDirty* {.importc: "orderDirty_".}: bool
    frustum* {.importc: "frustum_".}: ptr Frustum
    frustumBoundingBox* {.importc: "frustumBoundingBox_".}: BoundingBox
    indexCount* {.importc: "indexCount_".}: cuint
    vertexCount* {.importc: "vertexCount_".}: cuint


proc getType*(this: DrawableProxy2D): StringHash {.noSideEffect,
    importcpp: "GetType", header: "DrawableProxy2D.h".}
proc getBaseType*(this: DrawableProxy2D): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "DrawableProxy2D.h".}
proc getTypeName*(this: DrawableProxy2D): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "DrawableProxy2D.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::DrawableProxy2D::GetTypeStatic(@)",
    header: "DrawableProxy2D.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::DrawableProxy2D::GetTypeNameStatic(@)",
    header: "DrawableProxy2D.h".}
proc constructDrawableProxy2D*(context: ptr Context): DrawableProxy2D {.
    constructor, importcpp: "Urho3D::DrawableProxy2D(@)", header: "DrawableProxy2D.h".}
proc destroyDrawableProxy2D*(this: var DrawableProxy2D) {.
    importcpp: "#.~DrawableProxy2D()", header: "DrawableProxy2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::DrawableProxy2D::RegisterObject(@)",
    header: "DrawableProxy2D.h".}
proc updateBatches*(this: var DrawableProxy2D; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "DrawableProxy2D.h".}
proc updateGeometry*(this: var DrawableProxy2D; frame: FrameInfo) {.
    importcpp: "UpdateGeometry", header: "DrawableProxy2D.h".}
proc getUpdateGeometryType*(this: var DrawableProxy2D): UpdateGeometryType {.
    importcpp: "GetUpdateGeometryType", header: "DrawableProxy2D.h".}
proc markOrderDirty*(this: var DrawableProxy2D) {.importcpp: "MarkOrderDirty",
    header: "DrawableProxy2D.h".}
