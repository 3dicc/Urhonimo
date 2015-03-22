
when defined(windows):
  type Texture3D* {.importcpp: "Urho3D::Texture3D", header: "D3D9Texture3D.h".} = object
else:
  type Texture3D* {.importcpp: "Urho3D::Texture3D", header: "OGLTexture3D.h".} = object
