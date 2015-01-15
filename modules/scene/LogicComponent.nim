

import 
  component


var USE_UPDATE* {.importc: "USE_UPDATE", header: "LogicComponent.h".}: cuchar = 0x00000001


var USE_POSTUPDATE* {.importc: "USE_POSTUPDATE", header: "LogicComponent.h".}: cuchar = 0x00000002


var USE_FIXEDUPDATE* {.importc: "USE_FIXEDUPDATE", header: "LogicComponent.h".}: cuchar = 0x00000004


var USE_FIXEDPOSTUPDATE* {.importc: "USE_FIXEDPOSTUPDATE", 
                           header: "LogicComponent.h".}: cuchar = 0x00000008


type 
  LogicComponent* {.importc: "Urho3D::LogicComponent", 
                    header: "LogicComponent.h".} = object of Component
    updateEventMask* {.importc: "updateEventMask_".}: cuchar
    currentEventMask* {.importc: "currentEventMask_".}: cuchar
    delayedStartCalled* {.importc: "delayedStartCalled_".}: bool


proc getType*(this: LogicComponent): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "LogicComponent.h".}
proc getBaseType*(this: LogicComponent): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "LogicComponent.h".}
proc getTypeName*(this: LogicComponent): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "LogicComponent.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::LogicComponent::GetTypeStatic(@)", 
    header: "LogicComponent.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::LogicComponent::GetTypeNameStatic(@)", 
    header: "LogicComponent.h".}
proc constructLogicComponent*(context: ptr Context): LogicComponent {.
    importcpp: "Urho3D::LogicComponent(@)", header: "LogicComponent.h".}
proc destroyLogicComponent*(this: var LogicComponent) {.
    importcpp: "#.~LogicComponent()", header: "LogicComponent.h".}
proc onSetEnabled*(this: var LogicComponent) {.importcpp: "OnSetEnabled", 
    header: "LogicComponent.h".}
proc start*(this: var LogicComponent) {.importcpp: "Start", 
                                        header: "LogicComponent.h".}
proc delayedStart*(this: var LogicComponent) {.importcpp: "DelayedStart", 
    header: "LogicComponent.h".}
proc stop*(this: var LogicComponent) {.importcpp: "Stop", 
                                       header: "LogicComponent.h".}
proc update*(this: var LogicComponent; timeStep: cfloat) {.importcpp: "Update", 
    header: "LogicComponent.h".}
proc postUpdate*(this: var LogicComponent; timeStep: cfloat) {.
    importcpp: "PostUpdate", header: "LogicComponent.h".}
proc fixedUpdate*(this: var LogicComponent; timeStep: cfloat) {.
    importcpp: "FixedUpdate", header: "LogicComponent.h".}
proc fixedPostUpdate*(this: var LogicComponent; timeStep: cfloat) {.
    importcpp: "FixedPostUpdate", header: "LogicComponent.h".}
proc setUpdateEventMask*(this: var LogicComponent; mask: cuchar) {.
    importcpp: "SetUpdateEventMask", header: "LogicComponent.h".}
proc getUpdateEventMask*(this: LogicComponent): cuchar {.noSideEffect, 
    importcpp: "GetUpdateEventMask", header: "LogicComponent.h".}
proc isDelayedStartCalled*(this: LogicComponent): bool {.noSideEffect, 
    importcpp: "IsDelayedStartCalled", header: "LogicComponent.h".}