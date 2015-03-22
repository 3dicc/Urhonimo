

import
  hashSet, inputEvents, mutex, UrObject, list, cursor, vector2, ptrs, uielement,
  urstr, vector, graphics, hashmap, stringHash, serializer, deserializer,
  urobject


type
  MouseMode* {.importcpp: "Urho3D::MouseMode".} = enum
    MM_ABSOLUTE = 0, MM_RELATIVE, MM_WRAP


discard "forward decl of Deserializer"
discard "forward decl of Graphics"
discard "forward decl of Serializer"
discard "forward decl of UIElement"
discard "forward decl of XMLFile"
var MOUSE_POSITION_OFFSCREEN* {.importcpp: "Urho3D::MOUSE_POSITION_OFFSCREEN",
                                header: "Input.h".}: IntVector2
                                #= intVector2(m_Min_Int, m_Min_Int)

type
  TouchState* {.importcpp: "Urho3D::TouchState", header: "Input.h".} = object
    touchID* {.importc: "touchID_".}: cint
    position* {.importc: "position_".}: IntVector2
    lastPosition* {.importc: "lastPosition_".}: IntVector2
    delta* {.importc: "delta_".}: IntVector2
    pressure* {.importc: "pressure_".}: cfloat
    touchedElement* {.importc: "touchedElement_".}: WeakPtr[UIElement]


proc getTouchedElement*(this: var TouchState): ptr UIElement {.
    importcpp: "GetTouchedElement", header: "Input.h".}

type
  JoystickState* {.importcpp: "Urho3D::JoystickState", header: "Input.h".} = object
    #joystick* {.importc: "joystick_".}: ptr SDL_Joystick
    #joystickID* {.importc: "joystickID_".}: SDL_JoystickID
    #controller* {.importc: "controller_".}: ptr SDL_GameController
    screenJoystick* {.importc: "screenJoystick_".}: ptr UIElement
    name* {.importc: "name_".}: UrString
    buttons* {.importc: "buttons_".}: PODVector[bool]
    buttonPress* {.importc: "buttonPress_".}: PODVector[bool]
    axes* {.importc: "axes_".}: PODVector[cfloat]
    hats* {.importc: "hats_".}: PODVector[cint]


proc constructJoystickState*(): JoystickState {.constructor,
    importcpp: "Urho3D::JoystickState(@)", header: "Input.h".}
proc initialize*(this: var JoystickState; numButtons: cuint; numAxes: cuint;
                 numHats: cuint) {.importcpp: "Initialize", header: "Input.h".}
proc reset*(this: var JoystickState) {.importcpp: "Reset", header: "Input.h".}
proc isController*(this: JoystickState): bool {.noSideEffect,
    importcpp: "IsController", header: "Input.h".}
proc getNumButtons*(this: JoystickState): cuint {.noSideEffect,
    importcpp: "GetNumButtons", header: "Input.h".}
proc getNumAxes*(this: JoystickState): cuint {.noSideEffect,
    importcpp: "GetNumAxes", header: "Input.h".}
proc getNumHats*(this: JoystickState): cuint {.noSideEffect,
    importcpp: "GetNumHats", header: "Input.h".}
proc getButtonDown*(this: JoystickState; index: cuint): bool {.noSideEffect,
    importcpp: "GetButtonDown", header: "Input.h".}
proc getButtonPress*(this: JoystickState; index: cuint): bool {.noSideEffect,
    importcpp: "GetButtonPress", header: "Input.h".}
proc getAxisPosition*(this: JoystickState; index: cuint): cfloat {.noSideEffect,
    importcpp: "GetAxisPosition", header: "Input.h".}
proc getHatPosition*(this: JoystickState; index: cuint): cint {.noSideEffect,
    importcpp: "GetHatPosition", header: "Input.h".}

