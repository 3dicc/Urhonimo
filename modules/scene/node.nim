

import
  matrix3x4, animatable, vectorBuffer, component, stringHash, urstr, urobject,
  deserializer, xmlelement, serializer, connection, vector3, vector2,
  quaternion, variant, matrix4, vector4, vector, ptrs

discard "forward decl of Component"
discard "forward decl of Connection"
discard "forward decl of Scene"
discard "forward decl of SceneResolver"
discard "forward decl of NodeReplicationState"

proc getType*(this: Node): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Node.h".}
proc getBaseType*(this: Node): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Node.h".}
proc getTypeName*(this: Node): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Node.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Node::GetTypeStatic(@)", header: "Node.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Node::GetTypeNameStatic(@)", header: "Node.h".}
proc getBaseTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Node::GetBaseTypeStatic(@)", header: "Node.h".}
proc constructNode*(context: ptr Context): Node {.importcpp: "Urho3D::Node(@)",
    header: "Node.h", constructor.}
proc destroyNode*(this: var Node) {.importcpp: "#.~Node()", header: "Node.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Node::RegisterObject(@)", header: "Node.h".}
proc load*(this: var Node; source: var Deserializer;
           setInstanceDefault: bool = false): bool {.importcpp: "Load",
    header: "Node.h".}
proc loadXML*(this: var Node; source: XMLElement;
              setInstanceDefault: bool = false): bool {.importcpp: "LoadXML",
    header: "Node.h".}
proc save*(this: Node; dest: var Serializer): bool {.noSideEffect,
    importcpp: "Save", header: "Node.h".}
proc saveXML*(this: Node; dest: var XMLElement): bool {.noSideEffect,
    importcpp: "SaveXML", header: "Node.h".}
proc applyAttributes*(this: var Node) {.importcpp: "ApplyAttributes",
                                        header: "Node.h".}
proc saveDefaultAttributes*(this: Node): bool {.noSideEffect,
    importcpp: "SaveDefaultAttributes", header: "Node.h".}
proc markNetworkUpdate*(this: var Node) {.importcpp: "MarkNetworkUpdate",
    header: "Node.h".}
proc addReplicationState*(this: var Node; state: ptr NodeReplicationState) {.
    importcpp: "AddReplicationState", header: "Node.h".}
proc saveXML*(this: Node; dest: var Serializer): bool {.noSideEffect,
    importcpp: "SaveXML", header: "Node.h".}
proc setName*(this: var Node; name: UrString) {.importcpp: "SetName",
    header: "Node.h".}
proc setPosition*(this: var Node; position: Vector3) {.importcpp: "SetPosition",
    header: "Node.h".}
proc setPosition2D*(this: var Node; position: Vector2) {.
    importcpp: "SetPosition2D", header: "Node.h".}
proc setPosition2D*(this: var Node; x: cfloat; y: cfloat) {.
    importcpp: "SetPosition2D", header: "Node.h".}
proc setRotation*(this: var Node; rotation: Quaternion) {.
    importcpp: "SetRotation", header: "Node.h".}
proc setRotation2D*(this: var Node; rotation: cfloat) {.
    importcpp: "SetRotation2D", header: "Node.h".}
proc setDirection*(this: var Node; direction: Vector3) {.
    importcpp: "SetDirection", header: "Node.h".}
proc setScale*(this: var Node; scale: cfloat) {.importcpp: "SetScale",
    header: "Node.h".}
proc setScale*(this: var Node; scale: Vector3) {.importcpp: "SetScale",
    header: "Node.h".}
proc setScale2D*(this: var Node; scale: Vector2) {.importcpp: "SetScale2D",
    header: "Node.h".}
proc setScale2D*(this: var Node; x: cfloat; y: cfloat) {.
    importcpp: "SetScale2D", header: "Node.h".}
proc setTransform*(this: var Node; position: Vector3; rotation: Quaternion) {.
    importcpp: "SetTransform", header: "Node.h".}
