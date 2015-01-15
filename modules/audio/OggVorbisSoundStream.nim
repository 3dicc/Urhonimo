

import 
  arrayPtr, soundStream

discard "forward decl of Sound"
type 
  OggVorbisSoundStream* {.importc: "Urho3D::OggVorbisSoundStream", 
                          header: "OggVorbisSoundStream.h".} = object of SoundStream
    decoder* {.importc: "decoder_".}: pointer
    data* {.importc: "data_".}: SharedArrayPtr[cchar]
    dataSize* {.importc: "dataSize_".}: cuint


proc constructOggVorbisSoundStream*(sound: ptr Sound): OggVorbisSoundStream {.
    importcpp: "Urho3D::OggVorbisSoundStream(@)", 
    header: "OggVorbisSoundStream.h".}
proc destroyOggVorbisSoundStream*(this: var OggVorbisSoundStream) {.
    importcpp: "#.~OggVorbisSoundStream()", header: "OggVorbisSoundStream.h".}
proc getData*(this: var OggVorbisSoundStream; dest: ptr cchar; numBytes: cuint): cuint {.
    importcpp: "GetData", header: "OggVorbisSoundStream.h".}