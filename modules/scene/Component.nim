

import 
  animatable

discard "forward decl of DebugRenderer"
discard "forward decl of Node"
discard "forward decl of Scene"
discard "forward decl of ComponentReplicationState"
type 
  Component* {.importc: "Urho3D::Component", header: "Component.h".} = object of Animatable
    node* {.importc: "node_".}: ptr Node
    id* {.importc: "id_".}: cuint
    networkUpdate* {.importc: "networkUpdate_".}: bool
    enabled* {.importc: "enabled_".}: bool


proc getType*(this: Component): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Component.h".}
proc getBaseType*(this: Component): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Component.h".}
proc getTypeName*(this: Component): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Component.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Component::GetTypeStatic(@)", header: "Component.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Component::GetTypeNameStatic(@)", header: "Component.h".}
proc getBaseTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Component::GetBaseTypeStatic(@)", header: "Component.h".}
proc constructComponent*(context: ptr Context): Component {.
    importcpp: "Urho3D::Component(@)", header: "Component.h".}
proc destroyComponent*(this: var Component) {.importcpp: "#.~Component()", 
    header: "Component.h".}
proc onSetEnabled*(this: var Component) {.importcpp: "OnSetEnabled", 
    header: "Component.h".}
proc save*(this: Component; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Component.h".}
proc saveXML*(this: Component; dest: var XMLElement): bool {.noSideEffect, 
    importcpp: "SaveXML", header: "Component.h".}
proc markNetworkUpdate*(this: var Component) {.importcpp: "MarkNetworkUpdate", 
    header: "Component.h".}
proc getDependencyNodes*(this: var Component; dest: var PODVector[ptr Node]) {.
    importcpp: "GetDependencyNodes", header: "Component.h".}
proc drawDebugGeometry*(this: var Component; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Component.h".}
proc setEnabled*(this: var Component; enable: bool) {.importcpp: "SetEnabled", 
    header: "Component.h".}
proc remove*(this: var Component) {.importcpp: "Remove", header: "Component.h".}
proc getID*(this: Component): cuint {.noSideEffect, importcpp: "GetID", 
                                      header: "Component.h".}
proc getNode*(this: Component): ptr Node {.noSideEffect, importcpp: "GetNode", 
    header: "Component.h".}
proc getScene*(this: Component): ptr Scene {.noSideEffect, 
    importcpp: "GetScene", header: "Component.h".}
proc isEnabled*(this: Component): bool {.noSideEffect, importcpp: "IsEnabled", 
    header: "Component.h".}
proc isEnabledEffective*(this: Component): bool {.noSideEffect, 
    importcpp: "IsEnabledEffective", header: "Component.h".}
proc getComponent*(this: Component; `type`: StringHash): ptr Component {.
    noSideEffect, importcpp: "GetComponent", header: "Component.h".}
proc getComponents*(this: Component; dest: var PODVector[ptr Component]; 
                    `type`: StringHash) {.noSideEffect, 
    importcpp: "GetComponents", header: "Component.h".}
proc getComponent*[T](this: Component): ptr T {.noSideEffect, 
    importcpp: "GetComponent", header: "Component.h".}
proc getComponents*[T](this: Component; dest: var PODVector[ptr T]) {.
    noSideEffect, importcpp: "GetComponents", header: "Component.h".}
proc addReplicationState*(this: var Component; 
                          state: ptr ComponentReplicationState) {.
    importcpp: "AddReplicationState", header: "Component.h".}
proc prepareNetworkUpdate*(this: var Component) {.
    importcpp: "PrepareNetworkUpdate", header: "Component.h".}
proc cleanupConnection*(this: var Component; connection: ptr Connection) {.
    importcpp: "CleanupConnection", header: "Component.h".}
proc component::GetComponent*[T](): ptr T {.noSideEffect.}
proc component::GetComponents*[T](dest: var PODVector[ptr T]) {.noSideEffect.}