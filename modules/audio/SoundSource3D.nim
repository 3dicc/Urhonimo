

import 
  soundSource

discard "forward decl of Audio"
type 
  SoundSource3D* {.importc: "Urho3D::SoundSource3D", header: "SoundSource3D.h".} = object of SoundSource
    nearDistance* {.importc: "nearDistance_".}: cfloat
    farDistance* {.importc: "farDistance_".}: cfloat
    innerAngle* {.importc: "innerAngle_".}: cfloat
    outerAngle* {.importc: "outerAngle_".}: cfloat
    rolloffFactor* {.importc: "rolloffFactor_".}: cfloat


proc getType*(this: SoundSource3D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "SoundSource3D.h".}
proc getBaseType*(this: SoundSource3D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "SoundSource3D.h".}
proc getTypeName*(this: SoundSource3D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "SoundSource3D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::SoundSource3D::GetTypeStatic(@)", 
    header: "SoundSource3D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::SoundSource3D::GetTypeNameStatic(@)", 
    header: "SoundSource3D.h".}
proc constructSoundSource3D*(context: ptr Context): SoundSource3D {.
    importcpp: "Urho3D::SoundSource3D(@)", header: "SoundSource3D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::SoundSource3D::RegisterObject(@)", 
    header: "SoundSource3D.h".}
proc drawDebugGeometry*(this: var SoundSource3D; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "SoundSource3D.h".}
proc update*(this: var SoundSource3D; timeStep: cfloat) {.importcpp: "Update", 
    header: "SoundSource3D.h".}
proc setDistanceAttenuation*(this: var SoundSource3D; nearDistance: cfloat; 
                             farDistance: cfloat; rolloffFactor: cfloat) {.
    importcpp: "SetDistanceAttenuation", header: "SoundSource3D.h".}
proc setAngleAttenuation*(this: var SoundSource3D; innerAngle: cfloat; 
                          outerAngle: cfloat) {.
    importcpp: "SetAngleAttenuation", header: "SoundSource3D.h".}
proc setNearDistance*(this: var SoundSource3D; distance: cfloat) {.
    importcpp: "SetNearDistance", header: "SoundSource3D.h".}
proc setFarDistance*(this: var SoundSource3D; distance: cfloat) {.
    importcpp: "SetFarDistance", header: "SoundSource3D.h".}
proc setInnerAngle*(this: var SoundSource3D; angle: cfloat) {.
    importcpp: "SetInnerAngle", header: "SoundSource3D.h".}
proc setOuterAngle*(this: var SoundSource3D; angle: cfloat) {.
    importcpp: "SetOuterAngle", header: "SoundSource3D.h".}
proc setRolloffFactor*(this: var SoundSource3D; factor: cfloat) {.
    importcpp: "SetRolloffFactor", header: "SoundSource3D.h".}
proc calculateAttenuation*(this: var SoundSource3D) {.
    importcpp: "CalculateAttenuation", header: "SoundSource3D.h".}
proc getNearDistance*(this: SoundSource3D): cfloat {.noSideEffect, 
    importcpp: "GetNearDistance", header: "SoundSource3D.h".}
proc getFarDistance*(this: SoundSource3D): cfloat {.noSideEffect, 
    importcpp: "GetFarDistance", header: "SoundSource3D.h".}
proc getInnerAngle*(this: SoundSource3D): cfloat {.noSideEffect, 
    importcpp: "GetInnerAngle", header: "SoundSource3D.h".}
proc getOuterAngle*(this: SoundSource3D): cfloat {.noSideEffect, 
    importcpp: "GetOuterAngle", header: "SoundSource3D.h".}
proc rollAngleoffFactor*(this: SoundSource3D): cfloat {.noSideEffect, 
    importcpp: "RollAngleoffFactor", header: "SoundSource3D.h".}