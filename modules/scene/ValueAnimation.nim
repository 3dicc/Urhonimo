

import 
  resource, variant, stringHash, vector, urstr

discard "forward decl of XMLElement"
type 
  InterpMethod* = enum 
    IM_LINEAR = 0, IM_SPLINE



type 
  VAnimKeyFrame* {.importc: "Urho3D::VAnimKeyFrame", header: "ValueAnimation.h".} = object 
    time* {.importc: "time_".}: cfloat
    value* {.importc: "value_".}: Variant



type 
  VAnimEventFrame* {.importc: "Urho3D::VAnimEventFrame", 
                     header: "ValueAnimation.h".} = object 
    time* {.importc: "time_".}: cfloat
    eventType* {.importc: "eventType_".}: StringHash
    eventData* {.importc: "eventData_".}: VariantMap



type 
  ValueAnimation* {.importc: "Urho3D::ValueAnimation", 
                    header: "ValueAnimation.h".} = object of Resource
    owner* {.importc: "owner_".}: pointer
    interpolationMethod* {.importc: "interpolationMethod_".}: InterpMethod
    splineTension* {.importc: "splineTension_".}: cfloat
    valueType* {.importc: "valueType_".}: VariantType
    interpolatable* {.importc: "interpolatable_".}: bool
    beginTime* {.importc: "beginTime_".}: cfloat
    endTime* {.importc: "endTime_".}: cfloat
    keyFrames* {.importc: "keyFrames_".}: Vector[VAnimKeyFrame]
    splineTangents* {.importc: "splineTangents_".}: VariantVector
    splineTangentsDirty* {.importc: "splineTangentsDirty_".}: bool
    eventFrames* {.importc: "eventFrames_".}: Vector[VAnimEventFrame]


proc getType*(this: ValueAnimation): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ValueAnimation.h".}
proc getBaseType*(this: ValueAnimation): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ValueAnimation.h".}
proc getTypeName*(this: ValueAnimation): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ValueAnimation.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::ValueAnimation::GetTypeStatic(@)", 
    header: "ValueAnimation.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::ValueAnimation::GetTypeNameStatic(@)", 
    header: "ValueAnimation.h".}

when false:
  proc load*(this: var ValueAnimation; source: var Deserializer): bool {.
      importcpp: "Load", header: "ValueAnimation.h".}
  proc save*(this: ValueAnimation; dest: var Serializer): bool {.noSideEffect, 
      importcpp: "Save", header: "ValueAnimation.h".}
  proc loadXML*(this: var ValueAnimation; source: XMLElement): bool {.
      importcpp: "LoadXML", header: "ValueAnimation.h".}
  proc saveXML*(this: ValueAnimation; dest: var XMLElement): bool {.noSideEffect, 
      importcpp: "SaveXML", header: "ValueAnimation.h".}
    
proc setOwner*(this: var ValueAnimation; owner: pointer) {.
    importcpp: "SetOwner", header: "ValueAnimation.h".}
proc setInterpolationMethod*(this: var ValueAnimation; `method`: InterpMethod) {.
    importcpp: "SetInterpolationMethod", header: "ValueAnimation.h".}
proc setSplineTension*(this: var ValueAnimation; tension: cfloat) {.
    importcpp: "SetSplineTension", header: "ValueAnimation.h".}
proc setValueType*(this: var ValueAnimation; valueType: VariantType) {.
    importcpp: "SetValueType", header: "ValueAnimation.h".}
proc setKeyFrame*(this: var ValueAnimation; time: cfloat; value: Variant): bool {.
    importcpp: "SetKeyFrame", header: "ValueAnimation.h".}
proc setEventFrame*(this: var ValueAnimation; time: cfloat; 
                    eventType: StringHash; eventData: VariantMap) {.
    importcpp: "SetEventFrame", header: "ValueAnimation.h".}
proc isValid*(this: ValueAnimation): bool {.noSideEffect, importcpp: "IsValid", 
    header: "ValueAnimation.h".}
proc getOwner*(this: ValueAnimation): pointer {.noSideEffect, 
    importcpp: "GetOwner", header: "ValueAnimation.h".}
proc getInterpolationMethod*(this: ValueAnimation): InterpMethod {.noSideEffect, 
    importcpp: "GetInterpolationMethod", header: "ValueAnimation.h".}
proc getSplineTension*(this: ValueAnimation): cfloat {.noSideEffect, 
    importcpp: "GetSplineTension", header: "ValueAnimation.h".}
proc getValueType*(this: ValueAnimation): VariantType {.noSideEffect, 
    importcpp: "GetValueType", header: "ValueAnimation.h".}
proc getBeginTime*(this: ValueAnimation): cfloat {.noSideEffect, 
    importcpp: "GetBeginTime", header: "ValueAnimation.h".}
proc getEndTime*(this: ValueAnimation): cfloat {.noSideEffect, 
    importcpp: "GetEndTime", header: "ValueAnimation.h".}
proc getAnimationValue*(this: var ValueAnimation; scaledTime: cfloat): Variant {.
    importcpp: "GetAnimationValue", header: "ValueAnimation.h".}
proc hasEventFrames*(this: ValueAnimation): bool {.noSideEffect, 
    importcpp: "HasEventFrames", header: "ValueAnimation.h".}
proc getEventFrames*(this: ValueAnimation; beginTime: cfloat; endTime: cfloat; 
                     eventFrames: var PODVector[ptr VAnimEventFrame]) {.
    noSideEffect, importcpp: "GetEventFrames", header: "ValueAnimation.h".}