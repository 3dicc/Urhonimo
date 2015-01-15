

import 
  hashMap, `ptr`

discard "forward decl of Animation"
discard "forward decl of AnimatedModel"
discard "forward decl of Deserializer"
discard "forward decl of Serializer"
discard "forward decl of Skeleton"
discard "forward decl of AnimationTrack"
discard "forward decl of Bone"
type 
  AnimationStateTrack* {.importc: "Urho3D::AnimationStateTrack", 
                         header: "AnimationState.h".} = object 
    track* {.importc: "track_".}: ptr AnimationTrack
    bone* {.importc: "bone_".}: ptr Bone
    node* {.importc: "node_".}: WeakPtr[Node]
    weight* {.importc: "weight_".}: cfloat
    keyFrame* {.importc: "keyFrame_".}: cuint


proc constructAnimationStateTrack*(): AnimationStateTrack {.
    importcpp: "Urho3D::AnimationStateTrack(@)", header: "AnimationState.h".}
proc destroyAnimationStateTrack*(this: var AnimationStateTrack) {.
    importcpp: "#.~AnimationStateTrack()", header: "AnimationState.h".}

type 
  AnimationState* {.importc: "Urho3D::AnimationState", 
                    header: "AnimationState.h".} = object of RefCounted
    model* {.importc: "model_".}: WeakPtr[AnimatedModel]
    node* {.importc: "node_".}: WeakPtr[Node]
    animation* {.importc: "animation_".}: SharedPtr[Animation]
    startBone* {.importc: "startBone_".}: ptr Bone
    stateTracks* {.importc: "stateTracks_".}: Vector[AnimationStateTrack]
    looped* {.importc: "looped_".}: bool
    weight* {.importc: "weight_".}: cfloat
    time* {.importc: "time_".}: cfloat
    layer* {.importc: "layer_".}: cuchar


proc constructAnimationState*(model: ptr AnimatedModel; animation: ptr Animation): AnimationState {.
    importcpp: "Urho3D::AnimationState(@)", header: "AnimationState.h".}
proc constructAnimationState*(node: ptr Node; animation: ptr Animation): AnimationState {.
    importcpp: "Urho3D::AnimationState(@)", header: "AnimationState.h".}
proc destroyAnimationState*(this: var AnimationState) {.
    importcpp: "#.~AnimationState()", header: "AnimationState.h".}
proc setStartBone*(this: var AnimationState; bone: ptr Bone) {.
    importcpp: "SetStartBone", header: "AnimationState.h".}
proc setLooped*(this: var AnimationState; looped: bool) {.
    importcpp: "SetLooped", header: "AnimationState.h".}
proc setWeight*(this: var AnimationState; weight: cfloat) {.
    importcpp: "SetWeight", header: "AnimationState.h".}
proc setTime*(this: var AnimationState; time: cfloat) {.importcpp: "SetTime", 
    header: "AnimationState.h".}
proc setBoneWeight*(this: var AnimationState; index: cuint; weight: cfloat; 
                    recursive: bool = false) {.importcpp: "SetBoneWeight", 
    header: "AnimationState.h".}
proc setBoneWeight*(this: var AnimationState; name: UrString; weight: cfloat; 
                    recursive: bool = false) {.importcpp: "SetBoneWeight", 
    header: "AnimationState.h".}
proc setBoneWeight*(this: var AnimationState; nameHash: StringHash; 
                    weight: cfloat; recursive: bool = false) {.
    importcpp: "SetBoneWeight", header: "AnimationState.h".}
proc addWeight*(this: var AnimationState; delta: cfloat) {.
    importcpp: "AddWeight", header: "AnimationState.h".}
proc addTime*(this: var AnimationState; delta: cfloat) {.importcpp: "AddTime", 
    header: "AnimationState.h".}
proc setLayer*(this: var AnimationState; layer: cuchar) {.importcpp: "SetLayer", 
    header: "AnimationState.h".}
proc getAnimation*(this: AnimationState): ptr Animation {.noSideEffect, 
    importcpp: "GetAnimation", header: "AnimationState.h".}
proc getModel*(this: AnimationState): ptr AnimatedModel {.noSideEffect, 
    importcpp: "GetModel", header: "AnimationState.h".}
proc getNode*(this: AnimationState): ptr Node {.noSideEffect, 
    importcpp: "GetNode", header: "AnimationState.h".}
proc getStartBone*(this: AnimationState): ptr Bone {.noSideEffect, 
    importcpp: "GetStartBone", header: "AnimationState.h".}
proc getBoneWeight*(this: AnimationState; index: cuint): cfloat {.noSideEffect, 
    importcpp: "GetBoneWeight", header: "AnimationState.h".}
proc getBoneWeight*(this: AnimationState; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetBoneWeight", header: "AnimationState.h".}
proc getBoneWeight*(this: AnimationState; nameHash: StringHash): cfloat {.
    noSideEffect, importcpp: "GetBoneWeight", header: "AnimationState.h".}
proc getTrackIndex*(this: AnimationState; node: ptr Node): cuint {.noSideEffect, 
    importcpp: "GetTrackIndex", header: "AnimationState.h".}
proc getTrackIndex*(this: AnimationState; name: UrString): cuint {.noSideEffect, 
    importcpp: "GetTrackIndex", header: "AnimationState.h".}
proc getTrackIndex*(this: AnimationState; nameHash: StringHash): cuint {.
    noSideEffect, importcpp: "GetTrackIndex", header: "AnimationState.h".}
proc isEnabled*(this: AnimationState): bool {.noSideEffect, 
    importcpp: "IsEnabled", header: "AnimationState.h".}
proc isLooped*(this: AnimationState): bool {.noSideEffect, 
    importcpp: "IsLooped", header: "AnimationState.h".}
proc getWeight*(this: AnimationState): cfloat {.noSideEffect, 
    importcpp: "GetWeight", header: "AnimationState.h".}
proc getTime*(this: AnimationState): cfloat {.noSideEffect, 
    importcpp: "GetTime", header: "AnimationState.h".}
proc getLength*(this: AnimationState): cfloat {.noSideEffect, 
    importcpp: "GetLength", header: "AnimationState.h".}
proc getLayer*(this: AnimationState): cuchar {.noSideEffect, 
    importcpp: "GetLayer", header: "AnimationState.h".}
proc apply*(this: var AnimationState) {.importcpp: "Apply", 
                                        header: "AnimationState.h".}