//
// Copyright (c) 2008-2014 the Urho3D project.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#pragma once

#include "HashSet.h"
#include "InputEvents.h"
#include "Mutex.h"
#include "Object.h"
#include "List.h"

#include "Cursor.h"

namespace Urho3D
{

/// %Input Mouse Modes.
enum MouseMode
{
    MM_ABSOLUTE = 0,
    MM_RELATIVE,
    MM_WRAP
};

class Deserializer;
class Graphics;
class Serializer;
class UIElement;
class XMLFile;

const IntVector2 MOUSE_POSITION_OFFSCREEN = IntVector2(M_MIN_INT, M_MIN_INT);

/// %Input state for a finger touch.
struct TouchState
{
    /// Return last touched UI element, used by scripting integration.
    UIElement* GetTouchedElement();

    /// Touch (finger) ID.
    int touchID_;
    /// Position in screen coordinates.
    IntVector2 position_;
    /// Last position in screen coordinates.
    IntVector2 lastPosition_;
    /// Movement since last frame.
    IntVector2 delta_;
    /// Finger pressure.
    float pressure_;
    /// Last touched UI element from screen joystick.
    WeakPtr<UIElement> touchedElement_;
};

/// %Input state for a joystick.
struct JoystickState
{
    /// Construct with defaults.
    JoystickState() :
        joystick_(0), controller_(0), screenJoystick_(0)
    {
    }

    /// Initialize the number of buttons, axes and hats and set them to neutral state.
    void Initialize(unsigned numButtons, unsigned numAxes, unsigned numHats);
    /// Reset button, axis and hat states to neutral.
    void Reset();

    /// Return whether is a game controller. Game controllers will use standardized axis and button mappings.
    bool IsController() const { return controller_ != 0; }
    /// Return number of buttons.
    unsigned GetNumButtons() const { return buttons_.Size(); }
    /// Return number of axes.
    unsigned GetNumAxes() const { return axes_.Size(); }
    /// Return number of hats.
    unsigned GetNumHats() const { return hats_.Size(); }
    /// Check if a button is held down.
    bool GetButtonDown(unsigned index) const { return index < buttons_.Size() ? buttons_[index] : false; }
    /// Check if a button has been pressed on this frame.
    bool GetButtonPress(unsigned index) const { return index < buttonPress_.Size() ? buttonPress_[index] : false; }
    /// Return axis position.
    float GetAxisPosition(unsigned index) const { return index < axes_.Size() ? axes_[index] : 0.0f; }
    /// Return hat position.
    int GetHatPosition(unsigned index) const { return index < hats_.Size() ? hats_[index] : HAT_CENTER; }

    /// SDL joystick.
    SDL_Joystick* joystick_;
    /// SDL joystick instance ID.
    SDL_JoystickID joystickID_;
    /// SDL game controller.
    SDL_GameController* controller_;
    /// UI element containing the screen joystick.
    UIElement* screenJoystick_;
    /// Joystick name.
    String name_;
    /// Button up/down state.
    PODVector<bool> buttons_;
    /// Button pressed on this frame.
    PODVector<bool> buttonPress_;
    /// Axis position from -1 to 1.
    PODVector<float> axes_;
    /// POV hat bits.
    PODVector<int> hats_;
};

/// %Input subsystem. Converts operating system window messages to input state and events.
class URHO3D_API Input : public Object
{
    OBJECT(Input);

public:
    /// Construct.
    Input(Context* context);
    /// Destruct.
    virtual ~Input();

