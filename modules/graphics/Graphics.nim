
when defined(windows):
  type Graphics* {.importc: "Urho3D::Graphics", header: "D3D9Graphics.h".} = object
else:
  type Graphics* {.importc: "Urho3D::Graphics", header: "OGLGraphics.h".} = object
