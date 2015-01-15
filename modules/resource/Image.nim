

import 
  arrayPtr, resource

discard "forward decl of SDL_Surface"
var COLOR_LUT_SIZE* {.importc: "COLOR_LUT_SIZE", header: "Image.h".}: cint = 16


type 
  CompressedFormat* = enum 
    CF_NONE = 0, CF_DXT1, CF_DXT3, CF_DXT5, CF_ETC1, CF_PVRTC_RGB_2BPP, 
    CF_PVRTC_RGBA_2BPP, CF_PVRTC_RGB_4BPP, CF_PVRTC_RGBA_4BPP



type 
  CompressedLevel* {.importc: "Urho3D::CompressedLevel", header: "Image.h".} = object 
    data* {.importc: "data_".}: ptr cuchar
    format* {.importc: "format_".}: CompressedFormat
    width* {.importc: "width_".}: cint
    height* {.importc: "height_".}: cint
    depth* {.importc: "depth_".}: cint
    blockSize* {.importc: "blockSize_".}: cuint
    dataSize* {.importc: "dataSize_".}: cuint
    rowSize* {.importc: "rowSize_".}: cuint
    rows* {.importc: "rows_".}: cuint


proc constructCompressedLevel*(): CompressedLevel {.
    importcpp: "Urho3D::CompressedLevel(@)", header: "Image.h".}
proc decompress*(this: var CompressedLevel; dest: ptr cuchar): bool {.
    importcpp: "Decompress", header: "Image.h".}

type 
  Image* {.importc: "Urho3D::Image", header: "Image.h".} = object of Resource
    width* {.importc: "width_".}: cint
    height* {.importc: "height_".}: cint
    depth* {.importc: "depth_".}: cint
    components* {.importc: "components_".}: cuint
    numCompressedLevels* {.importc: "numCompressedLevels_".}: cuint
    compressedFormat* {.importc: "compressedFormat_".}: CompressedFormat
    data* {.importc: "data_".}: SharedArrayPtr[cuchar]
    nextLevel* {.importc: "nextLevel_".}: SharedPtr[Image]


proc getType*(this: Image): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Image.h".}
proc getBaseType*(this: Image): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Image.h".}
proc getTypeName*(this: Image): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Image.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Image::GetTypeStatic(@)", header: "Image.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Image::GetTypeNameStatic(@)", header: "Image.h".}
proc constructImage*(context: ptr Context): Image {.
    importcpp: "Urho3D::Image(@)", header: "Image.h".}
