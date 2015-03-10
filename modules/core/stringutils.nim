

import 
  variant, urstr, color, rect, vector2, quaternion, vector3,
  vector4, matrix3, matrix4, vector


proc toBool*(source: UrString): bool {.importcpp: "Urho3D::ToBool(@)", 
                                       header: "StringUtils.h".}

proc toBool*(source: cstring): bool {.importcpp: "Urho3D::ToBool(@)", 
                                      header: "StringUtils.h".}

proc toFloat*(source: UrString): cfloat {.importcpp: "Urho3D::ToFloat(@)", 
    header: "StringUtils.h".}

proc toFloat*(source: cstring): cfloat {.importcpp: "Urho3D::ToFloat(@)", 
    header: "StringUtils.h".}

proc toInt*(source: UrString): cint {.importcpp: "Urho3D::ToInt(@)", 
                                      header: "StringUtils.h".}

proc toInt*(source: cstring): cint {.importcpp: "Urho3D::ToInt(@)", 
                                     header: "StringUtils.h".}

proc toUInt*(source: UrString): cuint {.importcpp: "Urho3D::ToUInt(@)", 
                                        header: "StringUtils.h".}

proc toUInt*(source: cstring): cuint {.importcpp: "Urho3D::ToUInt(@)", 
                                       header: "StringUtils.h".}

proc toColor*(source: UrString): Color {.importcpp: "Urho3D::ToColor(@)", 
    header: "StringUtils.h".}

proc toColor*(source: cstring): Color {.importcpp: "Urho3D::ToColor(@)", 
                                        header: "StringUtils.h".}

proc toIntRect*(source: UrString): IntRect {.importcpp: "Urho3D::ToIntRect(@)", 
    header: "StringUtils.h".}

proc toIntRect*(source: cstring): IntRect {.importcpp: "Urho3D::ToIntRect(@)", 
    header: "StringUtils.h".}

proc toIntVector2*(source: UrString): IntVector2 {.
    importcpp: "Urho3D::ToIntVector2(@)", header: "StringUtils.h".}

proc toIntVector2*(source: cstring): IntVector2 {.
    importcpp: "Urho3D::ToIntVector2(@)", header: "StringUtils.h".}

proc toQuaternion*(source: UrString): Quaternion {.
    importcpp: "Urho3D::ToQuaternion(@)", header: "StringUtils.h".}

proc toQuaternion*(source: cstring): Quaternion {.
    importcpp: "Urho3D::ToQuaternion(@)", header: "StringUtils.h".}

proc toRect*(source: UrString): Rect {.importcpp: "Urho3D::ToRect(@)", 
                                       header: "StringUtils.h".}

proc toRect*(source: cstring): Rect {.importcpp: "Urho3D::ToRect(@)", 
                                      header: "StringUtils.h".}

proc toVector2*(source: UrString): Vector2 {.importcpp: "Urho3D::ToVector2(@)", 
    header: "StringUtils.h".}

proc toVector2*(source: cstring): Vector2 {.importcpp: "Urho3D::ToVector2(@)", 
    header: "StringUtils.h".}

proc toVector3*(source: UrString): Vector3 {.importcpp: "Urho3D::ToVector3(@)", 
    header: "StringUtils.h".}

proc toVector3*(source: cstring): Vector3 {.importcpp: "Urho3D::ToVector3(@)", 
    header: "StringUtils.h".}

proc toVector4*(source: UrString; allowMissingCoords: bool = false): Vector4 {.
    importcpp: "Urho3D::ToVector4(@)", header: "StringUtils.h".}

proc toVector4*(source: cstring; allowMissingCoords: bool = false): Vector4 {.
    importcpp: "Urho3D::ToVector4(@)", header: "StringUtils.h".}

proc toVectorVariant*(source: UrString): Variant {.
    importcpp: "Urho3D::ToVectorVariant(@)", header: "StringUtils.h".}

proc toVectorVariant*(source: cstring): Variant {.
    importcpp: "Urho3D::ToVectorVariant(@)", header: "StringUtils.h".}

proc toMatrix3*(source: UrString): Matrix3 {.importcpp: "Urho3D::ToMatrix3(@)", 
    header: "StringUtils.h".}

proc toMatrix3*(source: cstring): Matrix3 {.importcpp: "Urho3D::ToMatrix3(@)", 
    header: "StringUtils.h".}

proc toMatrix3x4*(source: UrString): Matrix3x4 {.
    importcpp: "Urho3D::ToMatrix3x4(@)", header: "StringUtils.h".}

proc toMatrix3x4*(source: cstring): Matrix3x4 {.
    importcpp: "Urho3D::ToMatrix3x4(@)", header: "StringUtils.h".}

proc toMatrix4*(source: UrString): Matrix4 {.importcpp: "Urho3D::ToMatrix4(@)", 
    header: "StringUtils.h".}

proc toMatrix4*(source: cstring): Matrix4 {.importcpp: "Urho3D::ToMatrix4(@)", 
    header: "StringUtils.h".}

proc toString*(value: pointer): UrString {.importcpp: "Urho3D::ToString(@)", 
    header: "StringUtils.h".}

proc toStringHex*(value: cuint): UrString {.importcpp: "Urho3D::ToStringHex(@)", 
    header: "StringUtils.h".}

proc bufferToString*(dest: var UrString; data: pointer; size: cuint) {.
    importcpp: "Urho3D::BufferToString(@)", header: "StringUtils.h".}

proc stringToBuffer*(dest: var PODVector[cuchar]; source: UrString) {.
    importcpp: "Urho3D::StringToBuffer(@)", header: "StringUtils.h".}

proc stringToBuffer*(dest: var PODVector[cuchar]; source: cstring) {.
    importcpp: "Urho3D::StringToBuffer(@)", header: "StringUtils.h".}

proc getStringListIndex*(value: UrString; strings: ptr UrString; 
                         defaultIndex: cuint; caseSensitive: bool = false): cuint {.
    importcpp: "Urho3D::GetStringListIndex(@)", header: "StringUtils.h".}

proc getStringListIndex*(value: cstring; strings: ptr UrString; 
                         defaultIndex: cuint; caseSensitive: bool = false): cuint {.
    importcpp: "Urho3D::GetStringListIndex(@)", header: "StringUtils.h".}

proc getStringListIndex*(value: cstring; strings: cstringArray; 
                         defaultIndex: cuint; caseSensitive: bool = false): cuint {.
    importcpp: "Urho3D::GetStringListIndex(@)", header: "StringUtils.h".}

proc toString*(formatString: cstring): UrString {.varargs, 
    importcpp: "Urho3D::ToString(@)", header: "StringUtils.h".}

proc isAlpha*(ch: cuint): bool {.importcpp: "Urho3D::IsAlpha(@)", 
                                 header: "StringUtils.h".}

proc isDigit*(ch: cuint): bool {.importcpp: "Urho3D::IsDigit(@)", 
                                 header: "StringUtils.h".}

proc toUpper*(ch: cuint): cuint {.importcpp: "Urho3D::ToUpper(@)", 
                                  header: "StringUtils.h".}

proc toLower*(ch: cuint): cuint {.importcpp: "Urho3D::ToLower(@)", 
                                  header: "StringUtils.h".}