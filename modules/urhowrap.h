
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

using namespace Urho3D;

typedef void(*HandlerFunc)(void* userData, StringHash eventType, VariantMap* eventData);

void openUrho3D(bool fullScreen);

void closeUrho3D(void);

Urho3D::Context* getContext(void);

Urho3D::UI* getSubsystemUI(void);

Urho3D::ResourceCache* getSubsystemResourceCache(void);

Urho3D::Font* getFont(const Urho3D::String& fontName);
void registerEvent(HandlerFunc func, void* userData, const StringHash* eventType);
void parseArguments(void);

int runMainLoop(void);
