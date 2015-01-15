

import 
  swap, vectorBase

var QUICKSORT_THRESHOLD* {.importc: "QUICKSORT_THRESHOLD", header: "Sort.h".}: cint = 16


proc insertionSort*[T](begin: RandomAccessIterator[T]; 
                       `end`: RandomAccessIterator[T])

proc insertionSort*[T, U](begin: RandomAccessIterator[T]; 
                          `end`: RandomAccessIterator[T]; compare: U)

proc initialQuickSort*[T](begin: RandomAccessIterator[T]; 
                          `end`: RandomAccessIterator[T])

proc initialQuickSort*[T, U](begin: RandomAccessIterator[T]; 
                             `end`: RandomAccessIterator[T]; compare: U)

proc sort*[T](begin: RandomAccessIterator[T]; `end`: RandomAccessIterator[T])

proc sort*[T, U](begin: RandomAccessIterator[T]; `end`: RandomAccessIterator[T]; 
                 compare: U)