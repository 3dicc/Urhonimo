

import 
  component, vectorBuffer

discard "forward decl of AnimatedModel"
discard "forward decl of Animation"
discard "forward decl of AnimationState"
discard "forward decl of Bone"
type 
  AnimationControl* {.importc: "Urho3D::AnimationControl", 
                      header: "AnimationController.h".} = object 
    name* {.importc: "name_".}: UrString
    hash* {.importc: "hash_".}: StringHash
    speed* {.importc: "speed_".}: cfloat
    targetWeight* {.importc: "targetWeight_".}: cfloat
    fadeTime* {.importc: "fadeTime_".}: cfloat
    autoFadeTime* {.importc: "autoFadeTime_".}: cfloat
    setTimeTtl* {.importc: "setTimeTtl_".}: cfloat
    setWeightTtl* {.importc: "setWeightTtl_".}: cfloat
    setTime* {.importc: "setTime_".}: cushort
    setWeight* {.importc: "setWeight_".}: cuchar
    setTimeRev* {.importc: "setTimeRev_".}: cuchar
    setWeightRev* {.importc: "setWeightRev_".}: cuchar


proc constructAnimationControl*(): AnimationControl {.
    importcpp: "Urho3D::AnimationControl(@)", header: "AnimationController.h".}

type 
  AnimationController* {.importc: "Urho3D::AnimationController", 
                         header: "AnimationController.h".} = object of Component
    animations* {.importc: "animations_".}: Vector[AnimationControl]
    nodeAnimationStates* {.importc: "nodeAnimationStates_".}: Vector[
        SharedPtr[AnimationState]]
    attrBuffer* {.importc: "attrBuffer_".}: VectorBuffer


proc getType*(this: AnimationController): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "AnimationController.h".}
proc getBaseType*(this: AnimationController): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "AnimationController.h".}
proc getTypeName*(this: AnimationController): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "AnimationController.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::AnimationController::GetTypeStatic(@)", 
    header: "AnimationController.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::AnimationController::GetTypeNameStatic(@)", 
    header: "AnimationController.h".}
proc constructAnimationController*(context: ptr Context): AnimationController {.
    importcpp: "Urho3D::AnimationController(@)", header: "AnimationController.h".}
proc destroyAnimationController*(this: var AnimationController) {.
    importcpp: "#.~AnimationController()", header: "AnimationController.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::AnimationController::RegisterObject(@)", 
    header: "AnimationController.h".}
proc onSetEnabled*(this: var AnimationController) {.importcpp: "OnSetEnabled", 
    header: "AnimationController.h".}
proc update*(this: var AnimationController; timeStep: cfloat) {.
    importcpp: "Update", header: "AnimationController.h".}
proc play*(this: var AnimationController; name: UrString; layer: cuchar; 
           looped: bool; fadeInTime: cfloat = 0.0): bool {.importcpp: "Play", 
    header: "AnimationController.h".}
proc playExclusive*(this: var AnimationController; name: UrString; 
                    layer: cuchar; looped: bool; fadeTime: cfloat = 0.0): bool {.
    importcpp: "PlayExclusive", header: "AnimationController.h".}
proc stop*(this: var AnimationController; name: UrString; 
           fadeOutTime: cfloat = 0.0): bool {.importcpp: "Stop", 
    header: "AnimationController.h".}
proc stopLayer*(this: var AnimationController; layer: cuchar; 
                fadeOutTime: cfloat = 0.0) {.importcpp: "StopLayer", 
    header: "AnimationController.h".}
proc stopAll*(this: var AnimationController; fadeTime: cfloat = 0.0) {.
    importcpp: "StopAll", header: "AnimationController.h".}
proc fade*(this: var AnimationController; name: UrString; targetWeight: cfloat; 
           fadeTime: cfloat): bool {.importcpp: "Fade", 
                                     header: "AnimationController.h".}
proc fadeOthers*(this: var AnimationController; name: UrString; 
                 targetWeight: cfloat; fadeTime: cfloat): bool {.
    importcpp: "FadeOthers", header: "AnimationController.h".}
proc setLayer*(this: var AnimationController; name: UrString; layer: cuchar): bool {.
    importcpp: "SetLayer", header: "AnimationController.h".}
