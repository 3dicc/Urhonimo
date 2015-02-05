

when defined(windows):
  type Texture* {.importc: "Urho3D::Texture", header: "D3D9Texture.h".} = object
else:
  type Texture* {.importc: "Urho3D::Texture", header: "OGLTexture.h".} = object
