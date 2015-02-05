

import 
  animationDefs, refCounted, urobject, valueanimation, ptrs

type 
  ValueAnimationInfo* {.importc: "Urho3D::ValueAnimationInfo", 
                        header: "ValueAnimationInfo.h".} = object of RefCounted
    target* {.importc: "target_".}: WeakPtr[UrObject]
    animation* {.importc: "animation_".}: SharedPtr[ValueAnimation]
    wrapMode* {.importc: "wrapMode_".}: WrapMode
    speed* {.importc: "speed_".}: cfloat
    currentTime* {.importc: "currentTime_".}: cfloat
    lastScaledTime* {.importc: "lastScaledTime_".}: cfloat


proc constructValueAnimationInfo*(animation: ptr ValueAnimation; 
                                  wrapMode: WrapMode; speed: cfloat): ValueAnimationInfo {.
    importcpp: "Urho3D::ValueAnimationInfo(@)", header: "ValueAnimationInfo.h".}
proc constructValueAnimationInfo*(target: ptr UrObject; 
                                  animation: ptr ValueAnimation; 
                                  wrapMode: WrapMode; speed: cfloat): ValueAnimationInfo {.
    importcpp: "Urho3D::ValueAnimationInfo(@)", header: "ValueAnimationInfo.h".}
proc constructValueAnimationInfo*(other: ValueAnimationInfo): ValueAnimationInfo {.
    importcpp: "Urho3D::ValueAnimationInfo(@)", header: "ValueAnimationInfo.h".}
proc destroyValueAnimationInfo*(this: var ValueAnimationInfo) {.
    importcpp: "#.~ValueAnimationInfo()", header: "ValueAnimationInfo.h".}
proc update*(this: var ValueAnimationInfo; timeStep: cfloat): bool {.
    importcpp: "Update", header: "ValueAnimationInfo.h".}
proc setWrapMode*(this: var ValueAnimationInfo; wrapMode: WrapMode) {.
    importcpp: "SetWrapMode", header: "ValueAnimationInfo.h".}
proc setSpeed*(this: var ValueAnimationInfo; speed: cfloat) {.
    importcpp: "SetSpeed", header: "ValueAnimationInfo.h".}
proc getTarget*(this: ValueAnimationInfo): ptr UrObject {.noSideEffect, 
    importcpp: "GetTarget", header: "ValueAnimationInfo.h".}
proc getAnimation*(this: ValueAnimationInfo): ptr ValueAnimation {.noSideEffect, 
    importcpp: "GetAnimation", header: "ValueAnimationInfo.h".}
proc getWrapMode*(this: ValueAnimationInfo): WrapMode {.noSideEffect, 
    importcpp: "GetWrapMode", header: "ValueAnimationInfo.h".}
proc getSpeed*(this: ValueAnimationInfo): cfloat {.noSideEffect, 
    importcpp: "GetSpeed", header: "ValueAnimationInfo.h".}