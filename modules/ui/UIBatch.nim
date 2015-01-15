

import 
  color, graphicsDefs, rect

discard "forward decl of PixelShader"
discard "forward decl of Graphics"
discard "forward decl of Matrix3x4"
discard "forward decl of Texture"
discard "forward decl of UIElement"
var UI_VERTEX_SIZE* {.importc: "UI_VERTEX_SIZE", header: "UIBatch.h".}: cuint = 6


type 
  UIBatch* {.importc: "Urho3D::UIBatch", header: "UIBatch.h".} = object 
    element* {.importc: "element_".}: ptr UIElement
    blendMode* {.importc: "blendMode_".}: BlendMode
    scissor* {.importc: "scissor_".}: IntRect
    texture* {.importc: "texture_".}: ptr Texture
    invTextureSize* {.importc: "invTextureSize_".}: Vector2
    color* {.importc: "color_".}: cuint
    vertexData* {.importc: "vertexData_".}: ptr PODVector[cfloat]
    vertexStart* {.importc: "vertexStart_".}: cuint
    vertexEnd* {.importc: "vertexEnd_".}: cuint
    useGradient* {.importc: "useGradient_".}: bool


proc constructUIBatch*(): UIBatch {.importcpp: "Urho3D::UIBatch(@)", 
                                    header: "UIBatch.h".}
proc constructUIBatch*(element: ptr UIElement; blendMode: BlendMode; 
                       scissor: IntRect; texture: ptr Texture; 
                       vertexData: ptr PODVector[cfloat]): UIBatch {.
    importcpp: "Urho3D::UIBatch(@)", header: "UIBatch.h".}
proc setColor*(this: var UIBatch; color: Color; overrideAlpha: bool = false) {.
    importcpp: "SetColor", header: "UIBatch.h".}
proc setDefaultColor*(this: var UIBatch) {.importcpp: "SetDefaultColor", 
    header: "UIBatch.h".}
proc addQuad*(this: var UIBatch; x: cint; y: cint; width: cint; height: cint; 
              texOffsetX: cint; texOffsetY: cint; texWidth: cint = 0; 
              texHeight: cint = 0) {.importcpp: "AddQuad", header: "UIBatch.h".}
proc addQuad*(this: var UIBatch; transform: Matrix3x4; x: cint; y: cint; 
              width: cint; height: cint; texOffsetX: cint; texOffsetY: cint; 
              texWidth: cint = 0; texHeight: cint = 0) {.importcpp: "AddQuad", 
    header: "UIBatch.h".}
proc addQuad*(this: var UIBatch; x: cint; y: cint; width: cint; height: cint; 
              texOffsetX: cint; texOffsetY: cint; texWidth: cint; 
              texHeight: cint; tiled: bool) {.importcpp: "AddQuad", 
    header: "UIBatch.h".}
proc merge*(this: var UIBatch; batch: UIBatch): bool {.importcpp: "Merge", 
    header: "UIBatch.h".}
proc getInterpolatedColor*(this: var UIBatch; x: cint; y: cint): cuint {.
    importcpp: "GetInterpolatedColor", header: "UIBatch.h".}
proc addOrMerge*(batch: UIBatch; batches: var PODVector[UIBatch]) {.
    importcpp: "Urho3D::UIBatch::AddOrMerge(@)", header: "UIBatch.h".}