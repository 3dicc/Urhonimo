

import 
  quaternion, resource, `ptr`, vector3


type 
  AnimationKeyFrame* {.importc: "Urho3D::AnimationKeyFrame", 
                       header: "Animation.h".} = object 
    time* {.importc: "time_".}: cfloat
    position* {.importc: "position_".}: Vector3
    rotation* {.importc: "rotation_".}: Quaternion
    scale* {.importc: "scale_".}: Vector3



type 
  AnimationTrack* {.importc: "Urho3D::AnimationTrack", header: "Animation.h".} = object 
    name* {.importc: "name_".}: UrString
    nameHash* {.importc: "nameHash_".}: StringHash
    channelMask* {.importc: "channelMask_".}: cuchar
    keyFrames* {.importc: "keyFrames_".}: Vector[AnimationKeyFrame]


proc getKeyFrameIndex*(this: AnimationTrack; time: cfloat; index: var cuint) {.
    noSideEffect, importcpp: "GetKeyFrameIndex", header: "Animation.h".}

type 
  AnimationTriggerPoint* {.importc: "Urho3D::AnimationTriggerPoint", 
                           header: "Animation.h".} = object 
    time* {.importc: "time_".}: cfloat
    data* {.importc: "data_".}: Variant


proc constructAnimationTriggerPoint*(): AnimationTriggerPoint {.
    importcpp: "Urho3D::AnimationTriggerPoint(@)", header: "Animation.h".}
var CHANNEL_POSITION* {.importc: "CHANNEL_POSITION", header: "Animation.h".}: cuchar = 0x00000001

var CHANNEL_ROTATION* {.importc: "CHANNEL_ROTATION", header: "Animation.h".}: cuchar = 0x00000002

var CHANNEL_SCALE* {.importc: "CHANNEL_SCALE", header: "Animation.h".}: cuchar = 0x00000004


type 
  Animation* {.importc: "Urho3D::Animation", header: "Animation.h".} = object of Resource
    animationName* {.importc: "animationName_".}: UrString
    animationNameHash* {.importc: "animationNameHash_".}: StringHash
    length* {.importc: "length_".}: cfloat
    tracks* {.importc: "tracks_".}: Vector[AnimationTrack]
    triggers* {.importc: "triggers_".}: Vector[AnimationTriggerPoint]


proc getType*(this: Animation): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Animation.h".}
proc getBaseType*(this: Animation): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Animation.h".}
proc getTypeName*(this: Animation): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Animation.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Animation::GetTypeStatic(@)", header: "Animation.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Animation::GetTypeNameStatic(@)", header: "Animation.h".}
proc constructAnimation*(context: ptr Context): Animation {.
    importcpp: "Urho3D::Animation(@)", header: "Animation.h".}
proc destroyAnimation*(this: var Animation) {.importcpp: "#.~Animation()", 
    header: "Animation.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Animation::RegisterObject(@)", header: "Animation.h".}
proc beginLoad*(this: var Animation; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Animation.h".}
proc save*(this: Animation; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Animation.h".}
proc setAnimationName*(this: var Animation; name: UrString) {.
    importcpp: "SetAnimationName", header: "Animation.h".}
proc setLength*(this: var Animation; length: cfloat) {.importcpp: "SetLength", 
    header: "Animation.h".}
proc setTracks*(this: var Animation; tracks: Vector[AnimationTrack]) {.
    importcpp: "SetTracks", header: "Animation.h".}
proc addTrigger*(this: var Animation; time: cfloat; timeIsNormalized: bool; 
                 data: Variant) {.importcpp: "AddTrigger", header: "Animation.h".}
proc removeTrigger*(this: var Animation; index: cuint) {.
    importcpp: "RemoveTrigger", header: "Animation.h".}
proc removeAllTriggers*(this: var Animation) {.importcpp: "RemoveAllTriggers", 
    header: "Animation.h".}
proc setNumTriggers*(this: var Animation; num: cuint) {.
    importcpp: "SetNumTriggers", header: "Animation.h".}
proc getAnimationName*(this: Animation): UrString {.noSideEffect, 
    importcpp: "GetAnimationName", header: "Animation.h".}
proc getAnimationNameHash*(this: Animation): StringHash {.noSideEffect, 
    importcpp: "GetAnimationNameHash", header: "Animation.h".}
proc getLength*(this: Animation): cfloat {.noSideEffect, importcpp: "GetLength", 
    header: "Animation.h".}
proc getTracks*(this: Animation): Vector[AnimationTrack] {.noSideEffect, 
    importcpp: "GetTracks", header: "Animation.h".}
proc getNumTracks*(this: Animation): cuint {.noSideEffect, 
    importcpp: "GetNumTracks", header: "Animation.h".}
proc getTrack*(this: Animation; index: cuint): ptr AnimationTrack {.
    noSideEffect, importcpp: "GetTrack", header: "Animation.h".}
proc getTrack*(this: Animation; name: UrString): ptr AnimationTrack {.
    noSideEffect, importcpp: "GetTrack", header: "Animation.h".}
proc getTrack*(this: Animation; nameHash: StringHash): ptr AnimationTrack {.
    noSideEffect, importcpp: "GetTrack", header: "Animation.h".}
proc getTriggers*(this: Animation): Vector[AnimationTriggerPoint] {.
    noSideEffect, importcpp: "GetTriggers", header: "Animation.h".}
proc getNumTriggers*(this: Animation): cuint {.noSideEffect, 
    importcpp: "GetNumTriggers", header: "Animation.h".}