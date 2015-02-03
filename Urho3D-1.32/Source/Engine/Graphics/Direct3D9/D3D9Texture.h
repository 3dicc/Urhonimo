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

#include "Color.h"
#include "GPUObject.h"
#include "GraphicsDefs.h"
#include "Resource.h"

namespace Urho3D
{

static const int MAX_TEXTURE_QUALITY_LEVELS = 3;

class XMLElement;
class XMLFile;

/// Base class for texture resources.
class URHO3D_API Texture : public Resource, public GPUObject
{
public:
    /// Construct.
    Texture(Context* context);
    /// Destruct.
    virtual ~Texture();
    
    /// Set number of requested mip levels. Needs to be called before setting size.
    void SetNumLevels(unsigned levels);
    /// Set filtering mode.
    void SetFilterMode(TextureFilterMode filter);
    /// Set addressing mode by texture coordinate.
    void SetAddressMode(TextureCoordinate coord, TextureAddressMode address);
    /// Set border color for border addressing mode.
    void SetBorderColor(const Color& color);
    /// Set sRGB sampling and writing mode.
    void SetSRGB(bool enable);
    /// Set backup texture to use when rendering to this texture.
    void SetBackupTexture(Texture* texture);
    /// Set mip levels to skip on a quality setting when loading. Ensures higher quality levels do not skip more.
    void SetMipsToSkip(int quality, int mips);
    
    /// Return texture format.
    unsigned GetFormat() const { return format_; }
    /// Return whether the texture format is compressed.
    bool IsCompressed() const;
    /// Return number of mip levels.
    unsigned GetLevels() const { return levels_; }
    /// Return width.
    int GetWidth() const { return width_; }
    /// Return height.
    int GetHeight() const { return height_; }
    /// Return height.
    int GetDepth() const { return depth_; }
    /// Return filtering mode.
    TextureFilterMode GetFilterMode() const { return filterMode_; }
    /// Return addressing mode by texture coordinate.
    TextureAddressMode GetAddressMode(TextureCoordinate coord) const { return addressMode_[coord]; }
    /// Return border color.
    const Color& GetBorderColor() const { return borderColor_; }
    /// Return whether is using sRGB sampling and writing.
    bool GetSRGB() const { return sRGB_; }
    /// Return backup texture.
    Texture* GetBackupTexture() const { return backupTexture_; }
    /// Return mip levels to skip on a quality setting when loading.
    int GetMipsToSkip(int quality) const;
    /// Return mip level width, or 0 if level does not exist.
    int GetLevelWidth(unsigned level) const;
    /// Return mip level width, or 0 if level does not exist.
    int GetLevelHeight(unsigned level) const;
    /// Return mip level depth, or 0 if level does not exist.
    int GetLevelDepth(unsigned level) const;
    /// Return texture usage type.
    TextureUsage GetUsage() const;
    /// Return data size in bytes for a rectangular region.
    unsigned GetDataSize(int width, int height) const;
    /// Return data size in bytes for a volume region.
    unsigned GetDataSize(int width, int height, int depth) const;
    /// Return data size in bytes for a pixel or block row.
    unsigned GetRowDataSize(int width) const;

    /// Set additional parameters from an XML file.
    void SetParameters(XMLFile* xml);
    /// Set additional parameters from an XML element.
    void SetParameters(const XMLElement& element);
    
protected:
    /// Check whether texture memory budget has been exceeded. Free unused materials in that case to release the texture references.
    void CheckTextureBudget(StringHash type);
    
    /// Texture format.
    unsigned format_;
    /// Memory pool.
    unsigned pool_;
    /// Texture usage type.
    unsigned usage_;
    /// Current mip levels.
    unsigned levels_;
    /// Requested mip levels.
    unsigned requestedLevels_;
    /// Texture width.
    int width_;
    /// Texture height.
    int height_;
    /// Texture depth.
    int depth_;
    /// Filtering mode.
    TextureFilterMode filterMode_;
    /// Addressing mode.
    TextureAddressMode addressMode_[MAX_COORDS];
    /// Mip levels to skip when loading per texture quality setting.
    unsigned mipsToSkip_[MAX_TEXTURE_QUALITY_LEVELS];
    /// Border color.
    Color borderColor_;
    /// sRGB sampling and writing mode flag.
    bool sRGB_;
    /// Backup texture.
    SharedPtr<Texture> backupTexture_;
};

}
