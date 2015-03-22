

import
  urho3D


type
  Condition* {.importc: "Urho3D::Condition", header: "Condition.h".} = object
    event* {.importc: "event_".}: pointer


proc constructCondition*(): Condition {.importcpp: "Urho3D::Condition(@)",
                                        header: "Condition.h", constructor.}
proc destroyCondition*(this: var Condition) {.importcpp: "#.~Condition()",
    header: "Condition.h".}
proc set*(this: var Condition) {.importcpp: "Set", header: "Condition.h".}
proc wait*(this: var Condition) {.importcpp: "Wait", header: "Condition.h".}
