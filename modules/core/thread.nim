

import
  urho3D

when not defined(WIN32):
  type
    ThreadID* = PthreadT
else:
  type
    ThreadID* = cuint

type
  Thread* {.importcpp: "Urho3D::Thread", header: "Thread.h".} = object
    handle* {.importc: "handle_".}: pointer
    shouldRun* {.importc: "shouldRun_".}: bool


proc constructThread*(): Thread {.importcpp: "Urho3D::Thread(@)",
                                  header: "Thread.h", constructor.}
proc destroyThread*(this: var Thread) {.importcpp: "#.~Thread()",
                                        header: "Thread.h".}
proc threadFunction*(this: var Thread) {.importcpp: "ThreadFunction",
    header: "Thread.h".}
proc run*(this: var Thread): bool {.importcpp: "Run", header: "Thread.h".}
proc stop*(this: var Thread) {.importcpp: "Stop", header: "Thread.h".}
proc setPriority*(this: var Thread; priority: cint) {.importcpp: "SetPriority",
    header: "Thread.h".}
proc isStarted*(this: Thread): bool {.noSideEffect, importcpp: "IsStarted",
                                      header: "Thread.h".}
proc setMainThread*() {.importcpp: "Urho3D::Thread::SetMainThread(@)",
                        header: "Thread.h".}
proc getCurrentThreadID*(): ThreadID {.importcpp: "Urho3D::Thread::GetCurrentThreadID(@)",
                                       header: "Thread.h".}
proc isMainThread*(): bool {.importcpp: "Urho3D::Thread::IsMainThread(@)",
                             header: "Thread.h".}