type
  Input* {.importcpp: "Urho3D::Input", header: "Input.h".} = object of UrObject
    graphics* {.importc: "graphics_".}: WeakPtr[Graphics]
    keyDown* {.importc: "keyDown_".}: HashSet[cint]
    keyPress* {.importc: "keyPress_".}: HashSet[cint]
    scancodeDown* {.importc: "scancodeDown_".}: HashSet[cint]
    scancodePress* {.importc: "scancodePress_".}: HashSet[cint]
    touches* {.importc: "touches_".}: HashMap[cint, TouchState]
    availableTouchIDs* {.importc: "availableTouchIDs_".}: List[cint]
    touchIDMap* {.importc: "touchIDMap_".}: HashMap[cint, cint]
    textInput* {.importc: "textInput_".}: UrString
    #joysticks* {.importc: "joysticks_".}: HashMap[SDL_JoystickID, JoystickState]
    mouseButtonDown* {.importc: "mouseButtonDown_".}: cuint
    mouseButtonPress* {.importc: "mouseButtonPress_".}: cuint
    lastMousePosition* {.importc: "lastMousePosition_".}: IntVector2
    lastVisibleMousePosition* {.importc: "lastVisibleMousePosition_".}: IntVector2
    mouseMove* {.importc: "mouseMove_".}: IntVector2
    mouseMoveWheel* {.importc: "mouseMoveWheel_".}: cint
    windowID* {.importc: "windowID_".}: cuint
    toggleFullscreen* {.importc: "toggleFullscreen_".}: bool
    mouseVisible* {.importc: "mouseVisible_".}: bool
    lastMouseVisible* {.importc: "lastMouseVisible_".}: bool
    mouseGrabbed* {.importc: "mouseGrabbed_".}: bool
    mouseMode* {.importc: "mouseMode_".}: MouseMode
    touchEmulation* {.importc: "touchEmulation_".}: bool
    inputFocus* {.importc: "inputFocus_".}: bool
    minimized* {.importc: "minimized_".}: bool
    focusedThisFrame* {.importc: "focusedThisFrame_".}: bool
    suppressNextMouseMove* {.importc: "suppressNextMouseMove_".}: bool
    initialized* {.importc: "initialized_".}: bool


proc getType*(this: Input): StringHash {.noSideEffect,
    importcpp: "GetType", header: "Input.h".}
proc getBaseType*(this: Input): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "Input.h".}
proc getTypeName*(this: Input): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "Input.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::Input::GetTypeStatic(@)", header: "Input.h".}
proc getTypeNameStatic*(): UrString {.
    importcpp: "Urho3D::Input::GetTypeNameStatic(@)", header: "Input.h".}
proc constructInput*(context: ptr Context): Input {.constructor,
    importcpp: "Urho3D::Input(@)", header: "Input.h".}
proc destroyInput*(this: var Input) {.importcpp: "#.~Input()", header: "Input.h".}
proc update*(this: var Input) {.importcpp: "Update", header: "Input.h".}
proc setToggleFullscreen*(this: var Input; enable: bool) {.
    importcpp: "SetToggleFullscreen", header: "Input.h".}
proc setMouseVisible*(this: var Input; enable: bool; suppressEvent: bool = false) {.
    importcpp: "SetMouseVisible", header: "Input.h".}
proc resetMouseVisible*(this: var Input) {.importcpp: "ResetMouseVisible",
    header: "Input.h".}
proc setMouseGrabbed*(this: var Input; grab: bool) {.
    importcpp: "SetMouseGrabbed", header: "Input.h".}
proc setMouseMode*(this: var Input; mode: MouseMode) {.
    importcpp: "SetMouseMode", header: "Input.h".}

when false:
  proc addScreenJoystick*(this: var Input; layoutFile: ptr XMLFile = 0;
                          styleFile: ptr XMLFile = 0): SDL_JoystickID {.
      importcpp: "AddScreenJoystick", header: "Input.h".}
  proc removeScreenJoystick*(this: var Input; id: SDL_JoystickID): bool {.
      importcpp: "RemoveScreenJoystick", header: "Input.h".}
  proc setScreenJoystickVisible*(this: var Input; id: SDL_JoystickID; enable: bool) {.
      importcpp: "SetScreenJoystickVisible", header: "Input.h".}

proc setScreenKeyboardVisible*(this: var Input; enable: bool) {.
    importcpp: "SetScreenKeyboardVisible", header: "Input.h".}
proc setTouchEmulation*(this: var Input; enable: bool) {.
    importcpp: "SetTouchEmulation", header: "Input.h".}
proc recordGesture*(this: var Input): bool {.importcpp: "RecordGesture",
    header: "Input.h".}
proc saveGestures*(this: var Input; dest: var Serializer): bool {.
    importcpp: "SaveGestures", header: "Input.h".}
proc saveGesture*(this: var Input; dest: var Serializer; gestureID: cuint): bool {.
    importcpp: "SaveGesture", header: "Input.h".}
proc loadGestures*(this: var Input; source: var Deserializer): cuint {.
    importcpp: "LoadGestures", header: "Input.h".}
proc removeGesture*(this: var Input; gestureID: cuint): bool {.
    importcpp: "RemoveGesture", header: "Input.h".}
proc removeAllGestures*(this: var Input) {.importcpp: "RemoveAllGestures",
    header: "Input.h".}
proc getKeyFromName*(this: Input; name: UrString): cint {.noSideEffect,
    importcpp: "GetKeyFromName", header: "Input.h".}
proc getKeyFromScancode*(this: Input; scancode: cint): cint {.noSideEffect,
    importcpp: "GetKeyFromScancode", header: "Input.h".}
proc getKeyName*(this: Input; key: cint): UrString {.noSideEffect,
    importcpp: "GetKeyName", header: "Input.h".}
proc getScancodeFromKey*(this: Input; key: cint): cint {.noSideEffect,
    importcpp: "GetScancodeFromKey", header: "Input.h".}