proc setTransform*(this: var Node; position: Vector3; rotation: Quaternion;
                   scale: cfloat) {.importcpp: "SetTransform", header: "Node.h".}
proc setTransform*(this: var Node; position: Vector3; rotation: Quaternion;
                   scale: Vector3) {.importcpp: "SetTransform", header: "Node.h".}
proc setTransform2D*(this: var Node; position: Vector2; rotation: cfloat) {.
    importcpp: "SetTransform2D", header: "Node.h".}
proc setTransform2D*(this: var Node; position: Vector2; rotation: cfloat;
                     scale: cfloat) {.importcpp: "SetTransform2D",
                                      header: "Node.h".}
proc setTransform2D*(this: var Node; position: Vector2; rotation: cfloat;
                     scale: Vector2) {.importcpp: "SetTransform2D",
                                       header: "Node.h".}
proc setWorldPosition*(this: var Node; position: Vector3) {.
    importcpp: "SetWorldPosition", header: "Node.h".}
proc setWorldPosition2D*(this: var Node; position: Vector2) {.
    importcpp: "SetWorldPosition2D", header: "Node.h".}
proc setWorldPosition2D*(this: var Node; x: cfloat; y: cfloat) {.
    importcpp: "SetWorldPosition2D", header: "Node.h".}
proc setWorldRotation*(this: var Node; rotation: Quaternion) {.
    importcpp: "SetWorldRotation", header: "Node.h".}
proc setWorldRotation2D*(this: var Node; rotation: cfloat) {.
    importcpp: "SetWorldRotation2D", header: "Node.h".}
proc setWorldDirection*(this: var Node; direction: Vector3) {.
    importcpp: "SetWorldDirection", header: "Node.h".}
proc setWorldScale*(this: var Node; scale: cfloat) {.importcpp: "SetWorldScale",
    header: "Node.h".}
proc setWorldScale*(this: var Node; scale: Vector3) {.
    importcpp: "SetWorldScale", header: "Node.h".}
proc setWorldScale2D*(this: var Node; scale: Vector2) {.
    importcpp: "SetWorldScale2D", header: "Node.h".}
proc setWorldScale2D*(this: var Node; x: cfloat; y: cfloat) {.
    importcpp: "SetWorldScale2D", header: "Node.h".}
proc setWorldTransform*(this: var Node; position: Vector3; rotation: Quaternion) {.
    importcpp: "SetWorldTransform", header: "Node.h".}
proc setWorldTransform*(this: var Node; position: Vector3; rotation: Quaternion;
                        scale: cfloat) {.importcpp: "SetWorldTransform",
    header: "Node.h".}
proc setWorldTransform*(this: var Node; position: Vector3; rotation: Quaternion;
                        scale: Vector3) {.importcpp: "SetWorldTransform",
    header: "Node.h".}
proc setWorldTransform2D*(this: var Node; position: Vector2; rotation: cfloat) {.
    importcpp: "SetWorldTransform2D", header: "Node.h".}
proc setWorldTransform2D*(this: var Node; position: Vector2; rotation: cfloat;
                          scale: cfloat) {.importcpp: "SetWorldTransform2D",
    header: "Node.h".}
proc setWorldTransform2D*(this: var Node; position: Vector2; rotation: cfloat;
                          scale: Vector2) {.importcpp: "SetWorldTransform2D",
    header: "Node.h".}
proc translate*(this: var Node; delta: Vector3; space: TransformSpace = TS_LOCAL) {.
    importcpp: "Translate", header: "Node.h".}
proc translate2D*(this: var Node; delta: Vector2;
                  space: TransformSpace = TS_LOCAL) {.importcpp: "Translate2D",
    header: "Node.h".}
proc rotate*(this: var Node; delta: Quaternion; space: TransformSpace = TS_LOCAL) {.
    importcpp: "Rotate", header: "Node.h".}
