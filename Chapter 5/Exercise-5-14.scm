#lang racket
(require "definitions/simply_redef.scm")

(define (square number)
  (* number number))


; Write a procedure third that selects the third letter of a word (or the third word of a sentence).

(define (third arg)
  (first (butfirst (butfirst arg))))