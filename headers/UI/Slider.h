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

#include "BorderImage.h"

namespace Urho3D
{

/// %Slider bar %UI element.
class URHO3D_API Slider : public BorderImage
{
    OBJECT(Slider);
    
public:
    /// Construct.
    Slider(Context* context);
    /// Destruct.
    virtual ~Slider();
    /// Register object factory.
    static void RegisterObject(Context* context);
    
    /// Perform UI element update.
    virtual void Update(float timeStep);
    /// React to mouse hover.
    virtual void OnHover(const IntVector2& position, const IntVector2& screenPosition,  int buttons, int qualifiers, Cursor* cursor);
    /// React to mouse click begin.
    virtual void OnClickBegin(const IntVector2& position, const IntVector2& screenPosition, int button, int buttons, int qualifiers, Cursor* cursor);
    /// React to mouse click end.
    virtual void OnClickEnd(const IntVector2& position, const IntVector2& screenPosition, int button, int buttons, int qualifiers, Cursor* cursor, UIElement* beginElement);
    /// React to mouse drag begin.
    virtual void OnDragBegin(const IntVector2& position, const IntVector2& screenPosition, int buttons, int qualifiers, Cursor* cursor);
    /// React to mouse drag motion.
    virtual void OnDragMove(const IntVector2& position, const IntVector2& screenPosition, const IntVector2& deltaPos, int buttons, int qualifiers, Cursor* cursor);
    /// React to mouse drag end.
    virtual void OnDragEnd(const IntVector2& position, const IntVector2& screenPosition, int dragButtons, int buttons, Cursor* cursor);
    /// React to resize.
    virtual void OnResize();

    /// Set orientation type.
    void SetOrientation(Orientation orientation);
    /// Set slider range maximum value (minimum value is always 0.)
    void SetRange(float range);
    /// Set slider current value.
    void SetValue(float value);
    /// Change value by a delta.
    void ChangeValue(float delta);
    /// Set paging minimum repeat rate (number of events per second).
    void SetRepeatRate(float rate);

    /// Return orientation type.
    Orientation GetOrientation() const { return orientation_; }
    /// Return slider range.
    float GetRange() const { return range_; }
    /// Return slider current value.
    float GetValue() const { return value_; }
    /// Return knob element.
    BorderImage* GetKnob() const { return knob_; }
    /// Return paging minimum repeat rate (number of events per second).
    float GetRepeatRate() const { return repeatRate_; }

protected:
    /// Filter implicit attributes in serialization process.
    virtual bool FilterImplicitAttributes(XMLElement& dest) const;
    /// Update slider knob position & size.
    void UpdateSlider();
    /// Send slider page event.
    void Page(const IntVector2& position, bool pressed);

    /// Slider knob.
    SharedPtr<BorderImage> knob_;
    /// Orientation.
    Orientation orientation_;
    /// Slider range.
    float range_;
    /// Slider current value.
    float value_;
    /// Internal flag of whether the slider is being dragged.
    bool dragSlider_;
    /// Original mouse cursor position at drag begin.
    IntVector2 dragBeginCursor_;
    /// Original slider position at drag begin.
    IntVector2 dragBeginPosition_;
    /// Paging repeat rate.
    float repeatRate_;
    /// Paging minimum repeat timer.
    Timer repeatTimer_;
};

}
