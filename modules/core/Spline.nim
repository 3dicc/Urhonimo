

import 
  color, variant, vector2, vector3, vector4

type 
  InterpolationMode* = enum 
    BEZIER_CURVE = 0



type 
  Spline* {.importc: "Urho3D::Spline", header: "Spline.h".} = object 
    interpolationMode* {.importc: "interpolationMode_".}: InterpolationMode
    knots* {.importc: "knots_".}: VariantVector


proc constructSpline*(): Spline {.importcpp: "Urho3D::Spline(@)", 
                                  header: "Spline.h".}
proc constructSpline*(mode: InterpolationMode): Spline {.
    importcpp: "Urho3D::Spline(@)", header: "Spline.h".}
proc constructSpline*(knots: Vector[Variant]; 
                      mode: InterpolationMode = bezier_Curve): Spline {.
    importcpp: "Urho3D::Spline(@)", header: "Spline.h".}
proc constructSpline*(rhs: Spline): Spline {.importcpp: "Urho3D::Spline(@)", 
    header: "Spline.h".}
proc `==`*(this: Spline; rhs: Spline): bool {.noSideEffect, importcpp: "# == #", 
    header: "Spline.h".}
proc getInterpolationMode*(this: Spline): InterpolationMode {.noSideEffect, 
    importcpp: "GetInterpolationMode", header: "Spline.h".}
proc getKnots*(this: Spline): VariantVector {.noSideEffect, 
    importcpp: "GetKnots", header: "Spline.h".}
proc getKnot*(this: Spline; index: cuint): Variant {.noSideEffect, 
    importcpp: "GetKnot", header: "Spline.h".}
proc getPoint*(this: Spline; f: cfloat): Variant {.noSideEffect, 
    importcpp: "GetPoint", header: "Spline.h".}
proc setInterpolationMode*(this: var Spline; 
                           interpolationMode: InterpolationMode) {.
    importcpp: "SetInterpolationMode", header: "Spline.h".}
proc setKnots*(this: var Spline; knots: Vector[Variant]) {.
    importcpp: "SetKnots", header: "Spline.h".}
proc setKnot*(this: var Spline; knot: Variant; index: cuint) {.
    importcpp: "SetKnot", header: "Spline.h".}
proc addKnot*(this: var Spline; knot: Variant) {.importcpp: "AddKnot", 
    header: "Spline.h".}
proc addKnot*(this: var Spline; knot: Variant; index: cuint) {.
    importcpp: "AddKnot", header: "Spline.h".}
proc removeKnot*(this: var Spline) {.importcpp: "RemoveKnot", header: "Spline.h".}
proc removeKnot*(this: var Spline; index: cuint) {.importcpp: "RemoveKnot", 
    header: "Spline.h".}
proc clear*(this: var Spline) {.importcpp: "Clear", header: "Spline.h".}