proc rotate2D*(this: var Node; delta: cfloat; space: TransformSpace = TS_LOCAL) {.
    importcpp: "Rotate2D", header: "Node.h".}
proc rotateAround*(this: var Node; point: Vector3; delta: Quaternion;
                   space: TransformSpace = TS_LOCAL) {.
    importcpp: "RotateAround", header: "Node.h".}
proc rotateAround2D*(this: var Node; point: Vector2; delta: cfloat;
                     space: TransformSpace = TS_LOCAL) {.
    importcpp: "RotateAround2D", header: "Node.h".}
proc pitch*(this: var Node; angle: cfloat; space: TransformSpace = TS_LOCAL) {.
    importcpp: "Pitch", header: "Node.h".}
proc yaw*(this: var Node; angle: cfloat; space: TransformSpace = TS_LOCAL) {.
    importcpp: "Yaw", header: "Node.h".}
proc roll*(this: var Node; angle: cfloat; space: TransformSpace = TS_LOCAL) {.
    importcpp: "Roll", header: "Node.h".}
proc lookAt*(this: var Node; target: Vector3; up: Vector3 = vector3.UP;
             space: TransformSpace = TS_World): bool {.importcpp: "LookAt",
    header: "Node.h".}
proc scale*(this: var Node; scale: cfloat) {.importcpp: "Scale",
    header: "Node.h".}
proc scale*(this: var Node; scale: Vector3) {.importcpp: "Scale",
    header: "Node.h".}
proc scale2D*(this: var Node; scale: Vector2) {.importcpp: "Scale2D",
    header: "Node.h".}
proc setEnabled*(this: var Node; enable: bool) {.importcpp: "SetEnabled",
    header: "Node.h".}
proc setDeepEnabled*(this: var Node; enable: bool) {.
    importcpp: "SetDeepEnabled", header: "Node.h".}
proc resetDeepEnabled*(this: var Node) {.importcpp: "ResetDeepEnabled",
    header: "Node.h".}
proc setEnabledRecursive*(this: var Node; enable: bool) {.
    importcpp: "SetEnabledRecursive", header: "Node.h".}
proc setOwner*(this: var Node; owner: ptr Connection) {.importcpp: "SetOwner",
    header: "Node.h".}
proc markDirty*(this: var Node) {.importcpp: "MarkDirty", header: "Node.h".}
proc createChild*(this: var Node; name: UrString;
                  mode: CreateMode = Replicated; id: cuint = 0): ptr Node {.
    importcpp: "CreateChild", header: "Node.h".}
proc addChild*(this: var Node; node: ptr Node; index: cuint = cuint(-1)) {.
    importcpp: "AddChild", header: "Node.h".}
proc removeChild*(this: var Node; node: ptr Node) {.importcpp: "RemoveChild",
    header: "Node.h".}
proc removeAllChildren*(this: var Node) {.importcpp: "RemoveAllChildren",
    header: "Node.h".}
proc removeChildren*(this: var Node; removeReplicated: bool; removeLocal: bool;
                     recursive: bool) {.importcpp: "RemoveChildren",
                                        header: "Node.h".}

proc createComponentRaw*(this: var Node; `type`: StringHash;
                  mode: CreateMode = Replicated; id: cuint = 0): ptr Component {.
    importcpp: "CreateComponent", header: "Node.h".}
proc createComponent*[T](this: var Node; mode: CreateMode = Replicated;
                         id: cuint = 0): ptr T {.
    importcpp: "#.CreateComponent<'*0>(@)", header: "Node.h".}

proc getOrCreateComponent*(this: var Node; `type`: StringHash;
                           mode: CreateMode = Replicated; id: cuint = 0): ptr Component {.
    importcpp: "GetOrCreateComponent", header: "Node.h".}
proc cloneComponent*(this: var Node; component: ptr Component; id: cuint = 0): ptr Component {.
    importcpp: "CloneComponent", header: "Node.h".}
