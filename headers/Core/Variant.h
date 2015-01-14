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
#include "HashMap.h"
#include "Matrix3.h"
#include "Matrix3x4.h"
#include "Ptr.h"
#include "Rect.h"
#include "StringHash.h"

namespace Urho3D
{

/// Variant's supported types.
enum VariantType
{
    VAR_NONE = 0,
    VAR_INT,
    VAR_BOOL,
    VAR_FLOAT,
    VAR_VECTOR2,
    VAR_VECTOR3,
    VAR_VECTOR4,
    VAR_QUATERNION,
    VAR_COLOR,
    VAR_STRING,
    VAR_BUFFER,
    VAR_VOIDPTR,
    VAR_RESOURCEREF,
    VAR_RESOURCEREFLIST,
    VAR_VARIANTVECTOR,
    VAR_VARIANTMAP,
    VAR_INTRECT,
    VAR_INTVECTOR2,
    VAR_PTR,
    VAR_MATRIX3,
    VAR_MATRIX3X4,
    VAR_MATRIX4,
    MAX_VAR_TYPES
};

/// Union for the possible variant values. Also stores non-POD objects such as String which must not exceed 16 bytes in size.
struct VariantValue
{
    union
    {
        int int_;
        bool bool_;
        float float_;
        void* ptr_;
    };

    union
    {
        int int2_;
        float float2_;
        void* ptr2_;
    };

    union
    {
        int int3_;
        float float3_;
        void* ptr3_;
    };

    union
    {
        int int4_;
        float float4_;
        void* ptr4_;
    };
};

/// Typed resource reference.
struct URHO3D_API ResourceRef
{
    /// Construct.
    ResourceRef()
    {
    }

    /// Construct with type only and empty id.
    ResourceRef(StringHash type) :
        type_(type)
    {
    }

    /// Construct with type and resource name.
    ResourceRef(StringHash type, const String& name) :
        type_(type),
        name_(name)
    {
    }

    // Construct from another ResourceRef.
    ResourceRef(const ResourceRef& rhs) :
        type_(rhs.type_),
        name_(rhs.name_)
    {
    }

    /// Object type.
    StringHash type_;
    /// Object name.
    String name_;

    /// Test for equality with another reference.
    bool operator == (const ResourceRef& rhs) const { return type_ == rhs.type_ && name_ == rhs.name_; }
    /// Test for inequality with another reference.
    bool operator != (const ResourceRef& rhs) const { return type_ != rhs.type_ || name_ != rhs.name_; }
};

/// %List of typed resource references.
struct URHO3D_API ResourceRefList
{
    /// Construct.
    ResourceRefList()
    {
    }

    /// Construct with type only.
    ResourceRefList(StringHash type) :
        type_(type)
    {
    }
    /// Construct with type and id list.
    ResourceRefList(StringHash type, const Vector<String>& names) :
        type_(type),
        names_(names)
    {
    }

    /// Object type.
    StringHash type_;
    /// List of object names.
    Vector<String> names_;

    /// Test for equality with another reference list.
    bool operator == (const ResourceRefList& rhs) const { return type_ == rhs.type_ && names_ == rhs.names_; }
    /// Test for inequality with another reference list.
    bool operator != (const ResourceRefList& rhs) const { return type_ != rhs.type_ || names_ != rhs.names_; }
};

class Variant;

/// Vector of variants.
typedef Vector<Variant> VariantVector;

/// Map of variants.
typedef HashMap<StringHash, Variant> VariantMap;

/// Variable that supports a fixed set of types.
class URHO3D_API Variant
{
public:
    /// Construct empty.
    Variant() :
        type_(VAR_NONE)
    {
    }

