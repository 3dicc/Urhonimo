

import 
  linkedList, variant, refcounted, urstr, stringHash, hashMap, vector, ptrs,
  attribute, hashset

type 
  ObjectFactory* {.importc: "Urho3D::ObjectFactory", header: "Object.h".} = object of RefCounted
    context* {.importc: "context_".}: ptr Context
    `type`* {.importc: "type_".}: StringHash
    baseType* {.importc: "baseType_".}: StringHash
    typeName* {.importc: "typeName_".}: UrString


  EventHandler* {.importc: "Urho3D::EventHandler", header: "Object.h".} = object of LinkedListNode
    receiver* {.importc: "receiver_".}: ptr UrObject
    sender* {.importc: "sender_".}: ptr UrObject
    eventType* {.importc: "eventType_".}: StringHash
    userData* {.importc: "userData_".}: pointer


  UrObject* {.importc: "Urho3D::Object", header: "Object.h".} = object of RefCounted
    context* {.importc: "context_".}: ptr Context
    eventHandlers* {.importc: "eventHandlers_".}: LinkedList[EventHandler]

  Context* {.importc: "Urho3D::Context", header: "Context.h".} = object of RefCounted
    factories* {.importc: "factories_".}: HashMap[StringHash, 
        SharedPtr[ObjectFactory]]
    subsystems* {.importc: "subsystems_".}: HashMap[StringHash, 
        SharedPtr[UrObject]]
    attributes* {.importc: "attributes_".}: HashMap[StringHash, 
        Vector[AttributeInfo]]
    networkAttributes* {.importc: "networkAttributes_".}: HashMap[StringHash, 
        Vector[AttributeInfo]]
    eventReceivers* {.importc: "eventReceivers_".}: HashMap[StringHash, 
        HashSet[ptr UrObject]]
    specificEventReceivers* {.importc: "specificEventReceivers_".}: HashMap[
        ptr UrObject, HashMap[StringHash, HashSet[ptr UrObject]]]
    eventSenders* {.importc: "eventSenders_".}: PODVector[ptr UrObject]
    eventDataMaps* {.importc: "eventDataMaps_".}: PODVector[ptr VariantMap]
    eventHandler* {.importc: "eventHandler_".}: ptr EventHandler
    objectCategories* {.importc: "objectCategories_".}: HashMap[UrString, 
        Vector[StringHash]]



proc getBaseTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Object::GetBaseTypeStatic(@)", header: "Object.h".}
proc constructObject*(context: ptr Context): UrObject {.
    importcpp: "Urho3D::Object(@)", header: "Object.h".}
proc destroyObject*(this: var UrObject) {.importcpp: "#.~Object()", 
    header: "Object.h".}
proc getType*(this: UrObject): StringHash {.noSideEffect, importcpp: "GetType", 
    header: "Object.h".}
proc getBaseType*(this: UrObject): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Object.h".}
proc getTypeName*(this: UrObject): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Object.h".}
proc onEvent*(this: var UrObject; sender: ptr UrObject; eventType: StringHash; 
              eventData: var VariantMap) {.importcpp: "OnEvent", 
    header: "Object.h".}
proc subscribeToEvent*(this: var UrObject; eventType: StringHash; 
                       handler: ptr EventHandler) {.
    importcpp: "SubscribeToEvent", header: "Object.h".}
proc subscribeToEvent*(this: var UrObject; sender: ptr UrObject; 
                       eventType: StringHash; handler: ptr EventHandler) {.
    importcpp: "SubscribeToEvent", header: "Object.h".}
proc unsubscribeFromEvent*(this: var UrObject; eventType: StringHash) {.
    importcpp: "UnsubscribeFromEvent", header: "Object.h".}
proc unsubscribeFromEvent*(this: var UrObject; sender: ptr UrObject; 
                           eventType: StringHash) {.
    importcpp: "UnsubscribeFromEvent", header: "Object.h".}
proc unsubscribeFromEvents*(this: var UrObject; sender: ptr UrObject) {.
    importcpp: "UnsubscribeFromEvents", header: "Object.h".}
proc unsubscribeFromAllEvents*(this: var UrObject) {.
    importcpp: "UnsubscribeFromAllEvents", header: "Object.h".}
proc unsubscribeFromAllEventsExcept*(this: var UrObject; 
                                     exceptions: PODVector[StringHash]; 
                                     onlyUserData: bool) {.
    importcpp: "UnsubscribeFromAllEventsExcept", header: "Object.h".}
proc sendEvent*(this: var UrObject; eventType: StringHash) {.
    importcpp: "SendEvent", header: "Object.h".}
proc sendEvent*(this: var UrObject; eventType: StringHash; 
                eventData: var VariantMap) {.importcpp: "SendEvent", 
    header: "Object.h".}
proc getEventDataMap*(this: UrObject): var VariantMap {.noSideEffect, 
    importcpp: "GetEventDataMap", header: "Object.h".}
proc getContext*(this: UrObject): ptr Context {.noSideEffect, 
    importcpp: "GetContext", header: "Object.h".}
