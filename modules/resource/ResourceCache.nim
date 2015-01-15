

import 
  file, hashSet, list, mutex, resource

discard "forward decl of BackgroundLoader"
discard "forward decl of FileWatcher"
discard "forward decl of PackageFile"
var PRIORITY_LAST* {.importc: "PRIORITY_LAST", header: "ResourceCache.h".}: cuint = 0xFFFFFFFF


type 
  ResourceGroup* {.importc: "Urho3D::ResourceGroup", header: "ResourceCache.h".} = object 
    memoryBudget* {.importc: "memoryBudget_".}: cuint
    memoryUse* {.importc: "memoryUse_".}: cuint
    resources* {.importc: "resources_".}: HashMap[StringHash, 
        SharedPtr[Resource]]


proc constructResourceGroup*(): ResourceGroup {.
    importcpp: "Urho3D::ResourceGroup(@)", header: "ResourceCache.h".}

type 
  ResourceRequest* = enum 
    RESOURCE_CHECKEXISTS = 0, RESOURCE_GETFILE = 1



type 
  ResourceRouter* {.importc: "Urho3D::ResourceRouter", header: "ResourceCache.h".} = object of UrObject
  

proc constructResourceRouter*(context: ptr Context): ResourceRouter {.
    importcpp: "Urho3D::ResourceRouter(@)", header: "ResourceCache.h".}
proc route*(this: var ResourceRouter; name: var UrString; 
            requestType: ResourceRequest) {.importcpp: "Route", 
    header: "ResourceCache.h".}

type 
  ResourceCache* {.importc: "Urho3D::ResourceCache", header: "ResourceCache.h".} = object of UrObject
    resourceMutex* {.importc: "resourceMutex_".}: Mutex
    resourceGroups* {.importc: "resourceGroups_".}: HashMap[StringHash, 
        ResourceGroup]
    resourceDirs* {.importc: "resourceDirs_".}: Vector[UrString]
    fileWatchers* {.importc: "fileWatchers_".}: Vector[SharedPtr[FileWatcher]]
    packages* {.importc: "packages_".}: Vector[SharedPtr[PackageFile]]
    dependentResources* {.importc: "dependentResources_".}: HashMap[StringHash, 
        HashSet[StringHash]]
    backgroundLoader* {.importc: "backgroundLoader_".}: SharedPtr[
        BackgroundLoader]
    resourceRouter* {.importc: "resourceRouter_".}: SharedPtr[ResourceRouter]
    autoReloadResources* {.importc: "autoReloadResources_".}: bool
    returnFailedResources* {.importc: "returnFailedResources_".}: bool
    searchPackagesFirst* {.importc: "searchPackagesFirst_".}: bool
    finishBackgroundResourcesMs* {.importc: "finishBackgroundResourcesMs_".}: cint


proc getType*(this: ResourceCache): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "ResourceCache.h".}
proc getBaseType*(this: ResourceCache): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "ResourceCache.h".}
proc getTypeName*(this: ResourceCache): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "ResourceCache.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::ResourceCache::GetTypeStatic(@)", 
    header: "ResourceCache.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::ResourceCache::GetTypeNameStatic(@)", 
    header: "ResourceCache.h".}
proc constructResourceCache*(context: ptr Context): ResourceCache {.
    importcpp: "Urho3D::ResourceCache(@)", header: "ResourceCache.h".}
proc destroyResourceCache*(this: var ResourceCache) {.
    importcpp: "#.~ResourceCache()", header: "ResourceCache.h".}
proc addResourceDir*(this: var ResourceCache; pathName: UrString; 
                     priority: cuint = priority_Last): bool {.
    importcpp: "AddResourceDir", header: "ResourceCache.h".}
proc addPackageFile*(this: var ResourceCache; package: ptr PackageFile; 
                     priority: cuint = priority_Last) {.
    importcpp: "AddPackageFile", header: "ResourceCache.h".}
proc addManualResource*(this: var ResourceCache; resource: ptr Resource): bool {.
    importcpp: "AddManualResource", header: "ResourceCache.h".}
proc removeResourceDir*(this: var ResourceCache; pathName: UrString) {.
    importcpp: "RemoveResourceDir", header: "ResourceCache.h".}
proc removePackageFile*(this: var ResourceCache; package: ptr PackageFile; 
                        releaseResources: bool = true; 
                        forceRelease: bool = false) {.
    importcpp: "RemovePackageFile", header: "ResourceCache.h".}