proc cloneComponent*(this: var Node; component: ptr Component; mode: CreateMode;
                     id: cuint = 0): ptr Component {.
    importcpp: "CloneComponent", header: "Node.h".}
proc removeComponent*(this: var Node; component: ptr Component) {.
    importcpp: "RemoveComponent", header: "Node.h".}
proc removeComponent*(this: var Node; `type`: StringHash) {.
    importcpp: "RemoveComponent", header: "Node.h".}
proc removeAllComponents*(this: var Node) {.importcpp: "RemoveAllComponents",
    header: "Node.h".}
proc removeComponents*(this: var Node; removeReplicated, removeLocal: bool) {.
    importcpp: "RemoveComponents", header: "Node.h".}
proc clone*(this: var Node; mode: CreateMode = Replicated): ptr Node {.
    importcpp: "Clone", header: "Node.h".}
proc remove*(this: var Node) {.importcpp: "Remove", header: "Node.h".}
proc setParent*(this: var Node; parent: ptr Node) {.importcpp: "SetParent",
    header: "Node.h".}
proc setVar*(this: var Node; key: StringHash; value: Variant) {.
    importcpp: "SetVar", header: "Node.h".}
proc addListener*(this: var Node; component: ptr Component) {.
    importcpp: "AddListener", header: "Node.h".}
proc removeListener*(this: var Node; component: ptr Component) {.
    importcpp: "RemoveListener", header: "Node.h".}
proc getOrCreateComponent*[T](this: var Node; mode: CreateMode = Replicated;
                              id: cuint = 0): ptr T {.
    importcpp: "GetOrCreateComponent", header: "Node.h".}
proc removeComponent*[T](this: var Node) {.importcpp: "RemoveComponent",
    header: "Node.h".}
proc getID*(this: Node): cuint {.noSideEffect, importcpp: "GetID",
                                 header: "Node.h".}
proc getName*(this: Node): UrString {.noSideEffect, importcpp: "GetName",
                                      header: "Node.h".}
proc getNameHash*(this: Node): StringHash {.noSideEffect,
    importcpp: "GetNameHash", header: "Node.h".}
proc getParent*(this: Node): ptr Node {.noSideEffect, importcpp: "GetParent",
                                        header: "Node.h".}
proc getScene*(this: Node): ptr Scene {.noSideEffect, importcpp: "GetScene",
                                        header: "Node.h".}
proc isEnabled*(this: Node): bool {.noSideEffect, importcpp: "IsEnabled",
                                    header: "Node.h".}
proc isEnabledSelf*(this: Node): bool {.noSideEffect,
                                        importcpp: "IsEnabledSelf",
                                        header: "Node.h".}
proc getOwner*(this: Node): ptr Connection {.noSideEffect,
    importcpp: "GetOwner", header: "Node.h".}
proc getPosition*(this: Node): Vector3 {.noSideEffect, importcpp: "GetPosition",
    header: "Node.h".}
proc getPosition2D*(this: Node): Vector2 {.noSideEffect,
    importcpp: "GetPosition2D", header: "Node.h".}
proc getRotation*(this: Node): Quaternion {.noSideEffect,
    importcpp: "GetRotation", header: "Node.h".}
proc getRotation2D*(this: Node): cfloat {.noSideEffect,
    importcpp: "GetRotation2D", header: "Node.h".}
proc getDirection*(this: Node): Vector3 {.noSideEffect,
    importcpp: "GetDirection", header: "Node.h".}
proc getUp*(this: Node): Vector3 {.noSideEffect, importcpp: "GetUp",
                                   header: "Node.h".}
proc getRight*(this: Node): Vector3 {.noSideEffect, importcpp: "GetRight",
                                      header: "Node.h".}
proc getScale*(this: Node): Vector3 {.noSideEffect, importcpp: "GetScale",
                                      header: "Node.h".}
