

import 
  list, mutex, UrObject


var E_WORKITEMCOMPLETED* {.importc: "E_WORKITEMCOMPLETED", header: "WorkQueue.h".}: Urho3D.StringHash = "WorkItemCompleted"

var P_ITEM* {.importc: "P_ITEM", header: "WorkQueue.h".}: Urho3D.StringHash = "Item"


discard "forward decl of WorkerThread"
type 
  WorkItem* {.importc: "Urho3D::WorkItem", header: "WorkQueue.h".} = object of RefCounted
    start* {.importc: "start_".}: pointer
    `end`* {.importc: "end_".}: pointer
    aux* {.importc: "aux_".}: pointer
    priority* {.importc: "priority_".}: cuint
    sendEvent* {.importc: "sendEvent_".}: bool
    completed* {.importc: "completed_".}: bool
    pooled* {.importc: "pooled_".}: bool


proc constructWorkItem*(): WorkItem {.importcpp: "Urho3D::WorkItem(@)", 
                                      header: "WorkQueue.h".}

type 
  WorkQueue* {.importc: "Urho3D::WorkQueue", header: "WorkQueue.h".} = object of UrObject
    threads* {.importc: "threads_".}: Vector[SharedPtr[WorkerThread]]
    poolItems* {.importc: "poolItems_".}: List[SharedPtr[WorkItem]]
    workItems* {.importc: "workItems_".}: List[SharedPtr[WorkItem]]
    queue* {.importc: "queue_".}: List[ptr WorkItem]
    queueMutex* {.importc: "queueMutex_".}: Mutex
    shutDown* {.importc: "shutDown_".}: bool
    pausing* {.importc: "pausing_".}: bool
    paused* {.importc: "paused_".}: bool
    tolerance* {.importc: "tolerance_".}: cint
    lastSize* {.importc: "lastSize_".}: cuint
    maxNonThreadedWorkMs* {.importc: "maxNonThreadedWorkMs_".}: cint


proc getType*(this: WorkQueue): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "WorkQueue.h".}
proc getBaseType*(this: WorkQueue): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "WorkQueue.h".}
proc getTypeName*(this: WorkQueue): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "WorkQueue.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::WorkQueue::GetTypeStatic(@)", header: "WorkQueue.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::WorkQueue::GetTypeNameStatic(@)", header: "WorkQueue.h".}
proc constructWorkQueue*(context: ptr Context): WorkQueue {.
    importcpp: "Urho3D::WorkQueue(@)", header: "WorkQueue.h".}
proc destroyWorkQueue*(this: var WorkQueue) {.importcpp: "#.~WorkQueue()", 
    header: "WorkQueue.h".}
proc createThreads*(this: var WorkQueue; numThreads: cuint) {.
    importcpp: "CreateThreads", header: "WorkQueue.h".}
proc getFreeItem*(this: var WorkQueue): SharedPtr[WorkItem] {.
    importcpp: "GetFreeItem", header: "WorkQueue.h".}
proc addWorkItem*(this: var WorkQueue; item: SharedPtr[WorkItem]) {.
    importcpp: "AddWorkItem", header: "WorkQueue.h".}
proc pause*(this: var WorkQueue) {.importcpp: "Pause", header: "WorkQueue.h".}
proc resume*(this: var WorkQueue) {.importcpp: "Resume", header: "WorkQueue.h".}
proc complete*(this: var WorkQueue; priority: cuint) {.importcpp: "Complete", 
    header: "WorkQueue.h".}
proc setTolerance*(this: var WorkQueue; tolerance: cint) {.
    importcpp: "SetTolerance", header: "WorkQueue.h".}
proc setNonThreadedWorkMs*(this: var WorkQueue; ms: cint) {.
    importcpp: "SetNonThreadedWorkMs", header: "WorkQueue.h".}
proc getNumThreads*(this: WorkQueue): cuint {.noSideEffect, 
    importcpp: "GetNumThreads", header: "WorkQueue.h".}
proc isCompleted*(this: WorkQueue; priority: cuint): bool {.noSideEffect, 
    importcpp: "IsCompleted", header: "WorkQueue.h".}
proc getTolerance*(this: WorkQueue): cint {.noSideEffect, 
    importcpp: "GetTolerance", header: "WorkQueue.h".}
proc getNonThreadedWorkMs*(this: WorkQueue): cint {.noSideEffect, 
    importcpp: "GetNonThreadedWorkMs", header: "WorkQueue.h".}