

import
  UrObject, stringHash, urstr


type
  Timer* {.importc: "Urho3D::Timer", header: "Timer.h".} = object
    startTime* {.importc: "startTime_".}: cuint


proc constructTimer*(): Timer {.importcpp: "Urho3D::Timer(@)", header: "Timer.h",
  constructor.}
proc getMSec*(this: var Timer; reset: bool): cuint {.importcpp: "GetMSec",
    header: "Timer.h".}
proc reset*(this: var Timer) {.importcpp: "Reset", header: "Timer.h".}

type
  HiresTimer* {.importc: "Urho3D::HiresTimer", header: "Timer.h".} = object
    startTime* {.importc: "startTime_".}: clonglong


proc constructHiresTimer*(): HiresTimer {.importcpp: "Urho3D::HiresTimer(@)",
    header: "Timer.h", constructor.}
proc getUSec*(this: var HiresTimer; reset: bool): clonglong {.
    importcpp: "GetUSec", header: "Timer.h".}
proc reset*(this: var HiresTimer) {.importcpp: "Reset", header: "Timer.h".}
proc isSupported*(): bool {.importcpp: "Urho3D::HiresTimer::IsSupported(@)",
                            header: "Timer.h".}
proc getFrequency*(): clonglong {.importcpp: "Urho3D::HiresTimer::GetFrequency(@)",
                                  header: "Timer.h".}

type
  Time* {.importc: "Urho3D::Time", header: "Timer.h".} = object of UrObject
    elapsedTime* {.importc: "elapsedTime_".}: Timer
    frameNumber* {.importc: "frameNumber_".}: cuint
    timeStep* {.importc: "timeStep_".}: cfloat
    timerPeriod* {.importc: "timerPeriod_".}: cuint


proc getType*(this: Time): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Timer.h".}
proc getBaseType*(this: Time): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Timer.h".}
proc getTypeName*(this: Time): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Timer.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Time::GetTypeStatic(@)", header: "Timer.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Time::GetTypeNameStatic(@)", header: "Timer.h".}
proc constructTime*(context: ptr Context): Time {.importcpp: "Urho3D::Time(@)",
    header: "Timer.h", constructor.}
proc destroyTime*(this: var Time) {.importcpp: "#.~Time()", header: "Timer.h".}
proc beginFrame*(this: var Time; timeStep: cfloat) {.importcpp: "BeginFrame",
    header: "Timer.h".}
proc endFrame*(this: var Time) {.importcpp: "EndFrame", header: "Timer.h".}
proc setTimerPeriod*(this: var Time; mSec: cuint) {.importcpp: "SetTimerPeriod",
    header: "Timer.h".}
proc getFrameNumber*(this: Time): cuint {.noSideEffect,
    importcpp: "GetFrameNumber", header: "Timer.h".}
proc getTimeStep*(this: Time): cfloat {.noSideEffect, importcpp: "GetTimeStep",
                                        header: "Timer.h".}
proc getTimerPeriod*(this: Time): cuint {.noSideEffect,
    importcpp: "GetTimerPeriod", header: "Timer.h".}
proc getElapsedTime*(this: var Time): cfloat {.importcpp: "GetElapsedTime",
    header: "Timer.h".}
proc getSystemTime*(): cuint {.importcpp: "Urho3D::Time::GetSystemTime(@)",
                               header: "Timer.h".}
proc getTimeSinceEpoch*(): cuint {.importcpp: "Urho3D::Time::GetTimeSinceEpoch(@)",
                                   header: "Timer.h".}
proc getTimeStamp*(): UrString {.importcpp: "Urho3D::Time::GetTimeStamp(@)",
                                 header: "Timer.h".}
proc sleep*(mSec: cuint) {.importcpp: "Urho3D::Time::Sleep(@)",
                           header: "Timer.h".}
