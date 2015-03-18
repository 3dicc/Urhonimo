
when defined(windows):
  type TextureCube* {.importcpp: "Urho3D::TextureCube", header: "D3D9TextureCube.h".} = object
else:
  type TextureCube* {.importcpp: "Urho3D::TextureCube", header: "OGLTextureCube.h".} = object
