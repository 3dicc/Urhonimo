

import
  stringHash, urstr


var E_MOUSEBUTTONDOWN* {.importcpp: "Urho3D::E_MOUSEBUTTONDOWN", header: "InputEvents.h".}: StringHash #= "MouseButtonDown"

var P_BUTTON* {.importcpp: "Urho3D::P_BUTTON", header: "InputEvents.h".}: StringHash #= "Button"


var P_BUTTONS* {.importcpp: "Urho3D::P_BUTTONS", header: "InputEvents.h".}: StringHash #= "Buttons"


var P_QUALIFIERS* {.importcpp: "Urho3D::P_QUALIFIERS", header: "InputEvents.h".}: StringHash #= "Qualifiers"



var E_MOUSEBUTTONUP* {.importcpp: "Urho3D::E_MOUSEBUTTONUP", header: "InputEvents.h".}: StringHash #= "MouseButtonUp"

#var P_BUTTON* {.importcpp: "Urho3D::P_BUTTON", header: "InputEvents.h".}: StringHash #= "Button"
#var P_BUTTONS* {.importcpp: "Urho3D::P_BUTTONS", header: "InputEvents.h".}: StringHash #= "Buttons"
#var P_QUALIFIERS* {.importcpp: "Urho3D::P_QUALIFIERS", header: "InputEvents.h".}: StringHash #= "Qualifiers"



var E_MOUSEMOVE* {.importcpp: "Urho3D::E_MOUSEMOVE", header: "InputEvents.h".}: StringHash #= "MouseMove"

var P_X* {.importcpp: "Urho3D::P_X", header: "InputEvents.h".}: StringHash #= "X"


var P_Y* {.importcpp: "Urho3D::P_Y", header: "InputEvents.h".}: StringHash #= "Y"


var P_DX* {.importcpp: "Urho3D::P_DX", header: "InputEvents.h".}: StringHash #= "DX"


var P_DY* {.importcpp: "Urho3D::P_DY", header: "InputEvents.h".}: StringHash #= "DY"


#var P_BUTTONS* {.importcpp: "Urho3D::P_BUTTONS", header: "InputEvents.h".}: StringHash #= "Buttons"


#var P_QUALIFIERS* {.importcpp: "Urho3D::P_QUALIFIERS", header: "InputEvents.h".}: StringHash #= "Qualifiers"



var E_MOUSEWHEEL* {.importcpp: "Urho3D::E_MOUSEWHEEL", header: "InputEvents.h".}: StringHash #= "MouseWheel"

var P_WHEEL* {.importcpp: "Urho3D::P_WHEEL", header: "InputEvents.h".}: StringHash #= "Wheel"


#var P_BUTTONS* {.importcpp: "Urho3D::P_BUTTONS", header: "InputEvents.h".}: StringHash #= "Buttons"
#var P_QUALIFIERS* {.importcpp: "Urho3D::P_QUALIFIERS", header: "InputEvents.h".}: StringHash #= "Qualifiers"



var E_KEYDOWN* {.importcpp: "Urho3D::E_KEYDOWN", header: "InputEvents.h".}: StringHash #= "KeyDown"

var P_KEY* {.importcpp: "Urho3D::P_KEY", header: "InputEvents.h".}: StringHash #= "Key"


var P_SCANCODE* {.importcpp: "Urho3D::P_SCANCODE", header: "InputEvents.h".}: StringHash #= "Scancode"


var P_RAW* {.importcpp: "Urho3D::P_RAW", header: "InputEvents.h".}: StringHash #= "Raw"


#var P_BUTTONS* {.importcpp: "Urho3D::P_BUTTONS", header: "InputEvents.h".}: StringHash #= "Buttons"


#var P_QUALIFIERS* {.importcpp: "Urho3D::P_QUALIFIERS", header: "InputEvents.h".}: StringHash #= "Qualifiers"


var P_REPEAT* {.importcpp: "Urho3D::P_REPEAT", header: "InputEvents.h".}: StringHash #= "Repeat"



var E_KEYUP* {.importcpp: "Urho3D::E_KEYUP", header: "InputEvents.h".}: StringHash #= "KeyUp"

#var P_KEY* {.importcpp: "Urho3D::P_KEY", header: "InputEvents.h".}: StringHash #= "Key"
#var P_SCANCODE* {.importcpp: "Urho3D::P_SCANCODE", header: "InputEvents.h".}: StringHash #= "Scancode"
#var P_RAW* {.importcpp: "Urho3D::P_RAW", header: "InputEvents.h".}: StringHash #= "Raw"
#var P_BUTTONS* {.importcpp: "Urho3D::P_BUTTONS", header: "InputEvents.h".}: StringHash #= "Buttons"
#var P_QUALIFIERS* {.importcpp: "Urho3D::P_QUALIFIERS", header: "InputEvents.h".}: StringHash #= "Qualifiers"



var E_TEXTINPUT* {.importcpp: "Urho3D::E_TEXTINPUT", header: "InputEvents.h".}: StringHash #= "TextInput"

var P_TEXT* {.importcpp: "Urho3D::P_TEXT", header: "InputEvents.h".}: StringHash #= "Text"


#var P_BUTTONS* {.importcpp: "Urho3D::P_BUTTONS", header: "InputEvents.h".}: StringHash #= "Buttons"
#var P_QUALIFIERS* {.importcpp: "Urho3D::P_QUALIFIERS", header: "InputEvents.h".}: StringHash #= "Qualifiers"



var E_JOYSTICKCONNECTED* {.importcpp: "Urho3D::E_JOYSTICKCONNECTED",
                           header: "InputEvents.h".}: StringHash #= "JoystickConnected"

var P_JOYSTICKID* {.importcpp: "Urho3D::P_JOYSTICKID", header: "InputEvents.h".}: StringHash #= "JoystickID"



var E_JOYSTICKDISCONNECTED* {.importcpp: "Urho3D::E_JOYSTICKDISCONNECTED",
                              header: "InputEvents.h".}: StringHash #= "JoystickDisconnected"

#var P_JOYSTICKID* {.importcpp: "Urho3D::P_JOYSTICKID", header: "InputEvents.h".}: StringHash #= "JoystickID"



var E_JOYSTICKBUTTONDOWN* {.importcpp: "Urho3D::E_JOYSTICKBUTTONDOWN",
                            header: "InputEvents.h".}: StringHash #= "JoystickButtonDown"

#var P_JOYSTICKID* {.importcpp: "Urho3D::P_JOYSTICKID", header: "InputEvents.h".}: StringHash #= "JoystickID"


#var P_BUTTON* {.importcpp: "Urho3D::P_BUTTON", header: "InputEvents.h".}: StringHash #= "Button"



var E_JOYSTICKBUTTONUP* {.importcpp: "Urho3D::E_JOYSTICKBUTTONUP", header: "InputEvents.h".}: StringHash #= "JoystickButtonUp"

#var P_JOYSTICKID* {.importcpp: "Urho3D::P_JOYSTICKID", header: "InputEvents.h".}: StringHash #= "JoystickID"


#var P_BUTTON* {.importcpp: "Urho3D::P_BUTTON", header: "InputEvents.h".}: StringHash #= "Button"



var E_JOYSTICKAXISMOVE* {.importcpp: "Urho3D::E_JOYSTICKAXISMOVE", header: "InputEvents.h".}: StringHash #= "JoystickAxisMove"

#var P_JOYSTICKID* {.importcpp: "Urho3D::P_JOYSTICKID", header: "InputEvents.h".}: StringHash #= "JoystickID"


var P_AXIS* {.importcpp: "Urho3D::P_AXIS", header: "InputEvents.h".}: StringHash #= "Button"


var P_POSITION* {.importcpp: "Urho3D::P_POSITION", header: "InputEvents.h".}: StringHash #= "Position"



var E_JOYSTICKHATMOVE* {.importcpp: "Urho3D::E_JOYSTICKHATMOVE", header: "InputEvents.h".}: StringHash #= "JoystickHatMove"

#var P_JOYSTICKID* {.importcpp: "Urho3D::P_JOYSTICKID", header: "InputEvents.h".}: StringHash #= "JoystickID"


var P_HAT* {.importcpp: "Urho3D::P_HAT", header: "InputEvents.h".}: StringHash #= "Button"


#var P_POSITION* {.importcpp: "Urho3D::P_POSITION", header: "InputEvents.h".}: StringHash #= "Position"



var E_TOUCHBEGIN* {.importcpp: "Urho3D::E_TOUCHBEGIN", header: "InputEvents.h".}: StringHash #= "TouchBegin"

var P_TOUCHID* {.importcpp: "Urho3D::P_TOUCHID", header: "InputEvents.h".}: StringHash #= "TouchID"


#var P_X* {.importcpp: "Urho3D::P_X", header: "InputEvents.h".}: StringHash #= "X"
#var P_Y* {.importcpp: "Urho3D::P_Y", header: "InputEvents.h".}: StringHash #= "Y"


var P_PRESSURE* {.importcpp: "Urho3D::P_PRESSURE", header: "InputEvents.h".}: StringHash #= "Pressure"



var E_TOUCHEND* {.importcpp: "Urho3D::E_TOUCHEND", header: "InputEvents.h".}: StringHash #= "TouchEnd"

