

import 
  vectorBase


type 
  Vector* {.importc: "Urho3D::Vector", header: "Vector.h".}[T] = object of VectorBase
  
  VIterator* {.importc: "Urho3D::Vector::Iterator", header: "Vector.h".}[T] = RandomAccessIterator[T]
  ConstVIterator* {.importc: "Urho3D::Vector::ConstIterator", header: "Vector.h".}[T] = RandomAccessConstIterator[T]

proc constructVector*[T](): Vector[T] {.importcpp: "Urho3D::Vector(@)", 
                                        header: "Vector.h".}
proc constructVector*[T](size: cuint): Vector[T] {.
    importcpp: "Urho3D::Vector(@)", header: "Vector.h".}
proc constructVector*[T](data: ptr T; size: cuint): Vector[T] {.
    importcpp: "Urho3D::Vector(@)", header: "Vector.h".}
proc constructVector*[T](vector: Vector[T]): Vector[T] {.
    importcpp: "Urho3D::Vector(@)", header: "Vector.h".}
proc destroyVector*[T](this: var Vector[T]) {.importcpp: "#.~Vector()", 
    header: "Vector.h".}
proc `+=`*[T](this: var Vector[T]; rhs: T) {.importcpp: "# += #", 
    header: "Vector.h".}
proc `+=`*[T](this: var Vector[T]; rhs: Vector[T]) {.importcpp: "# += #", 
    header: "Vector.h".}
proc `+`*[T](this: Vector[T]; rhs: T): Vector[T] {.noSideEffect, 
    importcpp: "# + #", header: "Vector.h".}
proc `+`*[T](this: Vector[T]; rhs: Vector[T]): Vector[T] {.noSideEffect, 
    importcpp: "# + #", header: "Vector.h".}
proc `==`*[T](this: Vector[T]; rhs: Vector[T]): bool {.noSideEffect, 
    importcpp: "# == #", header: "Vector.h".}
proc `[]`*[T](this: var Vector[T]; index: cuint): var T {.importcpp: "#[@]", 
    header: "Vector.h".}
proc `[]`*[T](this: Vector[T]; index: cuint): T {.noSideEffect, 
    importcpp: "#[@]", header: "Vector.h".}
proc at*[T](this: var Vector[T]; index: cuint): var T {.importcpp: "At", 
    header: "Vector.h".}
proc at*[T](this: Vector[T]; index: cuint): T {.noSideEffect, importcpp: "At", 
    header: "Vector.h".}
proc push*[T](this: var Vector[T]; value: T) {.importcpp: "Push", 
    header: "Vector.h".}
proc push*[T](this: var Vector[T]; vector: Vector[T]) {.importcpp: "Push", 
    header: "Vector.h".}
proc pop*[T](this: var Vector[T]) {.importcpp: "Pop", header: "Vector.h".}
proc insert*[T](this: var Vector[T]; pos: cuint; value: T) {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var Vector[T]; pos: cuint; vector: Vector[T]) {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var Vector[T]; dest: VIterator[T]; value: T): VIterator[T] {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var Vector[T]; dest: VIterator[T]; vector: Vector[T]): VIterator[T] {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var Vector[T]; dest: VIterator[T]; start: ConstVIterator[T]; 
                `end`: ConstVIterator[T]): VIterator[T] {.importcpp: "Insert", 
    header: "Vector.h".}
proc insert*[T](this: var Vector[T]; dest: VIterator[T]; start: ptr T; `end`: ptr T): VIterator[T] {.
    importcpp: "Insert", header: "Vector.h".}
proc erase*[T](this: var Vector[T]; pos: cuint; length: cuint = 1) {.
    importcpp: "Erase", header: "Vector.h".}
proc erase*[T](this: var Vector[T]; it: VIterator[T]): VIterator[T] {.
    importcpp: "Erase", header: "Vector.h".}
proc erase*[T](this: var Vector[T]; start: VIterator[T]; `end`: VIterator[T]): VIterator[T] {.
    importcpp: "Erase", header: "Vector.h".}
proc remove*[T](this: var Vector[T]; value: T): bool {.importcpp: "Remove", 
    header: "Vector.h".}
proc clear*[T](this: var Vector[T]) {.importcpp: "Clear", header: "Vector.h".}
proc resize*[T](this: var Vector[T]; newSize: cuint) {.importcpp: "Resize", 
    header: "Vector.h".}