    /// Poll for window messages. Called by HandleBeginFrame().
    void Update();
    /// Set whether ALT-ENTER fullscreen toggle is enabled.
    void SetToggleFullscreen(bool enable);
    /// Set whether the operating system mouse cursor is visible. When not visible (default), is kept centered to prevent leaving the window. Mouse visiblility event can be suppressed-- this also recalls any unsuppressed SetMouseVisible which can be returned by ResetMouseVisible().
    void SetMouseVisible(bool enable, bool suppressEvent = false);
    /// Reset last mouse visibilty that was not suppressed in SetMouseVisible.
    void ResetMouseVisible() { SetMouseVisible(lastMouseVisible_, true); }
    /// Set whether the mouse is currently being grabbed by an operation.
    void SetMouseGrabbed(bool grab);
    /// Set the mouse mode.
    /** Set the mouse mode behaviour.
     *  MM_ABSOLUTE is the default behaviour, allowing the toggling of operating system cursor visibility and allowing the cursor to escape the window when visible.
     *  When the operating system cursor is invisible in absolute mouse mode, the mouse is confined to the window.
     *  If the operating system and UI cursors are both invisible, interaction with the Urho UI will be limited (eg: drag move / drag end events will not trigger).
     *  SetMouseMode(MM_ABSOLUTE) will call SetMouseGrabbed(false).
     *
     *  MM_RELATIVE sets the operating system cursor to invisible and confines the cursor to the window.
     *  The operating system cursor cannot be set to be visible in this mode via SetMouseVisible(), however changes are tracked and will be restored when another mouse mode is set.
     *  When the virtual cursor is also invisible, UI interaction will still function as normal (eg: drag events will trigger).
     *  SetMouseMode(MM_RELATIVE) will call SetMouseGrabbed(true).
     *
     *  MM_WRAP grabs the mouse from the operating system and confines the operating system cursor to the window, wrapping the cursor when it is near the edges.
     *  SetMouseMode(MM_WRAP) will call SetMouseGrabbed(true).
    */
    void SetMouseMode(MouseMode mode);
    /// Add screen joystick.
    /** Return the joystick instance ID when successful or negative on error.
     *  If layout file is not given, use the default screen joystick layout.
     *  If style file is not given, use the default style file from root UI element.
     *
     *  This method should only be called in main thread.
     */
    SDL_JoystickID AddScreenJoystick(XMLFile* layoutFile = 0, XMLFile* styleFile = 0);
    /// Remove screen joystick by instance ID.
    /** Return true if successful.
     *
     *  This method should only be called in main thread.
     */
    bool RemoveScreenJoystick(SDL_JoystickID id);
    /// Set whether the virtual joystick is visible.
    void SetScreenJoystickVisible(SDL_JoystickID id, bool enable);
    /// Show or hide on-screen keyboard on platforms that support it. When shown, keypresses from it are delivered as key events.
    void SetScreenKeyboardVisible(bool enable);
    /// Set touch emulation by mouse. Only available on desktop platforms. When enabled, actual mouse events are no longer sent and the mouse cursor is forced visible.
    void SetTouchEmulation(bool enable);
    /// Begin recording a touch gesture. Return true if successful. The E_GESTURERECORDED event (which contains the ID for the new gesture) will be sent when recording finishes.
    bool RecordGesture();
    /// Save all in-memory touch gestures. Return true if successful.
    bool SaveGestures(Serializer& dest);
    /// Save a specific in-memory touch gesture to a file. Return true if successful.
    bool SaveGesture(Serializer& dest, unsigned gestureID);
    /// Load touch gestures from a file. Return number of loaded gestures, or 0 on failure.
    unsigned LoadGestures(Deserializer& source);
    /// Remove an in-memory gesture by ID. Return true if was found.
    bool RemoveGesture(unsigned gestureID);
    /// Remove all in-memory gestures.
    void RemoveAllGestures();

