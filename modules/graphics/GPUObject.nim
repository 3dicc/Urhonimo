

when defined(URHO3D_OPENGL): 
  import 
    openGL/OGLGPUObject

else: 
  import 
    direct3D9/D3D9GPUObject
