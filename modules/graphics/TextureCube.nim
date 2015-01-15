

when defined(URHO3D_OPENGL): 
  import 
    openGL/OGLTextureCube

else: 
  import 
    direct3D9/D3D9TextureCube
