


when defined(windows):
  const Header = "D3D9Texture2D.h"
else:
  const Header = "OGLTexture2D.h"

type Texture* {.importcpp: "Urho3D::Texture", header: Header,
                inheritable.} = object
