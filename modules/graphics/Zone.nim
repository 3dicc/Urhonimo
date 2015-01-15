

import 
  color, drawable, texture


type 
  Zone* {.importc: "Urho3D::Zone", header: "Zone.h".} = object of Drawable
    inverseWorld* {.importc: "inverseWorld_".}: Matrix3x4
    inverseWorldDirty* {.importc: "inverseWorldDirty_".}: bool
    heightFog* {.importc: "heightFog_".}: bool
    override* {.importc: "override_".}: bool
    ambientGradient* {.importc: "ambientGradient_".}: bool
    lastWorldBoundingBox* {.importc: "lastWorldBoundingBox_".}: BoundingBox
    ambientColor* {.importc: "ambientColor_".}: Color
    ambientStartColor* {.importc: "ambientStartColor_".}: Color
    ambientEndColor* {.importc: "ambientEndColor_".}: Color
    fogColor* {.importc: "fogColor_".}: Color
    fogStart* {.importc: "fogStart_".}: cfloat
    fogEnd* {.importc: "fogEnd_".}: cfloat
    fogHeight* {.importc: "fogHeight_".}: cfloat
    fogHeightScale* {.importc: "fogHeightScale_".}: cfloat
    priority* {.importc: "priority_".}: cint
    zoneTexture* {.importc: "zoneTexture_".}: SharedPtr[Texture]
    lastAmbientStartZone* {.importc: "lastAmbientStartZone_".}: WeakPtr[Zone]
    lastAmbientEndZone* {.importc: "lastAmbientEndZone_".}: WeakPtr[Zone]


proc getType*(this: Zone): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Zone.h".}
proc getBaseType*(this: Zone): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Zone.h".}
proc getTypeName*(this: Zone): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Zone.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Zone::GetTypeStatic(@)", header: "Zone.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Zone::GetTypeNameStatic(@)", header: "Zone.h".}
proc constructZone*(context: ptr Context): Zone {.importcpp: "Urho3D::Zone(@)", 
    header: "Zone.h".}
proc destroyZone*(this: var Zone) {.importcpp: "#.~Zone()", header: "Zone.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Zone::RegisterObject(@)", header: "Zone.h".}
proc onSetAttribute*(this: var Zone; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "Zone.h".}
proc drawDebugGeometry*(this: var Zone; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Zone.h".}
proc setBoundingBox*(this: var Zone; box: BoundingBox) {.
    importcpp: "SetBoundingBox", header: "Zone.h".}
proc setAmbientColor*(this: var Zone; color: Color) {.
    importcpp: "SetAmbientColor", header: "Zone.h".}
proc setFogColor*(this: var Zone; color: Color) {.importcpp: "SetFogColor", 
    header: "Zone.h".}
proc setFogStart*(this: var Zone; start: cfloat) {.importcpp: "SetFogStart", 
    header: "Zone.h".}
proc setFogEnd*(this: var Zone; `end`: cfloat) {.importcpp: "SetFogEnd", 
    header: "Zone.h".}
proc setFogHeight*(this: var Zone; height: cfloat) {.importcpp: "SetFogHeight", 
    header: "Zone.h".}
proc setFogHeightScale*(this: var Zone; scale: cfloat) {.
    importcpp: "SetFogHeightScale", header: "Zone.h".}
proc setPriority*(this: var Zone; priority: cint) {.importcpp: "SetPriority", 
    header: "Zone.h".}
proc setHeightFog*(this: var Zone; enable: bool) {.importcpp: "SetHeightFog", 
    header: "Zone.h".}
proc setOverride*(this: var Zone; enable: bool) {.importcpp: "SetOverride", 
    header: "Zone.h".}
proc setAmbientGradient*(this: var Zone; enable: bool) {.
    importcpp: "SetAmbientGradient", header: "Zone.h".}
proc setZoneTexture*(this: var Zone; texture: ptr Texture) {.
    importcpp: "SetZoneTexture", header: "Zone.h".}
proc getInverseWorldTransform*(this: Zone): Matrix3x4 {.noSideEffect, 
    importcpp: "GetInverseWorldTransform", header: "Zone.h".}
proc getAmbientColor*(this: Zone): Color {.noSideEffect, 
    importcpp: "GetAmbientColor", header: "Zone.h".}
proc getAmbientStartColor*(this: var Zone): Color {.
    importcpp: "GetAmbientStartColor", header: "Zone.h".}
proc getAmbientEndColor*(this: var Zone): Color {.
    importcpp: "GetAmbientEndColor", header: "Zone.h".}
proc getFogColor*(this: Zone): Color {.noSideEffect, importcpp: "GetFogColor", 
                                       header: "Zone.h".}
proc getFogStart*(this: Zone): cfloat {.noSideEffect, importcpp: "GetFogStart", 
                                        header: "Zone.h".}
proc getFogEnd*(this: Zone): cfloat {.noSideEffect, importcpp: "GetFogEnd", 
                                      header: "Zone.h".}
proc getFogHeight*(this: Zone): cfloat {.noSideEffect, 
    importcpp: "GetFogHeight", header: "Zone.h".}
proc getFogHeightScale*(this: Zone): cfloat {.noSideEffect, 
    importcpp: "GetFogHeightScale", header: "Zone.h".}
proc getPriority*(this: Zone): cint {.noSideEffect, importcpp: "GetPriority", 
                                      header: "Zone.h".}
proc getHeightFog*(this: Zone): bool {.noSideEffect, importcpp: "GetHeightFog", 
                                       header: "Zone.h".}
proc getOverride*(this: Zone): bool {.noSideEffect, importcpp: "GetOverride", 
                                      header: "Zone.h".}
proc getAmbientGradient*(this: Zone): bool {.noSideEffect, 
    importcpp: "GetAmbientGradient", header: "Zone.h".}
proc getZoneTexture*(this: Zone): ptr Texture {.noSideEffect, 
    importcpp: "GetZoneTexture", header: "Zone.h".}
proc isInside*(this: Zone; point: Vector3): bool {.noSideEffect, 
    importcpp: "IsInside", header: "Zone.h".}
proc setZoneTextureAttr*(this: var Zone; value: ResourceRef) {.
    importcpp: "SetZoneTextureAttr", header: "Zone.h".}
proc getZoneTextureAttr*(this: Zone): ResourceRef {.noSideEffect, 
    importcpp: "GetZoneTextureAttr", header: "Zone.h".}