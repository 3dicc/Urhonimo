

import
  renderSurface, ptrs, texture, image

discard "forward decl of Image"
type
  Texture3D* {.importcpp: "Urho3D::Texture3D", header: "Texture3D.h".} = object of Texture
    renderSurface* {.importc: "renderSurface_".}: SharedPtr[RenderSurface]
    loadImage* {.importc: "loadImage_".}: SharedPtr[Image]
    loadParameters* {.importc: "loadParameters_".}: SharedPtr[XMLFile]


proc getType*(this: Texture3D): StringHash {.noSideEffect, importcpp: "GetType",
    header: "Texture3D.h".}
proc getBaseType*(this: Texture3D): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Texture3D.h".}
proc getTypeName*(this: Texture3D): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Texture3D.h".}
proc getTypeStatic*(): StringHash {.importcpp: "Urho3D::Texture3D::GetTypeStatic(@)",
                                    header: "Texture3D.h".}
proc getTypeNameStatic*(): UrString {.importcpp: "Urho3D::Texture3D::GetTypeNameStatic(@)",
                                      header: "Texture3D.h".}
proc constructTexture3D*(context: ptr Context): Texture3D {.constructor,
    importcpp: "Urho3D::Texture3D(@)", header: "Texture3D.h".}
proc destroyTexture3D*(this: var Texture3D) {.importcpp: "#.~Texture3D()",
    header: "Texture3D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Texture3D::RegisterObject(@)", header: "Texture3D.h".}
proc beginLoad*(this: var Texture3D; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Texture3D.h".}
proc endLoad*(this: var Texture3D): bool {.importcpp: "EndLoad",
    header: "Texture3D.h".}
proc onDeviceLost*(this: var Texture3D) {.importcpp: "OnDeviceLost",
    header: "Texture3D.h".}
proc onDeviceReset*(this: var Texture3D) {.importcpp: "OnDeviceReset",
    header: "Texture3D.h".}
proc release*(this: var Texture3D) {.importcpp: "Release", header: "Texture3D.h".}
proc setSize*(this: var Texture3D; width: cint; height: cint; depth: cint;
              format: cuint; usage: TextureUsage = texture_Static): bool {.
    importcpp: "SetSize", header: "Texture3D.h".}
proc setData*(this: var Texture3D; level: cuint; x: cint; y: cint; z: cint;
              width: cint; height: cint; depth: cint; data: pointer): bool {.
    importcpp: "SetData", header: "Texture3D.h".}
proc setData*(this: var Texture3D; image: SharedPtr[Image];
              useAlpha: bool = false): bool {.importcpp: "SetData",
    header: "Texture3D.h".}
proc getData*(this: Texture3D; level: cuint; dest: pointer): bool {.
    noSideEffect, importcpp: "GetData", header: "Texture3D.h".}
proc getRenderSurface*(this: Texture3D): ptr RenderSurface {.noSideEffect,
    importcpp: "GetRenderSurface", header: "Texture3D.h".}
