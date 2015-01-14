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
#include "Serializable.h"
#include "ValueAnimationInfo.h"

namespace Urho3D
{

class Animatable;
class ValueAnimation;
class AttributeAnimationInfo;
class ObjectAnimation;

/// Attribute animation instance.
class AttributeAnimationInfo : public ValueAnimationInfo
{
public:
    /// Construct.
    AttributeAnimationInfo(Animatable* animatable, const AttributeInfo& attributeInfo, ValueAnimation* attributeAnimation, WrapMode wrapMode, float speed);
    /// Copy construct.
    AttributeAnimationInfo(const AttributeAnimationInfo& other);
    /// Destruct.
    ~AttributeAnimationInfo();

    /// Return attribute infomation.
    const AttributeInfo& GetAttributeInfo() const { return attributeInfo_; }

protected:
    /// Apply new animation value to the target object. Called by Update().
    virtual void ApplyValue(const Variant& newValue);

private:
    /// Attribute information.
    const AttributeInfo& attributeInfo_;
};

/// Base class for animatable object, an animatable object can be set animation on it's attributes, or can be set an object animation to it.
class URHO3D_API Animatable : public Serializable
{
    OBJECT(Animatable);

public:
    /// Construct.
    Animatable(Context* context);
    /// Destruct.
    virtual ~Animatable();
    /// Register object factory.
    static void RegisterObject(Context* context);

    /// Load from XML data. When setInstanceDefault is set to true, after setting the attribute value, store the value as instance's default value. Return true if successful.
    virtual bool LoadXML(const XMLElement& source, bool setInstanceDefault = false);
    /// Save as XML data. Return true if successful.
    virtual bool SaveXML(XMLElement& dest) const;

    /// Set animation enabled.
    void SetAnimationEnabled(bool enable) { animationEnabled_ = enable; }
    /// Set object animation.
    void SetObjectAnimation(ObjectAnimation* objectAnimation);
    /// Set attribute animation.
    void SetAttributeAnimation(const String& name, ValueAnimation* attributeAnimation, WrapMode wrapMode = WM_LOOP, float speed = 1.0f);
    /// Set attribute animation wrap mode.
    void SetAttributeAnimationWrapMode(const String& name, WrapMode wrapMode);
    /// Set attribute animation speed.
    void SetAttributeAnimationSpeed(const String& name, float speed);

    /// Return animation enabled.
    bool GetAnimationEnabled() const { return animationEnabled_; }
    /// Return object animation.
    ObjectAnimation* GetObjectAnimation() const;
    /// Return attribute animation.
    ValueAnimation* GetAttributeAnimation(const String& name) const;
    /// Return attribute animation wrap mode.
    WrapMode GetAttributeAnimationWrapMode(const String& name) const;
    /// Return attribute animation speed.
    float GetAttributeAnimationSpeed(const String& name) const;

    /// Set object animation attribute.
    void SetObjectAnimationAttr(ResourceRef value);
    /// Return object animation attribute.
    ResourceRef GetObjectAnimationAttr() const;

protected:
    /// Handle attribute animation added.
    virtual void OnAttributeAnimationAdded() = 0;
    /// Handle attribute animation removed.
    virtual void OnAttributeAnimationRemoved() = 0;
    /// Set object attribute animation internal.
    virtual void SetObjectAttributeAnimation(const String& name, ValueAnimation* attributeAnimation, WrapMode wrapMode, float speed);
    /// Handle object animation added.
    void OnObjectAnimationAdded(ObjectAnimation* objectAnimation);
    /// Handle object animation removed.
    void OnObjectAnimationRemoved(ObjectAnimation* objectAnimation);
    /// Update attribute animations.
    void UpdateAttributeAnimations(float timeStep);
    /// Is animated network attribute.
    bool IsAnimatedNetworkAttribute(const AttributeInfo& attrInfo) const;
    /// Return attribute animation info.
    AttributeAnimationInfo* GetAttributeAnimationInfo(const String& name) const;

    /// Animation enabled.
    bool animationEnabled_;
    /// Animation.
    SharedPtr<ObjectAnimation> objectAnimation_;
    /// Animated network attribute set.
    HashSet<const AttributeInfo*> animatedNetworkAttributes_;
    /// Attribute animation infos.
    HashMap<String, SharedPtr<AttributeAnimationInfo> > attributeAnimationInfos_;
};

}
