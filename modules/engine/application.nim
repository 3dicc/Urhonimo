

import
  context, UrObject, engine, urobject, urstr, stringHash, ptrs, variant

type
  Application* {.importc: "Urho3D::Application", header: "Application.h".} = object of UrObject
    engine* {.importc: "engine_".}: SharedPtr[Engine]
    engineParameters* {.importc: "engineParameters_".}: VariantMap
    startupErrors* {.importc: "startupErrors_".}: UrString
    exitCode* {.importc: "exitCode_".}: cint


proc getType*(this: Application): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Application.h".}
proc getBaseType*(this: Application): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Application.h".}
proc getTypeName*(this: Application): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Application.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Application::GetTypeStatic(@)", header: "Application.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Application::GetTypeNameStatic(@)",
    header: "Application.h".}
proc constructApplication*(context: ptr Context): Application {.
    importcpp: "Urho3D::Application(@)", header: "Application.h".}
proc setup*(this: var Application) {.importcpp: "Setup", header: "Application.h".}
proc start*(this: var Application) {.importcpp: "Start", header: "Application.h".}
proc stop*(this: var Application) {.importcpp: "Stop", header: "Application.h".}
proc run*(this: var Application): cint {.importcpp: "Run",
    header: "Application.h".}
proc errorExit*(this: var Application; message: UrString) {.
    importcpp: "ErrorExit", header: "Application.h".}

proc getSubsystem*[T](this: var Application): ptr T {.
  importcpp: "#.GetSubsystem<'*0>(@)", cdecl, nodecl.}
