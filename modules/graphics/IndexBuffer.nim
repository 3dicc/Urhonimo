

when defined(URHO3D_OPENGL): 
  import 
    openGL/OGLIndexBuffer

else: 
  import 
    direct3D9/D3D9IndexBuffer
