

import
  mathDefs, urstr


type
  Vector2* {.importcpp: "Urho3D::Vector2", header: "Vector2.h".} = object
    x* {.importc: "x_".}: cfloat
    y* {.importc: "y_".}: cfloat


proc constructVector2*(): Vector2 {.importcpp: "Urho3D::Vector2(@)",
                                    header: "Vector2.h", constructor.}
proc constructVector2*(vector: Vector2): Vector2 {.constructor,
    importcpp: "Urho3D::Vector2(@)", header: "Vector2.h".}
proc constructVector2*(x: cfloat; y: cfloat): Vector2 {.constructor,
    importcpp: "Urho3D::Vector2(@)", header: "Vector2.h".}
proc constructVector2*(data: ptr cfloat): Vector2 {.constructor,
    importcpp: "Urho3D::Vector2(@)", header: "Vector2.h".}
proc `==`*(this: Vector2; rhs: Vector2): bool {.noSideEffect,
    importcpp: "(# == #)", header: "Vector2.h".}
proc `+`*(this: Vector2; rhs: Vector2): Vector2 {.noSideEffect,
    importcpp: "(# + #)", header: "Vector2.h".}
proc `-`*(this: Vector2): Vector2 {.noSideEffect, importcpp: "(- #)",
                                    header: "Vector2.h".}
proc `-`*(this: Vector2; rhs: Vector2): Vector2 {.noSideEffect,
    importcpp: "(# - #)", header: "Vector2.h".}
proc `*`*(this: Vector2; rhs: cfloat): Vector2 {.noSideEffect,
    importcpp: "(# * #)", header: "Vector2.h".}
proc `*`*(this: Vector2; rhs: Vector2): Vector2 {.noSideEffect,
    importcpp: "(# * #)", header: "Vector2.h".}
proc `/`*(this: Vector2; rhs: cfloat): Vector2 {.noSideEffect,
    importcpp: "(# / #)", header: "Vector2.h".}
proc `/`*(this: Vector2; rhs: Vector2): Vector2 {.noSideEffect,
    importcpp: "(# / #)", header: "Vector2.h".}
proc `+=`*(this: var Vector2; rhs: Vector2) {.importcpp: "(# += #)",
    header: "Vector2.h".}
proc `-=`*(this: var Vector2; rhs: Vector2) {.importcpp: "(# -= #)",
    header: "Vector2.h".}
proc `*=`*(this: var Vector2; rhs: cfloat) {.importcpp: "(# *= #)",
    header: "Vector2.h".}
proc `*=`*(this: var Vector2; rhs: Vector2) {.importcpp: "(# *= #)",
    header: "Vector2.h".}
proc `/=`*(this: var Vector2; rhs: cfloat) {.importcpp: "(# /= #)",
    header: "Vector2.h".}
proc `/=`*(this: var Vector2; rhs: Vector2) {.importcpp: "(# /= #)",
    header: "Vector2.h".}
proc normalize*(this: var Vector2) {.importcpp: "Normalize", header: "Vector2.h".}
proc length*(this: Vector2): cfloat {.noSideEffect, importcpp: "Length",
                                      header: "Vector2.h".}
proc lengthSquared*(this: Vector2): cfloat {.noSideEffect,
    importcpp: "LengthSquared", header: "Vector2.h".}
proc dotProduct*(this: Vector2; rhs: Vector2): cfloat {.noSideEffect,
    importcpp: "DotProduct", header: "Vector2.h".}
proc absDotProduct*(this: Vector2; rhs: Vector2): cfloat {.noSideEffect,
    importcpp: "AbsDotProduct", header: "Vector2.h".}
proc abs*(this: Vector2): Vector2 {.noSideEffect, importcpp: "Abs",
                                    header: "Vector2.h".}
proc lerp*(this: Vector2; rhs: Vector2; t: cfloat): Vector2 {.noSideEffect,
    importcpp: "Lerp", header: "Vector2.h".}
proc equals*(this: Vector2; rhs: Vector2): bool {.noSideEffect,
    importcpp: "Equals", header: "Vector2.h".}
proc isNaN*(this: Vector2): bool {.noSideEffect, importcpp: "IsNaN",
                                   header: "Vector2.h".}
proc normalized*(this: Vector2): Vector2 {.noSideEffect,
    importcpp: "Normalized", header: "Vector2.h".}
proc data*(this: Vector2): ptr cfloat {.noSideEffect, importcpp: "Data",
                                        header: "Vector2.h".}
proc toString*(this: Vector2): UrString {.noSideEffect, importcpp: "ToString",
    header: "Vector2.h".}

proc `*`*(lhs: cfloat; rhs: Vector2): Vector2 {.noSideEffect,
    importcpp: "(# * #)", header: "Vector2.h".}

type
  IntVector2* {.importcpp: "Urho3D::IntVector2", header: "Vector2.h".} = object
    x* {.importc: "x_".}: cint
    y* {.importc: "y_".}: cint


proc constructIntVector2*(): IntVector2 {.importcpp: "Urho3D::IntVector2(@)",
    header: "Vector2.h", constructor.}
proc constructIntVector2*(x: cint; y: cint): IntVector2 {.
    importcpp: "Urho3D::IntVector2(@)", header: "Vector2.h", constructor.}
proc constructIntVector2*(data: ptr cint): IntVector2 {.
    importcpp: "Urho3D::IntVector2(@)", header: "Vector2.h", constructor.}
proc constructIntVector2*(rhs: IntVector2): IntVector2 {.constructor,
    importcpp: "Urho3D::IntVector2(@)", header: "Vector2.h".}
proc `==`*(this: IntVector2; rhs: IntVector2): bool {.noSideEffect,
    importcpp: "(# == #)", header: "Vector2.h".}
proc `+`*(this: IntVector2; rhs: IntVector2): IntVector2 {.noSideEffect,
    importcpp: "(# + #)", header: "Vector2.h".}
proc `-`*(this: IntVector2): IntVector2 {.noSideEffect, importcpp: "(- #)",
    header: "Vector2.h".}
proc `-`*(this: IntVector2; rhs: IntVector2): IntVector2 {.noSideEffect,
    importcpp: "(# - #)", header: "Vector2.h".}
proc `*`*(this: IntVector2; rhs: cint): IntVector2 {.noSideEffect,
    importcpp: "(# * #)", header: "Vector2.h".}
proc `/`*(this: IntVector2; rhs: cint): IntVector2 {.noSideEffect,
    importcpp: "(# / #)", header: "Vector2.h".}
proc `+=`*(this: var IntVector2; rhs: IntVector2) {.importcpp: "(# += #)",
    header: "Vector2.h".}
proc `-=`*(this: var IntVector2; rhs: IntVector2) {.importcpp: "(# -= #)",
    header: "Vector2.h".}
proc `*=`*(this: var IntVector2; rhs: cint) {.importcpp: "(# *= #)",
    header: "Vector2.h".}
proc `/=`*(this: var IntVector2; rhs: cint) {.importcpp: "(# /= #)",
    header: "Vector2.h".}
proc data*(this: IntVector2): ptr cint {.noSideEffect, importcpp: "Data",
    header: "Vector2.h".}
proc toString*(this: IntVector2): UrString {.noSideEffect,
    importcpp: "ToString", header: "Vector2.h".}

proc `*`*(lhs: cint; rhs: IntVector2): IntVector2 {.noSideEffect,
    importcpp: "(# * #)", header: "Vector2.h".}