proc getScale2D*(this: Node): Vector2 {.noSideEffect, importcpp: "GetScale2D",
                                        header: "Node.h".}
proc getTransform*(this: Node): Matrix3x4 {.noSideEffect,
    importcpp: "GetTransform", header: "Node.h".}
proc getWorldPosition*(this: Node): Vector3 {.noSideEffect,
    importcpp: "GetWorldPosition", header: "Node.h".}
proc getWorldPosition2D*(this: Node): Vector2 {.noSideEffect,
    importcpp: "GetWorldPosition2D", header: "Node.h".}
proc getWorldRotation*(this: Node): Quaternion {.noSideEffect,
    importcpp: "GetWorldRotation", header: "Node.h".}
proc getWorldRotation2D*(this: Node): cfloat {.noSideEffect,
    importcpp: "GetWorldRotation2D", header: "Node.h".}
proc getWorldDirection*(this: Node): Vector3 {.noSideEffect,
    importcpp: "GetWorldDirection", header: "Node.h".}
proc getWorldUp*(this: Node): Vector3 {.noSideEffect, importcpp: "GetWorldUp",
                                        header: "Node.h".}
proc getWorldRight*(this: Node): Vector3 {.noSideEffect,
    importcpp: "GetWorldRight", header: "Node.h".}
proc getWorldScale*(this: Node): Vector3 {.noSideEffect,
    importcpp: "GetWorldScale", header: "Node.h".}
proc getWorldScale2D*(this: Node): Vector2 {.noSideEffect,
    importcpp: "GetWorldScale2D", header: "Node.h".}
proc getWorldTransform*(this: Node): Matrix3x4 {.noSideEffect,
    importcpp: "GetWorldTransform", header: "Node.h".}
proc localToWorld*(this: Node; position: Vector3): Vector3 {.noSideEffect,
    importcpp: "LocalToWorld", header: "Node.h".}
proc localToWorld*(this: Node; vector: Vector4): Vector3 {.noSideEffect,
    importcpp: "LocalToWorld", header: "Node.h".}
proc localToWorld2D*(this: Node; vector: Vector2): Vector2 {.noSideEffect,
    importcpp: "LocalToWorld2D", header: "Node.h".}
proc worldToLocal*(this: Node; position: Vector3): Vector3 {.noSideEffect,
    importcpp: "WorldToLocal", header: "Node.h".}
proc worldToLocal*(this: Node; vector: Vector4): Vector3 {.noSideEffect,
    importcpp: "WorldToLocal", header: "Node.h".}
proc worldToLocal2D*(this: Node; vector: Vector2): Vector2 {.noSideEffect,
    importcpp: "WorldToLocal2D", header: "Node.h".}
proc isDirty*(this: Node): bool {.noSideEffect, importcpp: "IsDirty",
                                  header: "Node.h".}
proc getNumChildren*(this: Node; recursive: bool = false): cuint {.noSideEffect,
    importcpp: "GetNumChildren", header: "Node.h".}
proc getChildren*(this: Node): Vector[SharedPtr[Node]] {.noSideEffect,
    importcpp: "GetChildren", header: "Node.h".}
proc getChildren*(this: Node; dest: var PODVector[ptr Node];
                  recursive: bool = false) {.noSideEffect,
    importcpp: "GetChildren", header: "Node.h".}
proc getChildrenWithComponent*(this: Node; dest: var PODVector[ptr Node];
                               `type`: StringHash; recursive: bool = false) {.
    noSideEffect, importcpp: "GetChildrenWithComponent", header: "Node.h".}
proc getChild*(this: Node; index: cuint): ptr Node {.noSideEffect,
    importcpp: "GetChild", header: "Node.h".}
