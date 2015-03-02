when not defined(cpp):
  {.error: "Urhonimo requires that you compile in cpp mode".}

when defined(release):
  {.error: "we have no release build of Urho3D.lib yet".}
else:
  when defined(windows):
    {.link: "../lib/Urho3D_d.lib".}
    {.link: r"C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x86\d3d9.lib".}
    {.link: r"C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x86\d3dcompiler.lib".}
    {.link: r"kernel32.lib".}
    {.link: r"user32.lib".}
    {.link: r"winmm.lib".}
    {.link: r"gdi32.lib".}
    {.link: r"winspool.lib".}
    {.link: r"shell32.lib".}
    {.link: r"ole32.lib".}
    {.link: r"oleaut32.lib".}
    {.link: r"version.lib".}

    {.link: r"uuid.lib".}
    {.link: r"comdlg32.lib".}
    {.link: r"advapi32.lib".}
    {.link: r"imm32.lib".}
    {.link: r"ws2_32.lib".}
    {.link: r"dbghelp.lib".}
  when defined(linux):
    {.passL: "../lib/libUrho3D.a".}
    {.passL: "-pthread".}
    {.passL: "-lGL".}
    {.passL: "-lX11".}
  when defined(macosx):
    {.passL: "../lib/libUrho3D.a".}
    {.passL: "-framework OpenGL".}
    {.passL: "-framework CoreAudio".}
    {.passL: "-framework AudioToolbox".}
    {.passL: "-framework AudioUnit".}
    {.passL: "-framework Carbon".}
    {.passL: "-framework IOKit".}
    {.passL: "-framework Cocoa".}
    {.passL: "-framework ForceFeedback".}
#  {.passL: "/MD".}

{.emit: """
#include "Application.h"
#include "Engine.h"
#include "Graphics.h"
#include "Input.h"
#include "InputEvents.h"
#include "ResourceCache.h"
#include "UI.h"
#include "Font.h"
#include "Text.h"
#include "Variant.h"
#include "Renderer.h"

using namespace Urho3D;

#if !(defined(WIN32) || defined(_WIN32))
#  define __cdecl
#endif

typedef void(*__cdecl HandlerFunc)(void* userData, StringHash eventType,
                                   VariantMap& eventData);

class EventHandlerForC: public EventHandler
{
public:
  /// Invoke event handler function.
  virtual void Invoke(VariantMap& eventData)
  {
    function_(GetUserData(), eventType_, eventData);
  }

  EventHandlerForC(Object* receiver, HandlerFunc func, void* userData) :
    EventHandler(receiver, userData), function_(func) {}

private:
  HandlerFunc function_;
};

class MainApplication: public Urho3D::Application {
  OBJECT(MainApplication);

public:
  MainApplication(Urho3D::Context* context): Application(context){
  }

  virtual void Setup(){
  }
  virtual void Start() {
  }
  virtual void Stop() {}
  Engine* GetEngine() { return engine_; }
  VariantMap& GetEngineParams() { return engineParameters_; }
};

MainApplication* mainApp;

void openUrho3D(bool fullScreen) {
  mainApp = new MainApplication(new Urho3D::Context());
  mainApp->GetEngineParams()["FullScreen"] = fullScreen;
  if (!mainApp->GetEngine()->Initialize(mainApp->GetEngineParams()))
    ErrorExit();
}

void closeUrho3D(void) {
  mainApp->GetEngine()->Exit();
}

Urho3D::Context* getContext(void) { return mainApp->GetContext(); }
Urho3D::Application* getApp(void) { return mainApp; }

Urho3D::UI* getSubsystemUI(void) {
  return mainApp->GetSubsystem<UI>();
}

Urho3D::Engine* getEngine(void) {
  return mainApp->GetEngine();
}

Urho3D::ResourceCache* getSubsystemResourceCache(void) {
  return mainApp->GetSubsystem<Urho3D::ResourceCache>();
}

Urho3D::Renderer* getSubsystemRenderer(void) {
  return mainApp->GetSubsystem<Urho3D::Renderer>();
}

Urho3D::Input* getSubsystemInput(void) {
  return mainApp->GetSubsystem<Urho3D::Input>();
}

void subscribeToEvent(StringHash eventType, HandlerFunc func, void* userData) {
  mainApp->SubscribeToEvent(eventType, new EventHandlerForC(mainApp, func, userData));
}

void unsubscribeFromEvent(StringHash eventType) {
  mainApp->UnsubscribeFromEvent(eventType);
}

void parseArguments(void) {
#if defined(WIN32) || defined(_WIN32)
  Urho3D::ParseArguments(GetCommandLineW());
#endif
}

int runMainLoop(void) {
  return mainApp->Run();
}
""".}


import urobject, ui, resourcecache, urstr, font, stringHash, variant, input,
  renderer, vector3, quaternion, color, file, component, engine, application

{.pragma: urh, importc, cdecl.}

proc getApp(): ptr Application {.urh.}
proc openUrho3D*(fullScreen: bool) {.urh.}

proc closeUrho3D*() {.urh.}

proc getContext*(): ptr Context {.urh.}

proc getSubsystemUI*(): ptr UI {.urh.}

proc getEngine*(): ptr Engine {.urh.}

proc getSubsystemResourceCache*(): ptr ResourceCache {.urh.}
proc getSubsystemRenderer*(): ptr Renderer {.urh.}
proc getSubsystemInput*(): ptr Input {.urh.}
proc getSubsystem*[T](): ptr T = getSubsystem[T](getApp())
# {.importcpp: "getSubsystem<'*0>()", cdecl,
#  nodecl.}

proc getFont*(fontName: UrString): ptr Font =
  getResource[Font](getSubsystemResourceCache()[], fontname, true)

type
  HandlerFunc* = proc (userData: pointer, eventType: StringHash;
                       eventData: var VariantMap) {.cdecl.}

proc subscribeToEvent*(eventType: StringHash; fn: HandlerFunc;
                       userData: pointer = nil) {.urh.}

proc unsubscribeFromEvent*(eventType: StringHash) {.urh.}

proc parseArguments*() {.urh}
proc runMainLoop*(): cint {.urh.}

converter toUrStringHash*(s: string): StringHash =
  result = stringHash.constructStringHash(cstring(s))

converter toUrString*(s: string): UrString =
  result = urstr.constructString(s, s.len.cuint)

proc cnew*[T](x: T): ptr T {.importcpp: "(new '*0#@)", nodecl.}

template vec3*(a, b, c: float): Vector3 =
  constructVector3(a.float32, b.float32, c.float32)

template quat*(a, b, c: float): Quaternion =
  constructQuaternion(a.float32, b.float32, c.float32)

template col*(r, g, b: float): Color =
  constructColor(r.float32, g.float32, b.float32)

proc saveXML*(sc: ptr Scene, f: UrFile) {.importcpp: "#.SaveXML(@)", header:
  "File.h".}

proc loadXML*(sc: ptr Scene, f: UrFile) {.importcpp: "#.LoadXML(@)", header:
  "File.h".}
