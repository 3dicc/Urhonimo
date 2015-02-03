
#pragma once

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

float getTimeStep(void* eventData) {
  auto v = (Urho3D::VariantMap*)eventData;
  return (*v)["TimeStep"].GetFloat();
}

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

Urho3D::ResourceCache* getSubsystemResourceCache(void) {
  return mainApp->GetSubsystem<Urho3D::ResourceCache>();
}

Urho3D::Renderer* getSubsystemRenderer(void) {
  return mainApp->GetSubsystem<Urho3D::Renderer>();
}

Urho3D::Input* getSubsystemInput(void) {
  return mainApp->GetSubsystem<Urho3D::Input>();
}


Urho3D::Font* getFont(const Urho3D::String& fontName) {
  return mainApp->GetSubsystem<Urho3D::ResourceCache>()->GetResource<Urho3D::Font>(fontName);
}

void subscribeToEvent(StringHash eventType, HandlerFunc func, void* userData) {
  mainApp->SubscribeToEvent(eventType, new EventHandlerForC(mainApp, func, userData));
}

void unsubscribeFromEvent(StringHash eventType) { 
  mainApp->UnsubscribeFromEvent(eventType);
}

void parseArguments(void) {
  Urho3D::ParseArguments(GetCommandLineW());
}

int runMainLoop(void) {
  return mainApp->Run();
}