proc getSubsystem*(this: UrObject; `type`: StringHash): ptr UrObject {.
    noSideEffect, importcpp: "GetSubsystem", header: "Object.h".}
proc getEventSender*(this: UrObject): ptr UrObject {.noSideEffect, 
    importcpp: "GetEventSender", header: "Object.h".}
proc getEventHandler*(this: UrObject): ptr EventHandler {.noSideEffect, 
    importcpp: "GetEventHandler", header: "Object.h".}
proc hasSubscribedToEvent*(this: UrObject; eventType: StringHash): bool {.
    noSideEffect, importcpp: "HasSubscribedToEvent", header: "Object.h".}
proc hasSubscribedToEvent*(this: UrObject; sender: ptr UrObject; 
                           eventType: StringHash): bool {.noSideEffect, 
    importcpp: "HasSubscribedToEvent", header: "Object.h".}
proc hasEventHandlers*(this: UrObject): bool {.noSideEffect, 
    importcpp: "HasEventHandlers", header: "Object.h".}
proc getSubsystem*[T](this: UrObject): ptr T {.noSideEffect, 
    importcpp: "GetSubsystem", header: "Object.h".}
proc getCategory*(this: UrObject): UrString {.noSideEffect, 
    importcpp: "GetCategory", header: "Object.h".}
proc getSubsystem*[T](): ptr T {.noSideEffect, 
  importcpp: "Object::GetSubsystem<'*0>()", header: "Object.h".}

proc constructObjectFactory*(context: ptr Context): ObjectFactory {.
    importcpp: "Urho3D::ObjectFactory(@)", header: "Object.h".}
proc createObject*(this: var ObjectFactory): SharedPtr[UrObject] {.
    importcpp: "CreateObject", header: "Object.h".}
proc getContext*(this: ObjectFactory): ptr Context {.noSideEffect, 
    importcpp: "GetContext", header: "Object.h".}
proc getType*(this: ObjectFactory): StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Object.h".}
proc getBaseType*(this: ObjectFactory): StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Object.h".}
proc getTypeName*(this: ObjectFactory): UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Object.h".}

type 
  ObjectFactoryImpl* {.importc: "Urho3D::ObjectFactoryImpl", header: "Object.h".}[
      T] = object of ObjectFactory
  

proc constructObjectFactoryImpl*[T](context: ptr Context): ObjectFactoryImpl[T] {.
    importcpp: "Urho3D::ObjectFactoryImpl(@)", header: "Object.h".}
proc createObject*[T](this: var ObjectFactoryImpl[T]): SharedPtr[UrObject] {.
    importcpp: "CreateObject", header: "Object.h".}

proc constructEventHandler*(receiver: ptr UrObject): EventHandler {.
    importcpp: "Urho3D::EventHandler(@)", header: "Object.h".}
proc constructEventHandler*(receiver: ptr UrObject; userData: pointer): EventHandler {.
    importcpp: "Urho3D::EventHandler(@)", header: "Object.h".}
proc destroyEventHandler*(this: var EventHandler) {.
    importcpp: "#.~EventHandler()", header: "Object.h".}
proc setSenderAndEventType*(this: var EventHandler; sender: ptr UrObject; 
                            eventType: StringHash) {.
    importcpp: "SetSenderAndEventType", header: "Object.h".}
proc invoke*(this: var EventHandler; eventData: var VariantMap) {.
    importcpp: "Invoke", header: "Object.h".}
proc getReceiver*(this: EventHandler): ptr UrObject {.noSideEffect, 
    importcpp: "GetReceiver", header: "Object.h".}
proc getSender*(this: EventHandler): ptr UrObject {.noSideEffect, 
    importcpp: "GetSender", header: "Object.h".}
proc getEventType*(this: EventHandler): StringHash {.noSideEffect, 
    importcpp: "GetEventType", header: "Object.h".}
proc getUserData*(this: EventHandler): pointer {.noSideEffect, 
    importcpp: "GetUserData", header: "Object.h".}

when false:
  # we have our own event handler implementation that plays nicer with Nim
  type 
    EventHandlerImpl* {.importc: "Urho3D::EventHandlerImpl", header: "Object.h".}[
        T] = object of EventHandler
      function* {.importc: "function_".}: HandlerFunctionPtr


    HandlerFunctionPtr* = proc (a2: StringHash; a3: var VariantMap) {.
        memberfuncptr.}
  proc constructEventHandlerImpl*[T](receiver: ptr T; function: HandlerFunctionPtr): EventHandlerImpl[
      T] {.importcpp: "Urho3D::EventHandlerImpl(@)", header: "Object.h".}
  proc constructEventHandlerImpl*[T](receiver: ptr T; 
                                     function: HandlerFunctionPtr; 
                                     userData: pointer): EventHandlerImpl[T] {.
      importcpp: "Urho3D::EventHandlerImpl(@)", header: "Object.h".}
  proc invoke*[T](this: var EventHandlerImpl[T]; eventData: var VariantMap) {.
      importcpp: "Invoke", header: "Object.h".}
