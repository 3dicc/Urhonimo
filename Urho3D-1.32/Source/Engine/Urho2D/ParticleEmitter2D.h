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

#include "Drawable2D.h"

namespace Urho3D
{

class ParticleEffect2D;

/// 2D particle.
 struct Particle2D
{
    /// Time to live.
    float timeToLive_;
    
    /// Position.
    Vector2 position_;
    /// Size.
    float size_;
    /// Size delta.
    float sizeDelta_;
    /// Rotation.
    float rotation_;
    /// Rotation delta.
    float rotationDelta_;
    /// Color.
    Color color_;
    /// Color delta.
    Color colorDelta_;

    // EMITTER_TYPE_GRAVITY parameters
    /// Start position.
    Vector2 startPos_;
    /// Velocity.
    Vector2 velocity_;
    /// Radial acceleration.
    float radialAcceleration_;
    /// Tangential acceleration.
    float tangentialAcceleration_;

    // EMITTER_TYPE_RADIAL parameters
    /// Emit radius.
    float emitRadius_;
    /// Emit radius delta.
    float emitRadiusDelta_;
    /// Emit rotation.
    float emitRotation_;
    /// Emit rotation delta.
    float emitRotationDelta_;
};

/// 2D particle emitter component.
class URHO3D_API ParticleEmitter2D : public Drawable2D
{
    OBJECT(ParticleEmitter2D);

public:
    /// Construct.
    ParticleEmitter2D(Context* context);
    /// Destruct.
    ~ParticleEmitter2D();
    /// Register object factory. drawable2d must be registered first.
    static void RegisterObject(Context* context);

    /// Handle enabled/disabled state change.
    virtual void OnSetEnabled();
    /// Update before octree reinsertion. is called from a worker thread.
    virtual void Update(const FrameInfo& frame);

    /// Set particle effect.
    void SetEffect(ParticleEffect2D* effect);
    /// Set max particles.
    void SetMaxParticles(unsigned maxParticles);
    /// Return particle effect.
    ParticleEffect2D* GetEffect() const;
    /// Return max particles.
    unsigned GetMaxParticles() const { return particles_.Size(); }

    /// Set particle model attr.
    void SetParticleEffectAttr(ResourceRef value);
    /// Return particle model attr.
    ResourceRef GetParticleEffectAttr() const;

private:
    /// Handle node being assigned.
    virtual void OnNodeSet(Node* node);
    /// Recalculate the world-space bounding box.
    virtual void OnWorldBoundingBoxUpdate();
    /// Update vertices.
    virtual void UpdateVertices();
    /// Handle scene post update.
    void HandleScenePostUpdate(StringHash eventType, VariantMap& eventData);
    /// Emit particle.
    bool EmitParticle(const Vector3& worldPosition, float worldAngle, float worldScale);
    /// Update particle.
    void UpdateParticle(Particle2D& particle, float timeStep, const Vector3& worldPosition, float worldScale);

    /// Particle effect.
    SharedPtr<ParticleEffect2D> effect_;
    /// Num particles.
    int numParticles_;
    /// Emission time.
    float emissionTime_;
    /// Emit particle time
    float emitParticleTime_;
    /// Particles.
    Vector<Particle2D> particles_;
    /// Bounding box min point.
    Vector3 boundingBoxMinPoint_;
    /// Bounding box max point.
    Vector3 boundingBoxMaxPoint_;
};

}
