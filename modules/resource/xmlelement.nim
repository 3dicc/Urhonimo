

import
  boundingBox, rect, ptrs, variant, resource, urstr, vector, color, vector2,
  quaternion, vector3, vector4, matrix3, matrix4, urobject

type
  XMLFile* {.importcpp: "Urho3D::XMLFile", header: "XMLFile.h".} = object of Resource

  XMLElement* {.importcpp: "Urho3D::XMLElement", header: "XMLElement.h".} = object
    file* {.importc: "file_".}: WeakPtr[XMLFile]
    xpathResultSet* {.importc: "xpathResultSet_".}: ptr XPathResultSet
    xpathResultIndex* {.importc: "xpathResultIndex_".}: cuint

  XPathResultSet* {.importcpp: "Urho3D::XPathResultSet", header: "XMLElement.h".} = object
    file* {.importc: "file_".}: WeakPtr[XMLFile]
  XPathQuery* {.importcpp: "Urho3D::XPathQuery", header: "XMLElement.h".} = object
    queryString* {.importc: "queryString_".}: UrString


proc constructXMLFile*(context: ptr Context): XMLFile {.constructor,
    importcpp: "Urho3D::XMLFile(@)", header: "XMLFile.h".}
proc destroyXMLFile*(this: var XMLFile) {.importcpp: "#.~XMLFile()",
    header: "XMLFile.h".}


proc constructXMLElement*(): XMLElement {.importcpp: "Urho3D::XMLElement(@)",
    header: "XMLElement.h", constructor.}

proc constructXMLElement*(rhs: XMLElement): XMLElement {.constructor,
    importcpp: "Urho3D::XMLElement(@)", header: "XMLElement.h".}
proc destroyXMLElement*(this: var XMLElement) {.importcpp: "#.~XMLElement()",
    header: "XMLElement.h".}
proc createChild*(this: var XMLElement; name: UrString): XMLElement {.
    importcpp: "CreateChild", header: "XMLElement.h".}
proc createChild*(this: var XMLElement; name: cstring): XMLElement {.
    importcpp: "CreateChild", header: "XMLElement.h".}
proc removeChild*(this: var XMLElement; element: XMLElement): bool {.
    importcpp: "RemoveChild", header: "XMLElement.h".}
proc removeChild*(this: var XMLElement; name: UrString): bool {.
    importcpp: "RemoveChild", header: "XMLElement.h".}
proc removeChild*(this: var XMLElement; name: cstring): bool {.
    importcpp: "RemoveChild", header: "XMLElement.h".}
proc removeChildren*(this: var XMLElement; name: UrString): bool {.
    importcpp: "RemoveChildren", header: "XMLElement.h".}
proc removeChildren*(this: var XMLElement; name: cstring): bool {.
    importcpp: "RemoveChildren", header: "XMLElement.h".}
proc removeAttribute*(this: var XMLElement; name: UrString): bool {.
    importcpp: "RemoveAttribute", header: "XMLElement.h".}
proc removeAttribute*(this: var XMLElement; name: cstring): bool {.
    importcpp: "RemoveAttribute", header: "XMLElement.h".}
proc selectSingle*(this: XMLElement; query: UrString): XMLElement {.
    noSideEffect, importcpp: "SelectSingle", header: "XMLElement.h".}
proc selectSinglePrepared*(this: XMLElement; query: XPathQuery): XMLElement {.
    noSideEffect, importcpp: "SelectSinglePrepared", header: "XMLElement.h".}
proc select*(this: XMLElement; query: UrString): XPathResultSet {.
    noSideEffect, importcpp: "Select", header: "XMLElement.h".}
proc selectPrepared*(this: XMLElement; query: XPathQuery): XPathResultSet {.
    noSideEffect, importcpp: "SelectPrepared", header: "XMLElement.h".}
proc setValue*(this: var XMLElement; value: UrString): bool {.
    importcpp: "SetValue", header: "XMLElement.h".}
proc setValue*(this: var XMLElement; value: cstring): bool {.
    importcpp: "SetValue", header: "XMLElement.h".}
