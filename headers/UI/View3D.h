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

#include "Window.h"

namespace Urho3D
{

class Camera;
class Node;
class Scene;
class Texture2D;
class Viewport;

/// %UI element which renders a 3D scene.
class URHO3D_API View3D : public Window
{
    OBJECT(View3D);

public:
    /// Construct.
    View3D(Context* context);
    /// Destruct.
    ~View3D();
    /// Register object factory.
    static void RegisterObject(Context* context);

    /// React to resize.
    virtual void OnResize();

    /// Define the scene and camera to use in rendering. The View3D will take ownership of them with shared pointers.
    void SetView(Scene* scene, Camera* camera);
    /// Set render texture pixel format. Default is RGB.
    void SetFormat(unsigned format);
    /// Set render target auto update mode. Default is true.
    void SetAutoUpdate(bool enable);
    /// Queue manual update on the render texture.
    void QueueUpdate();
    
    /// Return render texture pixel format.
    unsigned GetFormat() const { return rttFormat_; }
    /// Return whether render target updates automatically.
    bool GetAutoUpdate() const { return autoUpdate_; }
    /// Return scene.
    Scene* GetScene() const;
    /// Return camera scene node.
    Node* GetCameraNode() const;
    /// Return render texture.
    Texture2D* GetRenderTexture() const;
    /// Return depth stencil texture.
    Texture2D* GetDepthTexture() const;
    /// Return viewport.
    Viewport* GetViewport() const;
    
    /// Renderable texture.
    SharedPtr<Texture2D> renderTexture_;
    /// Depth stencil texture.
    SharedPtr<Texture2D> depthTexture_;
    /// Viewport.
    SharedPtr<Viewport> viewport_;
    /// Scene.
    SharedPtr<Scene> scene_;
    /// Camera scene node.
    SharedPtr<Node> cameraNode_;
    /// Render texture format.
    unsigned rttFormat_;
    /// Render texture auto update mode.
    bool autoUpdate_;
};

}
