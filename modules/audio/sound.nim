

import
  arrayPtr, resource

discard "forward decl of SoundStream"
type
  Sound* {.importc: "Urho3D::Sound", header: "Sound.h".} = object of Resource
    data* {.importc: "data_".}: SharedArrayPtr[cchar]
    repeat* {.importc: "repeat_".}: ptr cchar
    `end`* {.importc: "end_".}: ptr cchar
    dataSize* {.importc: "dataSize_".}: cuint
    frequency* {.importc: "frequency_".}: cuint
    looped* {.importc: "looped_".}: bool
    sixteenBit* {.importc: "sixteenBit_".}: bool
    stereo* {.importc: "stereo_".}: bool
    compressed* {.importc: "compressed_".}: bool
    compressedLength* {.importc: "compressedLength_".}: cfloat


proc getType*(this: Sound): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetType", header: "Sound.h".}
proc getBaseType*(this: Sound): Urho3D.StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Sound.h".}
proc getTypeName*(this: Sound): Urho3D.UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Sound.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Sound::GetTypeStatic(@)", header: "Sound.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Sound::GetTypeNameStatic(@)", header: "Sound.h".}
proc constructSound*(context: ptr Context): Sound {.
    importcpp: "Urho3D::Sound(@)", header: "Sound.h", constructor.}
proc destroySound*(this: var Sound) {.importcpp: "#.~Sound()", header: "Sound.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Sound::RegisterObject(@)", header: "Sound.h".}
proc beginLoad*(this: var Sound; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Sound.h".}
proc loadRaw*(this: var Sound; source: var Deserializer): bool {.
    importcpp: "LoadRaw", header: "Sound.h".}
proc loadWav*(this: var Sound; source: var Deserializer): bool {.
    importcpp: "LoadWav", header: "Sound.h".}
proc loadOggVorbis*(this: var Sound; source: var Deserializer): bool {.
    importcpp: "LoadOggVorbis", header: "Sound.h".}
proc setSize*(this: var Sound; dataSize: cuint) {.importcpp: "SetSize",
    header: "Sound.h".}
proc setData*(this: var Sound; data: pointer; dataSize: cuint) {.
    importcpp: "SetData", header: "Sound.h".}
proc setFormat*(this: var Sound; frequency: cuint; sixteenBit: bool;
                stereo: bool) {.importcpp: "SetFormat", header: "Sound.h".}
proc setLooped*(this: var Sound; enable: bool) {.importcpp: "SetLooped",
    header: "Sound.h".}
proc setLoop*(this: var Sound; repeatOffset: cuint; endOffset: cuint) {.
    importcpp: "SetLoop", header: "Sound.h".}
proc fixInterpolation*(this: var Sound) {.importcpp: "FixInterpolation",
    header: "Sound.h".}
proc getDecoderStream*(this: Sound): SharedPtr[SoundStream] {.noSideEffect,
    importcpp: "GetDecoderStream", header: "Sound.h".}
proc getData*(this: Sound): SharedArrayPtr[cchar] {.noSideEffect,
    importcpp: "GetData", header: "Sound.h".}
proc getStart*(this: Sound): ptr cchar {.noSideEffect, importcpp: "GetStart",
    header: "Sound.h".}
proc getRepeat*(this: Sound): ptr cchar {.noSideEffect, importcpp: "GetRepeat",
    header: "Sound.h".}
proc getEnd*(this: Sound): ptr cchar {.noSideEffect, importcpp: "GetEnd",
                                       header: "Sound.h".}
proc getLength*(this: Sound): cfloat {.noSideEffect, importcpp: "GetLength",
                                       header: "Sound.h".}
proc getDataSize*(this: Sound): cuint {.noSideEffect, importcpp: "GetDataSize",
                                        header: "Sound.h".}
proc getSampleSize*(this: Sound): cuint {.noSideEffect,
    importcpp: "GetSampleSize", header: "Sound.h".}
proc getFrequency*(this: Sound): cfloat {.noSideEffect,
    importcpp: "GetFrequency", header: "Sound.h".}
proc getIntFrequency*(this: Sound): cuint {.noSideEffect,
    importcpp: "GetIntFrequency", header: "Sound.h".}
proc isLooped*(this: Sound): bool {.noSideEffect, importcpp: "IsLooped",
                                    header: "Sound.h".}
proc isSixteenBit*(this: Sound): bool {.noSideEffect, importcpp: "IsSixteenBit",
                                        header: "Sound.h".}
proc isStereo*(this: Sound): bool {.noSideEffect, importcpp: "IsStereo",
                                    header: "Sound.h".}
proc isCompressed*(this: Sound): bool {.noSideEffect, importcpp: "IsCompressed",
                                        header: "Sound.h".}