proc setAttribute*(this: var XMLElement; name: UrString; value: UrString): bool {.
    importcpp: "SetAttribute", header: "XMLElement.h".}
proc setAttribute*(this: var XMLElement; name: cstring; value: cstring): bool {.
    importcpp: "SetAttribute", header: "XMLElement.h".}
proc setAttribute*(this: var XMLElement; value: UrString): bool {.
    importcpp: "SetAttribute", header: "XMLElement.h".}
proc setAttribute*(this: var XMLElement; value: cstring): bool {.
    importcpp: "SetAttribute", header: "XMLElement.h".}
proc setBool*(this: var XMLElement; name: UrString; value: bool): bool {.
    importcpp: "SetBool", header: "XMLElement.h".}
proc setBoundingBox*(this: var XMLElement; value: BoundingBox): bool {.
    importcpp: "SetBoundingBox", header: "XMLElement.h".}
proc setBuffer*(this: var XMLElement; name: UrString; data: pointer; size: cuint): bool {.
    importcpp: "SetBuffer", header: "XMLElement.h".}
proc setBuffer*(this: var XMLElement; name: UrString; value: PODVector[cuchar]): bool {.
    importcpp: "SetBuffer", header: "XMLElement.h".}
proc setColor*(this: var XMLElement; name: UrString; value: Color): bool {.
    importcpp: "SetColor", header: "XMLElement.h".}
proc setFloat*(this: var XMLElement; name: UrString; value: cfloat): bool {.
    importcpp: "SetFloat", header: "XMLElement.h".}
proc setUInt*(this: var XMLElement; name: UrString; value: cuint): bool {.
    importcpp: "SetUInt", header: "XMLElement.h".}
proc setInt*(this: var XMLElement; name: UrString; value: cint): bool {.
    importcpp: "SetInt", header: "XMLElement.h".}
proc setIntRect*(this: var XMLElement; name: UrString; value: IntRect): bool {.
    importcpp: "SetIntRect", header: "XMLElement.h".}
proc setIntVector2*(this: var XMLElement; name: UrString; value: IntVector2): bool {.
    importcpp: "SetIntVector2", header: "XMLElement.h".}
proc setRect*(this: var XMLElement; name: UrString; value: Rect): bool {.
    importcpp: "SetRect", header: "XMLElement.h".}
proc setQuaternion*(this: var XMLElement; name: UrString; value: Quaternion): bool {.
    importcpp: "SetQuaternion", header: "XMLElement.h".}
proc setString*(this: var XMLElement; name: UrString; value: UrString): bool {.
    importcpp: "SetString", header: "XMLElement.h".}
proc setVariant*(this: var XMLElement; value: Variant): bool {.
    importcpp: "SetVariant", header: "XMLElement.h".}
proc setVariantValue*(this: var XMLElement; value: Variant): bool {.
    importcpp: "SetVariantValue", header: "XMLElement.h".}
proc setResourceRef*(this: var XMLElement; value: ResourceRef): bool {.
    importcpp: "SetResourceRef", header: "XMLElement.h".}
proc setResourceRefList*(this: var XMLElement; value: ResourceRefList): bool {.
    importcpp: "SetResourceRefList", header: "XMLElement.h".}
proc setVariantVector*(this: var XMLElement; value: VariantVector): bool {.
    importcpp: "SetVariantVector", header: "XMLElement.h".}
proc setVariantMap*(this: var XMLElement; value: VariantMap): bool {.
    importcpp: "SetVariantMap", header: "XMLElement.h".}
proc setVector2*(this: var XMLElement; name: UrString; value: Vector2): bool {.
    importcpp: "SetVector2", header: "XMLElement.h".}
proc setVector3*(this: var XMLElement; name: UrString; value: Vector3): bool {.
    importcpp: "SetVector3", header: "XMLElement.h".}
proc setVector4*(this: var XMLElement; name: UrString; value: Vector4): bool {.
    importcpp: "SetVector4", header: "XMLElement.h".}
proc setVectorVariant*(this: var XMLElement; name: UrString; value: Variant): bool {.
    importcpp: "SetVectorVariant", header: "XMLElement.h".}
