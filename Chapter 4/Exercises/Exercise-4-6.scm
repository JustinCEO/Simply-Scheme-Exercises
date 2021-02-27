#lang racket
(require "definitions/simply_redef.scm")

; Define a procedure `fourth` that computes the fourth power of its argument. Do this two ways, first using the multiplication function, and then using `square` and not (directly) using multiplication.

(define (square x)
  (* x x))

(define (fourth1 number)
  (* number (* number (* number (* number)))))


(define (fourth2 number)
  (square (square number)))