proc removePackageFile*(this: var ResourceCache; fileName: UrString; 
                        releaseResources: bool = true; 
                        forceRelease: bool = false) {.
    importcpp: "RemovePackageFile", header: "ResourceCache.h".}
proc releaseResource*(this: var ResourceCache; `type`: StringHash; 
                      name: UrString; force: bool = false) {.
    importcpp: "ReleaseResource", header: "ResourceCache.h".}
proc releaseResources*(this: var ResourceCache; `type`: StringHash; 
                       force: bool = false) {.importcpp: "ReleaseResources", 
    header: "ResourceCache.h".}
proc releaseResources*(this: var ResourceCache; `type`: StringHash; 
                       partialName: UrString; force: bool = false) {.
    importcpp: "ReleaseResources", header: "ResourceCache.h".}
proc releaseResources*(this: var ResourceCache; partialName: UrString; 
                       force: bool = false) {.importcpp: "ReleaseResources", 
    header: "ResourceCache.h".}
proc releaseAllResources*(this: var ResourceCache; force: bool = false) {.
    importcpp: "ReleaseAllResources", header: "ResourceCache.h".}
proc reloadResource*(this: var ResourceCache; resource: ptr Resource): bool {.
    importcpp: "ReloadResource", header: "ResourceCache.h".}
proc reloadResourceWithDependencies*(this: var ResourceCache; fileName: UrString) {.
    importcpp: "ReloadResourceWithDependencies", header: "ResourceCache.h".}
proc setMemoryBudget*(this: var ResourceCache; `type`: StringHash; budget: cuint) {.
    importcpp: "SetMemoryBudget", header: "ResourceCache.h".}
proc setAutoReloadResources*(this: var ResourceCache; enable: bool) {.
    importcpp: "SetAutoReloadResources", header: "ResourceCache.h".}
proc setReturnFailedResources*(this: var ResourceCache; enable: bool) {.
    importcpp: "SetReturnFailedResources", header: "ResourceCache.h".}
proc setSearchPackagesFirst*(this: var ResourceCache; value: bool) {.
    importcpp: "SetSearchPackagesFirst", header: "ResourceCache.h".}
proc setFinishBackgroundResourcesMs*(this: var ResourceCache; ms: cint) {.
    importcpp: "SetFinishBackgroundResourcesMs", header: "ResourceCache.h".}
proc setResourceRouter*(this: var ResourceCache; router: ptr ResourceRouter) {.
    importcpp: "SetResourceRouter", header: "ResourceCache.h".}
proc getFile*(this: var ResourceCache; name: UrString; 
              sendEventOnFailure: bool = true): SharedPtr[File] {.
    importcpp: "GetFile", header: "ResourceCache.h".}
proc getResource*(this: var ResourceCache; `type`: StringHash; name: UrString; 
                  sendEventOnFailure: bool = true): ptr Resource {.
    importcpp: "GetResource", header: "ResourceCache.h".}
proc getTempResource*(this: var ResourceCache; `type`: StringHash; 
                      name: UrString; sendEventOnFailure: bool = true): SharedPtr[
    Resource] {.importcpp: "GetTempResource", header: "ResourceCache.h".}
proc backgroundLoadResource*(this: var ResourceCache; `type`: StringHash; 
                             name: UrString; sendEventOnFailure: bool = true; 
                             caller: ptr Resource = 0): bool {.
    importcpp: "BackgroundLoadResource", header: "ResourceCache.h".}
proc getNumBackgroundLoadResources*(this: ResourceCache): cuint {.noSideEffect, 
    importcpp: "GetNumBackgroundLoadResources", header: "ResourceCache.h".}
proc getResources*(this: ResourceCache; result: var PODVector[ptr Resource]; 
                   `type`: StringHash) {.noSideEffect, 
    importcpp: "GetResources", header: "ResourceCache.h".}
proc getAllResources*(this: ResourceCache): HashMap[StringHash, ResourceGroup] {.
    noSideEffect, importcpp: "GetAllResources", header: "ResourceCache.h".}
proc getResourceDirs*(this: ResourceCache): Vector[UrString] {.noSideEffect, 
    importcpp: "GetResourceDirs", header: "ResourceCache.h".}