#var P_TOUCHID* {.importcpp: "Urho3D::P_TOUCHID", header: "InputEvents.h".}: StringHash #= "TouchID"


#var P_X* {.importcpp: "Urho3D::P_X", header: "InputEvents.h".}: StringHash #= "X"
#var P_Y* {.importcpp: "Urho3D::P_Y", header: "InputEvents.h".}: StringHash #= "Y"



var E_TOUCHMOVE* {.importcpp: "Urho3D::E_TOUCHMOVE", header: "InputEvents.h".}: StringHash #= "TouchMove"

#var P_TOUCHID* {.importcpp: "Urho3D::P_TOUCHID", header: "InputEvents.h".}: StringHash #= "TouchID"


#var P_X* {.importcpp: "Urho3D::P_X", header: "InputEvents.h".}: StringHash #= "X"
#var P_Y* {.importcpp: "Urho3D::P_Y", header: "InputEvents.h".}: StringHash #= "Y"


#var P_DX* {.importcpp: "Urho3D::P_DX", header: "InputEvents.h".}: StringHash #= "DX"
#var P_DY* {.importcpp: "Urho3D::P_DY", header: "InputEvents.h".}: StringHash #= "DY"


#var P_PRESSURE* {.importcpp: "Urho3D::P_PRESSURE", header: "InputEvents.h".}: StringHash #= "Pressure"

var E_GESTURERECORDED* {.importcpp: "Urho3D::E_GESTURERECORDED", header: "InputEvents.h".}: StringHash #= "GestureRecorded"
var P_GESTUREID* {.importcpp: "Urho3D::P_GESTUREID", header: "InputEvents.h".}: StringHash #= "GestureID"



var E_GESTUREINPUT* {.importcpp: "Urho3D::E_GESTUREINPUT", header: "InputEvents.h".}: StringHash #= "GestureInput"
#var P_GESTUREID* {.importcpp: "Urho3D::P_GESTUREID", header: "InputEvents.h".}: StringHash #= "GestureID"


var P_CENTERX* {.importcpp: "Urho3D::P_CENTERX", header: "InputEvents.h".}: StringHash #= "CenterX"


var P_CENTERY* {.importcpp: "Urho3D::P_CENTERY", header: "InputEvents.h".}: StringHash #= "CenterY"


var P_NUMFINGERS* {.importcpp: "Urho3D::P_NUMFINGERS", header: "InputEvents.h".}: StringHash #= "NumFingers"


var P_ERROR* {.importcpp: "Urho3D::P_ERROR", header: "InputEvents.h".}: StringHash #= "Error"



var E_MULTIGESTURE* {.importcpp: "Urho3D::E_MULTIGESTURE", header: "InputEvents.h".}: StringHash #= "MultiGesture"

#var P_CENTERX* {.importcpp: "Urho3D::P_CENTERX", header: "InputEvents.h".}: StringHash #= "CenterX"
#var P_CENTERY* {.importcpp: "Urho3D::P_CENTERY", header: "InputEvents.h".}: StringHash #= "CenterY"
#var P_NUMFINGERS* {.importcpp: "Urho3D::P_NUMFINGERS", header: "InputEvents.h".}: StringHash #= "NumFingers"


var P_DTHETA* {.importcpp: "Urho3D::P_DTHETA", header: "InputEvents.h".}: StringHash #= "DTheta"
var P_DDIST* {.importcpp: "Urho3D::P_DDIST", header: "InputEvents.h".}: StringHash #= "DDist"



var E_DROPFILE* {.importcpp: "Urho3D::E_DROPFILE", header: "InputEvents.h".}: StringHash #= "DropFile"
var P_FILENAME* {.importcpp: "Urho3D::P_FILENAME", header: "InputEvents.h".}: StringHash #= "FileName"

var E_INPUTFOCUS* {.importcpp: "Urho3D::E_INPUTFOCUS", header: "InputEvents.h".}: StringHash #= "InputFocus"
var P_FOCUS* {.importcpp: "Urho3D::P_FOCUS", header: "InputEvents.h".}: StringHash #= "Focus"


var P_MINIMIZED* {.importcpp: "Urho3D::P_MINIMIZED", header: "InputEvents.h".}: StringHash #= "Minimized"



var E_MOUSEVISIBLECHANGED* {.importcpp: "Urho3D::E_MOUSEVISIBLECHANGED",
                             header: "InputEvents.h".}: StringHash #= "MouseVisibleChanged"

var P_VISIBLE* {.importcpp: "Urho3D::P_VISIBLE", header: "InputEvents.h".}: StringHash #= "Visible"



var E_EXITREQUESTED* {.importcpp: "Urho3D::E_EXITREQUESTED", header: "InputEvents.h".}: StringHash #= "ExitRequested"

var MOUSEB_LEFT* {.importcpp: "Urho3D::MOUSEB_LEFT", header: "InputEvents.h".}: cint #= sdl_Button_Lmask

var MOUSEB_MIDDLE* {.importcpp: "Urho3D::MOUSEB_MIDDLE", header: "InputEvents.h".}: cint #= sdl_Button_Mmask

var MOUSEB_RIGHT* {.importcpp: "Urho3D::MOUSEB_RIGHT", header: "InputEvents.h".}: cint #= sdl_Button_Rmask

var MOUSEB_X1* {.importcpp: "Urho3D::MOUSEB_X1", header: "InputEvents.h".}: cint #= sdl_Button_X1mask

var MOUSEB_X2* {.importcpp: "Urho3D::MOUSEB_X2", header: "InputEvents.h".}: cint #= sdl_Button_X2mask

var QUAL_SHIFT* {.importcpp: "Urho3D::QUAL_SHIFT", header: "InputEvents.h".}: cint #= 1

var QUAL_CTRL* {.importcpp: "Urho3D::QUAL_CTRL", header: "InputEvents.h".}: cint #= 2

var QUAL_ALT* {.importcpp: "Urho3D::QUAL_ALT", header: "InputEvents.h".}: cint #= 4

var QUAL_ANY* {.importcpp: "Urho3D::QUAL_ANY", header: "InputEvents.h".}: cint #= 8

var KEY_A* {.importcpp: "Urho3D::KEY_A", header: "InputEvents.h".}: cint #= 'A'

var KEY_B* {.importcpp: "Urho3D::KEY_B", header: "InputEvents.h".}: cint #= 'B'

var KEY_C* {.importcpp: "Urho3D::KEY_C", header: "InputEvents.h".}: cint #= 'C'

var KEY_D* {.importcpp: "Urho3D::KEY_D", header: "InputEvents.h".}: cint #= 'D'

var KEY_E* {.importcpp: "Urho3D::KEY_E", header: "InputEvents.h".}: cint #= 'E'

var KEY_F* {.importcpp: "Urho3D::KEY_F", header: "InputEvents.h".}: cint #= 'F'

var KEY_G* {.importcpp: "Urho3D::KEY_G", header: "InputEvents.h".}: cint #= 'G'

var KEY_H* {.importcpp: "Urho3D::KEY_H", header: "InputEvents.h".}: cint #= 'H'

var KEY_I* {.importcpp: "Urho3D::KEY_I", header: "InputEvents.h".}: cint #= 'I'

var KEY_J* {.importcpp: "Urho3D::KEY_J", header: "InputEvents.h".}: cint #= 'J'

var KEY_K* {.importcpp: "Urho3D::KEY_K", header: "InputEvents.h".}: cint #= 'K'

var KEY_L* {.importcpp: "Urho3D::KEY_L", header: "InputEvents.h".}: cint #= 'L'

var KEY_M* {.importcpp: "Urho3D::KEY_M", header: "InputEvents.h".}: cint #= 'M'

var KEY_N* {.importcpp: "Urho3D::KEY_N", header: "InputEvents.h".}: cint #= 'N'

var KEY_O* {.importcpp: "Urho3D::KEY_O", header: "InputEvents.h".}: cint #= 'O'

var KEY_P* {.importcpp: "Urho3D::KEY_P", header: "InputEvents.h".}: cint #= 'P'

var KEY_Q* {.importcpp: "Urho3D::KEY_Q", header: "InputEvents.h".}: cint #= 'Q'

var KEY_R* {.importcpp: "Urho3D::KEY_R", header: "InputEvents.h".}: cint #= 'R'

var KEY_S* {.importcpp: "Urho3D::KEY_S", header: "InputEvents.h".}: cint #= 'S'

var KEY_T* {.importcpp: "Urho3D::KEY_T", header: "InputEvents.h".}: cint #= 'T'

var KEY_U* {.importcpp: "Urho3D::KEY_U", header: "InputEvents.h".}: cint #= 'U'

var KEY_V* {.importcpp: "Urho3D::KEY_V", header: "InputEvents.h".}: cint #= 'V'

var KEY_W* {.importcpp: "Urho3D::KEY_W", header: "InputEvents.h".}: cint #= 'W'

var KEY_X* {.importcpp: "Urho3D::KEY_X", header: "InputEvents.h".}: cint #= 'X'

var KEY_Y* {.importcpp: "Urho3D::KEY_Y", header: "InputEvents.h".}: cint #= 'Y'

var KEY_Z* {.importcpp: "Urho3D::KEY_Z", header: "InputEvents.h".}: cint #= 'Z'

