

import
  UrObject


var E_BEGINFRAME* {.importc: "E_BEGINFRAME", header: "CoreEvents.h".}: Urho3D.StringHash = "BeginFrame"

var P_FRAMENUMBER* {.importc: "P_FRAMENUMBER", header: "CoreEvents.h".}: Urho3D.StringHash = "FrameNumber"


var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "CoreEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_UPDATE* {.importc: "E_UPDATE", header: "CoreEvents.h".}: Urho3D.StringHash = "Update"

var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "CoreEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_POSTUPDATE* {.importc: "E_POSTUPDATE", header: "CoreEvents.h".}: Urho3D.StringHash = "PostUpdate"

var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "CoreEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_RENDERUPDATE* {.importc: "E_RENDERUPDATE", header: "CoreEvents.h".}: Urho3D.StringHash = "RenderUpdate"

var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "CoreEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_POSTRENDERUPDATE* {.importc: "E_POSTRENDERUPDATE", header: "CoreEvents.h".}: Urho3D.StringHash = "PostRenderUpdate"

var P_TIMESTEP* {.importc: "P_TIMESTEP", header: "CoreEvents.h".}: Urho3D.StringHash = "TimeStep"



var E_ENDFRAME* {.importc: "E_ENDFRAME", header: "CoreEvents.h".}: StringHash #= "EndFrame"