    /// Return keycode from key name.
    int GetKeyFromName(const String& name) const;
    /// Return keycode from scancode.
    int GetKeyFromScancode(int scancode) const;
    /// Return name of key from keycode.
    String GetKeyName(int key) const;
    /// Return scancode from keycode.
    int GetScancodeFromKey(int key) const;
    /// Return scancode from key name.
    int GetScancodeFromName(const String& name) const;
    /// Return name of key from scancode.
    String GetScancodeName(int scancode) const;
    /// Check if a key is held down.
    bool GetKeyDown(int key) const;
    /// Check if a key has been pressed on this frame.
    bool GetKeyPress(int key) const;
    /// Check if a key is held down by scancode.
    bool GetScancodeDown(int scancode) const;
    /// Check if a key has been pressed on this frame by scancode.
    bool GetScancodePress(int scanode) const;
    /// Check if a mouse button is held down.
    bool GetMouseButtonDown(int button) const;
    /// Check if a mouse button has been pressed on this frame.
    bool GetMouseButtonPress(int button) const;
    /// Check if a qualifier key is held down.
    bool GetQualifierDown(int qualifier) const;
    /// Check if a qualifier key has been pressed on this frame.
    bool GetQualifierPress(int qualifier) const;
    /// Return the currently held down qualifiers.
    int GetQualifiers() const;
    /// Return mouse position within window. Should only be used with a visible mouse cursor.
    IntVector2 GetMousePosition() const;
    /// Return mouse movement since last frame.
    const IntVector2& GetMouseMove() const { return mouseMove_; }
    /// Return horizontal mouse movement since last frame.
    int GetMouseMoveX() const { return mouseMove_.x_; }
    /// Return vertical mouse movement since last frame.
    int GetMouseMoveY() const { return mouseMove_.y_; }
    /// Return mouse wheel movement since last frame.
    int GetMouseMoveWheel() const { return mouseMoveWheel_; }
    /// Return number of active finger touches.
    unsigned GetNumTouches() const { return touches_.Size(); }
    /// Return active finger touch by index.
    TouchState* GetTouch(unsigned index) const;
    /// Return number of connected joysticks.
    unsigned GetNumJoysticks() const { return joysticks_.Size(); }
    /// Return joystick state by ID, or null if does not exist.
    JoystickState* GetJoystick(SDL_JoystickID id);
    /// Return joystick state by index, or null if does not exist. 0 = first connected joystick.
    JoystickState* GetJoystickByIndex(unsigned index);
    /// Return whether fullscreen toggle is enabled.
    bool GetToggleFullscreen() const { return toggleFullscreen_; }
    /// Return whether a virtual joystick is visible.
    bool IsScreenJoystickVisible(SDL_JoystickID id) const;
    /// Return whether on-screen keyboard is supported.
    bool GetScreenKeyboardSupport() const;
    /// Return whether on-screen keyboard is being shown.
    bool IsScreenKeyboardVisible() const;
    /// Return whether touch emulation is enabled.
    bool GetTouchEmulation() const { return touchEmulation_; }
    /// Return whether the operating system mouse cursor is visible.
    bool IsMouseVisible() const { return mouseVisible_; }
    /// Return whether the mouse is currently being grabbed by an operation.
    bool IsMouseGrabbed() const { return mouseGrabbed_; }
    /// Return the mouse mode.
    MouseMode GetMouseMode() const { return mouseMode_; }
    /// Return whether application window has input focus.
    bool HasFocus() { return inputFocus_; }
    /// Return whether application window is minimized.
    bool IsMinimized() const;

private:
    /// Initialize when screen mode initially set.
    void Initialize();
    /// Open a joystick and return its ID. Return -1 if no joystick.
    SDL_JoystickID OpenJoystick(unsigned index);
    /// Setup internal joystick structures.
    void ResetJoysticks();
    /// Prepare input state for application gaining input focus.
    void GainFocus();
    /// Prepare input state for application losing input focus.
    void LoseFocus();
    /// Clear input state.
    void ResetState();
    /// Clear touch states and send touch end events.
    void ResetTouches();
    /// Get the index of a touch based on the touch ID.
    unsigned GetTouchIndexFromID(int touchID);
    /// Used internally to return and remove the next available touch index.
    unsigned PopTouchIndex();
    /// Push a touch index back into the list of available when finished with it.
    void PushTouchIndex(int touchID);
    /// Send an input focus or window minimization change event.
    void SendInputFocusEvent();
    /// Handle a mouse button change.
    void SetMouseButton(int button, bool newState);
    /// Handle a key change.
    void SetKey(int key, int scancode, unsigned raw, bool newState);
    /// Handle mousewheel change.
    void SetMouseWheel(int delta);
    /// Internal function to set the mouse cursor position.
    void SetMousePosition(const IntVector2& position);
    /// Handle screen mode event.
    void HandleScreenMode(StringHash eventType, VariantMap& eventData);
    /// Handle frame start event.
    void HandleBeginFrame(StringHash eventType, VariantMap& eventData);
    /// Handle touch events from the controls of screen joystick(s).
    void HandleScreenJoystickTouch(StringHash eventType, VariantMap& eventData);
    /// Handle SDL event.
    void HandleSDLEvent(void* sdlEvent);

    /// Graphics subsystem.
    WeakPtr<Graphics> graphics_;
    /// Key down state.
    HashSet<int> keyDown_;
    /// Key pressed state.
    HashSet<int> keyPress_;
    /// Key down state by scancode.
    HashSet<int> scancodeDown_;
    /// Key pressed state by scancode.
    HashSet<int> scancodePress_;
    /// Active finger touches.
    HashMap<int, TouchState> touches_;
    /// List that maps between event touch IDs and normalised touch IDs
    List<int> availableTouchIDs_;
    /// Mapping of touch indicies
    HashMap<int, int> touchIDMap_;
    /// String for text input.
    String textInput_;
    /// Opened joysticks.
    HashMap<SDL_JoystickID, JoystickState> joysticks_;
    /// Mouse buttons' down state.
    unsigned mouseButtonDown_;
    /// Mouse buttons' pressed state.
    unsigned mouseButtonPress_;
    /// Last mouse position for calculating movement.
    IntVector2 lastMousePosition_;
    /// Last mouse position before being set to not visible.
    IntVector2 lastVisibleMousePosition_;
    /// Mouse movement since last frame.
    IntVector2 mouseMove_;
    /// Mouse wheel movement since last frame.
    int mouseMoveWheel_;
    /// SDL window ID.
    unsigned windowID_;
    /// Fullscreen toggle flag.
    bool toggleFullscreen_;
    /// Operating system mouse cursor visible flag.
    bool mouseVisible_;
    /// The last operating system mouse cursor visible flag set by end use call to SetMouseVisible.
    bool lastMouseVisible_;
    /// Flag to indicate the mouse is being grabbed by an operation. Subsystems like UI that uses mouse should temporarily ignore the mouse hover or click events.
    bool mouseGrabbed_;
    /// Determines the mode of mouse behaviour.
    MouseMode mouseMode_;
    /// Touch emulation mode flag.
    bool touchEmulation_;
    /// Input focus flag.
    bool inputFocus_;
    /// Minimized flag.
    bool minimized_;
    /// Gained focus on this frame flag.
    bool focusedThisFrame_;
    /// Next mouse move suppress flag.
    bool suppressNextMouseMove_;
    /// Initialized flag.
    bool initialized_;
};

}
