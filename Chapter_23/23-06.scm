#lang planet dyoo/simply-scheme:2:2

(define (vector-map! fn vec)
  (vmap-helper fn vec 0 ))


(define (vmap-helper fn vec index)
  (if (= index (vector-length vec)) vec
      (begin
      (vector-set! vec index (fn (vector-ref vec index)))
      (vmap-helper fn vec (+ 1 index)))))


;test vector and function

(define (add2 input)
  (+ 2 input))

(define z (make-vector 5 0))