proc setMatrix3*(this: var XMLElement; name: UrString; value: Matrix3): bool {.
    importcpp: "SetMatrix3", header: "XMLElement.h".}
proc setMatrix3x4*(this: var XMLElement; name: UrString; value: Matrix3x4): bool {.
    importcpp: "SetMatrix3x4", header: "XMLElement.h".}
proc setMatrix4*(this: var XMLElement; name: UrString; value: Matrix4): bool {.
    importcpp: "SetMatrix4", header: "XMLElement.h".}
proc isNull*(this: XMLElement): bool {.noSideEffect, importcpp: "IsNull",
                                       header: "XMLElement.h".}
proc notNull*(this: XMLElement): bool {.noSideEffect, importcpp: "NotNull",
                                        header: "XMLElement.h".}

proc getName*(this: XMLElement): UrString {.noSideEffect, importcpp: "GetName",
    header: "XMLElement.h".}
proc hasChild*(this: XMLElement; name: UrString): bool {.noSideEffect,
    importcpp: "HasChild", header: "XMLElement.h".}
proc hasChild*(this: XMLElement; name: cstring): bool {.noSideEffect,
    importcpp: "HasChild", header: "XMLElement.h".}
proc getChild*(this: XMLElement; name: UrString): XMLElement {.
    noSideEffect, importcpp: "GetChild", header: "XMLElement.h".}
proc getChild*(this: XMLElement; name: cstring): XMLElement {.noSideEffect,
    importcpp: "GetChild", header: "XMLElement.h".}
proc getNext*(this: XMLElement; name: UrString): XMLElement {.
    noSideEffect, importcpp: "GetNext", header: "XMLElement.h".}
proc getNext*(this: XMLElement; name: cstring): XMLElement {.noSideEffect,
    importcpp: "GetNext", header: "XMLElement.h".}
proc getParent*(this: XMLElement): XMLElement {.noSideEffect,
    importcpp: "GetParent", header: "XMLElement.h".}
proc getNumAttributes*(this: XMLElement): cuint {.noSideEffect,
    importcpp: "GetNumAttributes", header: "XMLElement.h".}
proc hasAttribute*(this: XMLElement; name: UrString): bool {.noSideEffect,
    importcpp: "HasAttribute", header: "XMLElement.h".}
proc hasAttribute*(this: XMLElement; name: cstring): bool {.noSideEffect,
    importcpp: "HasAttribute", header: "XMLElement.h".}
proc getValue*(this: XMLElement): UrString {.noSideEffect,
    importcpp: "GetValue", header: "XMLElement.h".}
proc getAttribute*(this: XMLElement; name: UrString): UrString {.
    noSideEffect, importcpp: "GetAttribute", header: "XMLElement.h".}
proc getAttribute*(this: XMLElement; name: cstring): UrString {.noSideEffect,
    importcpp: "GetAttribute", header: "XMLElement.h".}
proc getAttributeCString*(this: XMLElement; name: cstring): cstring {.
    noSideEffect, importcpp: "GetAttributeCString", header: "XMLElement.h".}
proc getAttributeLower*(this: XMLElement; name: UrString): UrString {.
    noSideEffect, importcpp: "GetAttributeLower", header: "XMLElement.h".}
proc getAttributeLower*(this: XMLElement; name: cstring): UrString {.
    noSideEffect, importcpp: "GetAttributeLower", header: "XMLElement.h".}
proc getAttributeUpper*(this: XMLElement; name: UrString): UrString {.
    noSideEffect, importcpp: "GetAttributeUpper", header: "XMLElement.h".}
proc getAttributeUpper*(this: XMLElement; name: cstring): UrString {.
    noSideEffect, importcpp: "GetAttributeUpper", header: "XMLElement.h".}
proc getAttributeNames*(this: XMLElement): Vector[UrString] {.noSideEffect,
    importcpp: "GetAttributeNames", header: "XMLElement.h".}
proc getBool*(this: XMLElement; name: UrString): bool {.noSideEffect,
    importcpp: "GetBool", header: "XMLElement.h".}
