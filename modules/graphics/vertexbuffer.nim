
when defined(windows):
  type VertexBuffer* {.importcpp: "Urho3D::VertexBuffer", header: "D3D9VertexBuffer.h".} = object
else:
  type VertexBuffer* {.importcpp: "Urho3D::VertexBuffer", header: "OGLVertexBuffer.h".} = object
