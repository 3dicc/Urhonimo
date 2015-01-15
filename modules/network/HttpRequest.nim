

import 
  arrayPtr, deserializer, mutex, refCounted, thread


type 
  HttpRequestState* = enum 
    HTTP_INITIALIZING = 0, HTTP_ERROR, HTTP_OPEN, HTTP_CLOSED



type 
  HttpRequest* {.importc: "Urho3D::HttpRequest", header: "HttpRequest.h".} = object of RefCounted
    url* {.importc: "url_".}: UrString
    verb* {.importc: "verb_".}: UrString
    error* {.importc: "error_".}: UrString
    headers* {.importc: "headers_".}: Vector[UrString]
    postData* {.importc: "postData_".}: UrString
    state* {.importc: "state_".}: HttpRequestState
    mutex* {.importc: "mutex_".}: Mutex
    httpReadBuffer* {.importc: "httpReadBuffer_".}: SharedArrayPtr[cuchar]
    readBuffer* {.importc: "readBuffer_".}: SharedArrayPtr[cuchar]
    readPosition* {.importc: "readPosition_".}: cuint
    writePosition* {.importc: "writePosition_".}: cuint


proc constructHttpRequest*(url: UrString; verb: UrString; 
                           headers: Vector[UrString]; postData: UrString): HttpRequest {.
    importcpp: "Urho3D::HttpRequest(@)", header: "HttpRequest.h".}
proc destroyHttpRequest*(this: var HttpRequest) {.importcpp: "#.~HttpRequest()", 
    header: "HttpRequest.h".}
proc threadFunction*(this: var HttpRequest) {.importcpp: "ThreadFunction", 
    header: "HttpRequest.h".}
proc read*(this: var HttpRequest; dest: pointer; size: cuint): cuint {.
    importcpp: "Read", header: "HttpRequest.h".}
proc seek*(this: var HttpRequest; position: cuint): cuint {.importcpp: "Seek", 
    header: "HttpRequest.h".}
proc getURL*(this: HttpRequest): UrString {.noSideEffect, importcpp: "GetURL", 
    header: "HttpRequest.h".}
proc getVerb*(this: HttpRequest): UrString {.noSideEffect, importcpp: "GetVerb", 
    header: "HttpRequest.h".}
proc getError*(this: HttpRequest): UrString {.noSideEffect, 
    importcpp: "GetError", header: "HttpRequest.h".}
proc getState*(this: HttpRequest): HttpRequestState {.noSideEffect, 
    importcpp: "GetState", header: "HttpRequest.h".}
proc getAvailableSize*(this: HttpRequest): cuint {.noSideEffect, 
    importcpp: "GetAvailableSize", header: "HttpRequest.h".}
proc isOpen*(this: HttpRequest): bool {.noSideEffect, importcpp: "IsOpen", 
                                        header: "HttpRequest.h".}