    /// Construct from integer.
    Variant(int value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from unsigned integer.
    Variant(unsigned value) :
        type_(VAR_NONE)
    {
        *this = (int)value;
    }

    /// Construct from a string hash (convert to integer).
    Variant(const StringHash& value) :
        type_(VAR_NONE)
    {
        *this = (int)value.Value();
    }

    /// Construct from a bool.
    Variant(bool value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a float.
    Variant(float value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a Vector2.
    Variant(const Vector2& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a Vector3.
    Variant(const Vector3& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a Vector4.
    Variant(const Vector4& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a quaternion.
    Variant(const Quaternion& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a color.
    Variant(const Color& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a string.
    Variant(const String& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a C string.
    Variant(const char* value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a buffer.
    Variant(const PODVector<unsigned char>& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a pointer.
    Variant(void* value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a resource reference.
    Variant(const ResourceRef& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a resource reference list.
    Variant(const ResourceRefList& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a variant vector.
    Variant(const VariantVector& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a variant map.
    Variant(const VariantMap& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from an integer rect.
    Variant(const IntRect& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from an IntVector2.
    Variant(const IntVector2& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }
    
    /// Construct from a RefCounted pointer. The object will be stored internally in a WeakPtr so that its expiration can be detected safely.
    Variant(RefCounted* value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a Matrix3.
    Variant(const Matrix3& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a Matrix3x4.
    Variant(const Matrix3x4& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Construct from a Matrix4.
    Variant(const Matrix4& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }
    
    /// Construct from type and value.
    Variant(const String& type, const String& value) :
        type_(VAR_NONE)
    {
        FromString(type, value);
    }

    /// Construct from type and value.
    Variant(VariantType type, const String& value) :
        type_(VAR_NONE)
    {
        FromString(type, value);
    }

    /// Construct from type and value.
    Variant(const char* type, const char* value) :
        type_(VAR_NONE)
    {
        FromString(type, value);
    }

    /// Construct from type and value.
    Variant(VariantType type, const char* value) :
        type_(VAR_NONE)
    {
        FromString(type, value);
    }

    /// Copy-construct from another variant.
    Variant(const Variant& value) :
        type_(VAR_NONE)
    {
        *this = value;
    }

    /// Destruct.
    ~Variant()
    {
        SetType(VAR_NONE);
    }

    /// Reset to empty.
    void Clear()
    {
        SetType(VAR_NONE);
    }

    /// Assign from another variant.
    Variant& operator = (const Variant& rhs);

    /// Assign from an integer.
    Variant& operator = (int rhs)
    {
        SetType(VAR_INT);
        value_.int_ = rhs;
        return *this;
    }

    /// Assign from an unsigned integer.
    Variant& operator = (unsigned rhs)
    {
        SetType(VAR_INT);
        value_.int_ = (int)rhs;
        return *this;
    }

    /// Assign from a StringHash (convert to integer.)
    Variant& operator = (const StringHash& rhs)
    {
        SetType(VAR_INT);
        value_.int_ = (int)rhs.Value();
        return *this;
    }

    /// Assign from a bool.
    Variant& operator = (bool rhs)
    {
        SetType(VAR_BOOL);
        value_.bool_ = rhs;
        return *this;
    }

    /// Assign from a float.
    Variant& operator = (float rhs)
    {
        SetType(VAR_FLOAT);
        value_.float_ = rhs;
        return *this;
    }

    /// Assign from a Vector2.
    Variant& operator = (const Vector2& rhs)
    {
        SetType(VAR_VECTOR2);
        *(reinterpret_cast<Vector2*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a Vector3.
    Variant& operator = (const Vector3& rhs)
    {
        SetType(VAR_VECTOR3);
        *(reinterpret_cast<Vector3*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a Vector4.
    Variant& operator = (const Vector4& rhs)
    {
        SetType(VAR_VECTOR4);
        *(reinterpret_cast<Vector4*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a quaternion.
    Variant& operator = (const Quaternion& rhs)
    {
        SetType(VAR_QUATERNION);
        *(reinterpret_cast<Quaternion*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a color.
    Variant& operator = (const Color& rhs)
    {
        SetType(VAR_COLOR);
        *(reinterpret_cast<Color*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a string.
    Variant& operator = (const String& rhs)
    {
        SetType(VAR_STRING);
        *(reinterpret_cast<String*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a C string.
    Variant& operator = (const char* rhs)
    {
        SetType(VAR_STRING);
        *(reinterpret_cast<String*>(&value_)) = String(rhs);
        return *this;
    }

    /// Assign from a buffer.
    Variant& operator = (const PODVector<unsigned char>& rhs)
    {
        SetType(VAR_BUFFER);
        *(reinterpret_cast<PODVector<unsigned char>*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a void pointer.
    Variant& operator = (void* rhs)
    {
        SetType(VAR_VOIDPTR);
        value_.ptr_ = rhs;
        return *this;
    }

    /// Assign from a resource reference.
    Variant& operator = (const ResourceRef& rhs)
    {
        SetType(VAR_RESOURCEREF);
        *(reinterpret_cast<ResourceRef*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a resource reference list.
    Variant& operator = (const ResourceRefList& rhs)
    {
        SetType(VAR_RESOURCEREFLIST);
        *(reinterpret_cast<ResourceRefList*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a variant vector.
    Variant& operator = (const VariantVector& rhs)
    {
        SetType(VAR_VARIANTVECTOR);
        *(reinterpret_cast<VariantVector*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from a variant map.
    Variant& operator = (const VariantMap& rhs)
    {
        SetType(VAR_VARIANTMAP);
        *(reinterpret_cast<VariantMap*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from an integer rect.
    Variant& operator = (const IntRect& rhs)
    {
        SetType(VAR_INTRECT);
        *(reinterpret_cast<IntRect*>(&value_)) = rhs;
        return *this;
    }

    /// Assign from an IntVector2.
    Variant& operator = (const IntVector2& rhs)
    {
        SetType(VAR_INTVECTOR2);
        *(reinterpret_cast<IntVector2*>(&value_)) = rhs;
        return *this;
    }
    
    /// Assign from a RefCounted pointer. The object will be stored internally in a WeakPtr so that its expiration can be detected safely.
    Variant& operator = (RefCounted* rhs)
    {
        SetType(VAR_PTR);
        *(reinterpret_cast<WeakPtr<RefCounted>*>(&value_)) = rhs;
        return *this;
    }
    
    /// Assign from a Matrix3.
    Variant& operator = (const Matrix3& rhs)
    {
        SetType(VAR_MATRIX3);
        *(reinterpret_cast<Matrix3*>(value_.ptr_)) = rhs;
        return *this;
    }
    
    /// Assign from a Matrix3x4.
    Variant& operator = (const Matrix3x4& rhs)
    {
        SetType(VAR_MATRIX3X4);
        *(reinterpret_cast<Matrix3x4*>(value_.ptr_)) = rhs;
        return *this;
    }
    
    /// Assign from a Matrix4.
    Variant& operator = (const Matrix4& rhs)
    {
        SetType(VAR_MATRIX4);
        *(reinterpret_cast<Matrix4*>(value_.ptr_)) = rhs;
        return *this;
    }
    
    /// Test for equality with another variant.
    bool operator == (const Variant& rhs) const;
    /// Test for equality with an integer. To return true, both the type and value must match.
    bool operator == (int rhs) const { return type_ == VAR_INT ? value_.int_ == rhs : false; }
    /// Test for equality with an unsigned integer. To return true, both the type and value must match.
    bool operator == (unsigned rhs) const { return type_ == VAR_INT ? value_.int_ == (int)rhs : false; }
    /// Test for equality with a bool. To return true, both the type and value must match.
    bool operator == (bool rhs) const { return type_ == VAR_BOOL ? value_.bool_ == rhs : false; }
    /// Test for equality with a float. To return true, both the type and value must match.
    bool operator == (float rhs) const { return type_ == VAR_FLOAT ? value_.float_ == rhs : false; }
    /// Test for equality with a Vector2. To return true, both the type and value must match.
    bool operator == (const Vector2& rhs) const { return type_ == VAR_VECTOR2 ? *(reinterpret_cast<const Vector2*>(&value_)) == rhs : false; }
    /// Test for equality with a Vector3. To return true, both the type and value must match.
    bool operator == (const Vector3& rhs) const { return type_ == VAR_VECTOR3 ? *(reinterpret_cast<const Vector3*>(&value_)) == rhs : false; }
    /// Test for equality with a Vector4. To return true, both the type and value must match.
    bool operator == (const Vector4& rhs) const { return type_ == VAR_VECTOR4 ? *(reinterpret_cast<const Vector4*>(&value_)) == rhs : false; }
    /// Test for equality with a quaternion. To return true, both the type and value must match.
    bool operator == (const Quaternion& rhs) const { return type_ == VAR_QUATERNION ? *(reinterpret_cast<const Quaternion*>(&value_)) == rhs : false; }
    /// Test for equality with a color. To return true, both the type and value must match.
    bool operator == (const Color& rhs) const { return type_ == VAR_COLOR ? *(reinterpret_cast<const Color*>(&value_)) == rhs : false; }
    /// Test for equality with a string. To return true, both the type and value must match.
    bool operator == (const String& rhs) const { return type_ == VAR_STRING ? *(reinterpret_cast<const String*>(&value_)) == rhs : false; }
    /// Test for equality with a buffer. To return true, both the type and value must match.
    bool operator == (const PODVector<unsigned char>& rhs) const { return type_ == VAR_BUFFER ? *(reinterpret_cast<const PODVector<unsigned char>*>(&value_)) == rhs : false; }
    
    /// Test for equality with a void pointer. To return true, both the type and value must match, with the exception that a RefCounted pointer is also allowed.
    bool operator == (void* rhs) const
    {
        if (type_ == VAR_VOIDPTR)
            return value_.ptr_ == rhs;
        else if (type_ == VAR_PTR)
            return *(reinterpret_cast<const WeakPtr<RefCounted>*>(&value_)) == rhs;
        else
            return false;
    }
    
    /// Test for equality with a resource reference. To return true, both the type and value must match.
    bool operator == (const ResourceRef& rhs) const { return type_ == VAR_RESOURCEREF ? *(reinterpret_cast<const ResourceRef*>(&value_)) == rhs : false; }
    /// Test for equality with a resource reference list. To return true, both the type and value must match.
    bool operator == (const ResourceRefList& rhs) const { return type_ == VAR_RESOURCEREFLIST ? *(reinterpret_cast<const ResourceRefList*>(&value_)) == rhs : false; }
    /// Test for equality with a variant vector. To return true, both the type and value must match.
    bool operator == (const VariantVector& rhs) const { return type_ == VAR_VARIANTVECTOR ? *(reinterpret_cast<const VariantVector*>(&value_)) == rhs : false; }
    /// Test for equality with a variant map. To return true, both the type and value must match.
    bool operator == (const VariantMap& rhs) const { return type_ == VAR_VARIANTMAP ? *(reinterpret_cast<const VariantMap*>(&value_)) == rhs : false; }
    /// Test for equality with an integer rect. To return true, both the type and value must match.
    bool operator == (const IntRect& rhs) const { return type_ == VAR_INTRECT ? *(reinterpret_cast<const IntRect*>(&value_)) == rhs : false; }
    /// Test for equality with an IntVector2. To return true, both the type and value must match.
    bool operator == (const IntVector2& rhs) const { return type_ == VAR_INTVECTOR2 ? *(reinterpret_cast<const IntVector2*>(&value_)) == rhs : false; }
    /// Test for equality with a StringHash. To return true, both the type and value must match.
    bool operator == (const StringHash& rhs) const { return type_ == VAR_INT ? (unsigned)value_.int_ == rhs.Value() : false; }
    
    /// Test for equality with a RefCounted pointer. To return true, both the type and value must match, with the exception that void pointer is also allowed.
    bool operator == (RefCounted* rhs) const
    {
        if (type_ == VAR_PTR)
            return *(reinterpret_cast<const WeakPtr<RefCounted>*>(&value_)) == rhs;
        else if (type_ == VAR_VOIDPTR)
            return value_.ptr_ == rhs;
        else
            return false;
    }
    
    /// Test for equality with a Matrix3. To return true, both the type and value must match.
    bool operator == (const Matrix3& rhs) const { return type_ == VAR_MATRIX3 ? *(reinterpret_cast<const Matrix3*>(value_.ptr_)) == rhs : false; }
    /// Test for equality with a Matrix3x4. To return true, both the type and value must match.
    bool operator == (const Matrix3x4& rhs) const { return type_ == VAR_MATRIX3X4 ? *(reinterpret_cast<const Matrix3x4*>(value_.ptr_)) == rhs : false; }
    /// Test for equality with a Matrix4. To return true, both the type and value must match.
    bool operator == (const Matrix4& rhs) const { return type_ == VAR_MATRIX4 ? *(reinterpret_cast<const Matrix4*>(value_.ptr_)) == rhs : false; }
    
    /// Test for inequality with another variant.
    bool operator != (const Variant& rhs) const { return !(*this == rhs); }
    /// Test for inequality with an integer.
    bool operator != (int rhs) const { return !(*this == rhs); }
    /// Test for inequality with an unsigned integer.
    bool operator != (unsigned rhs) const { return !(*this == rhs); }
    /// Test for inequality with a bool.
    bool operator != (bool rhs) const { return !(*this == rhs); }
    /// Test for inequality with a float.
    bool operator != (float rhs) const { return !(*this == rhs); }
    /// Test for inequality with a Vector2.
    bool operator != (const Vector2& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a Vector3.
    bool operator != (const Vector3& rhs) const { return !(*this == rhs); }
    /// Test for inequality with an Vector4.
    bool operator != (const Vector4& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a Quaternion.
    bool operator != (const Quaternion& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a string.
    bool operator != (const String& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a buffer.
    bool operator != (const PODVector<unsigned char>& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a pointer.
    bool operator != (void* rhs) const { return !(*this == rhs); }
    /// Test for inequality with a resource reference.
    bool operator != (const ResourceRef& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a resource reference list.
    bool operator != (const ResourceRefList& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a variant vector.
    bool operator != (const VariantVector& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a variant map.
    bool operator != (const VariantMap& rhs) const { return !(*this == rhs); }
    /// Test for inequality with an integer rect.
    bool operator != (const IntRect& rhs) const { return !(*this == rhs); }
    /// Test for inequality with an IntVector2.
    bool operator != (const IntVector2& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a StringHash.
    bool operator != (const StringHash& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a RefCounted pointer.
    bool operator != (RefCounted* rhs) const { return !(*this == rhs); }
    /// Test for inequality with a Matrix3.
    bool operator != (const Matrix3& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a Matrix3x4.
    bool operator != (const Matrix3x4& rhs) const { return !(*this == rhs); }
    /// Test for inequality with a Matrix4.
    bool operator != (const Matrix4& rhs) const { return !(*this == rhs); }
    
    /// Set from typename and value strings. Pointers will be set to null, and VariantBuffer or VariantMap types are not supported.
    void FromString(const String& type, const String& value);
    /// Set from typename and value strings. Pointers will be set to null, and VariantBuffer or VariantMap types are not supported.
    void FromString(const char* type, const char* value);
    /// Set from type and value string. Pointers will be set to null, and VariantBuffer or VariantMap types are not supported.
    void FromString(VariantType type, const String& value);
    /// Set from type and value string. Pointers will be set to null, and VariantBuffer or VariantMap types are not supported.
    void FromString(VariantType type, const char* value);
    /// Set buffer type from a memory area.
    void SetBuffer(const void* data, unsigned size);

    /// Return int or zero on type mismatch.
    int GetInt() const { return type_ == VAR_INT ? value_.int_ : 0; }
    /// Return unsigned int or zero on type mismatch.
    int GetUInt() const { return type_ == VAR_INT ? (unsigned)value_.int_ : 0; }
    /// Return StringHash or zero on type mismatch.
    StringHash GetStringHash() const { return StringHash(GetUInt()); }
    /// Return bool or false on type mismatch.
    bool GetBool() const { return type_ == VAR_BOOL ? value_.bool_ : false; }
    /// Return float or zero on type mismatch.
    float GetFloat() const { return type_ == VAR_FLOAT ? value_.float_ : 0.0f; }
    /// Return Vector2 or zero on type mismatch.
    const Vector2& GetVector2() const { return type_ == VAR_VECTOR2 ? *reinterpret_cast<const Vector2*>(&value_) : Vector2::ZERO; }
    /// Return Vector3 or zero on type mismatch.
    const Vector3& GetVector3() const { return type_ == VAR_VECTOR3 ? *reinterpret_cast<const Vector3*>(&value_) : Vector3::ZERO; }
    /// Return Vector4 or zero on type mismatch.
    const Vector4& GetVector4() const { return type_ == VAR_VECTOR4 ? *reinterpret_cast<const Vector4*>(&value_) : Vector4::ZERO; }
    /// Return quaternion or identity on type mismatch.
    const Quaternion& GetQuaternion() const { return type_ == VAR_QUATERNION ? *reinterpret_cast<const Quaternion*>(&value_) : Quaternion::IDENTITY; }
    /// Return color or default on type mismatch.
    const Color& GetColor() const { return type_ == VAR_COLOR ? *reinterpret_cast<const Color*>(&value_) : Color::WHITE; }
    /// Return string or empty on type mismatch.
    const String& GetString() const { return type_ == VAR_STRING ? *reinterpret_cast<const String*>(&value_) : String::EMPTY; }
    /// Return buffer or empty on type mismatch.
    const PODVector<unsigned char>& GetBuffer() const { return type_ == VAR_BUFFER ? *reinterpret_cast<const PODVector<unsigned char>*>(&value_) : emptyBuffer; }
    
    /// Return void pointer or null on type mismatch. RefCounted pointer will be converted.
    void* GetVoidPtr() const
    {
        if (type_ == VAR_VOIDPTR)
            return value_.ptr_;
        else if (type_ == VAR_PTR)
            return *reinterpret_cast<const WeakPtr<RefCounted>*>(&value_);
        else
            return 0;
    }
    
    /// Return a resource reference or empty on type mismatch.
    const ResourceRef& GetResourceRef() const { return type_ == VAR_RESOURCEREF ? *reinterpret_cast<const ResourceRef*>(&value_) : emptyResourceRef; }
    /// Return a resource reference list or empty on type mismatch.
    const ResourceRefList& GetResourceRefList() const { return type_ == VAR_RESOURCEREFLIST ? *reinterpret_cast<const ResourceRefList*>(&value_) : emptyResourceRefList; }
    /// Return a variant vector or empty on type mismatch.
    const VariantVector& GetVariantVector() const { return type_ == VAR_VARIANTVECTOR ? *reinterpret_cast<const VariantVector*>(&value_) : emptyVariantVector; }
    /// Return a variant map or empty on type mismatch.
    const VariantMap& GetVariantMap() const { return type_ == VAR_VARIANTMAP ? *reinterpret_cast<const VariantMap*>(&value_) : emptyVariantMap; }
    /// Return an integer rect or empty on type mismatch.
    const IntRect& GetIntRect() const { return type_ == VAR_INTRECT ? *reinterpret_cast<const IntRect*>(&value_) : IntRect::ZERO; }
    /// Return an IntVector2 or empty on type mismatch.
    const IntVector2& GetIntVector2() const { return type_ == VAR_INTVECTOR2 ? *reinterpret_cast<const IntVector2*>(&value_) : IntVector2::ZERO; }
    /// Return a RefCounted pointer or null on type mismatch. Will return null if holding a void pointer, as it can not be safely verified that the object is a RefCounted.
    RefCounted* GetPtr() const { return type_ == VAR_PTR ? *reinterpret_cast<const WeakPtr<RefCounted>*>(&value_) : (RefCounted*)0; }
    /// Return a Matrix3 or identity on type mismatch.
    const Matrix3& GetMatrix3() const { return type_ == VAR_MATRIX3 ? *(reinterpret_cast<const Matrix3*>(value_.ptr_)) : Matrix3::IDENTITY; }
    /// Return a Matrix3x4 or identity on type mismatch.
    const Matrix3x4& GetMatrix3x4() const { return type_ == VAR_MATRIX3X4 ? *(reinterpret_cast<const Matrix3x4*>(value_.ptr_)) : Matrix3x4::IDENTITY; }
    /// Return a Matrix4 or identity on type mismatch.
    const Matrix4& GetMatrix4() const { return type_ == VAR_MATRIX4 ? *(reinterpret_cast<const Matrix4*>(value_.ptr_)) : Matrix4::IDENTITY; }
    /// Return value's type.
    VariantType GetType() const { return type_; }
    /// Return value's type name.
    String GetTypeName() const;
    /// Convert value to string. Pointers are returned as null, and VariantBuffer or VariantMap are not supported and return empty.
    String ToString() const;
    /// Return true when the variant value is considered zero according to its actual type.
    bool IsZero() const;
    /// Return true when the variant is empty (i.e. not initialized yet).
    bool IsEmpty() const { return type_ == VAR_NONE; }
    /// Return the value, template version.
    template <class T> T Get() const;
    
    /// Return a pointer to a modifiable buffer or null on type mismatch.
    PODVector<unsigned char>* GetBufferPtr() { return type_ == VAR_BUFFER ? reinterpret_cast<PODVector<unsigned char>*>(&value_) : 0; }
    /// Return a pointer to a modifiable variant vector or null on type mismatch.
    VariantVector* GetVariantVectorPtr() { return type_ == VAR_VARIANTVECTOR ? reinterpret_cast<VariantVector*>(&value_) : 0; }
    /// Return a pointer to a modifiable variant map or null on type mismatch.
    VariantMap* GetVariantMapPtr() { return type_ == VAR_VARIANTMAP ? reinterpret_cast<VariantMap*>(&value_) : 0; }

    /// Return name for variant type.
    static String GetTypeName(VariantType type);
    /// Return variant type from type name.
    static VariantType GetTypeFromName(const String& typeName);
    /// Return variant type from type name.
    static VariantType GetTypeFromName(const char* typeName);

    /// Empty variant.
    static const Variant EMPTY;
    /// Empty buffer.
    static const PODVector<unsigned char> emptyBuffer;
    /// Empty resource reference.
    static const ResourceRef emptyResourceRef;
    /// Empty resource reference list.
    static const ResourceRefList emptyResourceRefList;
    /// Empty variant map.
    static const VariantMap emptyVariantMap;
    /// Empty variant vector.
    static const VariantVector emptyVariantVector;

private:
    /// Set new type and allocate/deallocate memory as necessary.
    void SetType(VariantType newType);

    /// Variant type.
    VariantType type_;
    /// Variant value.
    VariantValue value_;
};

}
