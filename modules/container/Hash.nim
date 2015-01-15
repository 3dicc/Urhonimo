


proc makeHash*[T](value: ptr T): cuint

proc makeHash*[T](value: ptr T): cuint

proc makeHash*[T](value: T): cuint

proc makeHash*[](value: pointer): cuint {.inline.}

proc makeHash*[](value: pointer): cuint {.inline.}

proc makeHash*[](value: clonglong): cuint {.inline.}

proc makeHash*[](value: culonglong): cuint {.inline.}

proc makeHash*[](value: cint): cuint {.inline.}

proc makeHash*[](value: cuint): cuint {.inline.}

proc makeHash*[](value: cshort): cuint {.inline.}

proc makeHash*[](value: cushort): cuint {.inline.}

proc makeHash*[](value: char): cuint {.inline.}

proc makeHash*[](value: cuchar): cuint {.inline.}