

import 
  vector

var CONVERSION_BUFFER_LENGTH* {.importc: "CONVERSION_BUFFER_LENGTH", 
                                header: "Str.h".}: cint = 128

var MATRIX_CONVERSION_BUFFER_LENGTH* {.importc: "MATRIX_CONVERSION_BUFFER_LENGTH", 
                                       header: "Str.h".}: cint = 256

discard "forward decl of WString"
type 
  UrString* {.importc: "Urho3D::String", header: "Str.h".} = object 
    length* {.importc: "length_".}: cuint
    capacity* {.importc: "capacity_".}: cuint
    buffer* {.importc: "buffer_".}: cstring


  type 
    Iterator* = RandomAccessIterator[char]
    ConstIterator* = RandomAccessConstIterator[char]
proc constructString*(): UrString {.importcpp: "Urho3D::String(@)", 
                                    header: "Str.h".}
proc constructString*(str: UrString): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(str: cstring): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(str: cstring): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(str: cstring; length: cuint): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*(str: ptr WcharT): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*(str: ptr WcharT): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*(str: WString): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: cint): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: cshort): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: clong): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: clonglong): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*(value: cuint): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: cushort): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*(value: culong): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: culonglong): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*(value: cfloat): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: cdouble): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*(value: bool): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: char): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc constructString*(value: char; length: cuint): UrString {.
    importcpp: "Urho3D::String(@)", header: "Str.h".}
proc constructString*[T](value: T): UrString {.importcpp: "Urho3D::String(@)", 
    header: "Str.h".}
proc destroyString*(this: var UrString) {.importcpp: "#.~String()", 
    header: "Str.h".}
proc `+=`*(this: var UrString; rhs: UrString) {.importcpp: "# += #", 
    header: "Str.h".}
proc `+=`*(this: var UrString; rhs: cstring) {.importcpp: "# += #", 
    header: "Str.h".}
proc `+=`*(this: var UrString; rhs: char) {.importcpp: "# += #", header: "Str.h".}
proc `+=`*(this: var UrString; rhs: cint) {.importcpp: "# += #", header: "Str.h".}
proc `+=`*(this: var UrString; rhs: cshort) {.importcpp: "# += #", 
    header: "Str.h".}
proc `+=`*(this: var UrString; rhs: cuint) {.importcpp: "# += #", 
    header: "Str.h".}
proc `+=`*(this: var UrString; rhs: cushort) {.importcpp: "# += #", 
    header: "Str.h".}
proc `+=`*(this: var UrString; rhs: cfloat) {.importcpp: "# += #", 
    header: "Str.h".}
proc `+=`*(this: var UrString; rhs: bool) {.importcpp: "# += #", header: "Str.h".}
proc `+=`*[T](this: var UrString; rhs: T) {.importcpp: "# += #", header: "Str.h".}
proc `+`*(this: UrString; rhs: UrString): UrString {.noSideEffect, 
    importcpp: "# + #", header: "Str.h".}
proc `+`*(this: UrString; rhs: cstring): UrString {.noSideEffect, 
    importcpp: "# + #", header: "Str.h".}
proc `+`*(this: UrString; rhs: char): UrString {.noSideEffect, 
    importcpp: "# + #", header: "Str.h".}
proc `==`*(this: UrString; rhs: UrString): bool {.noSideEffect, 
    importcpp: "# == #", header: "Str.h".}
proc `<`*(this: UrString; rhs: UrString): bool {.noSideEffect, 
    importcpp: "# < #", header: "Str.h".}
proc `==`*(this: UrString; rhs: cstring): bool {.noSideEffect, 
    importcpp: "# == #", header: "Str.h".}
proc `<`*(this: UrString; rhs: cstring): bool {.noSideEffect, 
    importcpp: "# < #", header: "Str.h".}
proc `[]`*(this: var UrString; index: cuint): var char {.importcpp: "#[@]", 
    header: "Str.h".}
proc `[]`*(this: UrString; index: cuint): char {.noSideEffect, 
    importcpp: "#[@]", header: "Str.h".}