proc setStartBone*(this: var AnimationController; name: UrString; 
                   startBoneName: UrString): bool {.importcpp: "SetStartBone", 
    header: "AnimationController.h".}
proc setTime*(this: var AnimationController; name: UrString; time: cfloat): bool {.
    importcpp: "SetTime", header: "AnimationController.h".}
proc setWeight*(this: var AnimationController; name: UrString; weight: cfloat): bool {.
    importcpp: "SetWeight", header: "AnimationController.h".}
proc setLooped*(this: var AnimationController; name: UrString; enable: bool): bool {.
    importcpp: "SetLooped", header: "AnimationController.h".}
proc setSpeed*(this: var AnimationController; name: UrString; speed: cfloat): bool {.
    importcpp: "SetSpeed", header: "AnimationController.h".}
proc setAutoFade*(this: var AnimationController; name: UrString; 
                  fadeOutTime: cfloat): bool {.importcpp: "SetAutoFade", 
    header: "AnimationController.h".}
proc isPlaying*(this: AnimationController; name: UrString): bool {.noSideEffect, 
    importcpp: "IsPlaying", header: "AnimationController.h".}
proc isFadingIn*(this: AnimationController; name: UrString): bool {.
    noSideEffect, importcpp: "IsFadingIn", header: "AnimationController.h".}
proc isFadingOut*(this: AnimationController; name: UrString): bool {.
    noSideEffect, importcpp: "IsFadingOut", header: "AnimationController.h".}
proc getLayer*(this: AnimationController; name: UrString): cuchar {.
    noSideEffect, importcpp: "GetLayer", header: "AnimationController.h".}
proc getStartBone*(this: AnimationController; name: UrString): ptr Bone {.
    noSideEffect, importcpp: "GetStartBone", header: "AnimationController.h".}
proc getStartBoneName*(this: AnimationController; name: UrString): UrString {.
    noSideEffect, importcpp: "GetStartBoneName", header: "AnimationController.h".}
proc getTime*(this: AnimationController; name: UrString): cfloat {.noSideEffect, 
    importcpp: "GetTime", header: "AnimationController.h".}
proc getWeight*(this: AnimationController; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetWeight", header: "AnimationController.h".}
proc isLooped*(this: AnimationController; name: UrString): bool {.noSideEffect, 
    importcpp: "IsLooped", header: "AnimationController.h".}
proc getLength*(this: AnimationController; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetLength", header: "AnimationController.h".}
proc getSpeed*(this: AnimationController; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetSpeed", header: "AnimationController.h".}
proc getFadeTarget*(this: AnimationController; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetFadeTarget", header: "AnimationController.h".}
proc getFadeTime*(this: AnimationController; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetFadeTime", header: "AnimationController.h".}
proc getAutoFade*(this: AnimationController; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetAutoFade", header: "AnimationController.h".}
proc getAnimationState*(this: AnimationController; name: UrString): ptr AnimationState {.
    noSideEffect, importcpp: "GetAnimationState", 
    header: "AnimationController.h".}
proc getAnimationState*(this: AnimationController; nameHash: StringHash): ptr AnimationState {.
    noSideEffect, importcpp: "GetAnimationState", 
    header: "AnimationController.h".}
proc setAnimationsAttr*(this: var AnimationController; value: VariantVector) {.
    importcpp: "SetAnimationsAttr", header: "AnimationController.h".}
proc setNetAnimationsAttr*(this: var AnimationController; 
                           value: PODVector[cuchar]) {.
    importcpp: "SetNetAnimationsAttr", header: "AnimationController.h".}
proc setNodeAnimationStatesAttr*(this: var AnimationController; 
                                 value: VariantVector) {.
    importcpp: "SetNodeAnimationStatesAttr", header: "AnimationController.h".}
proc getAnimationsAttr*(this: AnimationController): VariantVector {.
    noSideEffect, importcpp: "GetAnimationsAttr", 
    header: "AnimationController.h".}
proc getNetAnimationsAttr*(this: AnimationController): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetNetAnimationsAttr", 
    header: "AnimationController.h".}
proc getNodeAnimationStatesAttr*(this: AnimationController): VariantVector {.
    noSideEffect, importcpp: "GetNodeAnimationStatesAttr", 
    header: "AnimationController.h".}