proc reserve*[T](this: var Vector[T]; newCapacity: cuint) {.
    importcpp: "Reserve", header: "Vector.h".}
proc compact*[T](this: var Vector[T]) {.importcpp: "Compact", header: "Vector.h".}
proc find*[T](this: var Vector[T]; value: T): VIterator[T] {.importcpp: "Find", 
    header: "Vector.h".}
proc find*[T](this: Vector[T]; value: T): ConstVIterator[T] {.noSideEffect, 
    importcpp: "Find", header: "Vector.h".}
proc contains*[T](this: Vector[T]; value: T): bool {.noSideEffect, 
    importcpp: "Contains", header: "Vector.h".}
proc begin*[T](this: var Vector[T]): VIterator[T] {.importcpp: "Begin", 
    header: "Vector.h".}
proc begin*[T](this: Vector[T]): ConstVIterator[T] {.noSideEffect, 
    importcpp: "Begin", header: "Vector.h".}
proc `end`*[T](this: var Vector[T]): VIterator[T] {.importcpp: "End", 
    header: "Vector.h".}
proc `end`*[T](this: Vector[T]): ConstVIterator[T] {.noSideEffect, importcpp: "End", 
    header: "Vector.h".}
proc front*[T](this: var Vector[T]): var T {.importcpp: "Front", 
    header: "Vector.h".}
proc front*[T](this: Vector[T]): T {.noSideEffect, importcpp: "Front", 
                                     header: "Vector.h".}
proc back*[T](this: var Vector[T]): var T {.importcpp: "Back", 
    header: "Vector.h".}
proc back*[T](this: Vector[T]): T {.noSideEffect, importcpp: "Back", 
                                    header: "Vector.h".}
proc size*[T](this: Vector[T]): cuint {.noSideEffect, importcpp: "Size", 
                                        header: "Vector.h".}
proc capacity*[T](this: Vector[T]): cuint {.noSideEffect, importcpp: "Capacity", 
    header: "Vector.h".}
proc empty*[T](this: Vector[T]): bool {.noSideEffect, importcpp: "Empty", 
                                        header: "Vector.h".}

type 
  PODVector* {.importc: "Urho3D::PODVector", header: "Vector.h".}[T] = object of VectorBase
  PodIterator* {.importc: "Urho3D::PODVector::Iterator", header: "Vector.h".}[T] = RandomAccessIterator[T]
  ConstPodIterator* {.importc: "Urho3D::PODVector::ConstIterator", header: "Vector.h".}[T] = RandomAccessConstIterator[T]

proc constructPODVector*[T](): PODVector[T] {.importcpp: "Urho3D::PODVector(@)", 
    header: "Vector.h".}
proc constructPODVector*[T](size: cuint): PODVector[T] {.
    importcpp: "Urho3D::PODVector(@)", header: "Vector.h".}
proc constructPODVector*[T](data: ptr T; size: cuint): PODVector[T] {.
    importcpp: "Urho3D::PODVector(@)", header: "Vector.h".}
proc constructPODVector*[T](vector: PODVector[T]): PODVector[T] {.
    importcpp: "Urho3D::PODVector(@)", header: "Vector.h".}
proc destroyPODVector*[T](this: var PODVector[T]) {.importcpp: "#.~PODVector()", 
    header: "Vector.h".}
proc `+=`*[T](this: var PODVector[T]; rhs: T) {.importcpp: "# += #", 
    header: "Vector.h".}
proc `+=`*[T](this: var PODVector[T]; rhs: PODVector[T]) {.importcpp: "# += #", 
    header: "Vector.h".}
proc `+`*[T](this: PODVector[T]; rhs: T): PODVector[T] {.noSideEffect, 
    importcpp: "# + #", header: "Vector.h".}
proc `+`*[T](this: PODVector[T]; rhs: PODVector[T]): PODVector[T] {.
    noSideEffect, importcpp: "# + #", header: "Vector.h".}
proc `==`*[T](this: PODVector[T]; rhs: PODVector[T]): bool {.noSideEffect, 
    importcpp: "# == #", header: "Vector.h".}
proc `[]`*[T](this: var PODVector[T]; index: cuint): var T {.importcpp: "#[@]", 
    header: "Vector.h".}
proc `[]`*[T](this: PODVector[T]; index: cuint): T {.noSideEffect, 
    importcpp: "#[@]", header: "Vector.h".}
proc at*[T](this: var PODVector[T]; index: cuint): var T {.importcpp: "At", 
    header: "Vector.h".}
