

import
  variant


type
  Controls* {.importcpp: "Urho3D::Controls", header: "Controls.h".} = object
    buttons* {.importc: "buttons_".}: cuint
    yaw* {.importc: "yaw_".}: cfloat
    pitch* {.importc: "pitch_".}: cfloat
    extraData* {.importc: "extraData_".}: VariantMap


proc constructControls*(): Controls {.importcpp: "Urho3D::Controls(@)",
                         constructor, header: "Controls.h".}
proc destroyControls*(this: var Controls) {.importcpp: "#.~Controls()",
    header: "Controls.h".}
proc reset*(this: var Controls) {.importcpp: "Reset", header: "Controls.h".}
proc set*(this: var Controls; buttons: cuint; down: bool = true) {.
    importcpp: "Set", header: "Controls.h".}
proc isDown*(this: Controls; button: cuint): bool {.noSideEffect,
    importcpp: "IsDown", header: "Controls.h".}
proc isDown*(this: Controls; button: cint): bool {.noSideEffect,
    importcpp: "IsDown", header: "Controls.h".}

proc isPressed*(this: Controls; button: cuint; previousControls: Controls): bool {.
    noSideEffect, importcpp: "IsPressed", header: "Controls.h".}
proc isPressed*(this: Controls; button: cint; previousControls: Controls): bool {.
    noSideEffect, importcpp: "IsPressed", header: "Controls.h".}
