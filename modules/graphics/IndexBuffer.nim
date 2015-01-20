
when defined(windows):
  type IndexBuffer* {.importc: "Urho3D::IndexxBuffer", header: "D3D9IndexBuffer.h".} = object
else:
  type IndexBuffer* {.importc: "Urho3D::IndexxBuffer", header: "OGLIndexBuffer.h".} = object
