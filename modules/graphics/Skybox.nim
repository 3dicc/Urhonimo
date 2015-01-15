

import 
  staticModel


type 
  Skybox* {.importc: "Urho3D::Skybox", header: "Skybox.h".} = object of StaticModel
    customWorldTransforms* {.importc: "customWorldTransforms_".}: HashMap[
        ptr Camera, Matrix3x4]
    lastFrame* {.importc: "lastFrame_".}: cuint


proc getType*(this: Skybox): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Skybox.h".}
proc getBaseType*(this: Skybox): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Skybox.h".}
proc getTypeName*(this: Skybox): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Skybox.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Skybox::GetTypeStatic(@)", header: "Skybox.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Skybox::GetTypeNameStatic(@)", header: "Skybox.h".}
proc constructSkybox*(context: ptr Context): Skybox {.
    importcpp: "Urho3D::Skybox(@)", header: "Skybox.h".}
proc destroySkybox*(this: var Skybox) {.importcpp: "#.~Skybox()", 
                                        header: "Skybox.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Skybox::RegisterObject(@)", header: "Skybox.h".}
proc processRayQuery*(this: var Skybox; query: RayOctreeQuery; 
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "Skybox.h".}
proc updateBatches*(this: var Skybox; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "Skybox.h".}