#lang racket
(require "definitions/simply_redef.scm")

(define (square number)
  (* number number))


; Write a procedure third that selects the third letter of a word (or the third word of a sentence).

(define (first-two word-arg)
  (word (first word-arg) (first (bf word-arg))))