var KEY_0* {.importcpp: "Urho3D::KEY_0", header: "InputEvents.h".}: cint #= '0'

var KEY_1* {.importcpp: "Urho3D::KEY_1", header: "InputEvents.h".}: cint #= '1'

var KEY_2* {.importcpp: "Urho3D::KEY_2", header: "InputEvents.h".}: cint #= '2'

var KEY_3* {.importcpp: "Urho3D::KEY_3", header: "InputEvents.h".}: cint #= '3'

var KEY_4* {.importcpp: "Urho3D::KEY_4", header: "InputEvents.h".}: cint #= '4'

var KEY_5* {.importcpp: "Urho3D::KEY_5", header: "InputEvents.h".}: cint #= '5'

var KEY_6* {.importcpp: "Urho3D::KEY_6", header: "InputEvents.h".}: cint #= '6'

var KEY_7* {.importcpp: "Urho3D::KEY_7", header: "InputEvents.h".}: cint #= '7'

var KEY_8* {.importcpp: "Urho3D::KEY_8", header: "InputEvents.h".}: cint #= '8'

var KEY_9* {.importcpp: "Urho3D::KEY_9", header: "InputEvents.h".}: cint #= '9'

var KEY_BACKSPACE* {.importcpp: "Urho3D::KEY_BACKSPACE", header: "InputEvents.h".}: cint #= sdlk_Backspace

var KEY_TAB* {.importcpp: "Urho3D::KEY_TAB", header: "InputEvents.h".}: cint #= sdlk_Tab

var KEY_RETURN* {.importcpp: "Urho3D::KEY_RETURN", header: "InputEvents.h".}: cint #= sdlk_Return

var KEY_RETURN2* {.importcpp: "Urho3D::KEY_RETURN2", header: "InputEvents.h".}: cint #= sdlk_Return2

var KEY_KP_ENTER* {.importcpp: "Urho3D::KEY_KP_ENTER", header: "InputEvents.h".}: cint #= sdlk_Kp_Enter

var KEY_SHIFT* {.importcpp: "Urho3D::KEY_SHIFT", header: "InputEvents.h".}: cint #= sdlk_Lshift

var KEY_CTRL* {.importcpp: "Urho3D::KEY_CTRL", header: "InputEvents.h".}: cint #= sdlk_Lctrl

var KEY_ALT* {.importcpp: "Urho3D::KEY_ALT", header: "InputEvents.h".}: cint #= sdlk_Lalt

var KEY_GUI* {.importcpp: "Urho3D::KEY_GUI", header: "InputEvents.h".}: cint #= sdlk_Lgui

var KEY_PAUSE* {.importcpp: "Urho3D::KEY_PAUSE", header: "InputEvents.h".}: cint #= sdlk_Pause

var KEY_CAPSLOCK* {.importcpp: "Urho3D::KEY_CAPSLOCK", header: "InputEvents.h".}: cint #= sdlk_Capslock

var KEY_ESC* {.importcpp: "Urho3D::KEY_ESC", header: "InputEvents.h".}: cint #= sdlk_Escape

var KEY_SPACE* {.importcpp: "Urho3D::KEY_SPACE", header: "InputEvents.h".}: cint #= sdlk_Space

var KEY_PAGEUP* {.importcpp: "Urho3D::KEY_PAGEUP", header: "InputEvents.h".}: cint #= sdlk_Pageup

var KEY_PAGEDOWN* {.importcpp: "Urho3D::KEY_PAGEDOWN", header: "InputEvents.h".}: cint #= sdlk_Pagedown

var KEY_END* {.importcpp: "Urho3D::KEY_END", header: "InputEvents.h".}: cint #= sdlk_End

var KEY_HOME* {.importcpp: "Urho3D::KEY_HOME", header: "InputEvents.h".}: cint #= sdlk_Home

var KEY_LEFT* {.importcpp: "Urho3D::KEY_LEFT", header: "InputEvents.h".}: cint #= sdlk_Left

var KEY_UP* {.importcpp: "Urho3D::KEY_UP", header: "InputEvents.h".}: cint #= sdlk_Up

var KEY_RIGHT* {.importcpp: "Urho3D::KEY_RIGHT", header: "InputEvents.h".}: cint #= sdlk_Right

var KEY_DOWN* {.importcpp: "Urho3D::KEY_DOWN", header: "InputEvents.h".}: cint #= sdlk_Down

var KEY_SELECT* {.importcpp: "Urho3D::KEY_SELECT", header: "InputEvents.h".}: cint #= sdlk_Select

var KEY_PRINTSCREEN* {.importcpp: "Urho3D::KEY_PRINTSCREEN", header: "InputEvents.h".}: cint #= sdlk_Printscreen

var KEY_INSERT* {.importcpp: "Urho3D::KEY_INSERT", header: "InputEvents.h".}: cint #= sdlk_Insert

var KEY_DELETE* {.importcpp: "Urho3D::KEY_DELETE", header: "InputEvents.h".}: cint #= sdlk_Delete

var KEY_LGUI* {.importcpp: "Urho3D::KEY_LGUI", header: "InputEvents.h".}: cint #= sdlk_Lgui

var KEY_RGUI* {.importcpp: "Urho3D::KEY_RGUI", header: "InputEvents.h".}: cint #= sdlk_Rgui

var KEY_APPLICATION* {.importcpp: "Urho3D::KEY_APPLICATION", header: "InputEvents.h".}: cint #= sdlk_Application

var KEY_KP_0* {.importcpp: "Urho3D::KEY_KP_0", header: "InputEvents.h".}: cint #= sdlk_Kp_0

var KEY_KP_1* {.importcpp: "Urho3D::KEY_KP_1", header: "InputEvents.h".}: cint #= sdlk_Kp_1

var KEY_KP_2* {.importcpp: "Urho3D::KEY_KP_2", header: "InputEvents.h".}: cint #= sdlk_Kp_2

var KEY_KP_3* {.importcpp: "Urho3D::KEY_KP_3", header: "InputEvents.h".}: cint #= sdlk_Kp_3

var KEY_KP_4* {.importcpp: "Urho3D::KEY_KP_4", header: "InputEvents.h".}: cint #= sdlk_Kp_4

var KEY_KP_5* {.importcpp: "Urho3D::KEY_KP_5", header: "InputEvents.h".}: cint #= sdlk_Kp_5

var KEY_KP_6* {.importcpp: "Urho3D::KEY_KP_6", header: "InputEvents.h".}: cint #= sdlk_Kp_6

var KEY_KP_7* {.importcpp: "Urho3D::KEY_KP_7", header: "InputEvents.h".}: cint #= sdlk_Kp_7

var KEY_KP_8* {.importcpp: "Urho3D::KEY_KP_8", header: "InputEvents.h".}: cint #= sdlk_Kp_8

var KEY_KP_9* {.importcpp: "Urho3D::KEY_KP_9", header: "InputEvents.h".}: cint #= sdlk_Kp_9

var KEY_KP_MULTIPLY* {.importcpp: "Urho3D::KEY_KP_MULTIPLY", header: "InputEvents.h".}: cint #= sdlk_Kp_Multiply

var KEY_KP_PLUS* {.importcpp: "Urho3D::KEY_KP_PLUS", header: "InputEvents.h".}: cint #= sdlk_Kp_Plus

var KEY_KP_MINUS* {.importcpp: "Urho3D::KEY_KP_MINUS", header: "InputEvents.h".}: cint #= sdlk_Kp_Minus

var KEY_KP_PERIOD* {.importcpp: "Urho3D::KEY_KP_PERIOD", header: "InputEvents.h".}: cint #= sdlk_Kp_Period

var KEY_KP_DIVIDE* {.importcpp: "Urho3D::KEY_KP_DIVIDE", header: "InputEvents.h".}: cint #= sdlk_Kp_Divide

var KEY_F1* {.importcpp: "Urho3D::KEY_F1", header: "InputEvents.h".}: cint #= sdlk_F1

var KEY_F2* {.importcpp: "Urho3D::KEY_F2", header: "InputEvents.h".}: cint #= sdlk_F2

var KEY_F3* {.importcpp: "Urho3D::KEY_F3", header: "InputEvents.h".}: cint #= sdlk_F3

var KEY_F4* {.importcpp: "Urho3D::KEY_F4", header: "InputEvents.h".}: cint #= sdlk_F4

var KEY_F5* {.importcpp: "Urho3D::KEY_F5", header: "InputEvents.h".}: cint #= sdlk_F5

var KEY_F6* {.importcpp: "Urho3D::KEY_F6", header: "InputEvents.h".}: cint #= sdlk_F6

var KEY_F7* {.importcpp: "Urho3D::KEY_F7", header: "InputEvents.h".}: cint #= sdlk_F7

var KEY_F8* {.importcpp: "Urho3D::KEY_F8", header: "InputEvents.h".}: cint #= sdlk_F8

var KEY_F9* {.importcpp: "Urho3D::KEY_F9", header: "InputEvents.h".}: cint #= sdlk_F9

var KEY_F10* {.importcpp: "Urho3D::KEY_F10", header: "InputEvents.h".}: cint #= sdlk_F10

var KEY_F11* {.importcpp: "Urho3D::KEY_F11", header: "InputEvents.h".}: cint #= sdlk_F11