#proc getChild*(this: Node; name: UrString; recursive: bool = false): ptr Node {.
#    noSideEffect, importcpp: "GetChild", header: "Node.h".}
#proc getChild*(this: Node; name: cstring; recursive: bool = false): ptr Node {.
#    noSideEffect, importcpp: "GetChild", header: "Node.h".}
proc getChild*(this: Node; nameHash: StringHash; recursive: bool = false): ptr Node {.
    noSideEffect, importcpp: "GetChild", header: "Node.h".}
proc getNumComponents*(this: Node): cuint {.noSideEffect,
    importcpp: "GetNumComponents", header: "Node.h".}
proc getNumNetworkComponents*(this: Node): cuint {.noSideEffect,
    importcpp: "GetNumNetworkComponents", header: "Node.h".}
proc getComponents*(this: Node): Vector[SharedPtr[Component]] {.noSideEffect,
    importcpp: "GetComponents", header: "Node.h".}
proc getComponents*(this: Node; dest: var PODVector[ptr Component];
                    `type`: StringHash; recursive: bool = false) {.noSideEffect,
    importcpp: "GetComponents", header: "Node.h".}
proc getComponentRaw*(this: Node; `type`: StringHash): ptr Component {.
    noSideEffect, importcpp: "GetComponent", header: "Node.h".}
proc hasComponent*(this: Node; `type`: StringHash): bool {.noSideEffect,
    importcpp: "HasComponent", header: "Node.h".}
proc getListeners*(this: Node): Vector[WeakPtr[Component]] {.noSideEffect,
    importcpp: "GetListeners", header: "Node.h".}
proc getVar*(this: Node; key: StringHash): Variant {.noSideEffect,
    importcpp: "GetVar", header: "Node.h".}
proc getVars*(this: Node): VariantMap {.noSideEffect, importcpp: "GetVars",
                                        header: "Node.h".}
proc getDerivedComponent*[T](this: Node): ptr T {.noSideEffect,
    importcpp: "GetDerivedComponent", header: "Node.h".}
proc getDerivedComponents*[T](this: Node; dest: var PODVector[ptr T]) {.
    noSideEffect, importcpp: "GetDerivedComponents", header: "Node.h".}
proc getChildrenWithComponent*[T](this: Node; dest: var PODVector[ptr Node];
                                  recursive: bool = false) {.noSideEffect,
    importcpp: "GetChildrenWithComponent", header: "Node.h".}
proc getComponentFromNode*[T](this: Node): ptr T {.noSideEffect,
    importcpp: "#.GetComponent<'*0>(@)", header: "Node.h".}

proc getComponents*[T](this: Node; dest: var PODVector[ptr T];
                       recursive: bool = false) {.noSideEffect,
    importcpp: "GetComponents", header: "Node.h".}
proc hasComponent*[T](this: Node): bool {.noSideEffect,
    importcpp: "HasComponent", header: "Node.h".}
proc setID*(this: var Node; id: cuint) {.importcpp: "SetID", header: "Node.h".}
proc setScene*(this: var Node; scene: ptr Scene) {.importcpp: "SetScene",
    header: "Node.h".}
proc resetScene*(this: var Node) {.importcpp: "ResetScene", header: "Node.h".}
proc setNetPositionAttr*(this: var Node; value: Vector3) {.
    importcpp: "SetNetPositionAttr", header: "Node.h".}
proc setNetRotationAttr*(this: var Node; value: PODVector[cuchar]) {.
    importcpp: "SetNetRotationAttr", header: "Node.h".}
proc setNetParentAttr*(this: var Node; value: PODVector[cuchar]) {.
    importcpp: "SetNetParentAttr", header: "Node.h".}
proc getNetPositionAttr*(this: Node): Vector3 {.noSideEffect,
    importcpp: "GetNetPositionAttr", header: "Node.h".}
proc getNetRotationAttr*(this: Node): PODVector[cuchar] {.noSideEffect,
    importcpp: "GetNetRotationAttr", header: "Node.h".}
