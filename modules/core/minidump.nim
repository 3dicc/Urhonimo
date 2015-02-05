

when defined(msc_Ver) and defined(urho3d_Minidumps): 
  proc writeMiniDump*(applicationName: cstring; exceptionPointers: pointer): cint {.
      importcpp: "Urho3D::WriteMiniDump(@)", header: "MiniDump.h".}