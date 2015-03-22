

import
  audioDefs, component

discard "forward decl of Audio"
discard "forward decl of Sound"
discard "forward decl of SoundStream"
var STREAM_BUFFER_LENGTH* {.importc: "STREAM_BUFFER_LENGTH",
                            header: "SoundSource.h".}: cint = 100


type
  SoundSource* {.importc: "Urho3D::SoundSource", header: "SoundSource.h".} = object of Component
    audio* {.importc: "audio_".}: WeakPtr[Audio]
    soundType* {.importc: "soundType_".}: SoundType
    frequency* {.importc: "frequency_".}: cfloat
    gain* {.importc: "gain_".}: cfloat
    attenuation* {.importc: "attenuation_".}: cfloat
    panning* {.importc: "panning_".}: cfloat
    autoRemoveTimer* {.importc: "autoRemoveTimer_".}: cfloat
    autoRemove* {.importc: "autoRemove_".}: bool
    sound* {.importc: "sound_".}: SharedPtr[Sound]
    soundStream* {.importc: "soundStream_".}: SharedPtr[SoundStream]
    position* {.importc: "position_".}: ptr cchar
    fractPosition* {.importc: "fractPosition_".}: cint
    timePosition* {.importc: "timePosition_".}: cfloat
    streamBuffer* {.importc: "streamBuffer_".}: SharedPtr[Sound]
    unusedStreamSize* {.importc: "unusedStreamSize_".}: cint


proc getType*(this: SoundSource): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "SoundSource.h".}
proc getBaseType*(this: SoundSource): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "SoundSource.h".}
proc getTypeName*(this: SoundSource): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "SoundSource.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::SoundSource::GetTypeStatic(@)", header: "SoundSource.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::SoundSource::GetTypeNameStatic(@)",
    header: "SoundSource.h".}
proc constructSoundSource*(context: ptr Context): SoundSource {.
    importcpp: "Urho3D::SoundSource(@)", header: "SoundSource.h",
    constructor.}
proc destroySoundSource*(this: var SoundSource) {.importcpp: "#.~SoundSource()",
    header: "SoundSource.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::SoundSource::RegisterObject(@)", header: "SoundSource.h".}
proc play*(this: var SoundSource; sound: ptr Sound) {.importcpp: "Play",
    header: "SoundSource.h".}
proc play*(this: var SoundSource; sound: ptr Sound; frequency: cfloat) {.
    importcpp: "Play", header: "SoundSource.h".}
proc play*(this: var SoundSource; sound: ptr Sound; frequency: cfloat;
           gain: cfloat) {.importcpp: "Play", header: "SoundSource.h".}
proc play*(this: var SoundSource; sound: ptr Sound; frequency: cfloat;
           gain: cfloat; panning: cfloat) {.importcpp: "Play",
    header: "SoundSource.h".}
proc play*(this: var SoundSource; stream: ptr SoundStream) {.importcpp: "Play",
    header: "SoundSource.h".}
proc stop*(this: var SoundSource) {.importcpp: "Stop", header: "SoundSource.h".}
proc setSoundType*(this: var SoundSource; `type`: SoundType) {.
    importcpp: "SetSoundType", header: "SoundSource.h".}
proc setFrequency*(this: var SoundSource; frequency: cfloat) {.
    importcpp: "SetFrequency", header: "SoundSource.h".}
proc setGain*(this: var SoundSource; gain: cfloat) {.importcpp: "SetGain",
    header: "SoundSource.h".}
proc setAttenuation*(this: var SoundSource; attenuation: cfloat) {.
    importcpp: "SetAttenuation", header: "SoundSource.h".}
proc setPanning*(this: var SoundSource; panning: cfloat) {.
    importcpp: "SetPanning", header: "SoundSource.h".}
proc setAutoRemove*(this: var SoundSource; enable: bool) {.
    importcpp: "SetAutoRemove", header: "SoundSource.h".}
proc setPlayPosition*(this: var SoundSource; pos: ptr cchar) {.
    importcpp: "SetPlayPosition", header: "SoundSource.h".}
proc getSound*(this: SoundSource): ptr Sound {.noSideEffect,
    importcpp: "GetSound", header: "SoundSource.h".}
proc getPlayPosition*(this: SoundSource): ptr cchar {.noSideEffect,
    importcpp: "GetPlayPosition", header: "SoundSource.h".}
proc getSoundType*(this: SoundSource): SoundType {.noSideEffect,
    importcpp: "GetSoundType", header: "SoundSource.h".}
proc getTimePosition*(this: SoundSource): cfloat {.noSideEffect,
    importcpp: "GetTimePosition", header: "SoundSource.h".}
proc getFrequency*(this: SoundSource): cfloat {.noSideEffect,
    importcpp: "GetFrequency", header: "SoundSource.h".}
proc getGain*(this: SoundSource): cfloat {.noSideEffect, importcpp: "GetGain",
    header: "SoundSource.h".}
proc getAttenuation*(this: SoundSource): cfloat {.noSideEffect,
    importcpp: "GetAttenuation", header: "SoundSource.h".}
proc getPanning*(this: SoundSource): cfloat {.noSideEffect,
    importcpp: "GetPanning", header: "SoundSource.h".}
proc getAutoRemove*(this: SoundSource): bool {.noSideEffect,
    importcpp: "GetAutoRemove", header: "SoundSource.h".}
proc isPlaying*(this: SoundSource): bool {.noSideEffect, importcpp: "IsPlaying",
    header: "SoundSource.h".}
proc update*(this: var SoundSource; timeStep: cfloat) {.importcpp: "Update",
    header: "SoundSource.h".}
proc mix*(this: var SoundSource; dest: ptr cint; samples: cuint; mixRate: cint;
          stereo: bool; interpolation: bool) {.importcpp: "Mix",
    header: "SoundSource.h".}
proc setSoundAttr*(this: var SoundSource; value: ResourceRef) {.
    importcpp: "SetSoundAttr", header: "SoundSource.h".}
proc setPositionAttr*(this: var SoundSource; value: cint) {.
    importcpp: "SetPositionAttr", header: "SoundSource.h".}
proc getSoundAttr*(this: SoundSource): ResourceRef {.noSideEffect,
    importcpp: "GetSoundAttr", header: "SoundSource.h".}
proc setPlayingAttr*(this: var SoundSource; value: bool) {.
    importcpp: "SetPlayingAttr", header: "SoundSource.h".}
proc getPositionAttr*(this: SoundSource): cint {.noSideEffect,
    importcpp: "GetPositionAttr", header: "SoundSource.h".}