proc at*[T](this: PODVector[T]; index: cuint): T {.noSideEffect, 
    importcpp: "At", header: "Vector.h".}
proc push*[T](this: var PODVector[T]; value: T) {.importcpp: "Push", 
    header: "Vector.h".}
proc push*[T](this: var PODVector[T]; vector: PODVector[T]) {.importcpp: "Push", 
    header: "Vector.h".}
proc pop*[T](this: var PODVector[T]) {.importcpp: "Pop", header: "Vector.h".}
proc insert*[T](this: var PODVector[T]; pos: cuint; value: T) {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var PODVector[T]; pos: cuint; vector: PODVector[T]) {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var PODVector[T]; dest: PodIterator[T]; value: T): PodIterator[T] {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var PODVector[T]; dest: PodIterator[T]; vector: PODVector[T]): PodIterator[T] {.
    importcpp: "Insert", header: "Vector.h".}
proc insert*[T](this: var PODVector[T]; dest: PodIterator[T]; start: ConstPodIterator[T]; 
                `end`: ConstPodIterator[T]): PodIterator[T] {.importcpp: "Insert", 
    header: "Vector.h".}
proc insert*[T](this: var PODVector[T]; dest: PodIterator[T]; start: ptr T; 
                `end`: ptr T): PodIterator[T] {.importcpp: "Insert", 
    header: "Vector.h".}
proc erase*[T](this: var PODVector[T]; pos: cuint; length: cuint = 1) {.
    importcpp: "Erase", header: "Vector.h".}
proc erase*[T](this: var PODVector[T]; it: PodIterator[T]): PodIterator[T] {.
    importcpp: "Erase", header: "Vector.h".}
proc erase*[T](this: var PODVector[T]; start: PodIterator[T]; `end`: PodIterator[T]): PodIterator[T] {.
    importcpp: "Erase", header: "Vector.h".}
proc remove*[T](this: var PODVector[T]; value: T): bool {.importcpp: "Remove", 
    header: "Vector.h".}
proc clear*[T](this: var PODVector[T]) {.importcpp: "Clear", header: "Vector.h".}
proc resize*[T](this: var PODVector[T]; newSize: cuint) {.importcpp: "Resize", 
    header: "Vector.h".}
proc reserve*[T](this: var PODVector[T]; newCapacity: cuint) {.
    importcpp: "Reserve", header: "Vector.h".}
proc compact*[T](this: var PODVector[T]) {.importcpp: "Compact", 
    header: "Vector.h".}
proc find*[T](this: var PODVector[T]; value: T): PodIterator[T] {.importcpp: "Find", 
    header: "Vector.h".}
proc find*[T](this: PODVector[T]; value: T): ConstPodIterator[T] {.noSideEffect, 
    importcpp: "Find", header: "Vector.h".}
proc contains*[T](this: PODVector[T]; value: T): bool {.noSideEffect, 
    importcpp: "Contains", header: "Vector.h".}
proc begin*[T](this: var PODVector[T]): PodIterator[T] {.importcpp: "Begin", 
    header: "Vector.h".}
proc begin*[T](this: PODVector[T]): ConstPodIterator[T] {.noSideEffect, 
    importcpp: "Begin", header: "Vector.h".}
proc `end`*[T](this: var PODVector[T]): PodIterator[T] {.importcpp: "End", 
    header: "Vector.h".}
proc `end`*[T](this: PODVector[T]): ConstPodIterator[T] {.noSideEffect, 
    importcpp: "End", header: "Vector.h".}
proc front*[T](this: var PODVector[T]): var T {.importcpp: "Front", 
    header: "Vector.h".}
proc front*[T](this: PODVector[T]): T {.noSideEffect, importcpp: "Front", 
                                        header: "Vector.h".}
proc back*[T](this: var PODVector[T]): var T {.importcpp: "Back", 
    header: "Vector.h".}
proc back*[T](this: PODVector[T]): T {.noSideEffect, importcpp: "Back", 
                                       header: "Vector.h".}
proc size*[T](this: PODVector[T]): cuint {.noSideEffect, importcpp: "Size", 
    header: "Vector.h".}
proc capacity*[T](this: PODVector[T]): cuint {.noSideEffect, 
    importcpp: "Capacity", header: "Vector.h".}
proc empty*[T](this: PODVector[T]): bool {.noSideEffect, importcpp: "Empty", 
    header: "Vector.h".}