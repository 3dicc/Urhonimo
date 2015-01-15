

when defined(URHO3D_OPENGL): 
  import 
    openGL/OGLGraphicsImpl

else: 
  import 
    direct3D9/D3D9GraphicsImpl
