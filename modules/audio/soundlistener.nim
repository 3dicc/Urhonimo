

import 
  component


type 
  SoundListener* {.importc: "Urho3D::SoundListener", header: "SoundListener.h".} = object of Component
  

proc getType*(this: SoundListener): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "SoundListener.h".}
proc getBaseType*(this: SoundListener): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "SoundListener.h".}
proc getTypeName*(this: SoundListener): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "SoundListener.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::SoundListener::GetTypeStatic(@)", 
    header: "SoundListener.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::SoundListener::GetTypeNameStatic(@)", 
    header: "SoundListener.h".}
proc constructSoundListener*(context: ptr Context): SoundListener {.
    importcpp: "Urho3D::SoundListener(@)", header: "SoundListener.h".}
proc destroySoundListener*(this: var SoundListener) {.
    importcpp: "#.~SoundListener()", header: "SoundListener.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::SoundListener::RegisterObject(@)", 
    header: "SoundListener.h".}