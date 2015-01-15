

import 
  context, octreeQuery

when defined(URHO3D_PHYSICS): 
  import 
    physicsWorld

when defined(URHO3D_URHO2D): 
  import 
    physicsWorld2D

import 
  vector2, vector3

discard "forward decl of lua_State"
discard "forward decl of Context"
discard "forward decl of Pass"
discard "forward decl of SoundSource"
discard "forward decl of UIElement"
nil

const 
  toluaIsurho3dstring* = toluaIsstring


template toluaPushurho3dstring*(x, y: expr): expr = 
  toluaPushstring(x, y.cString())


proc toluaTourho3dstring*(L: ptr LuaState; narg: cint; str: cstring): cstring {.
    importcpp: "tolua_tourho3dstring(@)", header: "ToluaUtils.h".}

proc toluaTourho3dstring*(L: ptr LuaState; narg: cint; str: UrString): cstring {.
    importcpp: "tolua_tourho3dstring(@)", header: "ToluaUtils.h".}

proc setContext*(L: ptr LuaState; context: ptr Context) {.
    importcpp: "SetContext(@)", header: "ToluaUtils.h".}

proc getContext*(L: ptr LuaState): ptr Context {.importcpp: "GetContext(@)", 
    header: "ToluaUtils.h".}

proc toluaNewObject*[T](toluaS: ptr LuaState): cint

proc toluaNewObjectGC*[T](toluaS: ptr LuaState): cint

proc toluaGetSubsystem*[T](toluaS: ptr LuaState): cint

proc toluaIsVector*[T](L: ptr LuaState; lo: cint; `type`: cstring; def: cint; 
                       err: ptr ToluaError): cint {.
    importcpp: "ToluaIsVector(@)", header: "ToluaUtils.h".}

proc toluaToVector*[T](L: ptr LuaState; narg: cint; def: pointer): pointer {.
    importcpp: "ToluaToVector(@)", header: "ToluaUtils.h".}

proc toluaPushVector*[T](L: ptr LuaState; data: pointer; `type`: cstring): cint {.
    importcpp: "ToluaPushVector(@)", header: "ToluaUtils.h".}

proc toluaIsPODVector*[T](L: ptr LuaState; lo: cint; `type`: cstring; def: cint; 
                          err: ptr ToluaError): cint {.
    importcpp: "ToluaIsPODVector(@)", header: "ToluaUtils.h".}

proc toluaToPODVector*[T](L: ptr LuaState; narg: cint; def: pointer): pointer {.
    importcpp: "ToluaToPODVector(@)", header: "ToluaUtils.h".}

proc toluaPushPODVector*[T](L: ptr LuaState; data: pointer; `type`: cstring): cint {.
    importcpp: "ToluaPushPODVector(@)", header: "ToluaUtils.h".}

proc toluaPushObject*(L: ptr LuaState; data: pointer; `type`: cstring) {.
    importcpp: "ToluaPushObject(@)", header: "ToluaUtils.h".}