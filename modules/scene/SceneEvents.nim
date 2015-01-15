

import 
  UrObject


var E_SCENEUPDATE* {.importc: "E_SCENEUPDATE", header: "SceneEvents.h".}: Urho3D.StringHash = "SceneUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_SCENESUBSYSTEMUPDATE* {.importc: "E_SCENESUBSYSTEMUPDATE", 
                              header: "SceneEvents.h".}: Urho3D.StringHash = "SceneSubsystemUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_UPDATESMOOTHING* {.importc: "E_UPDATESMOOTHING", header: "SceneEvents.h".}: Urho3D.StringHash = "UpdateSmoothing"

var P_CONSTANT* {.importc: "P_CONSTANT", header: "SceneEvents.h".}: Urho3D.StringHash = "Constant"


var P_SQUAREDSNAPTHRESHOLD* {.importc: "P_SQUAREDSNAPTHRESHOLD", 
                              header: "SceneEvents.h".}: Urho3D.StringHash = "SquaredSnapThreshold"



var E_SCENEDRAWABLEUPDATEFINISHED* {.importc: "E_SCENEDRAWABLEUPDATEFINISHED", 
                                     header: "SceneEvents.h".}: Urho3D.StringHash = "SceneDrawableUpdateFinished"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_TARGETPOSITION* {.importc: "E_TARGETPOSITION", header: "SceneEvents.h".}: Urho3D.StringHash = "TargetPositionChanged"

discard 

var E_TARGETROTATION* {.importc: "E_TARGETROTATION", header: "SceneEvents.h".}: Urho3D.StringHash = "TargetRotationChanged"

discard 

var E_ATTRIBUTEANIMATIONUPDATE* {.importc: "E_ATTRIBUTEANIMATIONUPDATE", 
                                  header: "SceneEvents.h".}: Urho3D.StringHash = "AttributeAnimationUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_SCENEPOSTUPDATE* {.importc: "E_SCENEPOSTUPDATE", header: "SceneEvents.h".}: Urho3D.StringHash = "ScenePostUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_ASYNCLOADPROGRESS* {.importc: "E_ASYNCLOADPROGRESS", 
                           header: "SceneEvents.h".}: Urho3D.StringHash = "AsyncLoadProgress"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_PROGRESS* {.importc: "P_PROGRESS", header: "SceneEvents.h".}: Urho3D.StringHash = "Progress"


var P_LOADEDNODES* {.importc: "P_LOADEDNODES", header: "SceneEvents.h".}: Urho3D.StringHash = "LoadedNodes"


var P_TOTALNODES* {.importc: "P_TOTALNODES", header: "SceneEvents.h".}: Urho3D.StringHash = "TotalNodes"


var P_LOADEDRESOURCES* {.importc: "P_LOADEDRESOURCES", header: "SceneEvents.h".}: Urho3D.StringHash = "LoadedResources"


var P_TOTALRESOURCES* {.importc: "P_TOTALRESOURCES", header: "SceneEvents.h".}: Urho3D.StringHash = "TotalResources"



var E_ASYNCLOADFINISHED* {.importc: "E_ASYNCLOADFINISHED", 
                           header: "SceneEvents.h".}: Urho3D.StringHash = "AsyncLoadFinished"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"



var E_NODEADDED* {.importc: "E_NODEADDED", header: "SceneEvents.h".}: Urho3D.StringHash = "NodeAdded"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_PARENT* {.importc: "P_PARENT", header: "SceneEvents.h".}: Urho3D.StringHash = "Parent"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: Urho3D.StringHash = "Node"



var E_NODEREMOVED* {.importc: "E_NODEREMOVED", header: "SceneEvents.h".}: Urho3D.StringHash = "NodeRemoved"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_PARENT* {.importc: "P_PARENT", header: "SceneEvents.h".}: Urho3D.StringHash = "Parent"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: Urho3D.StringHash = "Node"



var E_COMPONENTADDED* {.importc: "E_COMPONENTADDED", header: "SceneEvents.h".}: Urho3D.StringHash = "ComponentAdded"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: Urho3D.StringHash = "Node"


var P_COMPONENT* {.importc: "P_COMPONENT", header: "SceneEvents.h".}: Urho3D.StringHash = "Component"



var E_COMPONENTREMOVED* {.importc: "E_COMPONENTREMOVED", header: "SceneEvents.h".}: Urho3D.StringHash = "ComponentRemoved"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: Urho3D.StringHash = "Node"


var P_COMPONENT* {.importc: "P_COMPONENT", header: "SceneEvents.h".}: Urho3D.StringHash = "Component"



var E_NODENAMECHANGED* {.importc: "E_NODENAMECHANGED", header: "SceneEvents.h".}: Urho3D.StringHash = "NodeNameChanged"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: Urho3D.StringHash = "Node"



var E_NODEENABLEDCHANGED* {.importc: "E_NODEENABLEDCHANGED", 
                            header: "SceneEvents.h".}: Urho3D.StringHash = "NodeEnabledChanged"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: Urho3D.StringHash = "Node"



var E_COMPONENTENABLEDCHANGED* {.importc: "E_COMPONENTENABLEDCHANGED", 
                                 header: "SceneEvents.h".}: Urho3D.StringHash = "ComponentEnabledChanged"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: Urho3D.StringHash = "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: Urho3D.StringHash = "Node"


var P_COMPONENT* {.importc: "P_COMPONENT", header: "SceneEvents.h".}: Urho3D.StringHash = "Component"



var E_TEMPORARYCHANGED* {.importc: "E_TEMPORARYCHANGED", header: "SceneEvents.h".}: Urho3D.StringHash = "TemporaryChanged"

var P_SERIALIZABLE* {.importc: "P_SERIALIZABLE", header: "SceneEvents.h".}: Urho3D.StringHash = "Serializable"

