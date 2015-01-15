

import 
  animation2D, drawable


type 
  LoopMode2D* = enum 
    LM_DEFAULT = 0, LM_FORCE_LOOPED, LM_FORCE_CLAMPED


discard "forward decl of AnimationSet2D"
type 
  AnimatedSprite2D* {.importc: "Urho3D::AnimatedSprite2D", 
                      header: "AnimatedSprite2D.h".} = object of Drawable
    layer* {.importc: "layer_".}: cint
    orderInLayer* {.importc: "orderInLayer_".}: cint
    blendMode* {.importc: "blendMode_".}: BlendMode
    flipX* {.importc: "flipX_".}: bool
    flipY* {.importc: "flipY_".}: bool
    color* {.importc: "color_".}: Color
    speed* {.importc: "speed_".}: cfloat
    animationSet* {.importc: "animationSet_".}: SharedPtr[AnimationSet2D]
    animationName* {.importc: "animationName_".}: UrString
    animation* {.importc: "animation_".}: SharedPtr[Animation2D]
    loopMode* {.importc: "loopMode_".}: LoopMode2D
    looped* {.importc: "looped_".}: bool
    currentTime* {.importc: "currentTime_".}: cfloat
    rootNode* {.importc: "rootNode_".}: SharedPtr[Node]
    timelineNodes* {.importc: "timelineNodes_".}: Vector[SharedPtr[Node]]
    timelineTransformInfos* {.importc: "timelineTransformInfos_".}: Vector[
        TransformInfo]


proc getType*(this: AnimatedSprite2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "AnimatedSprite2D.h".}
proc getBaseType*(this: AnimatedSprite2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "AnimatedSprite2D.h".}
proc getTypeName*(this: AnimatedSprite2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "AnimatedSprite2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::AnimatedSprite2D::GetTypeStatic(@)", 
    header: "AnimatedSprite2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::AnimatedSprite2D::GetTypeNameStatic(@)", 
    header: "AnimatedSprite2D.h".}
proc constructAnimatedSprite2D*(context: ptr Context): AnimatedSprite2D {.
    importcpp: "Urho3D::AnimatedSprite2D(@)", header: "AnimatedSprite2D.h".}
proc destroyAnimatedSprite2D*(this: var AnimatedSprite2D) {.
    importcpp: "#.~AnimatedSprite2D()", header: "AnimatedSprite2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::AnimatedSprite2D::RegisterObject(@)", 
    header: "AnimatedSprite2D.h".}
proc onSetEnabled*(this: var AnimatedSprite2D) {.importcpp: "OnSetEnabled", 
    header: "AnimatedSprite2D.h".}
proc setLayer*(this: var AnimatedSprite2D; layer: cint) {.importcpp: "SetLayer", 
    header: "AnimatedSprite2D.h".}
proc setOrderInLayer*(this: var AnimatedSprite2D; orderInLayer: cint) {.
    importcpp: "SetOrderInLayer", header: "AnimatedSprite2D.h".}
proc setBlendMode*(this: var AnimatedSprite2D; mode: BlendMode) {.
    importcpp: "SetBlendMode", header: "AnimatedSprite2D.h".}
proc setFlip*(this: var AnimatedSprite2D; flipX: bool; flipY: bool) {.
    importcpp: "SetFlip", header: "AnimatedSprite2D.h".}
proc setFlipX*(this: var AnimatedSprite2D; flipX: bool) {.importcpp: "SetFlipX", 
    header: "AnimatedSprite2D.h".}
proc setFlipY*(this: var AnimatedSprite2D; flipY: bool) {.importcpp: "SetFlipY", 
    header: "AnimatedSprite2D.h".}
proc setColor*(this: var AnimatedSprite2D; color: Color) {.
    importcpp: "SetColor", header: "AnimatedSprite2D.h".}
proc setSpeed*(this: var AnimatedSprite2D; speed: cfloat) {.
    importcpp: "SetSpeed", header: "AnimatedSprite2D.h".}
proc setAnimation*(this: var AnimatedSprite2D; animationSet: ptr AnimationSet2D; 
                   name: UrString; loopMode: LoopMode2D = lm_Default) {.
    importcpp: "SetAnimation", header: "AnimatedSprite2D.h".}
proc setAnimation*(this: var AnimatedSprite2D; name: UrString; 
                   loopMode: LoopMode2D = lm_Default) {.
    importcpp: "SetAnimation", header: "AnimatedSprite2D.h".}
proc setAnimationSet*(this: var AnimatedSprite2D; 
                      animationSet: ptr AnimationSet2D) {.
    importcpp: "SetAnimationSet", header: "AnimatedSprite2D.h".}
proc setLoopMode*(this: var AnimatedSprite2D; loopMode: LoopMode2D) {.
    importcpp: "SetLoopMode", header: "AnimatedSprite2D.h".}
proc getLayer*(this: AnimatedSprite2D): cint {.noSideEffect, 
    importcpp: "GetLayer", header: "AnimatedSprite2D.h".}
proc getOrderInLayer*(this: AnimatedSprite2D): cint {.noSideEffect, 
    importcpp: "GetOrderInLayer", header: "AnimatedSprite2D.h".}
proc getBlendMode*(this: AnimatedSprite2D): BlendMode {.noSideEffect, 
    importcpp: "GetBlendMode", header: "AnimatedSprite2D.h".}
proc getFlipX*(this: AnimatedSprite2D): bool {.noSideEffect, 
    importcpp: "GetFlipX", header: "AnimatedSprite2D.h".}
proc getFlipY*(this: AnimatedSprite2D): bool {.noSideEffect, 
    importcpp: "GetFlipY", header: "AnimatedSprite2D.h".}
proc getColor*(this: AnimatedSprite2D): Color {.noSideEffect, 
    importcpp: "GetColor", header: "AnimatedSprite2D.h".}
proc getSpeed*(this: AnimatedSprite2D): cfloat {.noSideEffect, 
    importcpp: "GetSpeed", header: "AnimatedSprite2D.h".}
proc getAnimation*(this: AnimatedSprite2D): UrString {.noSideEffect, 
    importcpp: "GetAnimation", header: "AnimatedSprite2D.h".}
proc getAnimationSet*(this: AnimatedSprite2D): ptr AnimationSet2D {.
    noSideEffect, importcpp: "GetAnimationSet", header: "AnimatedSprite2D.h".}
proc getLoopMode*(this: AnimatedSprite2D): LoopMode2D {.noSideEffect, 
    importcpp: "GetLoopMode", header: "AnimatedSprite2D.h".}
proc getRootNode*(this: AnimatedSprite2D): ptr Node {.noSideEffect, 
    importcpp: "GetRootNode", header: "AnimatedSprite2D.h".}
proc setAnimationSetAttr*(this: var AnimatedSprite2D; value: ResourceRef) {.
    importcpp: "SetAnimationSetAttr", header: "AnimatedSprite2D.h".}
proc getAnimationSetAttr*(this: AnimatedSprite2D): ResourceRef {.noSideEffect, 
    importcpp: "GetAnimationSetAttr", header: "AnimatedSprite2D.h".}
proc setAnimationAttr*(this: var AnimatedSprite2D; name: UrString) {.
    importcpp: "SetAnimationAttr", header: "AnimatedSprite2D.h".}