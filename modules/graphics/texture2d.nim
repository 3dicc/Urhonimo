


when defined(windows):
  const Header = "D3D9Texture2D.h"
else:
  const Header = "OGLTexture2D.h"

import
  renderSurface, ptrs, texture, image, xmlelement, stringHash, urstr,
  urobject, deserializer, graphicsdefs

type
  Texture2D* {.importcpp: "Urho3D::Texture2D", header: Header.} = object of Texture
    when false:
      renderSurface* {.importc: "renderSurface_".}: SharedPtr[RenderSurface]
      loadImage* {.importc: "loadImage_".}: SharedPtr[Image]
      loadParameters* {.importc: "loadParameters_".}: SharedPtr[XMLFile]
      readTexture* {.importc: "readTexture_".}: SharedPtr[Texture2D]
      readSurface* {.importc: "readSurface_".}: pointer


proc getType*(this: Texture2D): StringHash {.noSideEffect, importcpp: "GetType",
    header: Header.}
proc getBaseType*(this: Texture2D): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: Header.}
proc getTypeName*(this: Texture2D): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: Header.}
proc getTypeStatic*(): StringHash {.importcpp: "Urho3D::Texture2D::GetTypeStatic(@)",
                                    header: Header.}
proc getTypeNameStatic*(): UrString {.importcpp: "Urho3D::Texture2D::GetTypeNameStatic(@)",
                                      header: Header.}
proc constructTexture2D*(context: ptr Context): Texture2D {.constructor,
    importcpp: "Urho3D::Texture2D(@)", header: Header.}
proc destroyTexture2D*(this: var Texture2D) {.importcpp: "#.~Texture2D()",
    header: Header.}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Texture2D::RegisterObject(@)", header: Header.}
proc beginLoad*(this: var Texture2D; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: Header.}
proc endLoad*(this: var Texture2D): bool {.importcpp: "EndLoad",
    header: Header.}
proc onDeviceLost*(this: var Texture2D) {.importcpp: "OnDeviceLost",
    header: Header.}
proc onDeviceReset*(this: var Texture2D) {.importcpp: "OnDeviceReset",
    header: Header.}
proc release*(this: var Texture2D) {.importcpp: "Release", header: Header.}
proc setSize*(this: var Texture2D; width: cint; height: cint; format: cuint;
              usage: TextureUsage = Texture_Static): bool {.
    importcpp: "SetSize", header: Header, discardable.}
proc setData*(this: var Texture2D; level: cuint; x: cint; y: cint; width: cint;
              height: cint; data: pointer): bool {.importcpp: "SetData",
    header: Header, discardable.}
proc setData*(this: var Texture2D; image: SharedPtr[Image];
              useAlpha: bool = false): bool {.importcpp: "SetData",
    header: Header, discardable.}
proc getData*(this: Texture2D; level: cuint; dest: pointer): bool {.
    noSideEffect, importcpp: "GetData", header: Header.}
proc getRenderSurface*(this: Texture2D): ptr RenderSurface {.noSideEffect,
    importcpp: "GetRenderSurface", header: Header.}
