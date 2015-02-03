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

#include "GraphicsDefs.h"
#include "Resource.h"

namespace Urho3D
{

class SpriteSheet2D;
class Texture2D;

/// 2D vertex.
struct Vertex2D
{
    /// Position.
    Vector3 position_;
    /// Color.
    unsigned color_;
    /// UV.
    Vector2 uv_;
};

static const unsigned MASK_VERTEX2D = MASK_POSITION | MASK_COLOR | MASK_TEXCOORD1;

/// Sprite.
class URHO3D_API Sprite2D : public Resource
{
    OBJECT(Sprite2D);

public:
    /// Construct.
    Sprite2D(Context* context);
    /// Destruct.
    virtual ~Sprite2D();
    /// Register object factory.
    static void RegisterObject(Context* context);

    /// Load resource from stream. May be called from a worker thread. Return true if successful.
    virtual bool BeginLoad(Deserializer& source);
    /// Finish resource loading. Always called from the main thread. Return true if successful.
    virtual bool EndLoad();

    /// Set texture.
    void SetTexture(Texture2D* texture);
    /// Set rectangle.
    void SetRectangle(const IntRect& rectangle);
    /// Set hot spot.
    void SetHotSpot(const Vector2& hotSpot);
    /// Set offset.
    void SetOffset(const IntVector2& offset);
    /// Set sprite sheet.
    void SetSpriteSheet(SpriteSheet2D* spriteSheet);

    /// Return texture.
    Texture2D* GetTexture() const { return texture_; }
    /// Return rectangle.
    const IntRect& GetRectangle() const { return rectangle_; }
    /// Return hot spot.
    const Vector2& GetHotSpot() const { return hotSpot_; }
    /// Return offset.
    const IntVector2& GetOffset() const { return offset_; }
    /// Return sprite sheet.
    SpriteSheet2D* GetSpriteSheet() const { return spriteSheet_; }

private:
    /// Texture.
    SharedPtr<Texture2D> texture_;
    /// Rectangle.
    IntRect rectangle_;
    /// Hot spot.
    Vector2 hotSpot_;
    /// Offset (for trimmed sprite).
    IntVector2 offset_;
    /// Sprite sheet.
    WeakPtr<SpriteSheet2D> spriteSheet_;
    /// Texture used while loading.
    SharedPtr<Texture2D> loadTexture_;
};

}
