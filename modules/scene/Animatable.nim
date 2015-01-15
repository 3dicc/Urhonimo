

import 
  hashSet, serializable, valueAnimationInfo

discard "forward decl of Animatable"
discard "forward decl of ValueAnimation"
discard "forward decl of AttributeAnimationInfo"
discard "forward decl of ObjectAnimation"
type 
  AttributeAnimationInfo* {.importc: "Urho3D::AttributeAnimationInfo", 
                            header: "Animatable.h".} = object of ValueAnimationInfo
    attributeInfo* {.importc: "attributeInfo_".}: AttributeInfo


proc constructAttributeAnimationInfo*(animatable: ptr Animatable; 
                                      attributeInfo: AttributeInfo; 
                                      attributeAnimation: ptr ValueAnimation; 
                                      wrapMode: WrapMode; speed: cfloat): AttributeAnimationInfo {.
    importcpp: "Urho3D::AttributeAnimationInfo(@)", header: "Animatable.h".}
proc constructAttributeAnimationInfo*(other: AttributeAnimationInfo): AttributeAnimationInfo {.
    importcpp: "Urho3D::AttributeAnimationInfo(@)", header: "Animatable.h".}
proc destroyAttributeAnimationInfo*(this: var AttributeAnimationInfo) {.
    importcpp: "#.~AttributeAnimationInfo()", header: "Animatable.h".}
proc getAttributeInfo*(this: AttributeAnimationInfo): AttributeInfo {.
    noSideEffect, importcpp: "GetAttributeInfo", header: "Animatable.h".}

type 
  Animatable* {.importc: "Urho3D::Animatable", header: "Animatable.h".} = object of Serializable
    animationEnabled* {.importc: "animationEnabled_".}: bool
    objectAnimation* {.importc: "objectAnimation_".}: SharedPtr[ObjectAnimation]
    animatedNetworkAttributes* {.importc: "animatedNetworkAttributes_".}: HashSet[
        ptr AttributeInfo]
    attributeAnimationInfos* {.importc: "attributeAnimationInfos_".}: HashMap[
        UrString, SharedPtr[AttributeAnimationInfo]]


proc getType*(this: Animatable): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Animatable.h".}
proc getBaseType*(this: Animatable): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Animatable.h".}
proc getTypeName*(this: Animatable): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Animatable.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Animatable::GetTypeStatic(@)", header: "Animatable.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Animatable::GetTypeNameStatic(@)", 
    header: "Animatable.h".}
proc constructAnimatable*(context: ptr Context): Animatable {.
    importcpp: "Urho3D::Animatable(@)", header: "Animatable.h".}
proc destroyAnimatable*(this: var Animatable) {.importcpp: "#.~Animatable()", 
    header: "Animatable.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Animatable::RegisterObject(@)", header: "Animatable.h".}
proc loadXML*(this: var Animatable; source: XMLElement; 
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML", 
    header: "Animatable.h".}
proc saveXML*(this: Animatable; dest: var XMLElement): bool {.noSideEffect, 
    importcpp: "SaveXML", header: "Animatable.h".}
proc setAnimationEnabled*(this: var Animatable; enable: bool) {.
    importcpp: "SetAnimationEnabled", header: "Animatable.h".}
proc setObjectAnimation*(this: var Animatable; 
                         objectAnimation: ptr ObjectAnimation) {.
    importcpp: "SetObjectAnimation", header: "Animatable.h".}
proc setAttributeAnimation*(this: var Animatable; name: UrString; 
                            attributeAnimation: ptr ValueAnimation; 
                            wrapMode: WrapMode = wm_Loop; speed: cfloat = 1.0) {.
    importcpp: "SetAttributeAnimation", header: "Animatable.h".}
proc setAttributeAnimationWrapMode*(this: var Animatable; name: UrString; 
                                    wrapMode: WrapMode) {.
    importcpp: "SetAttributeAnimationWrapMode", header: "Animatable.h".}
proc setAttributeAnimationSpeed*(this: var Animatable; name: UrString; 
                                 speed: cfloat) {.
    importcpp: "SetAttributeAnimationSpeed", header: "Animatable.h".}
proc getAnimationEnabled*(this: Animatable): bool {.noSideEffect, 
    importcpp: "GetAnimationEnabled", header: "Animatable.h".}
proc getObjectAnimation*(this: Animatable): ptr ObjectAnimation {.noSideEffect, 
    importcpp: "GetObjectAnimation", header: "Animatable.h".}
proc getAttributeAnimation*(this: Animatable; name: UrString): ptr ValueAnimation {.
    noSideEffect, importcpp: "GetAttributeAnimation", header: "Animatable.h".}
proc getAttributeAnimationWrapMode*(this: Animatable; name: UrString): WrapMode {.
    noSideEffect, importcpp: "GetAttributeAnimationWrapMode", 
    header: "Animatable.h".}
proc getAttributeAnimationSpeed*(this: Animatable; name: UrString): cfloat {.
    noSideEffect, importcpp: "GetAttributeAnimationSpeed", 
    header: "Animatable.h".}
proc setObjectAnimationAttr*(this: var Animatable; value: ResourceRef) {.
    importcpp: "SetObjectAnimationAttr", header: "Animatable.h".}
proc getObjectAnimationAttr*(this: Animatable): ResourceRef {.noSideEffect, 
    importcpp: "GetObjectAnimationAttr", header: "Animatable.h".}