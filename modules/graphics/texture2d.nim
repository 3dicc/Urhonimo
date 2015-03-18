
when defined(windows):
  type Texture2D* {.importcpp: "Urho3D::Texture2D", header: "D3D9Texture2D.h".} = object
else:
  type Texture2D* {.importcpp: "Urho3D::Texture2D", header: "OGLTexture2D.h".} = object
