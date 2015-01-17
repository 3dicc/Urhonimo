
{.compile: "urhowrap.cpp".}
when defined(release):
  {.error: "we have no release build of Urho3D.lib yet".}
else:
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

#  {.passL: "/MD".}

import urobject, ui, resourcecache, urstr, font, stringHash, variant

{.pragma: urh, importc, cdecl, header: "urhowrap.h".}

proc openUrho3D*(fullScreen: bool) {.urh.}

proc closeUrho3D*() {.urh.}

proc getContext*(): ptr Context {.urh.}

proc getSubsystemUI*(): ptr UI {.urh.}

proc getSubsystemResourceCache*(): ptr ResourceCache {.urh.}

proc getFont*(fontName: UrString): ptr Font {.urh.}

type
  HandlerFunc* = proc (userData: pointer, eventType: StringHash;
                       eventData: pointer) {.cdecl.}

proc registerEvent*(fn: HandlerFunc, userData: pointer;
                    eventType: StringHash) {.urh.}

proc parseArguments*() {.urh}
proc runMainLoop*(): cint {.urh.}

converter toUrString*(s: string): UrString =
  result = urstr.constructString(s, s.len.cuint)

converter toUrStringHash*(s: string): StringHash =
  result = stringHash.constructStringHash(s.cstring)

proc cnew*[T](x: T): ptr T {.importcpp: "(new '*0#@)", nodecl.}
