

import
  urho3D, hashMap, str


discard "forward decl of SArrayBuffer"
discard "forward decl of SArrayCache"
type
  CScriptArray* {.importcpp: "Urho3D::CScriptArray", header: "Addons.h".} = object
    refCount* {.importc: "refCount".}: cint
    gcFlag* {.importc: "gcFlag".}: bool
    objType* {.importc: "objType".}: ptr AsIObjectType
    buffer* {.importc: "buffer".}: ptr SArrayBuffer
    elementSize* {.importc: "elementSize".}: cint
    subTypeId* {.importc: "subTypeId".}: cint


proc setMemoryFunctions*(allocFunc: AsALLOCFUNC_t; freeFunc: AsFREEFUNC_t) {.
    importcpp: "Urho3D::CScriptArray::SetMemoryFunctions(@)", header: "Addons.h".}
proc create*(ot: ptr AsIObjectType): ptr CScriptArray {.
    importcpp: "Urho3D::CScriptArray::Create(@)", header: "Addons.h".}
proc create*(ot: ptr AsIObjectType; length: AsUINT): ptr CScriptArray {.
    importcpp: "Urho3D::CScriptArray::Create(@)", header: "Addons.h".}
proc create*(ot: ptr AsIObjectType; length: AsUINT; defaultValue: pointer): ptr CScriptArray {.
    importcpp: "Urho3D::CScriptArray::Create(@)", header: "Addons.h".}
proc create*(ot: ptr AsIObjectType; listBuffer: pointer): ptr CScriptArray {.
    importcpp: "Urho3D::CScriptArray::Create(@)", header: "Addons.h".}
proc addRef*(this: CScriptArray) {.noSideEffect, importcpp: "AddRef",
                                   header: "Addons.h".}
proc release*(this: CScriptArray) {.noSideEffect, importcpp: "Release",
                                    header: "Addons.h".}
proc getArrayObjectType*(this: CScriptArray): ptr AsIObjectType {.noSideEffect,
    importcpp: "GetArrayObjectType", header: "Addons.h".}
proc getArrayTypeId*(this: CScriptArray): cint {.noSideEffect,
    importcpp: "GetArrayTypeId", header: "Addons.h".}
proc getElementTypeId*(this: CScriptArray): cint {.noSideEffect,
    importcpp: "GetElementTypeId", header: "Addons.h".}
proc getSize*(this: CScriptArray): AsUINT {.noSideEffect, importcpp: "GetSize",
    header: "Addons.h".}
proc isEmpty*(this: CScriptArray): bool {.noSideEffect, importcpp: "IsEmpty",
    header: "Addons.h".}
proc reserve*(this: var CScriptArray; maxElements: AsUINT) {.
    importcpp: "Reserve", header: "Addons.h".}
proc resize*(this: var CScriptArray; numElements: AsUINT) {.importcpp: "Resize",
    header: "Addons.h".}
proc at*(this: var CScriptArray; index: AsUINT): pointer {.importcpp: "At",
    header: "Addons.h".}
proc at*(this: CScriptArray; index: AsUINT): pointer {.noSideEffect,
    importcpp: "At", header: "Addons.h".}
proc setValue*(this: var CScriptArray; index: AsUINT; value: pointer) {.
    importcpp: "SetValue", header: "Addons.h".}
proc `==`*(this: CScriptArray; a3: CScriptArray): bool {.noSideEffect,
    importcpp: "# == #", header: "Addons.h".}
proc insertAt*(this: var CScriptArray; index: AsUINT; value: pointer) {.
    importcpp: "InsertAt", header: "Addons.h".}
proc removeAt*(this: var CScriptArray; index: AsUINT) {.importcpp: "RemoveAt",
    header: "Addons.h".}
proc insertLast*(this: var CScriptArray; value: pointer) {.
    importcpp: "InsertLast", header: "Addons.h".}
proc removeLast*(this: var CScriptArray) {.importcpp: "RemoveLast",
    header: "Addons.h".}
proc sortAsc*(this: var CScriptArray) {.importcpp: "SortAsc", header: "Addons.h".}
proc sortDesc*(this: var CScriptArray) {.importcpp: "SortDesc",
    header: "Addons.h".}
proc sortAsc*(this: var CScriptArray; startAt: AsUINT; count: AsUINT) {.
    importcpp: "SortAsc", header: "Addons.h".}
proc sortDesc*(this: var CScriptArray; startAt: AsUINT; count: AsUINT) {.
    importcpp: "SortDesc", header: "Addons.h".}
proc sort*(this: var CScriptArray; startAt: AsUINT; count: AsUINT; asc: bool) {.
    importcpp: "Sort", header: "Addons.h".}
