
{.compile: "urhowrap.cpp".}
{.link: "urho3d.lib".}

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
