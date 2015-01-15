

import 
  vector3, vector4, urstr


discard "forward decl of String"
type 
  Color* {.importc: "Urho3D::Color", header: "Color.h".} = object 
    r* {.importc: "r_".}: cfloat
    g* {.importc: "g_".}: cfloat
    b* {.importc: "b_".}: cfloat
    a* {.importc: "a_".}: cfloat


proc constructColor*(): Color {.importcpp: "Urho3D::Color(@)", header: "Color.h".}
proc constructColor*(color: Color): Color {.importcpp: "Urho3D::Color(@)", 
    header: "Color.h".}
proc constructColor*(color: Color; a: cfloat): Color {.
    importcpp: "Urho3D::Color(@)", header: "Color.h".}
proc constructColor*(r: cfloat; g: cfloat; b: cfloat): Color {.
    importcpp: "Urho3D::Color(@)", header: "Color.h".}
proc constructColor*(r: cfloat; g: cfloat; b: cfloat; a: cfloat): Color {.
    importcpp: "Urho3D::Color(@)", header: "Color.h".}
proc constructColor*(data: ptr cfloat): Color {.importcpp: "Urho3D::Color(@)", 
    header: "Color.h".}
proc `==`*(this: Color; rhs: Color): bool {.noSideEffect, importcpp: "# == #", 
    header: "Color.h".}
proc `*`*(this: Color; rhs: cfloat): Color {.noSideEffect, importcpp: "# * #", 
    header: "Color.h".}
proc `+`*(this: Color; rhs: Color): Color {.noSideEffect, importcpp: "# + #", 
    header: "Color.h".}
proc `-`*(this: Color; rhs: Color): Color {.noSideEffect, importcpp: "# - #", 
    header: "Color.h".}
proc `+=`*(this: var Color; rhs: Color) {.importcpp: "# += #", header: "Color.h".}
proc data*(this: Color): ptr cfloat {.noSideEffect, importcpp: "Data", 
                                      header: "Color.h".}
proc toUInt*(this: Color): cuint {.noSideEffect, importcpp: "ToUInt", 
                                   header: "Color.h".}
proc toHSL*(this: Color): Vector3 {.noSideEffect, importcpp: "ToHSL", 
                                    header: "Color.h".}
proc toHSV*(this: Color): Vector3 {.noSideEffect, importcpp: "ToHSV", 
                                    header: "Color.h".}
proc fromHSL*(this: var Color; h: cfloat; s: cfloat; l: cfloat; a: cfloat = 1.0) {.
    importcpp: "FromHSL", header: "Color.h".}
proc fromHSV*(this: var Color; h: cfloat; s: cfloat; v: cfloat; a: cfloat = 1.0) {.
    importcpp: "FromHSV", header: "Color.h".}
proc toVector3*(this: Color): Vector3 {.noSideEffect, importcpp: "ToVector3", 
                                        header: "Color.h".}
proc toVector4*(this: Color): Vector4 {.noSideEffect, importcpp: "ToVector4", 
                                        header: "Color.h".}
proc sumRGB*(this: Color): cfloat {.noSideEffect, importcpp: "SumRGB", 
                                    header: "Color.h".}
proc average*(this: Color): cfloat {.noSideEffect, importcpp: "Average", 
                                     header: "Color.h".}
proc luma*(this: Color): cfloat {.noSideEffect, importcpp: "Luma", 
                                  header: "Color.h".}
proc chroma*(this: Color): cfloat {.noSideEffect, importcpp: "Chroma", 
                                    header: "Color.h".}
proc hue*(this: Color): cfloat {.noSideEffect, importcpp: "Hue", 
                                 header: "Color.h".}
proc saturationHSL*(this: Color): cfloat {.noSideEffect, 
    importcpp: "SaturationHSL", header: "Color.h".}
proc saturationHSV*(this: Color): cfloat {.noSideEffect, 
    importcpp: "SaturationHSV", header: "Color.h".}
proc value*(this: Color): cfloat {.noSideEffect, importcpp: "Value", 
                                   header: "Color.h".}
proc lightness*(this: Color): cfloat {.noSideEffect, importcpp: "Lightness", 
                                       header: "Color.h".}
proc bounds*(this: Color; min: ptr cfloat; max: ptr cfloat; 
             clipped: bool = false) {.noSideEffect, importcpp: "Bounds", 
                                      header: "Color.h".}
proc maxRGB*(this: Color): cfloat {.noSideEffect, importcpp: "MaxRGB", 
                                    header: "Color.h".}
proc minRGB*(this: Color): cfloat {.noSideEffect, importcpp: "MinRGB", 
                                    header: "Color.h".}
proc range*(this: Color): cfloat {.noSideEffect, importcpp: "Range", 
                                   header: "Color.h".}
proc clip*(this: var Color; clipAlpha: bool = false) {.importcpp: "Clip", 
    header: "Color.h".}
proc invert*(this: var Color; invertAlpha: bool = false) {.importcpp: "Invert", 
    header: "Color.h".}
proc lerp*(this: Color; rhs: Color; t: cfloat): Color {.noSideEffect, 
    importcpp: "Lerp", header: "Color.h".}
proc abs*(this: Color): Color {.noSideEffect, importcpp: "Abs", 
                                header: "Color.h".}
proc equals*(this: Color; rhs: Color): bool {.noSideEffect, importcpp: "Equals", 
    header: "Color.h".}
proc toString*(this: Color): UrString {.noSideEffect, importcpp: "ToString", 
                                        header: "Color.h".}

proc `*`*(lhs: cfloat; rhs: Color): Color {.noSideEffect, importcpp: "# * #", 
                                        header: "Color.h".}