proc at*(this: var UrString; index: cuint): var char {.importcpp: "At", 
    header: "Str.h".}
proc at*(this: UrString; index: cuint): char {.noSideEffect, importcpp: "At", 
    header: "Str.h".}
proc replace*(this: var UrString; replaceThis: char; replaceWith: char; 
              caseSensitive: bool = true) {.importcpp: "Replace", 
    header: "Str.h".}
proc replace*(this: var UrString; replaceThis: UrString; replaceWith: UrString; 
              caseSensitive: bool = true) {.importcpp: "Replace", 
    header: "Str.h".}
proc replace*(this: var UrString; pos: cuint; length: cuint; 
              replaceWith: UrString) {.importcpp: "Replace", header: "Str.h".}
proc replace*(this: var UrString; pos: cuint; length: cuint; 
              replaceWith: cstring) {.importcpp: "Replace", header: "Str.h".}
proc replace*(this: var UrString; start: Iterator; `end`: Iterator; 
              replaceWith: UrString): Iterator {.importcpp: "Replace", 
    header: "Str.h".}
proc replaced*(this: UrString; replaceThis: char; replaceWith: char; 
               caseSensitive: bool = true): UrString {.noSideEffect, 
    importcpp: "Replaced", header: "Str.h".}
proc replaced*(this: UrString; replaceThis: UrString; replaceWith: UrString; 
               caseSensitive: bool = true): UrString {.noSideEffect, 
    importcpp: "Replaced", header: "Str.h".}
proc append*(this: var UrString; str: UrString): var UrString {.
    importcpp: "Append", header: "Str.h".}
proc append*(this: var UrString; str: cstring): var UrString {.
    importcpp: "Append", header: "Str.h".}
proc append*(this: var UrString; c: char): var UrString {.importcpp: "Append", 
    header: "Str.h".}
proc append*(this: var UrString; str: cstring; length: cuint): var UrString {.
    importcpp: "Append", header: "Str.h".}
proc insert*(this: var UrString; pos: cuint; str: UrString) {.
    importcpp: "Insert", header: "Str.h".}
proc insert*(this: var UrString; pos: cuint; c: char) {.importcpp: "Insert", 
    header: "Str.h".}
proc insert*(this: var UrString; dest: Iterator; str: UrString): Iterator {.
    importcpp: "Insert", header: "Str.h".}
proc insert*(this: var UrString; dest: Iterator; start: Iterator; 
             `end`: Iterator): Iterator {.importcpp: "Insert", header: "Str.h".}
proc insert*(this: var UrString; dest: Iterator; c: char): Iterator {.
    importcpp: "Insert", header: "Str.h".}
proc erase*(this: var UrString; pos: cuint; length: cuint = 1) {.
    importcpp: "Erase", header: "Str.h".}
proc erase*(this: var UrString; it: Iterator): Iterator {.importcpp: "Erase", 
    header: "Str.h".}
proc erase*(this: var UrString; start: Iterator; `end`: Iterator): Iterator {.
    importcpp: "Erase", header: "Str.h".}
proc resize*(this: var UrString; newLength: cuint) {.importcpp: "Resize", 
    header: "Str.h".}
proc reserve*(this: var UrString; newCapacity: cuint) {.importcpp: "Reserve", 
    header: "Str.h".}
proc compact*(this: var UrString) {.importcpp: "Compact", header: "Str.h".}
proc clear*(this: var UrString) {.importcpp: "Clear", header: "Str.h".}
proc swap*(this: var UrString; str: var UrString) {.importcpp: "Swap", 
    header: "Str.h".}
proc begin*(this: var UrString): Iterator {.importcpp: "Begin", header: "Str.h".}
proc begin*(this: UrString): ConstIterator {.noSideEffect, importcpp: "Begin", 
    header: "Str.h".}
proc `end`*(this: var UrString): Iterator {.importcpp: "End", header: "Str.h".}
proc `end`*(this: UrString): ConstIterator {.noSideEffect, importcpp: "End", 
    header: "Str.h".}
