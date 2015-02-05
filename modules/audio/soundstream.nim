

import 
  refCounted


type 
  SoundStream* {.importc: "Urho3D::SoundStream", header: "SoundStream.h".} = object of RefCounted
    frequency* {.importc: "frequency_".}: cuint
    stopAtEnd* {.importc: "stopAtEnd_".}: bool
    sixteenBit* {.importc: "sixteenBit_".}: bool
    stereo* {.importc: "stereo_".}: bool


proc constructSoundStream*(): SoundStream {.importcpp: "Urho3D::SoundStream(@)", 
    header: "SoundStream.h".}
proc destroySoundStream*(this: var SoundStream) {.importcpp: "#.~SoundStream()", 
    header: "SoundStream.h".}
proc getData*(this: var SoundStream; dest: ptr cchar; numBytes: cuint): cuint {.
    importcpp: "GetData", header: "SoundStream.h".}
proc setFormat*(this: var SoundStream; frequency: cuint; sixteenBit: bool; 
                stereo: bool) {.importcpp: "SetFormat", header: "SoundStream.h".}
proc setStopAtEnd*(this: var SoundStream; enable: bool) {.
    importcpp: "SetStopAtEnd", header: "SoundStream.h".}
proc getSampleSize*(this: SoundStream): cuint {.noSideEffect, 
    importcpp: "GetSampleSize", header: "SoundStream.h".}
proc getFrequency*(this: SoundStream): cfloat {.noSideEffect, 
    importcpp: "GetFrequency", header: "SoundStream.h".}
proc getIntFrequency*(this: SoundStream): cuint {.noSideEffect, 
    importcpp: "GetIntFrequency", header: "SoundStream.h".}
proc getStopAtEnd*(this: SoundStream): bool {.noSideEffect, 
    importcpp: "GetStopAtEnd", header: "SoundStream.h".}
proc isSixteenBit*(this: SoundStream): bool {.noSideEffect, 
    importcpp: "IsSixteenBit", header: "SoundStream.h".}
proc isStereo*(this: SoundStream): bool {.noSideEffect, importcpp: "IsStereo", 
    header: "SoundStream.h".}