proc getScancodeFromName*(this: Input; name: UrString): cint {.noSideEffect,
    importcpp: "GetScancodeFromName", header: "Input.h".}
proc getScancodeName*(this: Input; scancode: cint): UrString {.noSideEffect,
    importcpp: "GetScancodeName", header: "Input.h".}
proc getKeyDown*(this: Input; key: cint): bool {.noSideEffect,
    importcpp: "GetKeyDown", header: "Input.h".}
proc getKeyDown*(this: Input; key: char): bool {.noSideEffect,
    importcpp: "GetKeyDown", header: "Input.h".}
proc getKeyPress*(this: Input; key: cint): bool {.noSideEffect,
    importcpp: "GetKeyPress", header: "Input.h".}
proc getKeyPress*(this: Input; key: char): bool {.noSideEffect,
    importcpp: "GetKeyPress", header: "Input.h".}

proc getScancodeDown*(this: Input; scancode: cint): bool {.noSideEffect,
    importcpp: "GetScancodeDown", header: "Input.h".}
proc getScancodePress*(this: Input; scanode: cint): bool {.noSideEffect,
    importcpp: "GetScancodePress", header: "Input.h".}
proc getMouseButtonDown*(this: Input; button: cint): bool {.noSideEffect,
    importcpp: "GetMouseButtonDown", header: "Input.h".}
proc getMouseButtonPress*(this: Input; button: cint): bool {.noSideEffect,
    importcpp: "GetMouseButtonPress", header: "Input.h".}
proc getQualifierDown*(this: Input; qualifier: cint): bool {.noSideEffect,
    importcpp: "GetQualifierDown", header: "Input.h".}
proc getQualifierPress*(this: Input; qualifier: cint): bool {.noSideEffect,
    importcpp: "GetQualifierPress", header: "Input.h".}
proc getQualifiers*(this: Input): cint {.noSideEffect,
    importcpp: "GetQualifiers", header: "Input.h".}
proc getMousePosition*(this: Input): IntVector2 {.noSideEffect,
    importcpp: "GetMousePosition", header: "Input.h".}
proc getMouseMove*(this: Input): IntVector2 {.noSideEffect,
    importcpp: "GetMouseMove", header: "Input.h".}
proc getMouseMoveX*(this: Input): cint {.noSideEffect,
    importcpp: "GetMouseMoveX", header: "Input.h".}
proc getMouseMoveY*(this: Input): cint {.noSideEffect,
    importcpp: "GetMouseMoveY", header: "Input.h".}
proc getMouseMoveWheel*(this: Input): cint {.noSideEffect,
    importcpp: "GetMouseMoveWheel", header: "Input.h".}
proc getNumTouches*(this: Input): cuint {.noSideEffect,
    importcpp: "GetNumTouches", header: "Input.h".}
proc getTouch*(this: Input; index: int): ptr TouchState {.noSideEffect,
    importcpp: "GetTouch", header: "Input.h".}
proc getNumJoysticks*(this: Input): cuint {.noSideEffect,
    importcpp: "GetNumJoysticks", header: "Input.h".}
when false:
  proc getJoystick*(this: var Input; id: SDL_JoystickID): ptr JoystickState {.
      importcpp: "GetJoystick", header: "Input.h".}
  proc isScreenJoystickVisible*(this: Input; id: SDL_JoystickID): bool {.
      noSideEffect, importcpp: "IsScreenJoystickVisible", header: "Input.h".}

proc getJoystickByIndex*(this: var Input; index: cuint): ptr JoystickState {.
    importcpp: "GetJoystickByIndex", header: "Input.h".}
proc getToggleFullscreen*(this: Input): bool {.noSideEffect,
    importcpp: "GetToggleFullscreen", header: "Input.h".}
proc getScreenKeyboardSupport*(this: Input): bool {.noSideEffect,
    importcpp: "GetScreenKeyboardSupport", header: "Input.h".}
proc isScreenKeyboardVisible*(this: Input): bool {.noSideEffect,
    importcpp: "IsScreenKeyboardVisible", header: "Input.h".}
proc getTouchEmulation*(this: Input): bool {.noSideEffect,
    importcpp: "GetTouchEmulation", header: "Input.h".}
proc isMouseVisible*(this: Input): bool {.noSideEffect,
    importcpp: "IsMouseVisible", header: "Input.h".}
proc isMouseGrabbed*(this: Input): bool {.noSideEffect,
    importcpp: "IsMouseGrabbed", header: "Input.h".}
proc getMouseMode*(this: Input): MouseMode {.noSideEffect,
    importcpp: "GetMouseMode", header: "Input.h".}
proc hasFocus*(this: var Input): bool {.importcpp: "HasFocus", header: "Input.h".}
proc isMinimized*(this: Input): bool {.noSideEffect, importcpp: "IsMinimized",
                                       header: "Input.h".}