proc getBuffer*(this: XMLElement; name: UrString): PODVector[cuchar] {.
    noSideEffect, importcpp: "GetBuffer", header: "XMLElement.h".}
proc getBuffer*(this: XMLElement; name: UrString; dest: pointer; size: cuint): bool {.
    noSideEffect, importcpp: "GetBuffer", header: "XMLElement.h".}
proc getBoundingBox*(this: XMLElement): BoundingBox {.noSideEffect,
    importcpp: "GetBoundingBox", header: "XMLElement.h".}
proc getColor*(this: XMLElement; name: UrString): Color {.noSideEffect,
    importcpp: "GetColor", header: "XMLElement.h".}
proc getFloat*(this: XMLElement; name: UrString): cfloat {.noSideEffect,
    importcpp: "GetFloat", header: "XMLElement.h".}
proc getUInt*(this: XMLElement; name: UrString): cuint {.noSideEffect,
    importcpp: "GetUInt", header: "XMLElement.h".}
proc getInt*(this: XMLElement; name: UrString): cint {.noSideEffect,
    importcpp: "GetInt", header: "XMLElement.h".}
proc getIntRect*(this: XMLElement; name: UrString): IntRect {.noSideEffect,
    importcpp: "GetIntRect", header: "XMLElement.h".}
proc getIntVector2*(this: XMLElement; name: UrString): IntVector2 {.
    noSideEffect, importcpp: "GetIntVector2", header: "XMLElement.h".}
proc getRect*(this: XMLElement; name: UrString): Rect {.noSideEffect,
    importcpp: "GetRect", header: "XMLElement.h".}
proc getQuaternion*(this: XMLElement; name: UrString): Quaternion {.
    noSideEffect, importcpp: "GetQuaternion", header: "XMLElement.h".}
proc getVariant*(this: XMLElement): Variant {.noSideEffect,
    importcpp: "GetVariant", header: "XMLElement.h".}
proc getVariantValue*(this: XMLElement; `type`: VariantType): Variant {.
    noSideEffect, importcpp: "GetVariantValue", header: "XMLElement.h".}
proc getResourceRef*(this: XMLElement): ResourceRef {.noSideEffect,
    importcpp: "GetResourceRef", header: "XMLElement.h".}
proc getResourceRefList*(this: XMLElement): ResourceRefList {.noSideEffect,
    importcpp: "GetResourceRefList", header: "XMLElement.h".}
proc getVariantVector*(this: XMLElement): VariantVector {.noSideEffect,
    importcpp: "GetVariantVector", header: "XMLElement.h".}
proc getVariantMap*(this: XMLElement): VariantMap {.noSideEffect,
    importcpp: "GetVariantMap", header: "XMLElement.h".}
proc getVector2*(this: XMLElement; name: UrString): Vector2 {.noSideEffect,
    importcpp: "GetVector2", header: "XMLElement.h".}
proc getVector3*(this: XMLElement; name: UrString): Vector3 {.noSideEffect,
    importcpp: "GetVector3", header: "XMLElement.h".}
proc getVector4*(this: XMLElement; name: UrString): Vector4 {.noSideEffect,
    importcpp: "GetVector4", header: "XMLElement.h".}
proc getVector*(this: XMLElement; name: UrString): Vector4 {.noSideEffect,
    importcpp: "GetVector", header: "XMLElement.h".}
proc getVectorVariant*(this: XMLElement; name: UrString): Variant {.
    noSideEffect, importcpp: "GetVectorVariant", header: "XMLElement.h".}
proc getMatrix3*(this: XMLElement; name: UrString): Matrix3 {.noSideEffect,
    importcpp: "GetMatrix3", header: "XMLElement.h".}
proc getMatrix3x4*(this: XMLElement; name: UrString): Matrix3x4 {.noSideEffect,
    importcpp: "GetMatrix3x4", header: "XMLElement.h".}
proc getMatrix4*(this: XMLElement; name: UrString): Matrix4 {.noSideEffect,
    importcpp: "GetMatrix4", header: "XMLElement.h".}
proc getFile*(this: XMLElement): ptr XMLFile {.noSideEffect,
    importcpp: "GetFile", header: "XMLElement.h".}

