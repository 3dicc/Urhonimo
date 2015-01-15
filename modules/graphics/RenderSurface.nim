

when defined(URHO3D_OPENGL): 
  import 
    openGL/OGLRenderSurface

else: 
  import 
    direct3D9/D3D9RenderSurface
