

import 
  arrayPtr, list, mutex, pair, soundStream


type 
  BufferedSoundStream* {.importc: "Urho3D::BufferedSoundStream", 
                         header: "BufferedSoundStream.h".} = object of SoundStream
    buffers* {.importc: "buffers_".}: List[Pair[SharedArrayPtr[cchar], cuint]]
    position* {.importc: "position_".}: cuint
    bufferMutex* {.importc: "bufferMutex_".}: Mutex


proc constructBufferedSoundStream*(): BufferedSoundStream {.
    importcpp: "Urho3D::BufferedSoundStream(@)", header: "BufferedSoundStream.h".}
proc destroyBufferedSoundStream*(this: var BufferedSoundStream) {.
    importcpp: "#.~BufferedSoundStream()", header: "BufferedSoundStream.h".}
proc getData*(this: var BufferedSoundStream; dest: ptr cchar; numBytes: cuint): cuint {.
    importcpp: "GetData", header: "BufferedSoundStream.h".}
proc addData*(this: var BufferedSoundStream; data: pointer; numBytes: cuint) {.
    importcpp: "AddData", header: "BufferedSoundStream.h".}
proc addData*(this: var BufferedSoundStream; data: SharedArrayPtr[cchar]; 
              numBytes: cuint) {.importcpp: "AddData", 
                                 header: "BufferedSoundStream.h".}
proc addData*(this: var BufferedSoundStream; data: SharedArrayPtr[cshort]; 
              numBytes: cuint) {.importcpp: "AddData", 
                                 header: "BufferedSoundStream.h".}
proc clear*(this: var BufferedSoundStream) {.importcpp: "Clear", 
    header: "BufferedSoundStream.h".}
proc getBufferNumBytes*(this: BufferedSoundStream): cuint {.noSideEffect, 
    importcpp: "GetBufferNumBytes", header: "BufferedSoundStream.h".}
proc getBufferLength*(this: BufferedSoundStream): cfloat {.noSideEffect, 
    importcpp: "GetBufferLength", header: "BufferedSoundStream.h".}