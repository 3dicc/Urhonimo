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

#include "ArrayPtr.h"
#include "HashSet.h"
#include "Resource.h"
#include "ScriptEventListener.h"

class asIObjectType;
class asIScriptContext;
class asIScriptEngine;
class asIScriptFunction;
class asIScriptModule;
class asIScriptObject;

namespace Urho3D
{

class Script;
class ScriptEventInvoker;
class ScriptInstance;
class Variant;

/// %Script file resource.
class URHO3D_API ScriptFile : public Resource, public ScriptEventListener
{
    OBJECT(ScriptFile);
    
public:
    /// Construct.
    ScriptFile(Context* context);
    /// Destruct.
    virtual ~ScriptFile();
    /// Register object factory.
    static void RegisterObject(Context* context);
    
    /// Load resource from stream. May be called from a worker thread. Return true if successful.
    virtual bool BeginLoad(Deserializer& source);
    /// Finish resource loading. Always called from the main thread. Return true if successful.
    virtual bool EndLoad();

    /// Add a scripted event handler.
    virtual void AddEventHandler(StringHash eventType, const String& handlerName);
    /// Add a scripted event handler for a specific sender.
    virtual void AddEventHandler(Object* sender, StringHash eventType, const String& handlerName);
    /// Remove a scripted event handler.
    virtual void RemoveEventHandler(StringHash eventType);
    /// Remove a scripted event handler for a specific sender.
    virtual void RemoveEventHandler(Object* sender, StringHash eventType);
    /// Remove all scripted event handlers for a specific sender.
    virtual void RemoveEventHandlers(Object* sender);
    /// Remove all scripted event handlers.
    virtual void RemoveEventHandlers();
    /// Remove all scripted event handlers, except those listed.
    virtual void RemoveEventHandlersExcept(const PODVector<StringHash>& exceptions);
    
    /// Query for a function by declaration and execute if found.
    bool Execute(const String& declaration, const VariantVector& parameters = Variant::emptyVariantVector, bool unprepare = true);
    /// Execute a function.
    bool Execute(asIScriptFunction* function, const VariantVector& parameters = Variant::emptyVariantVector, bool unprepare = true);
    /// Query for an object method by declaration and execute if found.
    bool Execute(asIScriptObject* object, const String& declaration, const VariantVector& parameters = Variant::emptyVariantVector, bool unprepare = true);
    /// Execute an object method.
    bool Execute(asIScriptObject* object, asIScriptFunction* method, const VariantVector& parameters = Variant::emptyVariantVector, bool unprepare = true);
    /// Add a delay-executed function call, optionally repeating.
    void DelayedExecute(float delay, bool repeat, const String& declaration, const VariantVector& parameters = Variant::emptyVariantVector);
    /// Clear pending delay-executed function calls. If empty declaration given, clears all.
    void ClearDelayedExecute(const String& declaration = String::EMPTY);
    /// Create a script object. Optionally search for the first class in the module that implements the specified interface.
    asIScriptObject* CreateObject(const String& className, bool useInterface = false);
    /// Save the script bytecode. Return true if successful.
    bool SaveByteCode(Serializer& dest);
    
    /// Return script module.
    asIScriptModule* GetScriptModule() const { return scriptModule_; }
    /// Return a function by declaration. Will be stored to a search cache so that further searches should be faster.
    asIScriptFunction* GetFunction(const String& declaration);
    /// Return an object method by declaration.
    asIScriptFunction* GetMethod(asIScriptObject* object, const String& declaration);
    /// Return whether script compiled successfully.
    bool IsCompiled() const { return compiled_; }
    /// Clean up an event invoker object when its associated script object no longer exists
    void CleanupEventInvoker(asIScriptObject* object);

private:
    /// Add an event handler and create the necessary proxy object.
    void AddEventHandlerInternal(Object* sender, StringHash eventType, const String& handlerName);
    /// Add a script section, checking for includes recursively. Return true if successful.
    bool AddScriptSection(asIScriptEngine* engine, Deserializer& source);
    /// Set parameters for a function or method.
    void SetParameters(asIScriptContext* context, asIScriptFunction* function, const VariantVector& parameters);
    /// Release the script module.
    void ReleaseModule();
    /// Handle application update event.
    void HandleUpdate(StringHash eventType, VariantMap& eventData);
    
    /// Script subsystem.
    SharedPtr<Script> script_;
    /// Script module.
    asIScriptModule* scriptModule_;
    /// Compiled flag.
    bool compiled_;
    /// Subscribed to application update event flag.
    bool subscribed_;
    /// Encountered include files during script file loading.
    HashSet<String> includeFiles_;
    /// Search cache for checking whether script classes implement "ScriptObject" interface.
    HashMap<asIObjectType*, bool> validClasses_;
    /// Search cache for functions.
    HashMap<String, asIScriptFunction*> functions_;
    /// Search cache for methods.
    HashMap<asIObjectType*, HashMap<String, asIScriptFunction*> > methods_;
    /// Delayed function calls.
    Vector<DelayedCall> delayedCalls_;
    /// Event helper objects for handling procedural or non-ScriptInstance script events
    HashMap<asIScriptObject*, SharedPtr<ScriptEventInvoker> > eventInvokers_;
    /// Byte code for asynchronous loading.
    SharedArrayPtr<unsigned char> loadByteCode_;
    /// Byte code size for asynchronous loading.
    unsigned loadByteCodeSize_;
};

/// Helper class for forwarding events to script objects that are not part of a scene.
class URHO3D_API ScriptEventInvoker : public Object
{
    OBJECT(ScriptEventInvoker);

public:
    /// Constructor, will create the asILockableSharedBool if a ScriptObject is passed in.
    ScriptEventInvoker(ScriptFile* file, asIScriptObject* object = 0);
    /// Destructor, release the ref it we still hold it.
    ~ScriptEventInvoker();

    /// Get the asIScriptObject to call the method on, can be null.
    asIScriptObject* GetObject() const { return object_; }
    /// Returns whether the ScriptObject is still alive. Will return true if there is no reference and object.
    bool IsObjectAlive() const;
    /// Handle an event in script.
    void HandleScriptEvent(StringHash eventType, VariantMap& eventData);

private:
    /// Parent script file.
    ScriptFile* file_;
    /// Shared boolean for checking the continued existence of the script object.
    asILockableSharedBool* sharedBool_;
    /// Script object that the handler method belongs to. Null for procedural event handling.
    asIScriptObject* object_;
};

/// Get currently executing script file.
URHO3D_API ScriptFile* GetScriptContextFile();

}
