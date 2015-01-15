

when defined(URHO3D_OPENGL): 
  import 
    openGL/OGLTexture3D

else: 
  import 
    direct3D9/D3D9Texture3D
