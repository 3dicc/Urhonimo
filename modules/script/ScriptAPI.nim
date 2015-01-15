

discard "forward decl of asIScriptEngine"
discard "forward decl of Context"
proc registerMathAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterMathAPI(@)", header: "ScriptAPI.h".}

proc registerCoreAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterCoreAPI(@)", header: "ScriptAPI.h".}

proc registerIOAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterIOAPI(@)", header: "ScriptAPI.h".}

proc registerResourceAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterResourceAPI(@)", header: "ScriptAPI.h".}

proc registerSceneAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterSceneAPI(@)", header: "ScriptAPI.h".}

proc registerGraphicsAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterGraphicsAPI(@)", header: "ScriptAPI.h".}

proc registerInputAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterInputAPI(@)", header: "ScriptAPI.h".}

proc registerAudioAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterAudioAPI(@)", header: "ScriptAPI.h".}

proc registerUIAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterUIAPI(@)", header: "ScriptAPI.h".}

proc registerNetworkAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterNetworkAPI(@)", header: "ScriptAPI.h".}
when defined(URHO3D_PHYSICS): 
  proc registerPhysicsAPI*(engine: ptr AsIScriptEngine) {.
      importcpp: "Urho3D::RegisterPhysicsAPI(@)", header: "ScriptAPI.h".}
when defined(URHO3D_NAVIGATION): 
  proc registerNavigationAPI*(engine: ptr AsIScriptEngine) {.
      importcpp: "Urho3D::RegisterNavigationAPI(@)", header: "ScriptAPI.h".}

proc registerUrho2DAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterUrho2DAPI(@)", header: "ScriptAPI.h".}

proc registerScriptAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterScriptAPI(@)", header: "ScriptAPI.h".}

proc registerEngineAPI*(engine: ptr AsIScriptEngine) {.
    importcpp: "Urho3D::RegisterEngineAPI(@)", header: "ScriptAPI.h".}