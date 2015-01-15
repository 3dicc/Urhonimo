

import 
  component, graphicsDefs

discard "forward decl of Texture2D"
discard "forward decl of Material"
type 
  MaterialCache2D* {.importc: "Urho3D::MaterialCache2D", 
                     header: "MaterialCache2D.h".} = object of Component
    materials* {.importc: "materials_".}: HashMap[ptr Texture2D, 
        HashMap[cint, SharedPtr[Material]]]


proc getType*(this: MaterialCache2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "MaterialCache2D.h".}
proc getBaseType*(this: MaterialCache2D): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "MaterialCache2D.h".}
proc getTypeName*(this: MaterialCache2D): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "MaterialCache2D.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::MaterialCache2D::GetTypeStatic(@)", 
    header: "MaterialCache2D.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::MaterialCache2D::GetTypeNameStatic(@)", 
    header: "MaterialCache2D.h".}
proc constructMaterialCache2D*(context: ptr Context): MaterialCache2D {.
    importcpp: "Urho3D::MaterialCache2D(@)", header: "MaterialCache2D.h".}
proc destroyMaterialCache2D*(this: var MaterialCache2D) {.
    importcpp: "#.~MaterialCache2D()", header: "MaterialCache2D.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::MaterialCache2D::RegisterObject(@)", 
    header: "MaterialCache2D.h".}
proc getMaterial*(this: var MaterialCache2D; texture: ptr Texture2D; 
                  blendMode: BlendMode): ptr Material {.
    importcpp: "GetMaterial", header: "MaterialCache2D.h".}