proc getPackageFiles*(this: ResourceCache): Vector[SharedPtr[PackageFile]] {.
    noSideEffect, importcpp: "GetPackageFiles", header: "ResourceCache.h".}
proc getResource*[T](this: var ResourceCache; name: UrString; 
                     sendEventOnFailure: bool = true): ptr T {.
    importcpp: "GetResource", header: "ResourceCache.h".}
proc getTempResource*[T](this: var ResourceCache; name: UrString; 
                         sendEventOnFailure: bool = true): SharedPtr[T] {.
    importcpp: "GetTempResource", header: "ResourceCache.h".}
proc backgroundLoadResource*[T](this: var ResourceCache; name: UrString; 
                                sendEventOnFailure: bool = true; 
                                caller: ptr Resource = 0): bool {.
    importcpp: "BackgroundLoadResource", header: "ResourceCache.h".}
proc getResources*[T](this: ResourceCache; result: var PODVector[ptr T]) {.
    noSideEffect, importcpp: "GetResources", header: "ResourceCache.h".}
proc exists*(this: ResourceCache; name: UrString): bool {.noSideEffect, 
    importcpp: "Exists", header: "ResourceCache.h".}
proc getMemoryBudget*(this: ResourceCache; `type`: StringHash): cuint {.
    noSideEffect, importcpp: "GetMemoryBudget", header: "ResourceCache.h".}
proc getMemoryUse*(this: ResourceCache; `type`: StringHash): cuint {.
    noSideEffect, importcpp: "GetMemoryUse", header: "ResourceCache.h".}
proc getTotalMemoryUse*(this: ResourceCache): cuint {.noSideEffect, 
    importcpp: "GetTotalMemoryUse", header: "ResourceCache.h".}
proc getResourceFileName*(this: ResourceCache; name: UrString): UrString {.
    noSideEffect, importcpp: "GetResourceFileName", header: "ResourceCache.h".}
proc getAutoReloadResources*(this: ResourceCache): bool {.noSideEffect, 
    importcpp: "GetAutoReloadResources", header: "ResourceCache.h".}
proc getReturnFailedResources*(this: ResourceCache): bool {.noSideEffect, 
    importcpp: "GetReturnFailedResources", header: "ResourceCache.h".}
proc getSearchPackagesFirst*(this: ResourceCache): bool {.noSideEffect, 
    importcpp: "GetSearchPackagesFirst", header: "ResourceCache.h".}
proc getFinishBackgroundResourcesMs*(this: ResourceCache): cint {.noSideEffect, 
    importcpp: "GetFinishBackgroundResourcesMs", header: "ResourceCache.h".}
proc getResourceRouter*(this: ResourceCache): ptr ResourceRouter {.noSideEffect, 
    importcpp: "GetResourceRouter", header: "ResourceCache.h".}
proc getPreferredResourceDir*(this: ResourceCache; path: UrString): UrString {.
    noSideEffect, importcpp: "GetPreferredResourceDir", 
    header: "ResourceCache.h".}
proc sanitateResourceName*(this: ResourceCache; name: UrString): UrString {.
    noSideEffect, importcpp: "SanitateResourceName", header: "ResourceCache.h".}
proc sanitateResourceDirName*(this: ResourceCache; name: UrString): UrString {.
    noSideEffect, importcpp: "SanitateResourceDirName", 
    header: "ResourceCache.h".}
proc storeResourceDependency*(this: var ResourceCache; resource: ptr Resource; 
                              dependency: UrString) {.
    importcpp: "StoreResourceDependency", header: "ResourceCache.h".}
proc resetDependencies*(this: var ResourceCache; resource: ptr Resource) {.
    importcpp: "ResetDependencies", header: "ResourceCache.h".}
proc resourceCache::GetResource*[T](name: UrString; sendEventOnFailure: bool): ptr T
proc resourceCache::GetTempResource*[T](name: UrString; sendEventOnFailure: bool): SharedPtr[
    T]
proc resourceCache::BackgroundLoadResource*[T](name: UrString; 
    sendEventOnFailure: bool; caller: ptr Resource): bool
proc resourceCache::GetResources*[T](result: var PODVector[ptr T]) {.
    noSideEffect.}

proc registerResourceLibrary*(context: ptr Context) {.
    importcpp: "Urho3D::RegisterResourceLibrary(@)", header: "ResourceCache.h".}