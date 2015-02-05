

import 
  arrayPtr, audioDefs, mutex, UrObject

discard "forward decl of AudioImpl"
discard "forward decl of Sound"
discard "forward decl of SoundListener"
discard "forward decl of SoundSource"
type 
  Audio* {.importc: "Urho3D::Audio", header: "Audio.h".} = object of UrObject
    clipBuffer* {.importc: "clipBuffer_".}: SharedArrayPtr[cint]
    audioMutex* {.importc: "audioMutex_".}: Mutex
    deviceID* {.importc: "deviceID_".}: cuint
    sampleSize* {.importc: "sampleSize_".}: cuint
    fragmentSize* {.importc: "fragmentSize_".}: cuint
    mixRate* {.importc: "mixRate_".}: cint
    interpolation* {.importc: "interpolation_".}: bool
    stereo* {.importc: "stereo_".}: bool
    playing* {.importc: "playing_".}: bool
    masterGain* {.importc: "masterGain_".}: array[max_Sound_Types, cfloat]
    soundSources* {.importc: "soundSources_".}: PODVector[ptr SoundSource]
    listener* {.importc: "listener_".}: WeakPtr[SoundListener]


proc getType*(this: Audio): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Audio.h".}
proc getBaseType*(this: Audio): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Audio.h".}
proc getTypeName*(this: Audio): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Audio.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Audio::GetTypeStatic(@)", header: "Audio.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Audio::GetTypeNameStatic(@)", header: "Audio.h".}
proc constructAudio*(context: ptr Context): Audio {.
    importcpp: "Urho3D::Audio(@)", header: "Audio.h".}
proc destroyAudio*(this: var Audio) {.importcpp: "#.~Audio()", header: "Audio.h".}
proc setMode*(this: var Audio; bufferLengthMSec: cint; mixRate: cint; 
              stereo: bool; interpolation: bool = true): bool {.
    importcpp: "SetMode", header: "Audio.h".}
proc update*(this: var Audio; timeStep: cfloat) {.importcpp: "Update", 
    header: "Audio.h".}
proc play*(this: var Audio): bool {.importcpp: "Play", header: "Audio.h".}
proc stop*(this: var Audio) {.importcpp: "Stop", header: "Audio.h".}
proc setMasterGain*(this: var Audio; `type`: SoundType; gain: cfloat) {.
    importcpp: "SetMasterGain", header: "Audio.h".}
proc setListener*(this: var Audio; listener: ptr SoundListener) {.
    importcpp: "SetListener", header: "Audio.h".}
proc stopSound*(this: var Audio; sound: ptr Sound) {.importcpp: "StopSound", 
    header: "Audio.h".}
proc getSampleSize*(this: Audio): cuint {.noSideEffect, 
    importcpp: "GetSampleSize", header: "Audio.h".}
proc getMixRate*(this: Audio): cint {.noSideEffect, importcpp: "GetMixRate", 
                                      header: "Audio.h".}
proc getInterpolation*(this: Audio): bool {.noSideEffect, 
    importcpp: "GetInterpolation", header: "Audio.h".}
proc isStereo*(this: Audio): bool {.noSideEffect, importcpp: "IsStereo", 
                                    header: "Audio.h".}
proc isPlaying*(this: Audio): bool {.noSideEffect, importcpp: "IsPlaying", 
                                     header: "Audio.h".}
proc isInitialized*(this: Audio): bool {.noSideEffect, 
    importcpp: "IsInitialized", header: "Audio.h".}
proc getMasterGain*(this: Audio; `type`: SoundType): cfloat {.noSideEffect, 
    importcpp: "GetMasterGain", header: "Audio.h".}
proc getListener*(this: Audio): ptr SoundListener {.noSideEffect, 
    importcpp: "GetListener", header: "Audio.h".}
proc getSoundSources*(this: Audio): PODVector[ptr SoundSource] {.noSideEffect, 
    importcpp: "GetSoundSources", header: "Audio.h".}
proc addSoundSource*(this: var Audio; soundSource: ptr SoundSource) {.
    importcpp: "AddSoundSource", header: "Audio.h".}
proc removeSoundSource*(this: var Audio; soundSource: ptr SoundSource) {.
    importcpp: "RemoveSoundSource", header: "Audio.h".}
proc getMutex*(this: var Audio): var Mutex {.importcpp: "GetMutex", 
    header: "Audio.h".}
proc getSoundSourceMasterGain*(this: Audio; `type`: SoundType): cfloat {.
    noSideEffect, importcpp: "GetSoundSourceMasterGain", header: "Audio.h".}
proc mixOutput*(this: var Audio; dest: pointer; samples: cuint) {.
    importcpp: "MixOutput", header: "Audio.h".}

proc registerAudioLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterAudioLibrary(@)", header: "Audio.h".}