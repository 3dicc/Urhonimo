

import 
  vector2, vector4, mathdefs, urstr


type 
  Rect* {.importc: "Urho3D::Rect", header: "Rect.h".} = object 
    min* {.importc: "min_".}: Vector2
    max* {.importc: "max_".}: Vector2
    defined* {.importc: "defined_".}: bool


proc constructRect*(): Rect {.importcpp: "Urho3D::Rect(@)", header: "Rect.h".}
proc constructRect*(min: Vector2; max: Vector2): Rect {.
    importcpp: "Urho3D::Rect(@)", header: "Rect.h".}
proc constructRect*(left: cfloat; top: cfloat; right: cfloat; bottom: cfloat): Rect {.
    importcpp: "Urho3D::Rect(@)", header: "Rect.h".}
proc constructRect*(vector: Vector4): Rect {.importcpp: "Urho3D::Rect(@)", 
    header: "Rect.h".}
proc constructRect*(data: ptr cfloat): Rect {.importcpp: "Urho3D::Rect(@)", 
    header: "Rect.h".}
proc constructRect*(rect: Rect): Rect {.importcpp: "Urho3D::Rect(@)", 
                                        header: "Rect.h".}
proc `==`*(this: Rect; rhs: Rect): bool {.noSideEffect, importcpp: "# == #", 
    header: "Rect.h".}
proc define*(this: var Rect; rect: Rect) {.importcpp: "Define", header: "Rect.h".}
proc define*(this: var Rect; min: Vector2; max: Vector2) {.importcpp: "Define", 
    header: "Rect.h".}
proc define*(this: var Rect; point: Vector2) {.importcpp: "Define", 
    header: "Rect.h".}
proc merge*(this: var Rect; point: Vector2) {.importcpp: "Merge", 
    header: "Rect.h".}
proc merge*(this: var Rect; rect: Rect) {.importcpp: "Merge", header: "Rect.h".}
proc clear*(this: var Rect) {.importcpp: "Clear", header: "Rect.h".}
proc clip*(this: var Rect; rect: Rect) {.importcpp: "Clip", header: "Rect.h".}
proc center*(this: Rect): Vector2 {.noSideEffect, importcpp: "Center", 
                                    header: "Rect.h".}
proc size*(this: Rect): Vector2 {.noSideEffect, importcpp: "Size", 
                                  header: "Rect.h".}
proc halfSize*(this: Rect): Vector2 {.noSideEffect, importcpp: "HalfSize", 
                                      header: "Rect.h".}
proc equals*(this: Rect; rhs: Rect): bool {.noSideEffect, importcpp: "Equals", 
    header: "Rect.h".}
proc isInside*(this: Rect; point: Vector2): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Rect.h".}
proc data*(this: Rect): pointer {.noSideEffect, importcpp: "Data", 
                                  header: "Rect.h".}
proc toVector4*(this: Rect): Vector4 {.noSideEffect, importcpp: "ToVector4", 
                                       header: "Rect.h".}
proc toString*(this: Rect): UrString {.noSideEffect, importcpp: "ToString", 
                                       header: "Rect.h".}

type 
  IntRect* {.importc: "Urho3D::IntRect", header: "Rect.h".} = object 
    left* {.importc: "left_".}: cint
    top* {.importc: "top_".}: cint
    right* {.importc: "right_".}: cint
    bottom* {.importc: "bottom_".}: cint


proc constructIntRect*(): IntRect {.importcpp: "Urho3D::IntRect(@)", 
                                    header: "Rect.h".}
proc constructIntRect*(left: cint; top: cint; right: cint; bottom: cint): IntRect {.
    importcpp: "Urho3D::IntRect(@)", header: "Rect.h".}
proc constructIntRect*(data: ptr cint): IntRect {.
    importcpp: "Urho3D::IntRect(@)", header: "Rect.h".}
proc `==`*(this: IntRect; rhs: IntRect): bool {.noSideEffect, 
    importcpp: "# == #", header: "Rect.h".}
proc size*(this: IntRect): IntVector2 {.noSideEffect, importcpp: "Size", 
                                        header: "Rect.h".}
proc width*(this: IntRect): cint {.noSideEffect, importcpp: "Width", 
                                   header: "Rect.h".}
proc height*(this: IntRect): cint {.noSideEffect, importcpp: "Height", 
                                    header: "Rect.h".}
proc isInside*(this: IntRect; point: IntVector2): Intersection {.noSideEffect, 
    importcpp: "IsInside", header: "Rect.h".}
proc data*(this: IntRect): ptr cint {.noSideEffect, importcpp: "Data", 
                                      header: "Rect.h".}
proc toString*(this: IntRect): UrString {.noSideEffect, importcpp: "ToString", 
    header: "Rect.h".}