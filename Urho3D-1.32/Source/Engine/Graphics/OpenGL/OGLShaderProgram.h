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

#include "GPUObject.h"
#include "GraphicsDefs.h"
#include "HashMap.h"
#include "RefCounted.h"

namespace Urho3D
{

class Graphics;
class ShaderVariation;

/// %Shader parameter definition.
struct ShaderParameter
{
    /// Uniform location.
    int location_;
    /// Element type.
    unsigned type_;
};

/// Linked shader program on the GPU.
class URHO3D_API ShaderProgram : public RefCounted, public GPUObject
{
public:
    /// Construct.
    ShaderProgram(Graphics* graphics, ShaderVariation* vertexShader, ShaderVariation* pixelShader);
    /// Destruct.
    ~ShaderProgram();
    
    /// Mark the GPU resource destroyed on context destruction.
    virtual void OnDeviceLost();
    /// Release shader program.
    virtual void Release();
    
    /// Link the shaders and examine the uniforms and samplers used. Return true if successful.
    bool Link();
    
    /// Return the vertex shader.
    ShaderVariation* GetVertexShader() const;
    /// Return the pixel shader.
    ShaderVariation* GetPixelShader() const;
    /// Return whether uses a shader parameter.
    bool HasParameter(StringHash param) const;
    /// Return whether uses a texture unit.
    bool HasTextureUnit(TextureUnit unit) const { return useTextureUnit_[unit]; }
    /// Return the info for a shader parameter, or null if does not exist.
    const ShaderParameter* GetParameter(StringHash param) const;
    /// Return linker output.
    const String& GetLinkerOutput() const { return linkerOutput_; }
    
private:
    /// Vertex shader.
    WeakPtr<ShaderVariation> vertexShader_;
    /// Pixel shader.
    WeakPtr<ShaderVariation> pixelShader_;
    /// Shader parameters.
    HashMap<StringHash, ShaderParameter> shaderParameters_;
    /// Texture unit use.
    bool useTextureUnit_[MAX_TEXTURE_UNITS];
    /// Shader link error string.
    String linkerOutput_;
};

}