proc front*(this: UrString): char {.noSideEffect, importcpp: "Front", 
                                    header: "Str.h".}
proc back*(this: UrString): char {.noSideEffect, importcpp: "Back", 
                                   header: "Str.h".}
proc substring*(this: UrString; pos: cuint): UrString {.noSideEffect, 
    importcpp: "Substring", header: "Str.h".}
proc substring*(this: UrString; pos: cuint; length: cuint): UrString {.
    noSideEffect, importcpp: "Substring", header: "Str.h".}
proc trimmed*(this: UrString): UrString {.noSideEffect, importcpp: "Trimmed", 
    header: "Str.h".}
proc toUpper*(this: UrString): UrString {.noSideEffect, importcpp: "ToUpper", 
    header: "Str.h".}
proc toLower*(this: UrString): UrString {.noSideEffect, importcpp: "ToLower", 
    header: "Str.h".}
proc split*(this: UrString; separator: char): Vector[UrString] {.noSideEffect, 
    importcpp: "Split", header: "Str.h".}
proc join*(this: var UrString; subStrings: Vector[UrString]; glue: UrString) {.
    importcpp: "Join", header: "Str.h".}
proc find*(this: UrString; str: UrString; startPos: cuint = 0; 
           caseSensitive: bool = true): cuint {.noSideEffect, importcpp: "Find", 
    header: "Str.h".}
proc find*(this: UrString; c: char; startPos: cuint = 0; 
           caseSensitive: bool = true): cuint {.noSideEffect, importcpp: "Find", 
    header: "Str.h".}
proc findLast*(this: UrString; str: UrString; startPos: cuint = npos; 
               caseSensitive: bool = true): cuint {.noSideEffect, 
    importcpp: "FindLast", header: "Str.h".}
proc findLast*(this: UrString; c: char; startPos: cuint = npos; 
               caseSensitive: bool = true): cuint {.noSideEffect, 
    importcpp: "FindLast", header: "Str.h".}
proc startsWith*(this: UrString; str: UrString; caseSensitive: bool = true): bool {.
    noSideEffect, importcpp: "StartsWith", header: "Str.h".}
proc endsWith*(this: UrString; str: UrString; caseSensitive: bool = true): bool {.
    noSideEffect, importcpp: "EndsWith", header: "Str.h".}
proc cString*(this: UrString): cstring {.noSideEffect, importcpp: "CString", 
    header: "Str.h".}
proc length*(this: UrString): cuint {.noSideEffect, importcpp: "Length", 
                                      header: "Str.h".}
proc capacity*(this: UrString): cuint {.noSideEffect, importcpp: "Capacity", 
                                        header: "Str.h".}
proc empty*(this: UrString): bool {.noSideEffect, importcpp: "Empty", 
                                    header: "Str.h".}
proc compare*(this: UrString; str: UrString; caseSensitive: bool = true): cint {.
    noSideEffect, importcpp: "Compare", header: "Str.h".}
proc compare*(this: UrString; str: cstring; caseSensitive: bool = true): cint {.
    noSideEffect, importcpp: "Compare", header: "Str.h".}
proc contains*(this: UrString; str: UrString; caseSensitive: bool = true): bool {.
    noSideEffect, importcpp: "Contains", header: "Str.h".}
proc contains*(this: UrString; c: char; caseSensitive: bool = true): bool {.
    noSideEffect, importcpp: "Contains", header: "Str.h".}
proc setUTF8FromLatin1*(this: var UrString; str: cstring) {.
    importcpp: "SetUTF8FromLatin1", header: "Str.h".}
proc setUTF8FromWChar*(this: var UrString; str: ptr WcharT) {.
    importcpp: "SetUTF8FromWChar", header: "Str.h".}
proc lengthUTF8*(this: UrString): cuint {.noSideEffect, importcpp: "LengthUTF8", 
    header: "Str.h".}
proc byteOffsetUTF8*(this: UrString; index: cuint): cuint {.noSideEffect, 
    importcpp: "ByteOffsetUTF8", header: "Str.h".}
