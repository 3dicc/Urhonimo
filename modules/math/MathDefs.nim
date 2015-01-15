

import 
  random

var M_PI* {.importc: "M_PI", header: "MathDefs.h".}: cfloat = 3.141592653589793

var M_HALF_PI* {.importc: "M_HALF_PI", header: "MathDefs.h".}: cfloat = m_Pi *
    0.5

var M_MIN_INT* {.importc: "M_MIN_INT", header: "MathDefs.h".}: cint = 0x80000000

var M_MAX_INT* {.importc: "M_MAX_INT", header: "MathDefs.h".}: cint = 0x7FFFFFFF

var M_MIN_UNSIGNED* {.importc: "M_MIN_UNSIGNED", header: "MathDefs.h".}: cuint = 0x00000000

var M_MAX_UNSIGNED* {.importc: "M_MAX_UNSIGNED", header: "MathDefs.h".}: cuint = 0xFFFFFFFF

var M_EPSILON* {.importc: "M_EPSILON", header: "MathDefs.h".}: cfloat = 1e-006

var M_LARGE_EPSILON* {.importc: "M_LARGE_EPSILON", header: "MathDefs.h".}: cfloat = 5e-005

var M_MIN_NEARCLIP* {.importc: "M_MIN_NEARCLIP", header: "MathDefs.h".}: cfloat = 0.01

var M_MAX_FOV* {.importc: "M_MAX_FOV", header: "MathDefs.h".}: cfloat = 160.0

var M_LARGE_VALUE* {.importc: "M_LARGE_VALUE", header: "MathDefs.h".}: cfloat = 100000000.0

var M_INFINITY* {.importc: "M_INFINITY", header: "MathDefs.h".}: cfloat = cast[cfloat](huge_Val)

var M_DEGTORAD* {.importc: "M_DEGTORAD", header: "MathDefs.h".}: cfloat = cast[cfloat](m_Pi div
    180.0)

var M_DEGTORAD_2* {.importc: "M_DEGTORAD_2", header: "MathDefs.h".}: cfloat = cast[cfloat](m_Pi div
    360.0)


var M_RADTODEG* {.importc: "M_RADTODEG", header: "MathDefs.h".}: cfloat = 1.0 div
    m_Degtorad


type 
  Intersection* = enum 
    OUTSIDE, INTERSECTS, INSIDE



proc equals*(lhs: cfloat; rhs: cfloat): bool {.inline.}

proc isNaN*(value: cfloat): bool {.inline.}

proc lerp*(lhs: cfloat; rhs: cfloat; t: cfloat): cfloat {.inline.}

proc min*(lhs: cfloat; rhs: cfloat): cfloat {.inline.}

proc max*(lhs: cfloat; rhs: cfloat): cfloat {.inline.}

proc abs*(value: cfloat): cfloat {.inline.}

proc sign*(value: cfloat): cfloat {.inline.}

proc clamp*(value: cfloat; min: cfloat; max: cfloat): cfloat {.inline.}

proc smoothStep*(lhs: cfloat; rhs: cfloat; t: cfloat): cfloat {.inline.}

proc sin*(angle: cfloat): cfloat {.inline.}

proc cos*(angle: cfloat): cfloat {.inline.}

proc tan*(angle: cfloat): cfloat {.inline.}

proc asin*(x: cfloat): cfloat {.inline.}

proc acos*(x: cfloat): cfloat {.inline.}

proc atan*(x: cfloat): cfloat {.inline.}

proc atan2*(y: cfloat; x: cfloat): cfloat {.inline.}

proc min*(lhs: cint; rhs: cint): cint {.inline.}

proc max*(lhs: cint; rhs: cint): cint {.inline.}

proc abs*(value: cint): cint {.inline.}

proc clamp*(value: cint; min: cint; max: cint): cint {.inline.}

proc isPowerOfTwo*(value: cuint): bool {.inline.}

proc nextPowerOfTwo*(value: cuint): cuint {.inline.}

proc countSetBits*(value: cuint): cuint {.inline.}

proc sDBMHash*(hash: cuint; c: cuchar): cuint {.inline.}

proc random*(): cfloat {.inline.}

proc random*(range: cfloat): cfloat {.inline.}

proc random*(min: cfloat; max: cfloat): cfloat {.inline.}

proc random*(range: cint): cint {.inline.}

proc random*(min: cint; max: cint): cint {.inline.}

proc randomNormal*(meanValue: cfloat; variance: cfloat): cfloat {.inline.}