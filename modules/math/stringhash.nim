

import 
  urstr


type 
  StringHash* {.importc: "Urho3D::StringHash", header: "StringHash.h".} = object 
    value* {.importc: "value_".}: cuint


#proc constructStringHash*(): StringHash {.importcpp: "Urho3D::StringHash(@)", 
#    header: "StringHash.h".}
#proc constructStringHash*(rhs: StringHash): StringHash {.
#    importcpp: "Urho3D::StringHash(@)", header: "StringHash.h".}
#proc constructStringHash*(value: cuint): StringHash {.
#    importcpp: "Urho3D::StringHash(@)", header: "StringHash.h".}
proc constructStringHash*(str: cstring): StringHash {.
    importcpp: "Urho3D::StringHash(@)", header: "StringHash.h".}
proc constructStringHash*(str: UrString): StringHash {.
    importcpp: "Urho3D::StringHash(@)", header: "StringHash.h".}

proc `+`*(this: StringHash; rhs: StringHash): StringHash {.noSideEffect, 
    importcpp: "# + #", header: "StringHash.h".}
proc `+=`*(this: var StringHash; rhs: StringHash) {.importcpp: "# += #", 
    header: "StringHash.h".}
proc `==`*(this: StringHash; rhs: StringHash): bool {.noSideEffect, 
    importcpp: "# == #", header: "StringHash.h".}
proc `<`*(this: StringHash; rhs: StringHash): bool {.noSideEffect, 
    importcpp: "# < #", header: "StringHash.h".}
proc value*(this: StringHash): cuint {.noSideEffect, importcpp: "Value", 
                                       header: "StringHash.h".}
proc toString*(this: StringHash): UrString {.noSideEffect, 
    importcpp: "ToString", header: "StringHash.h".}
proc toHash*(this: StringHash): cuint {.noSideEffect, importcpp: "ToHash", 
                                        header: "StringHash.h".}
proc calculate*(str: cstring): cuint {.importcpp: "Urho3D::StringHash::Calculate(@)", 
                                       header: "StringHash.h".}