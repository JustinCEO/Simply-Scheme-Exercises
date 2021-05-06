#lang planet dyoo/simply-scheme:2:2

(define (vector-fill2! vec fill-value)
  (fill-helper vec fill-value 0))

(define (fill-helper vec fill-value index)
  (if (= index (vector-length vec)) vec
      (begin (vector-set! vec index fill-value)
             (fill-helper vec fill-value (+ 1 index)))))
