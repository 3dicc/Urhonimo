

import 
  ptrs, variant, refcounted, urstr


var AM_EDIT* {.importc: "AM_EDIT", header: "Attribute.h".}: cuint #= 0x00000000
var AM_FILE* {.importc: "AM_FILE", header: "Attribute.h".}: cuint #= 0x00000001
var AM_NET* {.importc: "AM_NET", header: "Attribute.h".}: cuint #= 0x00000002
var AM_DEFAULT* {.importc: "AM_DEFAULT", header: "Attribute.h".}: cuint #= 0x00000003
var AM_LATESTDATA* {.importc: "AM_LATESTDATA", header: "Attribute.h".}: cuint #= 0x00000004
var AM_NOEDIT* {.importc: "AM_NOEDIT", header: "Attribute.h".}: cuint #= 0x00000008
var AM_NODEID* {.importc: "AM_NODEID", header: "Attribute.h".}: cuint #= 0x00000010
var AM_COMPONENTID* {.importc: "AM_COMPONENTID", header: "Attribute.h".}: cuint #= 0x00000020
var AM_NODEIDVECTOR* {.importc: "AM_NODEIDVECTOR", header: "Attribute.h".}: cuint #= 0x00000040

discard "forward decl of Serializable"
type 
  AttributeAccessor* {.importc: "Urho3D::AttributeAccessor", 
                       header: "Attribute.h".} = object of RefCounted
  
when false:
  proc get*(this: AttributeAccessor; `ptr`: ptr Serializable; dest: var Variant) {.
      noSideEffect, importcpp: "Get", header: "Attribute.h".}
  proc set*(this: var AttributeAccessor; `ptr`: ptr Serializable; src: Variant) {.
      importcpp: "Set", header: "Attribute.h".}

type 
  AttributeInfo* {.importc: "Urho3D::AttributeInfo", header: "Attribute.h".} = object 
    `type`* {.importc: "type_".}: VariantType
    name* {.importc: "name_".}: UrString
    offset* {.importc: "offset_".}: cuint
    enumNames* {.importc: "enumNames_".}: cstringArray
    accessor* {.importc: "accessor_".}: SharedPtr[AttributeAccessor]
    defaultValue* {.importc: "defaultValue_".}: Variant
    mode* {.importc: "mode_".}: cuint
    `ptr`* {.importc: "ptr_".}: pointer


proc constructAttributeInfo*(): AttributeInfo {.
    importcpp: "Urho3D::AttributeInfo(@)", header: "Attribute.h".}
proc constructAttributeInfo*(`type`: VariantType; name: cstring; offset: csize; 
                             defaultValue: Variant; mode: cuint): AttributeInfo {.
    importcpp: "Urho3D::AttributeInfo(@)", header: "Attribute.h".}
proc constructAttributeInfo*(name: cstring; offset: csize; 
                             enumNames: cstringArray; defaultValue: Variant; 
                             mode: cuint): AttributeInfo {.
    importcpp: "Urho3D::AttributeInfo(@)", header: "Attribute.h".}
proc constructAttributeInfo*(`type`: VariantType; name: cstring; 
                             accessor: ptr AttributeAccessor; 
                             defaultValue: Variant; mode: cuint): AttributeInfo {.
    importcpp: "Urho3D::AttributeInfo(@)", header: "Attribute.h".}
proc constructAttributeInfo*(name: cstring; accessor: ptr AttributeAccessor; 
                             enumNames: cstringArray; defaultValue: Variant; 
                             mode: cuint): AttributeInfo {.
    importcpp: "Urho3D::AttributeInfo(@)", header: "Attribute.h".}