proc getNetParentAttr*(this: Node): PODVector[cuchar] {.noSideEffect,
    importcpp: "GetNetParentAttr", header: "Node.h".}
proc load*(this: var Node; source: var Deserializer;
           resolver: var SceneResolver; loadChildren: bool = true;
           rewriteIDs: bool = false; mode: CreateMode = Replicated): bool {.
    importcpp: "Load", header: "Node.h".}
proc loadXML*(this: var Node; source: XMLElement; resolver: var SceneResolver;
              loadChildren: bool = true; rewriteIDs: bool = false;
              mode: CreateMode = Replicated): bool {.importcpp: "LoadXML",
    header: "Node.h".}
proc getDependencyNodes*(this: Node): PODVector[ptr Node] {.noSideEffect,
    importcpp: "GetDependencyNodes", header: "Node.h".}
proc prepareNetworkUpdate*(this: var Node) {.importcpp: "PrepareNetworkUpdate",
    header: "Node.h".}
proc cleanupConnection*(this: var Node; connection: ptr Connection) {.
    importcpp: "CleanupConnection", header: "Node.h".}
proc markReplicationDirty*(this: var Node) {.importcpp: "MarkReplicationDirty",
    header: "Node.h".}
proc createChild*(this: var Node; id: cuint; mode: CreateMode): ptr Node {.
    importcpp: "CreateChild", header: "Node.h".}
proc addComponent*(this: var Node; component: ptr Component; id: cuint;
                   mode: CreateMode) {.importcpp: "AddComponent",
                                       header: "Node.h".}
proc getNumPersistentChildren*(this: Node): cuint {.noSideEffect,
    importcpp: "GetNumPersistentChildren", header: "Node.h".}
proc getNumPersistentComponents*(this: Node): cuint {.noSideEffect,
    importcpp: "GetNumPersistentComponents", header: "Node.h".}
proc setPositionSilent*(this: var Node; position: Vector3) {.
    importcpp: "SetPositionSilent", header: "Node.h".}
proc setRotationSilent*(this: var Node; rotation: Quaternion) {.
    importcpp: "SetRotationSilent", header: "Node.h".}
proc setScaleSilent*(this: var Node; scale: Vector3) {.
    importcpp: "SetScaleSilent", header: "Node.h".}
proc setTransformSilent*(this: var Node; position: Vector3;
                         rotation: Quaternion; scale: Vector3) {.
    importcpp: "SetTransformSilent", header: "Node.h".}

#proc createComponent*[T](mode: CreateMode; id: cuint): ptr T {.
#    importcpp: "Node::CreateComponent<'*0>(@)", header: "Node.h".}

proc getOrCreateComponent*[T](mode: CreateMode; id: cuint): ptr T{.
    importcpp: "Node::GetOrCreateComponent<'*0>(@)", header: "Node.h".}
proc removeComponent*[T]() {.
    importcpp: "Node::RemoveComponent(@)", header: "Node.h".}

proc getChildrenWithComponent*[T](dest: var PODVector[ptr Node];
                                        recursive: bool) {.
    importcpp: "Node::GetChildrenWithComponent(@)", header: "Node.h".}
#proc getComponent*[T](): ptr T {.
#    importcpp: "Node::GetComponent<'*0>(@)", header: "Node.h".}
proc getComponents*[T](dest: var PODVector[ptr T]; recursive: bool) {.
    importcpp: "Node::GetComponent<'*0>(@)", header: "Node.h".}

proc hasComponent*(t: typedesc): bool {.
    importcpp: "Node::HasComponent<'1>()", header: "Node.h".}
# XXX this is unlikely to work!

proc getDerivedComponent*[T](): ptr T {.
    importcpp: "Node::GetDerivedComponent<'*0>(@)", header: "Node.h".}
proc getDerivedComponents*[T](dest: var PODVector[ptr T]) {.
    importcpp: "Node::GetDerivedComponents(@)", header: "Node.h".}