proc getXPathResultSet*(this: XMLElement): ptr XPathResultSet {.noSideEffect,
    importcpp: "GetXPathResultSet", header: "XMLElement.h".}
proc getXPathResultIndex*(this: XMLElement): cuint {.noSideEffect,
    importcpp: "GetXPathResultIndex", header: "XMLElement.h".}
proc nextResult*(this: XMLElement): XMLElement {.noSideEffect,
    importcpp: "NextResult", header: "XMLElement.h".}


proc constructXPathResultSet*(): XPathResultSet {.constructor,
    importcpp: "Urho3D::XPathResultSet(@)", header: "XMLElement.h".}

proc constructXPathResultSet*(rhs: XPathResultSet): XPathResultSet {.
    importcpp: "Urho3D::XPathResultSet(@)", header: "XMLElement.h",
    constructor.}
proc destroyXPathResultSet*(this: var XPathResultSet) {.
    importcpp: "#.~XPathResultSet()", header: "XMLElement.h".}
proc `[]`*(this: XPathResultSet; index: cuint): XMLElement {.noSideEffect,
    importcpp: "#[@]", header: "XMLElement.h".}
proc firstResult*(this: var XPathResultSet): XMLElement {.
    importcpp: "FirstResult", header: "XMLElement.h".}
proc size*(this: XPathResultSet): cuint {.noSideEffect, importcpp: "Size",
    header: "XMLElement.h".}
proc empty*(this: XPathResultSet): bool {.noSideEffect, importcpp: "Empty",
    header: "XMLElement.h".}


proc constructXPathQuery*(): XPathQuery {.importcpp: "Urho3D::XPathQuery(@)",
    header: "XMLElement.h", constructor.}
proc constructXPathQuery*(queryString: UrString;
                          variableString: UrString): XPathQuery {.
    importcpp: "Urho3D::XPathQuery(@)", header: "XMLElement.h",
    constructor.}
proc destroyXPathQuery*(this: var XPathQuery) {.importcpp: "#.~XPathQuery()",
    header: "XMLElement.h".}
proc `bind`*(this: var XPathQuery) {.importcpp: "Bind", header: "XMLElement.h".}
proc setVariable*(this: var XPathQuery; name: UrString; value: bool): bool {.
    importcpp: "SetVariable", header: "XMLElement.h".}
proc setVariable*(this: var XPathQuery; name: UrString; value: cfloat): bool {.
    importcpp: "SetVariable", header: "XMLElement.h".}
proc setVariable*(this: var XPathQuery; name: UrString; value: UrString): bool {.
    importcpp: "SetVariable", header: "XMLElement.h".}
proc setVariable*(this: var XPathQuery; name: cstring; value: cstring): bool {.
    importcpp: "SetVariable", header: "XMLElement.h".}
proc setVariable*(this: var XPathQuery; name: UrString; value: XPathResultSet): bool {.
    importcpp: "SetVariable", header: "XMLElement.h".}
proc setQuery*(this: var XPathQuery; queryString: UrString;
               variableString: UrString; `bind`: bool = true): bool {.
    importcpp: "SetQuery", header: "XMLElement.h".}
proc clear*(this: var XPathQuery) {.importcpp: "Clear", header: "XMLElement.h".}
proc evaluateToBool*(this: XPathQuery; element: XMLElement): bool {.
    noSideEffect, importcpp: "EvaluateToBool", header: "XMLElement.h".}
proc evaluateToFloat*(this: XPathQuery; element: XMLElement): cfloat {.
    noSideEffect, importcpp: "EvaluateToFloat", header: "XMLElement.h".}
proc evaluateToString*(this: XPathQuery; element: XMLElement): UrString {.
    noSideEffect, importcpp: "EvaluateToString", header: "XMLElement.h".}
proc evaluate*(this: XPathQuery; element: XMLElement): XPathResultSet {.
    noSideEffect, importcpp: "Evaluate", header: "XMLElement.h".}
proc getQuery*(this: XPathQuery): UrString {.noSideEffect,
    importcpp: "GetQuery", header: "XMLElement.h".}

