

import 
  attribute, UrObject, hashSet, stringHash, ptrs, variant, hashMap, urstr,
  vector, valueanimation

proc constructValueAnimation*(context: ptr Context): ValueAnimation {.
    importcpp: "Urho3D::ValueAnimation(@)", header: "ValueAnimation.h".}
proc destroyValueAnimation*(this: var ValueAnimation) {.
    importcpp: "#.~ValueAnimation()", header: "ValueAnimation.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::ValueAnimation::RegisterObject(@)", 
    header: "ValueAnimation.h".}

proc constructContext*(): Context {.importcpp: "Urho3D::Context(@)", 
                                    header: "Context.h".}
proc destroyContext*(this: var Context) {.importcpp: "#.~Context()", 
    header: "Context.h".}
proc createObject*(this: var Context; objectType: StringHash): SharedPtr[
    UrObject] {.importcpp: "CreateObject", header: "Context.h".}

when false:
  proc registerFactory*(this: var Context; factory: ptr ObjectFactory) {.
      importcpp: "RegisterFactory", header: "Context.h".}
  proc registerFactory*(this: var Context; factory: ptr ObjectFactory; 
                        category: cstring) {.importcpp: "RegisterFactory", 
      header: "Context.h".}
proc registerSubsystem*(this: var Context; subsystem: ptr UrObject) {.
    importcpp: "RegisterSubsystem", header: "Context.h".}
proc removeSubsystem*(this: var Context; objectType: StringHash) {.
    importcpp: "RemoveSubsystem", header: "Context.h".}
proc registerAttribute*(this: var Context; objectType: StringHash; 
                        attr: AttributeInfo) {.importcpp: "RegisterAttribute", 
    header: "Context.h".}
proc removeAttribute*(this: var Context; objectType: StringHash; name: cstring) {.
    importcpp: "RemoveAttribute", header: "Context.h".}
proc updateAttributeDefaultValue*(this: var Context; objectType: StringHash; 
                                  name: cstring; defaultValue: Variant) {.
    importcpp: "UpdateAttributeDefaultValue", header: "Context.h".}
proc getEventDataMap*(this: var Context): var VariantMap {.
    importcpp: "GetEventDataMap", header: "Context.h".}
proc copyBaseAttributes*(this: var Context; baseType: StringHash; 
                         derivedType: StringHash) {.
    importcpp: "CopyBaseAttributes", header: "Context.h".}
proc registerFactory*[T](this: var Context; dummy: ptr T) {.
  importcpp: "#.RegisterFactory<'*2>()", header: "Context.h".}

when false:
  proc registerFactory*[T](this: var Context; category: cstring) {.
      importcpp: "RegisterFactory", header: "Context.h".}

proc removeSubsystem*[T](this: var Context) {.importcpp: "RemoveSubsystem", 
    header: "Context.h".}
proc registerAttribute*[T](this: var Context; attr: AttributeInfo) {.
    importcpp: "RegisterAttribute", header: "Context.h".}
proc removeAttribute*[T](this: var Context; name: cstring) {.
    importcpp: "RemoveAttribute", header: "Context.h".}
proc copyBaseAttributes*[T, U](this: var Context) {.
    importcpp: "CopyBaseAttributes", header: "Context.h".}
proc updateAttributeDefaultValue*[T](this: var Context; name: cstring; 
                                     defaultValue: Variant) {.
    importcpp: "UpdateAttributeDefaultValue", header: "Context.h".}
proc getSubsystem*(this: Context; `type`: StringHash): ptr UrObject {.
    noSideEffect, importcpp: "GetSubsystem", header: "Context.h".}
proc getSubsystems*(this: Context): HashMap[StringHash, SharedPtr[UrObject]] {.
    noSideEffect, importcpp: "GetSubsystems", header: "Context.h".}
proc getObjectFactories*(this: Context): HashMap[StringHash, 
    SharedPtr[ObjectFactory]] {.noSideEffect, importcpp: "GetObjectFactories", 
                                header: "Context.h".}
proc getObjectCategories*(this: Context): HashMap[UrString, Vector[StringHash]] {.
    noSideEffect, importcpp: "GetObjectCategories", header: "Context.h".}
proc getEventSender*(this: Context): ptr UrObject {.noSideEffect, 
    importcpp: "GetEventSender", header: "Context.h".}
proc getEventHandler*(this: Context): ptr EventHandler {.noSideEffect, 
    importcpp: "GetEventHandler", header: "Context.h".}
proc getTypeName*(this: Context; objectType: StringHash): UrString {.
    noSideEffect, importcpp: "GetTypeName", header: "Context.h".}
proc getAttribute*(this: var Context; objectType: StringHash; name: cstring): ptr AttributeInfo {.
    importcpp: "GetAttribute", header: "Context.h".}
proc getSubsystem*[T](this: Context): ptr T {.noSideEffect, 
    importcpp: "GetSubsystem", header: "Context.h".}
proc getAttribute*[T](this: var Context; name: cstring): ptr AttributeInfo {.
    importcpp: "GetAttribute", header: "Context.h".}
proc getAttributes*(this: Context; `type`: StringHash): ptr Vector[AttributeInfo] {.
    noSideEffect, importcpp: "GetAttributes", header: "Context.h".}
proc getNetworkAttributes*(this: Context; `type`: StringHash): ptr Vector[
    AttributeInfo] {.noSideEffect, importcpp: "GetNetworkAttributes", 
                     header: "Context.h".}
proc getAllAttributes*(this: Context): HashMap[StringHash, Vector[AttributeInfo]] {.
    noSideEffect, importcpp: "GetAllAttributes", header: "Context.h".}
proc getEventReceivers*(this: var Context; sender: ptr UrObject; 
                        eventType: StringHash): ptr HashSet[ptr UrObject] {.
    importcpp: "GetEventReceivers", header: "Context.h".}
proc getEventReceivers*(this: var Context; eventType: StringHash): ptr HashSet[
    ptr UrObject] {.importcpp: "GetEventReceivers", header: "Context.h".}

when false:
  proc registerFactory*[T]() {.
    importcpp: "Context::RegisterFactory(@)", header: "Context.h".}
  proc registerFactory*[T](category: cstring){.
    importcpp: "Context::RegisterFactory(@)", header: "Context.h".}

  proc getSubsystem*[T](): ptr T {.
    importcpp: "Context::GetSubsystem(@)", header: "Context.h", noSideEffect.}

proc removeSubsystem*[T](){.
  importcpp: "Context::RemoveSubsystem(@)", header: "Context.h".}
proc registerAttribute*[T](attr: AttributeInfo){.
  importcpp: "Context::RegisterAttribute(@)", header: "Context.h".}
proc removeAttribute*[T](name: cstring){.
  importcpp: "Context::RemoveAttribute(@)", header: "Context.h".}
proc copyBaseAttributes*[T, U](){.
  importcpp: "Context::CopyBaseAttributes(@)", header: "Context.h".}
proc getAttribute*[T](name: cstring): ptr AttributeInfo {.
  importcpp: "Context::GetAttribute(@)", header: "Context.h".}
proc updateAttributeDefaultValue*[T](name: cstring; 
    defaultValue: Variant) {.
  importcpp: "Context::UpdateAttributeDefaultValue(@)", header: "Context.h".}