proc reverse*(this: var CScriptArray) {.importcpp: "Reverse", header: "Addons.h".}
proc find*(this: CScriptArray; value: pointer): cint {.noSideEffect,
    importcpp: "Find", header: "Addons.h".}
proc find*(this: CScriptArray; startAt: AsUINT; value: pointer): cint {.
    noSideEffect, importcpp: "Find", header: "Addons.h".}
proc findByRef*(this: CScriptArray; `ref`: pointer): cint {.noSideEffect,
    importcpp: "FindByRef", header: "Addons.h".}
proc findByRef*(this: CScriptArray; startAt: AsUINT; `ref`: pointer): cint {.
    noSideEffect, importcpp: "FindByRef", header: "Addons.h".}
proc getRefCount*(this: var CScriptArray): cint {.importcpp: "GetRefCount",
    header: "Addons.h".}
proc setFlag*(this: var CScriptArray) {.importcpp: "SetFlag", header: "Addons.h".}
proc getFlag*(this: var CScriptArray): bool {.importcpp: "GetFlag",
    header: "Addons.h".}
proc enumReferences*(this: var CScriptArray; engine: ptr AsIScriptEngine) {.
    importcpp: "EnumReferences", header: "Addons.h".}
proc releaseAllHandles*(this: var CScriptArray; engine: ptr AsIScriptEngine) {.
    importcpp: "ReleaseAllHandles", header: "Addons.h".}
discard "forward decl of CScriptDictionary"
type
  CScriptDictValue* {.importcpp: "Urho3D::CScriptDictValue", header: "Addons.h".} = object
    mTypeId* {.importc: "m_typeId".}: cint


proc constructCScriptDictValue*(): CScriptDictValue {.constructor,
    importcpp: "Urho3D::CScriptDictValue(@)", header: "Addons.h".}
proc constructCScriptDictValue*(engine: ptr AsIScriptEngine; value: pointer;
                                typeId: cint): CScriptDictValue {.constructor,
    importcpp: "Urho3D::CScriptDictValue(@)", header: "Addons.h".}
proc destroyCScriptDictValue*(this: var CScriptDictValue) {.
    importcpp: "#.~CScriptDictValue()", header: "Addons.h".}
proc set*(this: var CScriptDictValue; engine: ptr AsIScriptEngine;
          value: pointer; typeId: cint) {.importcpp: "Set", header: "Addons.h".}
proc set*(this: var CScriptDictValue; engine: ptr AsIScriptEngine;
          value: AsINT64) {.importcpp: "Set", header: "Addons.h".}
proc set*(this: var CScriptDictValue; engine: ptr AsIScriptEngine;
          value: cdouble) {.importcpp: "Set", header: "Addons.h".}
proc get*(this: CScriptDictValue; engine: ptr AsIScriptEngine; value: pointer;
          typeId: cint): bool {.noSideEffect, importcpp: "Get",
                                header: "Addons.h".}
proc get*(this: CScriptDictValue; engine: ptr AsIScriptEngine;
          value: var AsINT64): bool {.noSideEffect, importcpp: "Get",
                                      header: "Addons.h".}
proc get*(this: CScriptDictValue; engine: ptr AsIScriptEngine;
          value: var cdouble): bool {.noSideEffect, importcpp: "Get",
                                      header: "Addons.h".}
proc getTypeId*(this: CScriptDictValue): cint {.noSideEffect,
    importcpp: "GetTypeId", header: "Addons.h".}
proc freeValue*(this: var CScriptDictValue; engine: ptr AsIScriptEngine) {.
    importcpp: "FreeValue", header: "Addons.h".}

type
  CScriptDictionary* {.importcpp: "Urho3D::CScriptDictionary", header: "Addons.h".} = object
    engine* {.importc: "engine".}: ptr AsIScriptEngine
    refCount* {.importc: "refCount".}: cint
    gcFlag* {.importc: "gcFlag".}: bool
    dict* {.importc: "dict".}: HashMap[UrString, CScriptDictValue]


proc create*(engine: ptr AsIScriptEngine): ptr CScriptDictionary {.
    importcpp: "Urho3D::CScriptDictionary::Create(@)", header: "Addons.h".}
proc create*(buffer: ptr AsBYTE): ptr CScriptDictionary {.
    importcpp: "Urho3D::CScriptDictionary::Create(@)", header: "Addons.h".}
proc addRef*(this: CScriptDictionary) {.noSideEffect, importcpp: "AddRef",
                                        header: "Addons.h".}
proc release*(this: CScriptDictionary) {.noSideEffect, importcpp: "Release",
    header: "Addons.h".}
proc set*(this: var CScriptDictionary; key: UrString; value: pointer;
          typeId: cint) {.importcpp: "Set", header: "Addons.h".}