var KEY_F12* {.importcpp: "Urho3D::KEY_F12", header: "InputEvents.h".}: cint #= sdlk_F12

var KEY_F13* {.importcpp: "Urho3D::KEY_F13", header: "InputEvents.h".}: cint #= sdlk_F13

var KEY_F14* {.importcpp: "Urho3D::KEY_F14", header: "InputEvents.h".}: cint #= sdlk_F14

var KEY_F15* {.importcpp: "Urho3D::KEY_F15", header: "InputEvents.h".}: cint #= sdlk_F15

var KEY_F16* {.importcpp: "Urho3D::KEY_F16", header: "InputEvents.h".}: cint #= sdlk_F16

var KEY_F17* {.importcpp: "Urho3D::KEY_F17", header: "InputEvents.h".}: cint #= sdlk_F17

var KEY_F18* {.importcpp: "Urho3D::KEY_F18", header: "InputEvents.h".}: cint #= sdlk_F18

var KEY_F19* {.importcpp: "Urho3D::KEY_F19", header: "InputEvents.h".}: cint #= sdlk_F19

var KEY_F20* {.importcpp: "Urho3D::KEY_F20", header: "InputEvents.h".}: cint #= sdlk_F20

var KEY_F21* {.importcpp: "Urho3D::KEY_F21", header: "InputEvents.h".}: cint #= sdlk_F21

var KEY_F22* {.importcpp: "Urho3D::KEY_F22", header: "InputEvents.h".}: cint #= sdlk_F22

var KEY_F23* {.importcpp: "Urho3D::KEY_F23", header: "InputEvents.h".}: cint #= sdlk_F23

var KEY_F24* {.importcpp: "Urho3D::KEY_F24", header: "InputEvents.h".}: cint #= sdlk_F24

var KEY_NUMLOCKCLEAR* {.importcpp: "Urho3D::KEY_NUMLOCKCLEAR", header: "InputEvents.h".}: cint #= sdlk_Numlockclear

var KEY_SCROLLLOCK* {.importcpp: "Urho3D::KEY_SCROLLLOCK", header: "InputEvents.h".}: cint #= sdlk_Scrolllock

var KEY_LSHIFT* {.importcpp: "Urho3D::KEY_LSHIFT", header: "InputEvents.h".}: cint #= sdlk_Lshift

var KEY_RSHIFT* {.importcpp: "Urho3D::KEY_RSHIFT", header: "InputEvents.h".}: cint #= sdlk_Rshift

var KEY_LCTRL* {.importcpp: "Urho3D::KEY_LCTRL", header: "InputEvents.h".}: cint #= sdlk_Lctrl

var KEY_RCTRL* {.importcpp: "Urho3D::KEY_RCTRL", header: "InputEvents.h".}: cint #= sdlk_Rctrl

var KEY_LALT* {.importcpp: "Urho3D::KEY_LALT", header: "InputEvents.h".}: cint #= sdlk_Lalt

var KEY_RALT* {.importcpp: "Urho3D::KEY_RALT", header: "InputEvents.h".}: cint #= sdlk_Ralt

var SCANCODE_UNKNOWN* {.importcpp: "Urho3D::SCANCODE_UNKNOWN", header: "InputEvents.h".}: cint #= sdl_Scancode_Unknown

var SCANCODE_CTRL* {.importcpp: "Urho3D::SCANCODE_CTRL", header: "InputEvents.h".}: cint #= sdl_Scancode_Lctrl

var SCANCODE_SHIFT* {.importcpp: "Urho3D::SCANCODE_SHIFT", header: "InputEvents.h".}: cint #= sdl_Scancode_Lshift

var SCANCODE_ALT* {.importcpp: "Urho3D::SCANCODE_ALT", header: "InputEvents.h".}: cint #= sdl_Scancode_Lalt

var SCANCODE_GUI* {.importcpp: "Urho3D::SCANCODE_GUI", header: "InputEvents.h".}: cint #= sdl_Scancode_Lgui

var SCANCODE_A* {.importcpp: "Urho3D::SCANCODE_A", header: "InputEvents.h".}: cint #= sdl_Scancode_A

var SCANCODE_B* {.importcpp: "Urho3D::SCANCODE_B", header: "InputEvents.h".}: cint #= sdl_Scancode_B

var SCANCODE_C* {.importcpp: "Urho3D::SCANCODE_C", header: "InputEvents.h".}: cint #= sdl_Scancode_C

var SCANCODE_D* {.importcpp: "Urho3D::SCANCODE_D", header: "InputEvents.h".}: cint #= sdl_Scancode_D

var SCANCODE_E* {.importcpp: "Urho3D::SCANCODE_E", header: "InputEvents.h".}: cint #= sdl_Scancode_E

var SCANCODE_F* {.importcpp: "Urho3D::SCANCODE_F", header: "InputEvents.h".}: cint #= sdl_Scancode_F

var SCANCODE_G* {.importcpp: "Urho3D::SCANCODE_G", header: "InputEvents.h".}: cint #= sdl_Scancode_G

var SCANCODE_H* {.importcpp: "Urho3D::SCANCODE_H", header: "InputEvents.h".}: cint #= sdl_Scancode_H

var SCANCODE_I* {.importcpp: "Urho3D::SCANCODE_I", header: "InputEvents.h".}: cint #= sdl_Scancode_I

var SCANCODE_J* {.importcpp: "Urho3D::SCANCODE_J", header: "InputEvents.h".}: cint #= sdl_Scancode_J

var SCANCODE_K* {.importcpp: "Urho3D::SCANCODE_K", header: "InputEvents.h".}: cint #= sdl_Scancode_K

var SCANCODE_L* {.importcpp: "Urho3D::SCANCODE_L", header: "InputEvents.h".}: cint #= sdl_Scancode_L

var SCANCODE_M* {.importcpp: "Urho3D::SCANCODE_M", header: "InputEvents.h".}: cint #= sdl_Scancode_M

var SCANCODE_N* {.importcpp: "Urho3D::SCANCODE_N", header: "InputEvents.h".}: cint #= sdl_Scancode_N

var SCANCODE_O* {.importcpp: "Urho3D::SCANCODE_O", header: "InputEvents.h".}: cint #= sdl_Scancode_O

var SCANCODE_P* {.importcpp: "Urho3D::SCANCODE_P", header: "InputEvents.h".}: cint #= sdl_Scancode_P

var SCANCODE_Q* {.importcpp: "Urho3D::SCANCODE_Q", header: "InputEvents.h".}: cint #= sdl_Scancode_Q

var SCANCODE_R* {.importcpp: "Urho3D::SCANCODE_R", header: "InputEvents.h".}: cint #= sdl_Scancode_R

var SCANCODE_S* {.importcpp: "Urho3D::SCANCODE_S", header: "InputEvents.h".}: cint #= sdl_Scancode_S

var SCANCODE_T* {.importcpp: "Urho3D::SCANCODE_T", header: "InputEvents.h".}: cint #= sdl_Scancode_T

var SCANCODE_U* {.importcpp: "Urho3D::SCANCODE_U", header: "InputEvents.h".}: cint #= sdl_Scancode_U

var SCANCODE_V* {.importcpp: "Urho3D::SCANCODE_V", header: "InputEvents.h".}: cint #= sdl_Scancode_V

var SCANCODE_W* {.importcpp: "Urho3D::SCANCODE_W", header: "InputEvents.h".}: cint #= sdl_Scancode_W

var SCANCODE_X* {.importcpp: "Urho3D::SCANCODE_X", header: "InputEvents.h".}: cint #= sdl_Scancode_X

var SCANCODE_Y* {.importcpp: "Urho3D::SCANCODE_Y", header: "InputEvents.h".}: cint #= sdl_Scancode_Y

var SCANCODE_Z* {.importcpp: "Urho3D::SCANCODE_Z", header: "InputEvents.h".}: cint #= sdl_Scancode_Z

var SCANCODE_1* {.importcpp: "Urho3D::SCANCODE_1", header: "InputEvents.h".}: cint #= sdl_Scancode_1

var SCANCODE_2* {.importcpp: "Urho3D::SCANCODE_2", header: "InputEvents.h".}: cint #= sdl_Scancode_2

var SCANCODE_3* {.importcpp: "Urho3D::SCANCODE_3", header: "InputEvents.h".}: cint #= sdl_Scancode_3

var SCANCODE_4* {.importcpp: "Urho3D::SCANCODE_4", header: "InputEvents.h".}: cint #= sdl_Scancode_4

var SCANCODE_5* {.importcpp: "Urho3D::SCANCODE_5", header: "InputEvents.h".}: cint #= sdl_Scancode_5

var SCANCODE_6* {.importcpp: "Urho3D::SCANCODE_6", header: "InputEvents.h".}: cint #= sdl_Scancode_6

var SCANCODE_7* {.importcpp: "Urho3D::SCANCODE_7", header: "InputEvents.h".}: cint #= sdl_Scancode_7

var SCANCODE_8* {.importcpp: "Urho3D::SCANCODE_8", header: "InputEvents.h".}: cint #= sdl_Scancode_8

var SCANCODE_9* {.importcpp: "Urho3D::SCANCODE_9", header: "InputEvents.h".}: cint #= sdl_Scancode_9

