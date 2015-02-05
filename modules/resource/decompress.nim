

import 
  image


proc decompressImageDXT*(dest: ptr cuchar; blocks: pointer; width: cint; 
                         height: cint; depth: cint; format: CompressedFormat) {.
    importcpp: "Urho3D::DecompressImageDXT(@)", header: "Decompress.h".}

proc decompressImageETC*(dest: ptr cuchar; blocks: pointer; width: cint; 
                         height: cint) {.
    importcpp: "Urho3D::DecompressImageETC(@)", header: "Decompress.h".}

proc decompressImagePVRTC*(dest: ptr cuchar; blocks: pointer; width: cint; 
                           height: cint; format: CompressedFormat) {.
    importcpp: "Urho3D::DecompressImagePVRTC(@)", header: "Decompress.h".}

proc flipBlockVertical*(dest: ptr cuchar; src: ptr cuchar; 
                        format: CompressedFormat) {.
    importcpp: "Urho3D::FlipBlockVertical(@)", header: "Decompress.h".}

proc flipBlockHorizontal*(dest: ptr cuchar; src: ptr cuchar; 
                          format: CompressedFormat) {.
    importcpp: "Urho3D::FlipBlockHorizontal(@)", header: "Decompress.h".}