#lang planet dyoo/simply-scheme:2:2

; Write length.

(define (my-length lst)
  (if (null? lst) 0
  (+ 1 (my-length (cdr lst)))))