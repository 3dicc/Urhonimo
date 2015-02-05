
when defined(windows):
  type TextureCube* {.importc: "Urho3D::TextureCube", header: "D3D9TextureCube.h".} = object
else:
  type TextureCube* {.importc: "Urho3D::TextureCube", header: "OGLTextureCube.h".} = object
