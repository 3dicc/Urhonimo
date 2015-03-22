

import
  hashMap, ptrs, component, stringhash

discard "forward decl of Component"
discard "forward decl of Node"


proc constructSceneResolver*(): SceneResolver {.constructor,
    importcpp: "Urho3D::SceneResolver(@)", header: "SceneResolver.h".}
proc destroySceneResolver*(this: var SceneResolver) {.
    importcpp: "#.~SceneResolver()", header: "SceneResolver.h".}
proc reset*(this: var SceneResolver) {.importcpp: "Reset",
                                       header: "SceneResolver.h".}
proc addNode*(this: var SceneResolver; oldID: cuint; node: ptr component.Node) {.
    importcpp: "AddNode", header: "SceneResolver.h".}
proc addComponent*(this: var SceneResolver; oldID: cuint;
                   component: ptr Component) {.importcpp: "AddComponent",
    header: "SceneResolver.h".}
proc resolve*(this: var SceneResolver) {.importcpp: "Resolve",
    header: "SceneResolver.h".}
