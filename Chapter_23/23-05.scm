#lang planet dyoo/simply-scheme:2:2

; Write a procedure vector-map that takes two arguments, a function and a vector, and returns a new vector in
; which each box contains the result of applying the function to the corresponding element of the argument vector.

(define (vector-map fn vec)
  (vmap-helper fn vec 0 (make-vector (vector-length vec))))


(define (vmap-helper fn oldvec index newvec)
  (if (= index (vector-length oldvec)) newvec
      (begin
      (vector-set! newvec index (fn (vector-ref oldvec index)))
      (vmap-helper fn oldvec (+ 1 index) newvec))))


;test vector and function

(define (add2 input)
  (+ 2 input))

(define z (make-vector 5 0))