proc destroyImage*(this: var Image) {.importcpp: "#.~Image()", header: "Image.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Image::RegisterObject(@)", header: "Image.h".}
proc beginLoad*(this: var Image; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Image.h".}
proc save*(this: Image; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Image.h".}
proc setSize*(this: var Image; width: cint; height: cint; components: cuint): bool {.
    importcpp: "SetSize", header: "Image.h".}
proc setSize*(this: var Image; width: cint; height: cint; depth: cint; 
              components: cuint): bool {.importcpp: "SetSize", header: "Image.h".}
proc setData*(this: var Image; pixelData: ptr cuchar) {.importcpp: "SetData", 
    header: "Image.h".}
proc setPixel*(this: var Image; x: cint; y: cint; color: Color) {.
    importcpp: "SetPixel", header: "Image.h".}
proc setPixel*(this: var Image; x: cint; y: cint; z: cint; color: Color) {.
    importcpp: "SetPixel", header: "Image.h".}
proc setPixelInt*(this: var Image; x: cint; y: cint; uintColor: cuint) {.
    importcpp: "SetPixelInt", header: "Image.h".}
proc setPixelInt*(this: var Image; x: cint; y: cint; z: cint; uintColor: cuint) {.
    importcpp: "SetPixelInt", header: "Image.h".}
proc loadColorLUT*(this: var Image; source: var Deserializer): bool {.
    importcpp: "LoadColorLUT", header: "Image.h".}
proc flipHorizontal*(this: var Image): bool {.importcpp: "FlipHorizontal", 
    header: "Image.h".}
proc flipVertical*(this: var Image): bool {.importcpp: "FlipVertical", 
    header: "Image.h".}
proc resize*(this: var Image; width: cint; height: cint): bool {.
    importcpp: "Resize", header: "Image.h".}
proc clear*(this: var Image; color: Color) {.importcpp: "Clear", 
    header: "Image.h".}
proc clearInt*(this: var Image; uintColor: cuint) {.importcpp: "ClearInt", 
    header: "Image.h".}
proc saveBMP*(this: Image; fileName: UrString): bool {.noSideEffect, 
    importcpp: "SaveBMP", header: "Image.h".}
proc savePNG*(this: Image; fileName: UrString): bool {.noSideEffect, 
    importcpp: "SavePNG", header: "Image.h".}
proc saveTGA*(this: Image; fileName: UrString): bool {.noSideEffect, 
    importcpp: "SaveTGA", header: "Image.h".}
proc saveJPG*(this: Image; fileName: UrString; quality: cint): bool {.
    noSideEffect, importcpp: "SaveJPG", header: "Image.h".}
proc getPixel*(this: Image; x: cint; y: cint): Color {.noSideEffect, 
    importcpp: "GetPixel", header: "Image.h".}
proc getPixel*(this: Image; x: cint; y: cint; z: cint): Color {.noSideEffect, 
    importcpp: "GetPixel", header: "Image.h".}
proc getPixelInt*(this: Image; x: cint; y: cint): cuint {.noSideEffect, 
    importcpp: "GetPixelInt", header: "Image.h".}
proc getPixelInt*(this: Image; x: cint; y: cint; z: cint): cuint {.noSideEffect, 
    importcpp: "GetPixelInt", header: "Image.h".}
proc getPixelBilinear*(this: Image; x: cfloat; y: cfloat): Color {.noSideEffect, 
    importcpp: "GetPixelBilinear", header: "Image.h".}
proc getPixelTrilinear*(this: Image; x: cfloat; y: cfloat; z: cfloat): Color {.
    noSideEffect, importcpp: "GetPixelTrilinear", header: "Image.h".}
proc getWidth*(this: Image): cint {.noSideEffect, importcpp: "GetWidth", 
                                    header: "Image.h".}
proc getHeight*(this: Image): cint {.noSideEffect, importcpp: "GetHeight", 
                                     header: "Image.h".}
proc getDepth*(this: Image): cint {.noSideEffect, importcpp: "GetDepth", 
                                    header: "Image.h".}
proc getComponents*(this: Image): cuint {.noSideEffect, 
    importcpp: "GetComponents", header: "Image.h".}
proc getData*(this: Image): ptr cuchar {.noSideEffect, importcpp: "GetData", 
    header: "Image.h".}
proc isCompressed*(this: Image): bool {.noSideEffect, importcpp: "IsCompressed", 
                                        header: "Image.h".}
proc getCompressedFormat*(this: Image): CompressedFormat {.noSideEffect, 
    importcpp: "GetCompressedFormat", header: "Image.h".}
proc getNumCompressedLevels*(this: Image): cuint {.noSideEffect, 
    importcpp: "GetNumCompressedLevels", header: "Image.h".}
proc getNextLevel*(this: Image): SharedPtr[Image] {.noSideEffect, 
    importcpp: "GetNextLevel", header: "Image.h".}
proc getCompressedLevel*(this: Image; index: cuint): CompressedLevel {.
    noSideEffect, importcpp: "GetCompressedLevel", header: "Image.h".}
proc getSubimage*(this: Image; rect: IntRect): ptr Image {.noSideEffect, 
    importcpp: "GetSubimage", header: "Image.h".}
proc getSDLSurface*(this: Image; rect: IntRect = intRect.zero): ptr SDL_Surface {.
    noSideEffect, importcpp: "GetSDLSurface", header: "Image.h".}
proc precalculateLevels*(this: var Image) {.importcpp: "PrecalculateLevels", 
    header: "Image.h".}