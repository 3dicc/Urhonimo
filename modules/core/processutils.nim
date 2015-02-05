

import 
  urstr, vector

discard "forward decl of Mutex"
proc initFPU*() {.importcpp: "Urho3D::InitFPU(@)", header: "ProcessUtils.h".}

proc errorDialog*(title: UrString; message: UrString) {.
    importcpp: "Urho3D::ErrorDialog(@)", header: "ProcessUtils.h".}

proc errorExit*(message: UrString; exitCode: cint) {.
    importcpp: "Urho3D::ErrorExit(@)", header: "ProcessUtils.h".}

proc openConsoleWindow*() {.importcpp: "Urho3D::OpenConsoleWindow(@)", 
                            header: "ProcessUtils.h".}

proc printUnicode*(str: UrString; error: bool = false) {.
    importcpp: "Urho3D::PrintUnicode(@)", header: "ProcessUtils.h".}

proc printUnicodeLine*(str: UrString; error: bool = false) {.
    importcpp: "Urho3D::PrintUnicodeLine(@)", header: "ProcessUtils.h".}

proc printLine*(str: UrString; error: bool = false) {.
    importcpp: "Urho3D::PrintLine(@)", header: "ProcessUtils.h".}

proc parseArguments*(cmdLine: UrString; skipFirstArgument: bool = true): var Vector[
    UrString] {.importcpp: "Urho3D::ParseArguments(@)", header: "ProcessUtils.h".}

proc parseArguments*(cmdLine: cstring): var Vector[UrString] {.
    importcpp: "Urho3D::ParseArguments(@)", header: "ProcessUtils.h".}

when false:
  proc parseArguments*(cmdLine: WString): var Vector[UrString] {.
      importcpp: "Urho3D::ParseArguments(@)", header: "ProcessUtils.h".}

  proc parseArguments*(cmdLine: ptr WcharT): var Vector[UrString] {.
      importcpp: "Urho3D::ParseArguments(@)", header: "ProcessUtils.h".}

proc parseArguments*(argc: cint; argv: cstringArray): var Vector[UrString] {.
    importcpp: "Urho3D::ParseArguments(@)", header: "ProcessUtils.h".}

proc getArguments*(): var Vector[UrString] {.
    importcpp: "Urho3D::GetArguments(@)", header: "ProcessUtils.h".}

proc getConsoleInput*(): UrString {.importcpp: "Urho3D::GetConsoleInput(@)", 
                                    header: "ProcessUtils.h".}

proc getPlatform*(): UrString {.importcpp: "Urho3D::GetPlatform(@)", 
                                header: "ProcessUtils.h".}

proc getNumPhysicalCPUs*(): cuint {.importcpp: "Urho3D::GetNumPhysicalCPUs(@)", 
                                    header: "ProcessUtils.h".}

proc getNumLogicalCPUs*(): cuint {.importcpp: "Urho3D::GetNumLogicalCPUs(@)", 
                                   header: "ProcessUtils.h".}