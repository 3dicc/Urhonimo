

import 
  hashMap, hashSet, mutex, `ptr`, refCounted, stringHash, thread

discard "forward decl of Resource"
discard "forward decl of ResourceCache"
type 
  BackgroundLoadItem* {.importc: "Urho3D::BackgroundLoadItem", 
                        header: "BackgroundLoader.h".} = object 
    resource* {.importc: "resource_".}: SharedPtr[Resource]
    dependencies* {.importc: "dependencies_".}: HashSet[
        Pair[StringHash, StringHash]]
    dependents* {.importc: "dependents_".}: HashSet[Pair[StringHash, StringHash]]
    sendEventOnFailure* {.importc: "sendEventOnFailure_".}: bool



type 
  BackgroundLoader* {.importc: "Urho3D::BackgroundLoader", 
                      header: "BackgroundLoader.h".} = object of RefCounted
    owner* {.importc: "owner_".}: ptr ResourceCache
    backgroundLoadMutex* {.importc: "backgroundLoadMutex_".}: Mutex
    backgroundLoadQueue* {.importc: "backgroundLoadQueue_".}: HashMap[
        Pair[StringHash, StringHash], BackgroundLoadItem]


proc constructBackgroundLoader*(owner: ptr ResourceCache): BackgroundLoader {.
    importcpp: "Urho3D::BackgroundLoader(@)", header: "BackgroundLoader.h".}
proc threadFunction*(this: var BackgroundLoader) {.importcpp: "ThreadFunction", 
    header: "BackgroundLoader.h".}
proc queueResource*(this: var BackgroundLoader; `type`: StringHash; 
                    name: UrString; sendEventOnFailure: bool; 
                    caller: ptr Resource): bool {.importcpp: "QueueResource", 
    header: "BackgroundLoader.h".}
proc waitForResource*(this: var BackgroundLoader; `type`: StringHash; 
                      nameHash: StringHash) {.importcpp: "WaitForResource", 
    header: "BackgroundLoader.h".}
proc finishResources*(this: var BackgroundLoader; maxMs: cint) {.
    importcpp: "FinishResources", header: "BackgroundLoader.h".}
proc getNumQueuedResources*(this: BackgroundLoader): cuint {.noSideEffect, 
    importcpp: "GetNumQueuedResources", header: "BackgroundLoader.h".}