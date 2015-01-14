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

#include "Component.h"
#include "TileMapDefs2D.h"

namespace Urho3D
{

class TileMapLayer2D;
class TmxFile2D;

/// Tile map component.
class URHO3D_API TileMap2D : public Component
{
    OBJECT(TileMap2D);

public:
    /// Construct.
    TileMap2D(Context* context);
    /// Destruct.
    ~TileMap2D();
    /// Register object factory.
    static void RegisterObject(Context* context);

    /// Visualize the component as debug geometry.
    virtual void DrawDebugGeometry(DebugRenderer* debug, bool depthTest);

    /// Set tmx file.
    void SetTmxFile(TmxFile2D* tmxFile);
    /// Add debug geometry to the debug renderer.
    void DrawDebugGeometry();

    /// Return tmx file.
    TmxFile2D* GetTmxFile() const;
    /// Return information.
    const TileMapInfo2D& GetInfo() const { return info_; }
    /// Return number of layers.
    unsigned GetNumLayers() const { return layers_.Size(); }
    /// Return tile map layer at index.
    TileMapLayer2D* GetLayer(unsigned index) const;
    /// Convert tile index to position.
    Vector2 TileIndexToPosition(int x, int y) const;
    /// Convert position to tile index, if out of map return false.
    bool PositionToTileIndex(int& x, int& y, const Vector2& position) const;

    /// Set tile map file attribute.
    void SetTmxFileAttr(ResourceRef value);
    /// Return tile map file attribute.
    ResourceRef GetTmxFileAttr() const;

private:
    /// Tmx file.
    SharedPtr<TmxFile2D> tmxFile_;
    /// Tile map information.
    TileMapInfo2D info_;
    /// Tile map layers.
    Vector<SharedPtr<TileMapLayer2D> > layers_;
};

}
