

import
  staticModel, urobject, urstr, hashmap, camera, matrix4, stringHash,
  octreequery, vector, drawable


type
  Skybox* {.importcpp: "Urho3D::Skybox", header: "Skybox.h".} = object of StaticModel
    customWorldTransforms* {.importc: "customWorldTransforms_".}: HashMap[
        ptr Camera, Matrix3x4]
    lastFrame* {.importc: "lastFrame_".}: cuint


proc getType*(this: Skybox): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Skybox.h".}
proc getBaseType*(this: Skybox): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Skybox.h".}
proc getTypeName*(this: Skybox): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Skybox.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Skybox::GetTypeStatic(@)", header: "Skybox.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Skybox::GetTypeNameStatic(@)", header: "Skybox.h".}
proc constructSkybox*(context: ptr Context): Skybox {.
    importcpp: "Urho3D::Skybox(@)", header: "Skybox.h", constructor.}
proc destroySkybox*(this: var Skybox) {.importcpp: "#.~Skybox()",
                                        header: "Skybox.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Skybox::RegisterObject(@)", header: "Skybox.h".}
proc processRayQuery*(this: var Skybox; query: RayOctreeQuery;
                      results: var PODVector[RayQueryResult]) {.
    importcpp: "ProcessRayQuery", header: "Skybox.h".}
proc updateBatches*(this: var Skybox; frame: FrameInfo) {.
    importcpp: "UpdateBatches", header: "Skybox.h".}
