

import
  attribute, UrObject

discard "forward decl of Connection"
discard "forward decl of Deserializer"
discard "forward decl of Serializer"
discard "forward decl of XMLElement"
discard "forward decl of DirtyBits"
discard "forward decl of NetworkState"
discard "forward decl of ReplicationState"
type
  Serializable* {.importcpp: "Urho3D::Serializable", header: "Serializable.h".} = object of UrObject
#    networkState* {.importc: "networkState_".}: ptr NetworkState
#    instanceDefaultValues* {.importc: "instanceDefaultValues_".}: ptr VariantMap
#    temporary* {.importc: "temporary_".}: bool

when false:

  proc getType*(this: Serializable): StringHash {.noSideEffect,
      importcpp: "GetType", header: "Serializable.h".}
  proc getBaseType*(this: Serializable): StringHash {.noSideEffect,
      importcpp: "GetBaseType", header: "Serializable.h".}
  proc getTypeName*(this: Serializable): UrString {.noSideEffect,
      importcpp: "GetTypeName", header: "Serializable.h".}
  proc getTypeStatic*(): StringHash {.
      importcpp: "Urho3D::Serializable::GetTypeStatic(@)",
      header: "Serializable.h".}
  proc getTypeNameStatic*(): UrString {.
      importcpp: "Urho3D::Serializable::GetTypeNameStatic(@)",
      header: "Serializable.h".}
  proc constructSerializable*(context: ptr Context): Serializable {.constructor,
      importcpp: "Urho3D::Serializable(@)", header: "Serializable.h".}
  proc destroySerializable*(this: var Serializable) {.
      importcpp: "#.~Serializable()", header: "Serializable.h".}
  proc onSetAttribute*(this: var Serializable; attr: AttributeInfo; src: Variant) {.
      importcpp: "OnSetAttribute", header: "Serializable.h".}
  proc onGetAttribute*(this: Serializable; attr: AttributeInfo; dest: var Variant) {.
      noSideEffect, importcpp: "OnGetAttribute", header: "Serializable.h".}
  proc getAttributes*(this: Serializable): ptr Vector[AttributeInfo] {.
      noSideEffect, importcpp: "GetAttributes", header: "Serializable.h".}
  proc getNetworkAttributes*(this: Serializable): ptr Vector[AttributeInfo] {.
      noSideEffect, importcpp: "GetNetworkAttributes", header: "Serializable.h".}
  proc load*(this: var Serializable; source: var Deserializer;
             setInstanceDefault: bool = false): bool {.importcpp: "Load",
      header: "Serializable.h".}
  proc save*(this: Serializable; dest: var Serializer): bool {.noSideEffect,
      importcpp: "Save", header: "Serializable.h".}
  proc loadXML*(this: var Serializable; source: XMLElement;
                setInstanceDefault: bool = false): bool {.importcpp: "LoadXML",
      header: "Serializable.h".}
  proc saveXML*(this: Serializable; dest: var XMLElement): bool {.noSideEffect,
      importcpp: "SaveXML", header: "Serializable.h".}
  proc applyAttributes*(this: var Serializable) {.importcpp: "ApplyAttributes",
      header: "Serializable.h".}
  proc saveDefaultAttributes*(this: Serializable): bool {.noSideEffect,
      importcpp: "SaveDefaultAttributes", header: "Serializable.h".}
  proc markNetworkUpdate*(this: var Serializable) {.
      importcpp: "MarkNetworkUpdate", header: "Serializable.h".}
  proc setAttribute*(this: var Serializable; index: cuint; value: Variant): bool {.
      importcpp: "SetAttribute", header: "Serializable.h".}
  proc setAttribute*(this: var Serializable; name: UrString; value: Variant): bool {.
      importcpp: "SetAttribute", header: "Serializable.h".}
  proc resetToDefault*(this: var Serializable) {.importcpp: "ResetToDefault",
      header: "Serializable.h".}
  proc removeInstanceDefault*(this: var Serializable) {.
      importcpp: "RemoveInstanceDefault", header: "Serializable.h".}
  proc setTemporary*(this: var Serializable; enable: bool) {.
      importcpp: "SetTemporary", header: "Serializable.h".}
  proc allocateNetworkState*(this: var Serializable) {.
      importcpp: "AllocateNetworkState", header: "Serializable.h".}
  proc writeInitialDeltaUpdate*(this: var Serializable; dest: var Serializer) {.
      importcpp: "WriteInitialDeltaUpdate", header: "Serializable.h".}
  proc writeDeltaUpdate*(this: var Serializable; dest: var Serializer;
                         attributeBits: DirtyBits) {.
      importcpp: "WriteDeltaUpdate", header: "Serializable.h".}
  proc writeLatestDataUpdate*(this: var Serializable; dest: var Serializer) {.
      importcpp: "WriteLatestDataUpdate", header: "Serializable.h".}
  proc readDeltaUpdate*(this: var Serializable; source: var Deserializer) {.
      importcpp: "ReadDeltaUpdate", header: "Serializable.h".}
  proc readLatestDataUpdate*(this: var Serializable; source: var Deserializer) {.
      importcpp: "ReadLatestDataUpdate", header: "Serializable.h".}
  proc getAttribute*(this: Serializable; index: cuint): Variant {.noSideEffect,
      importcpp: "GetAttribute", header: "Serializable.h".}
  proc getAttribute*(this: Serializable; name: UrString): Variant {.noSideEffect,
      importcpp: "GetAttribute", header: "Serializable.h".}
  proc getAttributeDefault*(this: Serializable; index: cuint): Variant {.
      noSideEffect, importcpp: "GetAttributeDefault", header: "Serializable.h".}
  proc getAttributeDefault*(this: Serializable; name: UrString): Variant {.
      noSideEffect, importcpp: "GetAttributeDefault", header: "Serializable.h".}
  proc getNumAttributes*(this: Serializable): cuint {.noSideEffect,
      importcpp: "GetNumAttributes", header: "Serializable.h".}
  proc getNumNetworkAttributes*(this: Serializable): cuint {.noSideEffect,
      importcpp: "GetNumNetworkAttributes", header: "Serializable.h".}
  proc isTemporary*(this: Serializable): bool {.noSideEffect,
      importcpp: "IsTemporary", header: "Serializable.h".}

  type
    AttributeAccessorImpl* [T, U]{.importcpp: "Urho3D::AttributeAccessorImpl",
                             header: "Serializable.h".} = object of AttributeAccessor
      getFunction* {.importc: "getFunction_".}: GetFunctionPtr
      setFunction* {.importc: "setFunction_".}: SetFunctionPtr


  proc constructAttributeAccessorImpl*[T, U](getFunction: GetFunctionPtr;
      setFunction: SetFunctionPtr): AttributeAccessorImpl[T, U] {.constructor,
      importcpp: "Urho3D::AttributeAccessorImpl(@)", header: "Serializable.h".}
  proc get*[T, U](this: AttributeAccessorImpl[T, U]; `ptr`: ptr Serializable;
                  dest: var Variant) {.noSideEffect, importcpp: "Get",
                                       header: "Serializable.h".}
  proc set*[T, U](this: var AttributeAccessorImpl[T, U]; `ptr`: ptr Serializable;
                  value: Variant) {.importcpp: "Set", header: "Serializable.h".}

  type
    RefAttributeAccessorImpl* [T, U]{.importcpp: "Urho3D::RefAttributeAccessorImpl",
                                header: "Serializable.h".} = object of AttributeAccessor
      getFunction* {.importc: "getFunction_".}: GetFunctionPtr
      setFunction* {.importc: "setFunction_".}: SetFunctionPtr


  proc constructRefAttributeAccessorImpl*[T, U](getFunction: GetFunctionPtr;
      setFunction: SetFunctionPtr): RefAttributeAccessorImpl[T, U] {.constructor,
      importcpp: "Urho3D::RefAttributeAccessorImpl(@)", header: "Serializable.h".}
  proc get*[T, U](this: RefAttributeAccessorImpl[T, U]; `ptr`: ptr Serializable;
                  dest: var Variant) {.noSideEffect, importcpp: "Get",
                                       header: "Serializable.h".}
  proc set*[T, U](this: var RefAttributeAccessorImpl[T, U];
                  `ptr`: ptr Serializable; value: Variant) {.importcpp: "Set",
      header: "Serializable.h".}
