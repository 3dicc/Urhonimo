

import
  ptrs, graphics

discard "forward decl of Graphics"
type
  GPUObject* {.importcpp: "Urho3D::GPUObject", header: "GPUObject.h".} = object
    graphics* {.importc: "graphics_".}: WeakPtr[Graphics]
    `object`* {.importc: "object_".}: pointer
    dataLost* {.importc: "dataLost_".}: bool
    dataPending* {.importc: "dataPending_".}: bool


proc constructGPUObject*(graphics: ptr Graphics): GPUObject {.constructor,
    importcpp: "Urho3D::GPUObject(@)", header: "GPUObject.h".}
proc destroyGPUObject*(this: var GPUObject) {.importcpp: "#.~GPUObject()",
    header: "GPUObject.h".}
proc onDeviceLost*(this: var GPUObject) {.importcpp: "OnDeviceLost",
    header: "GPUObject.h".}
proc onDeviceReset*(this: var GPUObject) {.importcpp: "OnDeviceReset",
    header: "GPUObject.h".}
proc release*(this: var GPUObject) {.importcpp: "Release", header: "GPUObject.h".}
proc clearDataLost*(this: var GPUObject) {.importcpp: "ClearDataLost",
    header: "GPUObject.h".}
proc getGraphics*(this: GPUObject): ptr Graphics {.noSideEffect,
    importcpp: "GetGraphics", header: "GPUObject.h".}
proc getGPUObject*(this: GPUObject): pointer {.noSideEffect,
    importcpp: "GetGPUObject", header: "GPUObject.h".}
proc isDataLost*(this: GPUObject): bool {.noSideEffect, importcpp: "IsDataLost",
    header: "GPUObject.h".}
proc hasPendingData*(this: GPUObject): bool {.noSideEffect,
    importcpp: "HasPendingData", header: "GPUObject.h".}
