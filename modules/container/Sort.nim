

import 
  vectorBase

var QUICKSORT_THRESHOLD* {.importc: "QUICKSORT_THRESHOLD", header: "Sort.h".}: cint = 16


proc insertionSort*[T](begin: RandomAccessIterator[T]; 
                       `end`: RandomAccessIterator[T]){.noSideEffect,
  importcpp: "Urho3D::InsertionSort(@)", header: "Sort.h".}

proc insertionSort*[T, U](begin: RandomAccessIterator[T]; 
                          `end`: RandomAccessIterator[T]; compare: U){.noSideEffect,
  importcpp: "Urho3D::InsertionSort(@)", header: "Sort.h".}

proc initialQuickSort*[T](begin: RandomAccessIterator[T]; 
                          `end`: RandomAccessIterator[T]){.noSideEffect,
  importcpp: "Urho3D::InitialQuickSort(@)", header: "Sort.h".}

proc initialQuickSort*[T, U](begin: RandomAccessIterator[T]; 
                             `end`: RandomAccessIterator[T]; compare: U){.noSideEffect,
  importcpp: "Urho3D::InitialQuickSort(@)", header: "Sort.h".}

proc sort*[T](begin: RandomAccessIterator[T]; `end`: RandomAccessIterator[T]){.noSideEffect,
  importcpp: "Urho3D::Sort(@)", header: "Sort.h".}

proc sort*[T, U](begin: RandomAccessIterator[T]; `end`: RandomAccessIterator[T]; 
                 compare: U){.noSideEffect,
  importcpp: "Urho3D::Sort(@)", header: "Sort.h".}
