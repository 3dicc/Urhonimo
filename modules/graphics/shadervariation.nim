
when defined(windows):
  type ShaderVariation* {.importc: "Urho3D::ShaderVariation", header: "D3D9ShaderVariation.h".} = object
else:
  type ShaderVariation* {.importc: "Urho3D::ShaderVariation", header: "OGLShaderVariation.h".} = object