var SCANCODE_0* {.importcpp: "Urho3D::SCANCODE_0", header: "InputEvents.h".}: cint #= sdl_Scancode_0

var SCANCODE_RETURN* {.importcpp: "Urho3D::SCANCODE_RETURN", header: "InputEvents.h".}: cint #= sdl_Scancode_Return

var SCANCODE_ESCAPE* {.importcpp: "Urho3D::SCANCODE_ESCAPE", header: "InputEvents.h".}: cint #= sdl_Scancode_Escape

var SCANCODE_BACKSPACE* {.importcpp: "Urho3D::SCANCODE_BACKSPACE", header: "InputEvents.h".}: cint #= sdl_Scancode_Backspace

var SCANCODE_TAB* {.importcpp: "Urho3D::SCANCODE_TAB", header: "InputEvents.h".}: cint #= sdl_Scancode_Tab

var SCANCODE_SPACE* {.importcpp: "Urho3D::SCANCODE_SPACE", header: "InputEvents.h".}: cint #= sdl_Scancode_Space

var SCANCODE_MINUS* {.importcpp: "Urho3D::SCANCODE_MINUS", header: "InputEvents.h".}: cint #= sdl_Scancode_Minus

var SCANCODE_EQUALS* {.importcpp: "Urho3D::SCANCODE_EQUALS", header: "InputEvents.h".}: cint #= sdl_Scancode_Equals

var SCANCODE_LEFTBRACKET* {.importcpp: "Urho3D::SCANCODE_LEFTBRACKET",
                            header: "InputEvents.h".}: cint #= sdl_Scancode_Leftbracket

