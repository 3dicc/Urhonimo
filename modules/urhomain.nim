when not defined(cpp):
  {.error: "Urhonimo requires that you compile in cpp mode".}

{.compile: "urhowrap.cpp".}
when defined(release):
  {.error: "we have no release build of Urho3D.lib yet".}
else:
  when defined(windows):
    {.link: "../lib/Urho3D_d.lib".}
    {.link: r"C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x86\d3d9.lib".}
    {.link: r"C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x86\d3dcompiler.lib".}
    {.link: r"kernel32.lib".}
    {.link: r"user32.lib".}
    {.link: r"winmm.lib".}
    {.link: r"gdi32.lib".}
    {.link: r"winspool.lib".}
    {.link: r"shell32.lib".}
    {.link: r"ole32.lib".}
    {.link: r"oleaut32.lib".}
    {.link: r"version.lib".}

    {.link: r"uuid.lib".}
    {.link: r"comdlg32.lib".}
    {.link: r"advapi32.lib".}
    {.link: r"imm32.lib".}
    {.link: r"ws2_32.lib".}
    {.link: r"dbghelp.lib".}
  when defined(linux):
    {.passL: "-lGL".}
    {.passL: "-lX11".}
    {.passL: "../lib/libUrho3D.a".}
  when defined(macosx):
    {.passL: "-framework OpenGL".}
    {.passL: "-framework CoreAudio".}
    {.passL: "-framework AudioToolbox".}
    {.passL: "-framework AudioUnit".}
    {.passL: "-framework Carbon".}
    {.passL: "-framework IOKit".}
    {.passL: "-framework Cocoa".}
    {.passL: "-framework ForceFeedback".}
    {.passL: "../lib/libUrho3D.a".}
#  {.passL: "/MD".}

import urobject, ui, resourcecache, urstr, font, stringHash, variant, input,
  renderer, vector3, quaternion, color, file, component, engine

proc getSubsystem*[T](): ptr T {.importcpp: "getSubsystem<'*0>()", cdecl,
  header: "urhowrap.h".}

{.pragma: urh, importc, cdecl, header: "urhowrap.h".}

proc openUrho3D*(fullScreen: bool) {.urh.}

proc closeUrho3D*() {.urh.}

proc getContext*(): ptr Context {.urh.}

proc getSubsystemUI*(): ptr UI {.urh.}

proc getEngine*(): ptr Engine {.urh.}

proc getSubsystemResourceCache*(): ptr ResourceCache {.urh.}
proc getSubsystemRenderer*(): ptr Renderer {.urh.}
proc getSubsystemInput*(): ptr Input {.urh.}


proc getFont*(fontName: UrString): ptr Font {.urh.}

type
  HandlerFunc* = proc (userData: pointer, eventType: StringHash;
                       eventData: var VariantMap) {.cdecl.}

proc subscribeToEvent*(eventType: StringHash; fn: HandlerFunc;
                       userData: pointer = nil) {.urh.}

proc unsubscribeFromEvent*(eventType: StringHash) {.urh.}

proc parseArguments*() {.urh}
proc runMainLoop*(): cint {.urh.}

converter toUrStringHash*(s: string): StringHash =
  result = stringHash.constructStringHash(cstring(s))

converter toUrString*(s: string): UrString =
  result = urstr.constructString(s, s.len.cuint)

proc cnew*[T](x: T): ptr T {.importcpp: "(new '*0#@)", nodecl.}

template vec3*(a, b, c: float): Vector3 =
  constructVector3(a.float32, b.float32, c.float32)

template quat*(a, b, c: float): Quaternion =
  constructQuaternion(a.float32, b.float32, c.float32)

template col*(r, g, b: float): Color =
  constructColor(r.float32, g.float32, b.float32)

proc saveXML*(sc: ptr Scene, f: UrFile) {.importcpp: "#.SaveXML(@)", header:
  "File.h".}

proc loadXML*(sc: ptr Scene, f: UrFile) {.importcpp: "#.LoadXML(@)", header:
  "File.h".}
