

import 
  UrObject


var E_SCENEUPDATE* {.importc: "E_SCENEUPDATE", header: "SceneEvents.h".}: StringHash = "SceneUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: StringHash = "TimeStep"



var E_SCENESUBSYSTEMUPDATE* {.importc: "E_SCENESUBSYSTEMUPDATE", 
                              header: "SceneEvents.h".}: StringHash = "SceneSubsystemUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: StringHash = "TimeStep"



var E_UPDATESMOOTHING* {.importc: "E_UPDATESMOOTHING", header: "SceneEvents.h".}: StringHash = "UpdateSmoothing"

var P_CONSTANT* {.importc: "P_CONSTANT", header: "SceneEvents.h".}: StringHash = "Constant"


var P_SQUAREDSNAPTHRESHOLD* {.importc: "P_SQUAREDSNAPTHRESHOLD", 
                              header: "SceneEvents.h".}: StringHash = "SquaredSnapThreshold"



var E_SCENEDRAWABLEUPDATEFINISHED* {.importc: "E_SCENEDRAWABLEUPDATEFINISHED", 
                                     header: "SceneEvents.h".}: StringHash = "SceneDrawableUpdateFinished"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: StringHash = "TimeStep"



var E_TARGETPOSITION* {.importc: "E_TARGETPOSITION", header: "SceneEvents.h".}: StringHash = "TargetPositionChanged"

discard 

var E_TARGETROTATION* {.importc: "E_TARGETROTATION", header: "SceneEvents.h".}: StringHash = "TargetRotationChanged"

discard 

var E_ATTRIBUTEANIMATIONUPDATE* {.importc: "E_ATTRIBUTEANIMATIONUPDATE", 
                                  header: "SceneEvents.h".}: StringHash = "AttributeAnimationUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: StringHash = "TimeStep"



var E_SCENEPOSTUPDATE* {.importc: "E_SCENEPOSTUPDATE", header: "SceneEvents.h".}: StringHash = "ScenePostUpdate"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "SceneEvents.h".}: StringHash = "TimeStep"



var E_ASYNCLOADPROGRESS* {.importc: "E_ASYNCLOADPROGRESS", 
                           header: "SceneEvents.h".}: StringHash = "AsyncLoadProgress"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_PROGRESS* {.importc: "P_PROGRESS", header: "SceneEvents.h".}: StringHash = "Progress"


var P_LOADEDNODES* {.importc: "P_LOADEDNODES", header: "SceneEvents.h".}: StringHash = "LoadedNodes"


var P_TOTALNODES* {.importc: "P_TOTALNODES", header: "SceneEvents.h".}: StringHash = "TotalNodes"


var P_LOADEDRESOURCES* {.importc: "P_LOADEDRESOURCES", header: "SceneEvents.h".}: StringHash = "LoadedResources"


var P_TOTALRESOURCES* {.importc: "P_TOTALRESOURCES", header: "SceneEvents.h".}: StringHash = "TotalResources"



var E_ASYNCLOADFINISHED* {.importc: "E_ASYNCLOADFINISHED", 
                           header: "SceneEvents.h".}: StringHash = "AsyncLoadFinished"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"



var E_NODEADDED* {.importc: "E_NODEADDED", header: "SceneEvents.h".}: StringHash = "NodeAdded"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_PARENT* {.importc: "P_PARENT", header: "SceneEvents.h".}: StringHash = "Parent"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: StringHash = "Node"



var E_NODEREMOVED* {.importc: "E_NODEREMOVED", header: "SceneEvents.h".}: StringHash = "NodeRemoved"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_PARENT* {.importc: "P_PARENT", header: "SceneEvents.h".}: StringHash = "Parent"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: StringHash = "Node"



var E_COMPONENTADDED* {.importc: "E_COMPONENTADDED", header: "SceneEvents.h".}: StringHash = "ComponentAdded"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: StringHash = "Node"


var P_COMPONENT* {.importc: "P_COMPONENT", header: "SceneEvents.h".}: StringHash = "Component"



var E_COMPONENTREMOVED* {.importc: "E_COMPONENTREMOVED", header: "SceneEvents.h".}: StringHash = "ComponentRemoved"

var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: StringHash = "Node"


var P_COMPONENT* {.importc: "P_COMPONENT", header: "SceneEvents.h".}: StringHash = "Component"



var E_NODENAMECHANGED* {.importc: "E_NODENAMECHANGED", header: "SceneEvents.h".}: StringHash = "NodeNameChanged"
var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash = "Scene"
var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: StringHash = "Node"



var E_NODEENABLEDCHANGED* {.importc: "E_NODEENABLEDCHANGED", 
                            header: "SceneEvents.h".}: StringHash #= "NodeEnabledChanged"
var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash #= "Scene"


var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: StringHash #= "Node"

var E_COMPONENTENABLEDCHANGED* {.importc: "E_COMPONENTENABLEDCHANGED", 
                                 header: "SceneEvents.h".}: StringHash #= "ComponentEnabledChanged"
var P_SCENE* {.importc: "P_SCENE", header: "SceneEvents.h".}: StringHash #= "Scene"
var P_NODE* {.importc: "P_NODE", header: "SceneEvents.h".}: StringHash #= "Node"
var P_COMPONENT* {.importc: "P_COMPONENT", header: "SceneEvents.h".}: StringHash #= "Component"
var E_TEMPORARYCHANGED* {.importc: "E_TEMPORARYCHANGED", header: "SceneEvents.h".}: StringHash #= "TemporaryChanged"
var P_SERIALIZABLE* {.importc: "P_SERIALIZABLE", header: "SceneEvents.h".}: StringHash #= "Serializable"