var SCANCODE_RIGHTBRACKET* {.importcpp: "Urho3D::SCANCODE_RIGHTBRACKET",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Rightbracket

var SCANCODE_BACKSLASH* {.importcpp: "Urho3D::SCANCODE_BACKSLASH", header: "InputEvents.h".}: cint #= sdl_Scancode_Backslash

var SCANCODE_NONUSHASH* {.importcpp: "Urho3D::SCANCODE_NONUSHASH", header: "InputEvents.h".}: cint #= sdl_Scancode_Nonushash

var SCANCODE_SEMICOLON* {.importcpp: "Urho3D::SCANCODE_SEMICOLON", header: "InputEvents.h".}: cint #= sdl_Scancode_Semicolon

var SCANCODE_APOSTROPHE* {.importcpp: "Urho3D::SCANCODE_APOSTROPHE",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Apostrophe

var SCANCODE_GRAVE* {.importcpp: "Urho3D::SCANCODE_GRAVE", header: "InputEvents.h".}: cint #= sdl_Scancode_Grave

var SCANCODE_COMMA* {.importcpp: "Urho3D::SCANCODE_COMMA", header: "InputEvents.h".}: cint #= sdl_Scancode_Comma

var SCANCODE_PERIOD* {.importcpp: "Urho3D::SCANCODE_PERIOD", header: "InputEvents.h".}: cint #= sdl_Scancode_Period

var SCANCODE_SLASH* {.importcpp: "Urho3D::SCANCODE_SLASH", header: "InputEvents.h".}: cint #= sdl_Scancode_Slash

var SCANCODE_CAPSLOCK* {.importcpp: "Urho3D::SCANCODE_CAPSLOCK", header: "InputEvents.h".}: cint #= sdl_Scancode_Capslock

var SCANCODE_F1* {.importcpp: "Urho3D::SCANCODE_F1", header: "InputEvents.h".}: cint #= sdl_Scancode_F1

var SCANCODE_F2* {.importcpp: "Urho3D::SCANCODE_F2", header: "InputEvents.h".}: cint #= sdl_Scancode_F2

var SCANCODE_F3* {.importcpp: "Urho3D::SCANCODE_F3", header: "InputEvents.h".}: cint #= sdl_Scancode_F3

var SCANCODE_F4* {.importcpp: "Urho3D::SCANCODE_F4", header: "InputEvents.h".}: cint #= sdl_Scancode_F4

var SCANCODE_F5* {.importcpp: "Urho3D::SCANCODE_F5", header: "InputEvents.h".}: cint #= sdl_Scancode_F5

var SCANCODE_F6* {.importcpp: "Urho3D::SCANCODE_F6", header: "InputEvents.h".}: cint #= sdl_Scancode_F6

var SCANCODE_F7* {.importcpp: "Urho3D::SCANCODE_F7", header: "InputEvents.h".}: cint #= sdl_Scancode_F7

var SCANCODE_F8* {.importcpp: "Urho3D::SCANCODE_F8", header: "InputEvents.h".}: cint #= sdl_Scancode_F8

var SCANCODE_F9* {.importcpp: "Urho3D::SCANCODE_F9", header: "InputEvents.h".}: cint #= sdl_Scancode_F9

var SCANCODE_F10* {.importcpp: "Urho3D::SCANCODE_F10", header: "InputEvents.h".}: cint #= sdl_Scancode_F10

var SCANCODE_F11* {.importcpp: "Urho3D::SCANCODE_F11", header: "InputEvents.h".}: cint #= sdl_Scancode_F11

var SCANCODE_F12* {.importcpp: "Urho3D::SCANCODE_F12", header: "InputEvents.h".}: cint #= sdl_Scancode_F12

var SCANCODE_PRINTSCREEN* {.importcpp: "Urho3D::SCANCODE_PRINTSCREEN",
                            header: "InputEvents.h".}: cint #= sdl_Scancode_Printscreen

var SCANCODE_SCROLLLOCK* {.importcpp: "Urho3D::SCANCODE_SCROLLLOCK",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Scrolllock

var SCANCODE_PAUSE* {.importcpp: "Urho3D::SCANCODE_PAUSE", header: "InputEvents.h".}: cint #= sdl_Scancode_Pause

var SCANCODE_INSERT* {.importcpp: "Urho3D::SCANCODE_INSERT", header: "InputEvents.h".}: cint #= sdl_Scancode_Insert

var SCANCODE_HOME* {.importcpp: "Urho3D::SCANCODE_HOME", header: "InputEvents.h".}: cint #= sdl_Scancode_Home

var SCANCODE_PAGEUP* {.importcpp: "Urho3D::SCANCODE_PAGEUP", header: "InputEvents.h".}: cint #= sdl_Scancode_Pageup

var SCANCODE_DELETE* {.importcpp: "Urho3D::SCANCODE_DELETE", header: "InputEvents.h".}: cint #= sdl_Scancode_Delete

var SCANCODE_END* {.importcpp: "Urho3D::SCANCODE_END", header: "InputEvents.h".}: cint #= sdl_Scancode_End

var SCANCODE_PAGEDOWN* {.importcpp: "Urho3D::SCANCODE_PAGEDOWN", header: "InputEvents.h".}: cint #= sdl_Scancode_Pagedown

var SCANCODE_RIGHT* {.importcpp: "Urho3D::SCANCODE_RIGHT", header: "InputEvents.h".}: cint #= sdl_Scancode_Right

var SCANCODE_LEFT* {.importcpp: "Urho3D::SCANCODE_LEFT", header: "InputEvents.h".}: cint #= sdl_Scancode_Left

var SCANCODE_DOWN* {.importcpp: "Urho3D::SCANCODE_DOWN", header: "InputEvents.h".}: cint #= sdl_Scancode_Down

var SCANCODE_UP* {.importcpp: "Urho3D::SCANCODE_UP", header: "InputEvents.h".}: cint #= sdl_Scancode_Up

var SCANCODE_NUMLOCKCLEAR* {.importcpp: "Urho3D::SCANCODE_NUMLOCKCLEAR",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Numlockclear

var SCANCODE_KP_DIVIDE* {.importcpp: "Urho3D::SCANCODE_KP_DIVIDE", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Divide

var SCANCODE_KP_MULTIPLY* {.importcpp: "Urho3D::SCANCODE_KP_MULTIPLY",
                            header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Multiply

var SCANCODE_KP_MINUS* {.importcpp: "Urho3D::SCANCODE_KP_MINUS", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Minus

var SCANCODE_KP_PLUS* {.importcpp: "Urho3D::SCANCODE_KP_PLUS", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Plus

var SCANCODE_KP_ENTER* {.importcpp: "Urho3D::SCANCODE_KP_ENTER", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Enter

var SCANCODE_KP_1* {.importcpp: "Urho3D::SCANCODE_KP_1", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_1

var SCANCODE_KP_2* {.importcpp: "Urho3D::SCANCODE_KP_2", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_2

var SCANCODE_KP_3* {.importcpp: "Urho3D::SCANCODE_KP_3", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_3

var SCANCODE_KP_4* {.importcpp: "Urho3D::SCANCODE_KP_4", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_4

var SCANCODE_KP_5* {.importcpp: "Urho3D::SCANCODE_KP_5", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_5

var SCANCODE_KP_6* {.importcpp: "Urho3D::SCANCODE_KP_6", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_6

var SCANCODE_KP_7* {.importcpp: "Urho3D::SCANCODE_KP_7", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_7

var SCANCODE_KP_8* {.importcpp: "Urho3D::SCANCODE_KP_8", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_8

var SCANCODE_KP_9* {.importcpp: "Urho3D::SCANCODE_KP_9", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_9

var SCANCODE_KP_0* {.importcpp: "Urho3D::SCANCODE_KP_0", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_0

var SCANCODE_KP_PERIOD* {.importcpp: "Urho3D::SCANCODE_KP_PERIOD", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Period

var SCANCODE_NONUSBACKSLASH* {.importcpp: "Urho3D::SCANCODE_NONUSBACKSLASH",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Nonusbackslash

var SCANCODE_APPLICATION* {.importcpp: "Urho3D::SCANCODE_APPLICATION",
                            header: "InputEvents.h".}: cint #= sdl_Scancode_Application

var SCANCODE_POWER* {.importcpp: "Urho3D::SCANCODE_POWER", header: "InputEvents.h".}: cint #= sdl_Scancode_Power

var SCANCODE_KP_EQUALS* {.importcpp: "Urho3D::SCANCODE_KP_EQUALS", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Equals

var SCANCODE_F13* {.importcpp: "Urho3D::SCANCODE_F13", header: "InputEvents.h".}: cint #= sdl_Scancode_F13

var SCANCODE_F14* {.importcpp: "Urho3D::SCANCODE_F14", header: "InputEvents.h".}: cint #= sdl_Scancode_F14

var SCANCODE_F15* {.importcpp: "Urho3D::SCANCODE_F15", header: "InputEvents.h".}: cint #= sdl_Scancode_F15

var SCANCODE_F16* {.importcpp: "Urho3D::SCANCODE_F16", header: "InputEvents.h".}: cint #= sdl_Scancode_F16

var SCANCODE_F17* {.importcpp: "Urho3D::SCANCODE_F17", header: "InputEvents.h".}: cint #= sdl_Scancode_F17

var SCANCODE_F18* {.importcpp: "Urho3D::SCANCODE_F18", header: "InputEvents.h".}: cint #= sdl_Scancode_F18

var SCANCODE_F19* {.importcpp: "Urho3D::SCANCODE_F19", header: "InputEvents.h".}: cint #= sdl_Scancode_F19

var SCANCODE_F20* {.importcpp: "Urho3D::SCANCODE_F20", header: "InputEvents.h".}: cint #= sdl_Scancode_F20

var SCANCODE_F21* {.importcpp: "Urho3D::SCANCODE_F21", header: "InputEvents.h".}: cint #= sdl_Scancode_F21

var SCANCODE_F22* {.importcpp: "Urho3D::SCANCODE_F22", header: "InputEvents.h".}: cint #= sdl_Scancode_F22

var SCANCODE_F23* {.importcpp: "Urho3D::SCANCODE_F23", header: "InputEvents.h".}: cint #= sdl_Scancode_F23

var SCANCODE_F24* {.importcpp: "Urho3D::SCANCODE_F24", header: "InputEvents.h".}: cint #= sdl_Scancode_F24

var SCANCODE_EXECUTE* {.importcpp: "Urho3D::SCANCODE_EXECUTE", header: "InputEvents.h".}: cint #= sdl_Scancode_Execute

var SCANCODE_HELP* {.importcpp: "Urho3D::SCANCODE_HELP", header: "InputEvents.h".}: cint #= sdl_Scancode_Help

var SCANCODE_MENU* {.importcpp: "Urho3D::SCANCODE_MENU", header: "InputEvents.h".}: cint #= sdl_Scancode_Menu

var SCANCODE_SELECT* {.importcpp: "Urho3D::SCANCODE_SELECT", header: "InputEvents.h".}: cint #= sdl_Scancode_Select

var SCANCODE_STOP* {.importcpp: "Urho3D::SCANCODE_STOP", header: "InputEvents.h".}: cint #= sdl_Scancode_Stop

var SCANCODE_AGAIN* {.importcpp: "Urho3D::SCANCODE_AGAIN", header: "InputEvents.h".}: cint #= sdl_Scancode_Again

var SCANCODE_UNDO* {.importcpp: "Urho3D::SCANCODE_UNDO", header: "InputEvents.h".}: cint #= sdl_Scancode_Undo

var SCANCODE_CUT* {.importcpp: "Urho3D::SCANCODE_CUT", header: "InputEvents.h".}: cint #= sdl_Scancode_Cut

var SCANCODE_COPY* {.importcpp: "Urho3D::SCANCODE_COPY", header: "InputEvents.h".}: cint #= sdl_Scancode_Copy

var SCANCODE_PASTE* {.importcpp: "Urho3D::SCANCODE_PASTE", header: "InputEvents.h".}: cint #= sdl_Scancode_Paste

var SCANCODE_FIND* {.importcpp: "Urho3D::SCANCODE_FIND", header: "InputEvents.h".}: cint #= sdl_Scancode_Find

var SCANCODE_MUTE* {.importcpp: "Urho3D::SCANCODE_MUTE", header: "InputEvents.h".}: cint #= sdl_Scancode_Mute

var SCANCODE_VOLUMEUP* {.importcpp: "Urho3D::SCANCODE_VOLUMEUP", header: "InputEvents.h".}: cint #= sdl_Scancode_Volumeup

var SCANCODE_VOLUMEDOWN* {.importcpp: "Urho3D::SCANCODE_VOLUMEDOWN",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Volumedown

var SCANCODE_KP_COMMA* {.importcpp: "Urho3D::SCANCODE_KP_COMMA", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Comma

var SCANCODE_KP_EQUALSAS400* {.importcpp: "Urho3D::SCANCODE_KP_EQUALSAS400",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Equalsas400

var SCANCODE_INTERNATIONAL1* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL1",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International1

var SCANCODE_INTERNATIONAL2* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL2",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International2

var SCANCODE_INTERNATIONAL3* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL3",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International3

var SCANCODE_INTERNATIONAL4* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL4",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International4

var SCANCODE_INTERNATIONAL5* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL5",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International5

var SCANCODE_INTERNATIONAL6* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL6",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International6

var SCANCODE_INTERNATIONAL7* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL7",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International7

var SCANCODE_INTERNATIONAL8* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL8",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International8

var SCANCODE_INTERNATIONAL9* {.importcpp: "Urho3D::SCANCODE_INTERNATIONAL9",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_International9

var SCANCODE_LANG1* {.importcpp: "Urho3D::SCANCODE_LANG1", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang1

var SCANCODE_LANG2* {.importcpp: "Urho3D::SCANCODE_LANG2", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang2

var SCANCODE_LANG3* {.importcpp: "Urho3D::SCANCODE_LANG3", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang3

var SCANCODE_LANG4* {.importcpp: "Urho3D::SCANCODE_LANG4", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang4

var SCANCODE_LANG5* {.importcpp: "Urho3D::SCANCODE_LANG5", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang5

var SCANCODE_LANG6* {.importcpp: "Urho3D::SCANCODE_LANG6", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang6

var SCANCODE_LANG7* {.importcpp: "Urho3D::SCANCODE_LANG7", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang7

var SCANCODE_LANG8* {.importcpp: "Urho3D::SCANCODE_LANG8", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang8

var SCANCODE_LANG9* {.importcpp: "Urho3D::SCANCODE_LANG9", header: "InputEvents.h".}: cint #= sdl_Scancode_Lang9

var SCANCODE_ALTERASE* {.importcpp: "Urho3D::SCANCODE_ALTERASE", header: "InputEvents.h".}: cint #= sdl_Scancode_Alterase

var SCANCODE_SYSREQ* {.importcpp: "Urho3D::SCANCODE_SYSREQ", header: "InputEvents.h".}: cint #= sdl_Scancode_Sysreq

var SCANCODE_CANCEL* {.importcpp: "Urho3D::SCANCODE_CANCEL", header: "InputEvents.h".}: cint #= sdl_Scancode_Cancel

var SCANCODE_CLEAR* {.importcpp: "Urho3D::SCANCODE_CLEAR", header: "InputEvents.h".}: cint #= sdl_Scancode_Clear

var SCANCODE_PRIOR* {.importcpp: "Urho3D::SCANCODE_PRIOR", header: "InputEvents.h".}: cint #= sdl_Scancode_Prior

var SCANCODE_RETURN2* {.importcpp: "Urho3D::SCANCODE_RETURN2", header: "InputEvents.h".}: cint #= sdl_Scancode_Return2

var SCANCODE_SEPARATOR* {.importcpp: "Urho3D::SCANCODE_SEPARATOR", header: "InputEvents.h".}: cint #= sdl_Scancode_Separator

var SCANCODE_OUT* {.importcpp: "Urho3D::SCANCODE_OUT", header: "InputEvents.h".}: cint #= sdl_Scancode_Out

var SCANCODE_OPER* {.importcpp: "Urho3D::SCANCODE_OPER", header: "InputEvents.h".}: cint #= sdl_Scancode_Oper

var SCANCODE_CLEARAGAIN* {.importcpp: "Urho3D::SCANCODE_CLEARAGAIN",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Clearagain

var SCANCODE_CRSEL* {.importcpp: "Urho3D::SCANCODE_CRSEL", header: "InputEvents.h".}: cint #= sdl_Scancode_Crsel

var SCANCODE_EXSEL* {.importcpp: "Urho3D::SCANCODE_EXSEL", header: "InputEvents.h".}: cint #= sdl_Scancode_Exsel

var SCANCODE_KP_00* {.importcpp: "Urho3D::SCANCODE_KP_00", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_00

var SCANCODE_KP_000* {.importcpp: "Urho3D::SCANCODE_KP_000", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_000

var SCANCODE_THOUSANDSSEPARATOR* {.importcpp: "Urho3D::SCANCODE_THOUSANDSSEPARATOR",
                                   header: "InputEvents.h".}: cint #= sdl_Scancode_Thousandsseparator

var SCANCODE_DECIMALSEPARATOR* {.importcpp: "Urho3D::SCANCODE_DECIMALSEPARATOR",
                                 header: "InputEvents.h".}: cint #= sdl_Scancode_Decimalseparator

var SCANCODE_CURRENCYUNIT* {.importcpp: "Urho3D::SCANCODE_CURRENCYUNIT",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Currencyunit

var SCANCODE_CURRENCYSUBUNIT* {.importcpp: "Urho3D::SCANCODE_CURRENCYSUBUNIT",
                                header: "InputEvents.h".}: cint #= sdl_Scancode_Currencysubunit

var SCANCODE_KP_LEFTPAREN* {.importcpp: "Urho3D::SCANCODE_KP_LEFTPAREN",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Leftparen

var SCANCODE_KP_RIGHTPAREN* {.importcpp: "Urho3D::SCANCODE_KP_RIGHTPAREN",
                              header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Rightparen

var SCANCODE_KP_LEFTBRACE* {.importcpp: "Urho3D::SCANCODE_KP_LEFTBRACE",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Leftbrace

var SCANCODE_KP_RIGHTBRACE* {.importcpp: "Urho3D::SCANCODE_KP_RIGHTBRACE",
                              header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Rightbrace

var SCANCODE_KP_TAB* {.importcpp: "Urho3D::SCANCODE_KP_TAB", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Tab

var SCANCODE_KP_BACKSPACE* {.importcpp: "Urho3D::SCANCODE_KP_BACKSPACE",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Backspace

var SCANCODE_KP_A* {.importcpp: "Urho3D::SCANCODE_KP_A", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_A

var SCANCODE_KP_B* {.importcpp: "Urho3D::SCANCODE_KP_B", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_B

var SCANCODE_KP_C* {.importcpp: "Urho3D::SCANCODE_KP_C", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_C

var SCANCODE_KP_D* {.importcpp: "Urho3D::SCANCODE_KP_D", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_D

var SCANCODE_KP_E* {.importcpp: "Urho3D::SCANCODE_KP_E", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_E

var SCANCODE_KP_F* {.importcpp: "Urho3D::SCANCODE_KP_F", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_F

var SCANCODE_KP_XOR* {.importcpp: "Urho3D::SCANCODE_KP_XOR", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Xor

var SCANCODE_KP_POWER* {.importcpp: "Urho3D::SCANCODE_KP_POWER", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Power

var SCANCODE_KP_PERCENT* {.importcpp: "Urho3D::SCANCODE_KP_PERCENT",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Percent

var SCANCODE_KP_LESS* {.importcpp: "Urho3D::SCANCODE_KP_LESS", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Less

var SCANCODE_KP_GREATER* {.importcpp: "Urho3D::SCANCODE_KP_GREATER",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Greater

var SCANCODE_KP_AMPERSAND* {.importcpp: "Urho3D::SCANCODE_KP_AMPERSAND",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Ampersand

var SCANCODE_KP_DBLAMPERSAND* {.importcpp: "Urho3D::SCANCODE_KP_DBLAMPERSAND",
                                header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Dblampersand

var SCANCODE_KP_VERTICALBAR* {.importcpp: "Urho3D::SCANCODE_KP_VERTICALBAR",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Verticalbar

var SCANCODE_KP_DBLVERTICALBAR* {.importcpp: "Urho3D::SCANCODE_KP_DBLVERTICALBAR",
                                  header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Dblverticalbar

var SCANCODE_KP_COLON* {.importcpp: "Urho3D::SCANCODE_KP_COLON", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Colon

var SCANCODE_KP_HASH* {.importcpp: "Urho3D::SCANCODE_KP_HASH", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Hash

var SCANCODE_KP_SPACE* {.importcpp: "Urho3D::SCANCODE_KP_SPACE", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Space

var SCANCODE_KP_AT* {.importcpp: "Urho3D::SCANCODE_KP_AT", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_At

var SCANCODE_KP_EXCLAM* {.importcpp: "Urho3D::SCANCODE_KP_EXCLAM", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Exclam

var SCANCODE_KP_MEMSTORE* {.importcpp: "Urho3D::SCANCODE_KP_MEMSTORE",
                            header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Memstore

var SCANCODE_KP_MEMRECALL* {.importcpp: "Urho3D::SCANCODE_KP_MEMRECALL",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Memrecall

var SCANCODE_KP_MEMCLEAR* {.importcpp: "Urho3D::SCANCODE_KP_MEMCLEAR",
                            header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Memclear

var SCANCODE_KP_MEMADD* {.importcpp: "Urho3D::SCANCODE_KP_MEMADD", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Memadd

var SCANCODE_KP_MEMSUBTRACT* {.importcpp: "Urho3D::SCANCODE_KP_MEMSUBTRACT",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Memsubtract

var SCANCODE_KP_MEMMULTIPLY* {.importcpp: "Urho3D::SCANCODE_KP_MEMMULTIPLY",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Memmultiply

var SCANCODE_KP_MEMDIVIDE* {.importcpp: "Urho3D::SCANCODE_KP_MEMDIVIDE",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Memdivide

var SCANCODE_KP_PLUSMINUS* {.importcpp: "Urho3D::SCANCODE_KP_PLUSMINUS",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Plusminus

var SCANCODE_KP_CLEAR* {.importcpp: "Urho3D::SCANCODE_KP_CLEAR", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Clear

var SCANCODE_KP_CLEARENTRY* {.importcpp: "Urho3D::SCANCODE_KP_CLEARENTRY",
                              header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Clearentry

var SCANCODE_KP_BINARY* {.importcpp: "Urho3D::SCANCODE_KP_BINARY", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Binary

var SCANCODE_KP_OCTAL* {.importcpp: "Urho3D::SCANCODE_KP_OCTAL", header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Octal

var SCANCODE_KP_DECIMAL* {.importcpp: "Urho3D::SCANCODE_KP_DECIMAL",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Decimal

var SCANCODE_KP_HEXADECIMAL* {.importcpp: "Urho3D::SCANCODE_KP_HEXADECIMAL",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Kp_Hexadecimal

var SCANCODE_LCTRL* {.importcpp: "Urho3D::SCANCODE_LCTRL", header: "InputEvents.h".}: cint #= sdl_Scancode_Lctrl

var SCANCODE_LSHIFT* {.importcpp: "Urho3D::SCANCODE_LSHIFT", header: "InputEvents.h".}: cint #= sdl_Scancode_Lshift

var SCANCODE_LALT* {.importcpp: "Urho3D::SCANCODE_LALT", header: "InputEvents.h".}: cint #= sdl_Scancode_Lalt

var SCANCODE_LGUI* {.importcpp: "Urho3D::SCANCODE_LGUI", header: "InputEvents.h".}: cint #= sdl_Scancode_Lgui

var SCANCODE_RCTRL* {.importcpp: "Urho3D::SCANCODE_RCTRL", header: "InputEvents.h".}: cint #= sdl_Scancode_Rctrl

var SCANCODE_RSHIFT* {.importcpp: "Urho3D::SCANCODE_RSHIFT", header: "InputEvents.h".}: cint #= sdl_Scancode_Rshift

var SCANCODE_RALT* {.importcpp: "Urho3D::SCANCODE_RALT", header: "InputEvents.h".}: cint #= sdl_Scancode_Ralt

var SCANCODE_RGUI* {.importcpp: "Urho3D::SCANCODE_RGUI", header: "InputEvents.h".}: cint #= sdl_Scancode_Rgui

var SCANCODE_MODE* {.importcpp: "Urho3D::SCANCODE_MODE", header: "InputEvents.h".}: cint #= sdl_Scancode_Mode

var SCANCODE_AUDIONEXT* {.importcpp: "Urho3D::SCANCODE_AUDIONEXT", header: "InputEvents.h".}: cint #= sdl_Scancode_Audionext

var SCANCODE_AUDIOPREV* {.importcpp: "Urho3D::SCANCODE_AUDIOPREV", header: "InputEvents.h".}: cint #= sdl_Scancode_Audioprev

var SCANCODE_AUDIOSTOP* {.importcpp: "Urho3D::SCANCODE_AUDIOSTOP", header: "InputEvents.h".}: cint #= sdl_Scancode_Audiostop

var SCANCODE_AUDIOPLAY* {.importcpp: "Urho3D::SCANCODE_AUDIOPLAY", header: "InputEvents.h".}: cint #= sdl_Scancode_Audioplay

var SCANCODE_AUDIOMUTE* {.importcpp: "Urho3D::SCANCODE_AUDIOMUTE", header: "InputEvents.h".}: cint #= sdl_Scancode_Audiomute

var SCANCODE_MEDIASELECT* {.importcpp: "Urho3D::SCANCODE_MEDIASELECT",
                            header: "InputEvents.h".}: cint #= sdl_Scancode_Mediaselect

var SCANCODE_WWW* {.importcpp: "Urho3D::SCANCODE_WWW", header: "InputEvents.h".}: cint #= sdl_Scancode_Www

var SCANCODE_MAIL* {.importcpp: "Urho3D::SCANCODE_MAIL", header: "InputEvents.h".}: cint #= sdl_Scancode_Mail

var SCANCODE_CALCULATOR* {.importcpp: "Urho3D::SCANCODE_CALCULATOR",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Calculator

var SCANCODE_COMPUTER* {.importcpp: "Urho3D::SCANCODE_COMPUTER", header: "InputEvents.h".}: cint #= sdl_Scancode_Computer

var SCANCODE_AC_SEARCH* {.importcpp: "Urho3D::SCANCODE_AC_SEARCH", header: "InputEvents.h".}: cint #= sdl_Scancode_Ac_Search

var SCANCODE_AC_HOME* {.importcpp: "Urho3D::SCANCODE_AC_HOME", header: "InputEvents.h".}: cint #= sdl_Scancode_Ac_Home

var SCANCODE_AC_BACK* {.importcpp: "Urho3D::SCANCODE_AC_BACK", header: "InputEvents.h".}: cint #= sdl_Scancode_Ac_Back

var SCANCODE_AC_FORWARD* {.importcpp: "Urho3D::SCANCODE_AC_FORWARD",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Ac_Forward

var SCANCODE_AC_STOP* {.importcpp: "Urho3D::SCANCODE_AC_STOP", header: "InputEvents.h".}: cint #= sdl_Scancode_Ac_Stop

var SCANCODE_AC_REFRESH* {.importcpp: "Urho3D::SCANCODE_AC_REFRESH",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Ac_Refresh

var SCANCODE_AC_BOOKMARKS* {.importcpp: "Urho3D::SCANCODE_AC_BOOKMARKS",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Ac_Bookmarks

var SCANCODE_BRIGHTNESSDOWN* {.importcpp: "Urho3D::SCANCODE_BRIGHTNESSDOWN",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Brightnessdown

var SCANCODE_BRIGHTNESSUP* {.importcpp: "Urho3D::SCANCODE_BRIGHTNESSUP",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Brightnessup

var SCANCODE_DISPLAYSWITCH* {.importcpp: "Urho3D::SCANCODE_DISPLAYSWITCH",
                              header: "InputEvents.h".}: cint #= sdl_Scancode_Displayswitch

var SCANCODE_KBDILLUMTOGGLE* {.importcpp: "Urho3D::SCANCODE_KBDILLUMTOGGLE",
                               header: "InputEvents.h".}: cint #= sdl_Scancode_Kbdillumtoggle

var SCANCODE_KBDILLUMDOWN* {.importcpp: "Urho3D::SCANCODE_KBDILLUMDOWN",
                             header: "InputEvents.h".}: cint #= sdl_Scancode_Kbdillumdown

var SCANCODE_KBDILLUMUP* {.importcpp: "Urho3D::SCANCODE_KBDILLUMUP",
                           header: "InputEvents.h".}: cint #= sdl_Scancode_Kbdillumup

var SCANCODE_EJECT* {.importcpp: "Urho3D::SCANCODE_EJECT", header: "InputEvents.h".}: cint #= sdl_Scancode_Eject

var SCANCODE_SLEEP* {.importcpp: "Urho3D::SCANCODE_SLEEP", header: "InputEvents.h".}: cint #= sdl_Scancode_Sleep

var SCANCODE_APP1* {.importcpp: "Urho3D::SCANCODE_APP1", header: "InputEvents.h".}: cint #= sdl_Scancode_App1

var SCANCODE_APP2* {.importcpp: "Urho3D::SCANCODE_APP2", header: "InputEvents.h".}: cint #= sdl_Scancode_App2

var HAT_CENTER* {.importcpp: "Urho3D::HAT_CENTER", header: "InputEvents.h".}: cint #= sdl_Hat_Centered

var HAT_UP* {.importcpp: "Urho3D::HAT_UP", header: "InputEvents.h".}: cint #= sdl_Hat_Up

var HAT_RIGHT* {.importcpp: "Urho3D::HAT_RIGHT", header: "InputEvents.h".}: cint #= sdl_Hat_Right

var HAT_DOWN* {.importcpp: "Urho3D::HAT_DOWN", header: "InputEvents.h".}: cint #= sdl_Hat_Down

var HAT_LEFT* {.importcpp: "Urho3D::HAT_LEFT", header: "InputEvents.h".}: cint #= sdl_Hat_Left

var CONTROLLER_BUTTON_A* {.importcpp: "Urho3D::CONTROLLER_BUTTON_A",
                           header: "InputEvents.h".}: cint #= sdl_Controller_Button_A

var CONTROLLER_BUTTON_B* {.importcpp: "Urho3D::CONTROLLER_BUTTON_B",
                           header: "InputEvents.h".}: cint #= sdl_Controller_Button_B

var CONTROLLER_BUTTON_X* {.importcpp: "Urho3D::CONTROLLER_BUTTON_X",
                           header: "InputEvents.h".}: cint #= sdl_Controller_Button_X

var CONTROLLER_BUTTON_Y* {.importcpp: "Urho3D::CONTROLLER_BUTTON_Y",
                           header: "InputEvents.h".}: cint #= sdl_Controller_Button_Y

var CONTROLLER_BUTTON_BACK* {.importcpp: "Urho3D::CONTROLLER_BUTTON_BACK",
                              header: "InputEvents.h".}: cint #= sdl_Controller_Button_Back

var CONTROLLER_BUTTON_GUIDE* {.importcpp: "Urho3D::CONTROLLER_BUTTON_GUIDE",
                               header: "InputEvents.h".}: cint #= sdl_Controller_Button_Guide

var CONTROLLER_BUTTON_START* {.importcpp: "Urho3D::CONTROLLER_BUTTON_START",
                               header: "InputEvents.h".}: cint #= sdl_Controller_Button_Start

var CONTROLLER_BUTTON_LEFTSTICK* {.importcpp: "Urho3D::CONTROLLER_BUTTON_LEFTSTICK",
                                   header: "InputEvents.h".}: cint #= sdl_Controller_Button_Leftstick

var CONTROLLER_BUTTON_RIGHTSTICK* {.importcpp: "Urho3D::CONTROLLER_BUTTON_RIGHTSTICK",
                                    header: "InputEvents.h".}: cint #= sdl_Controller_Button_Rightstick

var CONTROLLER_BUTTON_LEFTSHOULDER* {.importcpp: "Urho3D::CONTROLLER_BUTTON_LEFTSHOULDER",
                                      header: "InputEvents.h".}: cint #= sdl_Controller_Button_Leftshoulder

var CONTROLLER_BUTTON_RIGHTSHOULDER* {.importcpp: "Urho3D::CONTROLLER_BUTTON_RIGHTSHOULDER",
                                       header: "InputEvents.h".}: cint #= sdl_Controller_Button_Rightshoulder

var CONTROLLER_BUTTON_DPAD_UP* {.importcpp: "Urho3D::CONTROLLER_BUTTON_DPAD_UP",
                                 header: "InputEvents.h".}: cint #= sdl_Controller_Button_Dpad_Up

var CONTROLLER_BUTTON_DPAD_DOWN* {.importcpp: "Urho3D::CONTROLLER_BUTTON_DPAD_DOWN",
                                   header: "InputEvents.h".}: cint #= sdl_Controller_Button_Dpad_Down

var CONTROLLER_BUTTON_DPAD_LEFT* {.importcpp: "Urho3D::CONTROLLER_BUTTON_DPAD_LEFT",
                                   header: "InputEvents.h".}: cint #= sdl_Controller_Button_Dpad_Left

var CONTROLLER_BUTTON_DPAD_RIGHT* {.importcpp: "Urho3D::CONTROLLER_BUTTON_DPAD_RIGHT",
                                    header: "InputEvents.h".}: cint #= sdl_Controller_Button_Dpad_Right

var CONTROLLER_AXIS_LEFTX* {.importcpp: "Urho3D::CONTROLLER_AXIS_LEFTX",
                             header: "InputEvents.h".}: cint #= sdl_Controller_Axis_Leftx

var CONTROLLER_AXIS_LEFTY* {.importcpp: "Urho3D::CONTROLLER_AXIS_LEFTY",
                             header: "InputEvents.h".}: cint #= sdl_Controller_Axis_Lefty

var CONTROLLER_AXIS_RIGHTX* {.importcpp: "Urho3D::CONTROLLER_AXIS_RIGHTX",
                              header: "InputEvents.h".}: cint #= sdl_Controller_Axis_Rightx

var CONTROLLER_AXIS_RIGHTY* {.importcpp: "Urho3D::CONTROLLER_AXIS_RIGHTY",
                              header: "InputEvents.h".}: cint #= sdl_Controller_Axis_Righty

var CONTROLLER_AXIS_TRIGGERLEFT* {.importcpp: "Urho3D::CONTROLLER_AXIS_TRIGGERLEFT",
                                   header: "InputEvents.h".}: cint #= sdl_Controller_Axis_Triggerleft

var CONTROLLER_AXIS_TRIGGERRIGHT* {.importcpp: "Urho3D::CONTROLLER_AXIS_TRIGGERRIGHT",
                                    header: "InputEvents.h".}: cint #= sdl_Controller_Axis_Triggerright
