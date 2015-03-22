

import
  UrObject, timer, urstr, vector, stringHash, deserializer, serializer, variant,
  ptrs

discard "forward decl of Deserializer"
discard "forward decl of Serializer"
type
  AsyncLoadState* {.importcpp: "Urho3D::AsyncLoadState".} = enum
    ASYNC_DONE = 0, ASYNC_QUEUED = 1, ASYNC_LOADING = 2, ASYNC_SUCCESS = 3,
    ASYNC_FAIL = 4



type
  Resource* {.importcpp: "Urho3D::Resource", header: "Resource.h".} = object of UrObject
    name* {.importc: "name_".}: UrString
    nameHash* {.importc: "nameHash_".}: StringHash
    useTimer* {.importc: "useTimer_".}: Timer
    memoryUse* {.importc: "memoryUse_".}: cuint
    asyncLoadState* {.importc: "asyncLoadState_".}: AsyncLoadState


proc getType*(this: Resource): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Resource.h".}
proc getBaseType*(this: Resource): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Resource.h".}
proc getTypeName*(this: Resource): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Resource.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Resource::GetTypeStatic(@)", header: "Resource.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Resource::GetTypeNameStatic(@)", header: "Resource.h".}
proc getBaseTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Resource::GetBaseTypeStatic(@)", header: "Resource.h".}
proc constructResource*(context: ptr Context): Resource {.constructor,
    importcpp: "Urho3D::Resource(@)", header: "Resource.h".}
proc load*(this: var Resource; source: var Deserializer): bool {.
    importcpp: "Load", header: "Resource.h".}
proc beginLoad*(this: var Resource; source: var Deserializer): bool {.
    importcpp: "BeginLoad", header: "Resource.h".}
proc endLoad*(this: var Resource): bool {.importcpp: "EndLoad",
    header: "Resource.h".}
proc save*(this: Resource; dest: var Serializer): bool {.noSideEffect,
    importcpp: "Save", header: "Resource.h".}
proc setName*(this: var Resource; name: UrString) {.importcpp: "SetName",
    header: "Resource.h".}
proc setMemoryUse*(this: var Resource; size: cuint) {.importcpp: "SetMemoryUse",
    header: "Resource.h".}
proc resetUseTimer*(this: var Resource) {.importcpp: "ResetUseTimer",
    header: "Resource.h".}
proc setAsyncLoadState*(this: var Resource; newState: AsyncLoadState) {.
    importcpp: "SetAsyncLoadState", header: "Resource.h".}
proc getName*(this: Resource): UrString {.noSideEffect, importcpp: "GetName",
    header: "Resource.h".}
proc getNameHash*(this: Resource): StringHash {.noSideEffect,
    importcpp: "GetNameHash", header: "Resource.h".}
proc getMemoryUse*(this: Resource): cuint {.noSideEffect,
    importcpp: "GetMemoryUse", header: "Resource.h".}
proc getUseTimer*(this: var Resource): cuint {.importcpp: "GetUseTimer",
    header: "Resource.h".}
proc getAsyncLoadState*(this: Resource): AsyncLoadState {.noSideEffect,
    importcpp: "GetAsyncLoadState", header: "Resource.h".}

proc getResourceName*(resource: ptr Resource): UrString {.noSideEffect,
    importcpp: "Urho3D::GetResourceName(@)", header: "Resource.h".}
proc getResourceType*(resource: ptr Resource; defaultType: StringHash): StringHash {.noSideEffect,
    importcpp: "Urho3D::GetResourceType(@)", header: "Resource.h".}
proc getResourceRef*(resource: ptr Resource; defaultType: StringHash): ResourceRef {.noSideEffect,
    importcpp: "Urho3D::GetResourceReg", header: "Resource.h".}
proc getResourceNames*[T](resources: Vector[SharedPtr[T]]): Vector[UrString] {.noSideEffect,
    importcpp: "Urho3D::GetResourceNames(@)", header: "Resource.h".}
proc getResourceRefList*[T](resources: Vector[SharedPtr[T]]): ResourceRefList{.noSideEffect,
    importcpp: "Urho3D::GetResourceRefList(@)", header: "Resource.h".}

