

type 
  Mutex* {.importc: "Urho3D::Mutex", header: "Mutex.h".} = object 
    handle* {.importc: "handle_".}: pointer


proc constructMutex*(): Mutex {.importcpp: "Urho3D::Mutex(@)", header: "Mutex.h".}
proc destroyMutex*(this: var Mutex) {.importcpp: "#.~Mutex()", header: "Mutex.h".}
proc acquire*(this: var Mutex) {.importcpp: "Acquire", header: "Mutex.h".}
proc release*(this: var Mutex) {.importcpp: "Release", header: "Mutex.h".}

type 
  MutexLock* {.importc: "Urho3D::MutexLock", header: "Mutex.h".} = object 

proc constructMutexLock*(mutex: var Mutex): MutexLock {.
    importcpp: "Urho3D::MutexLock(@)", header: "Mutex.h".}
proc destroyMutexLock*(this: var MutexLock) {.importcpp: "#.~MutexLock()", 
    header: "Mutex.h".}