proc nextUTF8Char*(this: UrString; byteOffset: var cuint): cuint {.noSideEffect, 
    importcpp: "NextUTF8Char", header: "Str.h".}
proc atUTF8*(this: UrString; index: cuint): cuint {.noSideEffect, 
    importcpp: "AtUTF8", header: "Str.h".}
proc replaceUTF8*(this: var UrString; index: cuint; unicodeChar: cuint) {.
    importcpp: "ReplaceUTF8", header: "Str.h".}
proc appendUTF8*(this: var UrString; unicodeChar: cuint): var UrString {.
    importcpp: "AppendUTF8", header: "Str.h".}
proc substringUTF8*(this: UrString; pos: cuint): UrString {.noSideEffect, 
    importcpp: "SubstringUTF8", header: "Str.h".}
proc substringUTF8*(this: UrString; pos: cuint; length: cuint): UrString {.
    noSideEffect, importcpp: "SubstringUTF8", header: "Str.h".}
proc toHash*(this: UrString): cuint {.noSideEffect, importcpp: "ToHash", 
                                      header: "Str.h".}
proc split*(str: cstring; separator: char): Vector[UrString] {.
    importcpp: "Urho3D::String::Split(@)", header: "Str.h".}
proc joined*(subStrings: Vector[UrString]; glue: UrString): UrString {.
    importcpp: "Urho3D::String::Joined(@)", header: "Str.h".}
proc encodeUTF8*(dest: cstring; unicodeChar: cuint) {.
    importcpp: "Urho3D::String::EncodeUTF8(@)", header: "Str.h".}
proc decodeUTF8*(src: cstring): cuint {.importcpp: "Urho3D::String::DecodeUTF8(@)", 
                                        header: "Str.h".}
proc cStringLength*(str: cstring): cuint {.
    importcpp: "Urho3D::String::CStringLength(@)", header: "Str.h".}
proc appendWithFormat*(this: var UrString; formatString: cstring): var UrString {.
    varargs, importcpp: "AppendWithFormat", header: "Str.h".}
proc appendWithFormatArgs*(this: var UrString; formatString: cstring; 
                           args: VaList): var UrString {.
    importcpp: "AppendWithFormatArgs", header: "Str.h".}
proc compare*(str1: cstring; str2: cstring; caseSensitive: bool): cint {.
    importcpp: "Urho3D::String::Compare(@)", header: "Str.h".}

proc +*(lhs: cstring; rhs: UrString): UrString {.inline.}

type 
  WString* {.importc: "Urho3D::WString", header: "Str.h".} = object 
    length* {.importc: "length_".}: cuint
    buffer* {.importc: "buffer_".}: ptr WcharT


proc constructWString*(): WString {.importcpp: "Urho3D::WString(@)", 
                                    header: "Str.h".}
proc constructWString*(str: UrString): WString {.
    importcpp: "Urho3D::WString(@)", header: "Str.h".}
proc destroyWString*(this: var WString) {.importcpp: "#.~WString()", 
    header: "Str.h".}
proc `[]`*(this: var WString; index: cuint): var WcharT {.importcpp: "#[@]", 
    header: "Str.h".}
proc `[]`*(this: WString; index: cuint): WcharT {.noSideEffect, 
    importcpp: "#[@]", header: "Str.h".}
proc at*(this: var WString; index: cuint): var WcharT {.importcpp: "At", 
    header: "Str.h".}
proc at*(this: WString; index: cuint): WcharT {.noSideEffect, importcpp: "At", 
    header: "Str.h".}
proc resize*(this: var WString; newLength: cuint) {.importcpp: "Resize", 
    header: "Str.h".}
proc empty*(this: WString): bool {.noSideEffect, importcpp: "Empty", 
                                   header: "Str.h".}
proc length*(this: WString): cuint {.noSideEffect, importcpp: "Length", 
                                     header: "Str.h".}
proc cString*(this: WString): ptr WcharT {.noSideEffect, importcpp: "CString", 
    header: "Str.h".}