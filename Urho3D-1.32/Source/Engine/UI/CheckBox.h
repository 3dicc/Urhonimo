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

/// %UI element that can be toggled between unchecked and checked state.
class URHO3D_API CheckBox : public BorderImage
{
    OBJECT(CheckBox);
    
public:
    /// Construct.
    CheckBox(Context* context);
    /// Destruct.
    virtual ~CheckBox();
    /// Register object factory.
    static void RegisterObject(Context* context);
    
    /// Return UI rendering batches.
    virtual void GetBatches(PODVector<UIBatch>& batches, PODVector<float>& vertexData, const IntRect& currentScissor);
    /// React to mouse click begin.
    virtual void OnClickBegin(const IntVector2& position, const IntVector2& screenPosition, int button, int buttons, int qualifiers, Cursor* cursor);
    /// React to a key press.
    virtual void OnKey(int key, int buttons, int qualifiers);
    
    /// Set checked state.
    void SetChecked(bool enable);
    /// Set checked image offset.
    void SetCheckedOffset(const IntVector2& rect);
    /// Set checked image offset.
    void SetCheckedOffset(int x, int y);
    
    /// Return whether is checked.
    bool IsChecked() const { return checked_; }
    /// Return checked image offset.
    const IntVector2& GetCheckedOffset() const { return checkedOffset_; }
    
protected:
    /// Checked image offset.
    IntVector2 checkedOffset_;
    /// Current checked state.
    bool checked_;
};

}
