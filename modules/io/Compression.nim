

import 
  urho3D

discard "forward decl of Deserializer"
discard "forward decl of Serializer"
discard "forward decl of VectorBuffer"
proc estimateCompressBound*(srcSize: cuint): cuint {.
    importcpp: "Urho3D::EstimateCompressBound(@)", header: "Compression.h".}

proc compressData*(dest: pointer; src: pointer; srcSize: cuint): cuint {.
    importcpp: "Urho3D::CompressData(@)", header: "Compression.h".}

proc decompressData*(dest: pointer; src: pointer; destSize: cuint): cuint {.
    importcpp: "Urho3D::DecompressData(@)", header: "Compression.h".}

proc compressStream*(dest: var Serializer; src: var Deserializer): bool {.
    importcpp: "Urho3D::CompressStream(@)", header: "Compression.h".}

proc decompressStream*(dest: var Serializer; src: var Deserializer): bool {.
    importcpp: "Urho3D::DecompressStream(@)", header: "Compression.h".}

proc compressVectorBuffer*(src: var VectorBuffer): VectorBuffer {.
    importcpp: "Urho3D::CompressVectorBuffer(@)", header: "Compression.h".}

proc decompressVectorBuffer*(src: var VectorBuffer): VectorBuffer {.
    importcpp: "Urho3D::DecompressVectorBuffer(@)", header: "Compression.h".}