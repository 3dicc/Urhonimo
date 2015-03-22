
when defined(windows):
  type RenderSurface* {.importcpp: "Urho3D::RenderSurface", header: "D3D9RenderSurface.h".} = object
else:
  type RenderSurface* {.importcpp: "Urho3D::RenderSurface", header: "OGLRenderSurface.h".} = object
