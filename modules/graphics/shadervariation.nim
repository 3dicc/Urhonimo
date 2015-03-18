
when defined(windows):
  type ShaderVariation* {.importcpp: "Urho3D::ShaderVariation", header: "D3D9ShaderVariation.h".} = object
else:
  type ShaderVariation* {.importcpp: "Urho3D::ShaderVariation", header: "OGLShaderVariation.h".} = object
