

import 
  component


type 
  NetworkPriority* {.importc: "Urho3D::NetworkPriority", 
                     header: "NetworkPriority.h".} = object of Component
    basePriority* {.importc: "basePriority_".}: cfloat
    distanceFactor* {.importc: "distanceFactor_".}: cfloat
    minPriority* {.importc: "minPriority_".}: cfloat
    alwaysUpdateOwner* {.importc: "alwaysUpdateOwner_".}: bool


proc getType*(this: NetworkPriority): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "NetworkPriority.h".}
proc getBaseType*(this: NetworkPriority): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "NetworkPriority.h".}
proc getTypeName*(this: NetworkPriority): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "NetworkPriority.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::NetworkPriority::GetTypeStatic(@)", 
    header: "NetworkPriority.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::NetworkPriority::GetTypeNameStatic(@)", 
    header: "NetworkPriority.h".}
proc constructNetworkPriority*(context: ptr Context): NetworkPriority {.
    importcpp: "Urho3D::NetworkPriority(@)", header: "NetworkPriority.h".}
proc destroyNetworkPriority*(this: var NetworkPriority) {.
    importcpp: "#.~NetworkPriority()", header: "NetworkPriority.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::NetworkPriority::RegisterObject(@)", 
    header: "NetworkPriority.h".}
proc setBasePriority*(this: var NetworkPriority; priority: cfloat) {.
    importcpp: "SetBasePriority", header: "NetworkPriority.h".}
proc setDistanceFactor*(this: var NetworkPriority; factor: cfloat) {.
    importcpp: "SetDistanceFactor", header: "NetworkPriority.h".}
proc setMinPriority*(this: var NetworkPriority; priority: cfloat) {.
    importcpp: "SetMinPriority", header: "NetworkPriority.h".}
proc setAlwaysUpdateOwner*(this: var NetworkPriority; enable: bool) {.
    importcpp: "SetAlwaysUpdateOwner", header: "NetworkPriority.h".}
proc getBasePriority*(this: NetworkPriority): cfloat {.noSideEffect, 
    importcpp: "GetBasePriority", header: "NetworkPriority.h".}
proc getDistanceFactor*(this: NetworkPriority): cfloat {.noSideEffect, 
    importcpp: "GetDistanceFactor", header: "NetworkPriority.h".}
proc getMinPriority*(this: NetworkPriority): cfloat {.noSideEffect, 
    importcpp: "GetMinPriority", header: "NetworkPriority.h".}
proc getAlwaysUpdateOwner*(this: NetworkPriority): bool {.noSideEffect, 
    importcpp: "GetAlwaysUpdateOwner", header: "NetworkPriority.h".}
proc checkUpdate*(this: var NetworkPriority; distance: cfloat; 
                  accumulator: var cfloat): bool {.importcpp: "CheckUpdate", 
    header: "NetworkPriority.h".}