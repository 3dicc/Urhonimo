

import 
  resource

discard "forward decl of Animation2D"
discard "forward decl of Sprite2D"
discard "forward decl of XMLElement"
discard "forward decl of XMLFile"
type 
  AnimationSet2D* {.importc: "Urho3D::AnimationSet2D", 
                    header: "AnimationSet2D.h".} = object of Resource
    sprites* {.importc: "sprites_".}: HashMap[cuint, SharedPtr[Sprite2D]]
    animations* {.importc: "animations_".}: Vector[SharedPtr[Animation2D]]
    loadXMLFile* {.importc: "loadXMLFile_".}: SharedPtr[XMLFile]


proc getType*(this: AnimationSet2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "AnimationSet2D.h".}
proc getBaseType*(this: AnimationSet2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "AnimationSet2D.h".}
proc getTypeName*(this: AnimationSet2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "AnimationSet2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::AnimationSet2D::GetTypeStatic(@)", 
    header: "AnimationSet2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::AnimationSet2D::GetTypeNameStatic(@)", 
    header: "AnimationSet2D.h".}
proc constructAnimationSet2D*(context: ptr Context): AnimationSet2D {.
    importcpp: "Urho3D::AnimationSet2D(@)", header: "AnimationSet2D.h".}
proc destroyAnimationSet2D*(this: var AnimationSet2D) {.
    importcpp: "#.~AnimationSet2D()", header: "AnimationSet2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::AnimationSet2D::RegisterObject(@)", 
    header: "AnimationSet2D.h".}
proc beginLoad*(this: var AnimationSet2D; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "AnimationSet2D.h".}
proc endLoad*(this: var AnimationSet2D): bool {.importcpp: "EndLoad", 
    header: "AnimationSet2D.h".}
proc getNumAnimations*(this: AnimationSet2D): cuint {.noSideEffect, 
    importcpp: "GetNumAnimations", header: "AnimationSet2D.h".}
proc getAnimation*(this: AnimationSet2D; index: cuint): ptr Animation2D {.
    noSideEffect, importcpp: "GetAnimation", header: "AnimationSet2D.h".}
proc getAnimation*(this: AnimationSet2D; name: UrString): ptr Animation2D {.
    noSideEffect, importcpp: "GetAnimation", header: "AnimationSet2D.h".}