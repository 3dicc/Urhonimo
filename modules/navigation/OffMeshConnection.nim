

import 
  component


type 
  OffMeshConnection* {.importc: "Urho3D::OffMeshConnection", 
                       header: "OffMeshConnection.h".} = object of Component
    endPoint* {.importc: "endPoint_".}: WeakPtr[Node]
    endPointID* {.importc: "endPointID_".}: cuint
    radius* {.importc: "radius_".}: cfloat
    bidirectional* {.importc: "bidirectional_".}: bool
    endPointDirty* {.importc: "endPointDirty_".}: bool


proc getType*(this: OffMeshConnection): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "OffMeshConnection.h".}
proc getBaseType*(this: OffMeshConnection): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "OffMeshConnection.h".}
proc getTypeName*(this: OffMeshConnection): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "OffMeshConnection.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::OffMeshConnection::GetTypeStatic(@)", 
    header: "OffMeshConnection.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::OffMeshConnection::GetTypeNameStatic(@)", 
    header: "OffMeshConnection.h".}
proc constructOffMeshConnection*(context: ptr Context): OffMeshConnection {.
    importcpp: "Urho3D::OffMeshConnection(@)", header: "OffMeshConnection.h".}
proc destroyOffMeshConnection*(this: var OffMeshConnection) {.
    importcpp: "#.~OffMeshConnection()", header: "OffMeshConnection.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::OffMeshConnection::RegisterObject(@)", 
    header: "OffMeshConnection.h".}
proc onSetAttribute*(this: var OffMeshConnection; attr: AttributeInfo; 
                     src: Variant) {.importcpp: "OnSetAttribute", 
                                     header: "OffMeshConnection.h".}
proc applyAttributes*(this: var OffMeshConnection) {.
    importcpp: "ApplyAttributes", header: "OffMeshConnection.h".}
proc drawDebugGeometry*(this: var OffMeshConnection; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "OffMeshConnection.h".}
proc setEndPoint*(this: var OffMeshConnection; node: ptr Node) {.
    importcpp: "SetEndPoint", header: "OffMeshConnection.h".}
proc setRadius*(this: var OffMeshConnection; radius: cfloat) {.
    importcpp: "SetRadius", header: "OffMeshConnection.h".}
proc setBidirectional*(this: var OffMeshConnection; enabled: bool) {.
    importcpp: "SetBidirectional", header: "OffMeshConnection.h".}
proc getEndPoint*(this: OffMeshConnection): ptr Node {.noSideEffect, 
    importcpp: "GetEndPoint", header: "OffMeshConnection.h".}
proc getRadius*(this: OffMeshConnection): cfloat {.noSideEffect, 
    importcpp: "GetRadius", header: "OffMeshConnection.h".}
proc isBidirectional*(this: OffMeshConnection): bool {.noSideEffect, 
    importcpp: "IsBidirectional", header: "OffMeshConnection.h".}