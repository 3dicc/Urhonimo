

import 
  animationDefs, resource, ValueAnimation, ValueAnimationInfo, XMLElement,
  hashmap, urstr, ptrs, stringHash, urobject, deserializer, serializer

type 
  ObjectAnimation* {.importc: "Urho3D::ObjectAnimation", 
                     header: "ObjectAnimation.h".} = object of Resource
    attributeAnimationInfos* {.importc: "attributeAnimationInfos_".}: HashMap[
        UrString, SharedPtr[ValueAnimationInfo]]


proc getType*(this: ObjectAnimation): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ObjectAnimation.h".}
proc getBaseType*(this: ObjectAnimation): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ObjectAnimation.h".}
proc getTypeName*(this: ObjectAnimation): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ObjectAnimation.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::ObjectAnimation::GetTypeStatic(@)", 
    header: "ObjectAnimation.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::ObjectAnimation::GetTypeNameStatic(@)", 
    header: "ObjectAnimation.h".}
proc constructObjectAnimation*(context: ptr Context): ObjectAnimation {.
    importcpp: "Urho3D::ObjectAnimation(@)", header: "ObjectAnimation.h".}
proc destroyObjectAnimation*(this: var ObjectAnimation) {.
    importcpp: "#.~ObjectAnimation()", header: "ObjectAnimation.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ObjectAnimation::RegisterObject(@)", 
    header: "ObjectAnimation.h".}
proc beginLoad*(this: var ObjectAnimation; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "ObjectAnimation.h".}
proc save*(this: ObjectAnimation; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "ObjectAnimation.h".}
proc loadXML*(this: var ObjectAnimation; source: XMLElement): bool {.
    importcpp: "LoadXML", header: "ObjectAnimation.h".}
proc saveXML*(this: ObjectAnimation; dest: var XMLElement): bool {.noSideEffect, 
    importcpp: "SaveXML", header: "ObjectAnimation.h".}
proc addAttributeAnimation*(this: var ObjectAnimation; name: UrString; 
                            attributeAnimation: ptr ValueAnimation; 
                            wrapMode: WrapMode = Wm_Loop; speed: cfloat = 1.0) {.
    importcpp: "AddAttributeAnimation", header: "ObjectAnimation.h".}
proc removeAttributeAnimation*(this: var ObjectAnimation; name: UrString) {.
    importcpp: "RemoveAttributeAnimation", header: "ObjectAnimation.h".}
proc removeAttributeAnimation*(this: var ObjectAnimation; 
                               attributeAnimation: ptr ValueAnimation) {.
    importcpp: "RemoveAttributeAnimation", header: "ObjectAnimation.h".}
proc getAttributeAnimation*(this: ObjectAnimation; name: UrString): ptr ValueAnimation {.
    noSideEffect, importcpp: "GetAttributeAnimation", 
    header: "ObjectAnimation.h".}
proc getAttributeAnimationWrapMode*(this: ObjectAnimation; name: UrString): WrapMode {.
    noSideEffect, importcpp: "GetAttributeAnimationWrapMode", 
    header: "ObjectAnimation.h".}
proc getAttributeAnimationSpeed*(this: ObjectAnimation; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetAttributeAnimationSpeed", 
    header: "ObjectAnimation.h".}
proc getAttributeAnimationInfos*(this: ObjectAnimation): HashMap[UrString, 
    SharedPtr[ValueAnimationInfo]] {.noSideEffect, 
                                     importcpp: "GetAttributeAnimationInfos", 
                                     header: "ObjectAnimation.h".}