proc set*(this: var CScriptDictionary; key: UrString; value: AsINT64) {.
    importcpp: "Set", header: "Addons.h".}
proc set*(this: var CScriptDictionary; key: UrString; value: cdouble) {.
    importcpp: "Set", header: "Addons.h".}
proc get*(this: CScriptDictionary; key: UrString; value: pointer; typeId: cint): bool {.
    noSideEffect, importcpp: "Get", header: "Addons.h".}
proc get*(this: CScriptDictionary; key: UrString; value: var AsINT64): bool {.
    noSideEffect, importcpp: "Get", header: "Addons.h".}
proc get*(this: CScriptDictionary; key: UrString; value: var cdouble): bool {.
    noSideEffect, importcpp: "Get", header: "Addons.h".}
proc `[]`*(this: var CScriptDictionary; key: UrString): ptr CScriptDictValue {.
    importcpp: "#[@]", header: "Addons.h".}
proc `[]`*(this: CScriptDictionary; key: UrString): ptr CScriptDictValue {.
    noSideEffect, importcpp: "#[@]", header: "Addons.h".}
proc getTypeId*(this: CScriptDictionary; key: UrString): cint {.noSideEffect,
    importcpp: "GetTypeId", header: "Addons.h".}
proc exists*(this: CScriptDictionary; key: UrString): bool {.noSideEffect,
    importcpp: "Exists", header: "Addons.h".}
proc isEmpty*(this: CScriptDictionary): bool {.noSideEffect,
    importcpp: "IsEmpty", header: "Addons.h".}
proc getSize*(this: CScriptDictionary): AsUINT {.noSideEffect,
    importcpp: "GetSize", header: "Addons.h".}
proc delete*(this: var CScriptDictionary; key: UrString) {.importcpp: "Delete",
    header: "Addons.h".}
proc deleteAll*(this: var CScriptDictionary) {.importcpp: "DeleteAll",
    header: "Addons.h".}
proc getKeys*(this: CScriptDictionary): ptr CScriptArray {.noSideEffect,
    importcpp: "GetKeys", header: "Addons.h".}
  type
    CIterator* {.importcpp: "Urho3D::CIterator", header: "Addons.h".} = object
      mIt* {.importc: "m_it".}: HashMap[UrString, CScriptDictValue].ConstIterator
      mDict* {.importc: "m_dict".}: CScriptDictionary

  proc `++`*(this: var CIterator) {.importcpp: "++ #", header: "Addons.h".}
  proc `++`*(this: var CIterator; a3: cint) {.importcpp: "++ #",
      header: "Addons.h".}
  proc `*`*(this: var CIterator): var CIterator {.importcpp: "* #",
      header: "Addons.h".}
  proc `==`*(this: CIterator; other: CIterator): bool {.noSideEffect,
      importcpp: "# == #", header: "Addons.h".}
  proc getKey*(this: CIterator): UrString {.noSideEffect, importcpp: "GetKey",
      header: "Addons.h".}
  proc getTypeId*(this: CIterator): cint {.noSideEffect, importcpp: "GetTypeId",
      header: "Addons.h".}
  proc getValue*(this: CIterator; value: var AsINT64): bool {.noSideEffect,
      importcpp: "GetValue", header: "Addons.h".}
  proc getValue*(this: CIterator; value: var cdouble): bool {.noSideEffect,
      importcpp: "GetValue", header: "Addons.h".}
  proc getValue*(this: CIterator; value: pointer; typeId: cint): bool {.
      noSideEffect, importcpp: "GetValue", header: "Addons.h".}
proc begin*(this: CScriptDictionary): CIterator {.noSideEffect,
    importcpp: "begin", header: "Addons.h".}
proc `end`*(this: CScriptDictionary): CIterator {.noSideEffect,
    importcpp: "end", header: "Addons.h".}
proc getRefCount*(this: var CScriptDictionary): cint {.importcpp: "GetRefCount",
    header: "Addons.h".}
proc setGCFlag*(this: var CScriptDictionary) {.importcpp: "SetGCFlag",
    header: "Addons.h".}
proc getGCFlag*(this: var CScriptDictionary): bool {.importcpp: "GetGCFlag",
    header: "Addons.h".}
proc enumReferences*(this: var CScriptDictionary; engine: ptr AsIScriptEngine) {.
    importcpp: "EnumReferences", header: "Addons.h".}
proc releaseAllReferences*(this: var CScriptDictionary;
                           engine: ptr AsIScriptEngine) {.
    importcpp: "ReleaseAllReferences", header: "Addons.h".}

proc registerArray*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterArray(@)", header: "Addons.h".}

proc registerDictionary*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterDictionary(@)", header: "Addons.h".}

proc registerString*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterString(@)", header: "Addons.h".}
