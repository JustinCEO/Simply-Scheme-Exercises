#lang racket
(require "definitions/simply_redef.scm")

; Write a procedure two-first that takes two words as arguments, returning a two-letter word containing the first letters of the two arguments.

(define (two-first word-arg1 word-arg2)
  (word (first word-arg1)(first word-arg2)))

;Now write a procedure two-first-sent that takes a two-word sentence as argument, returning a two-letter word containing the first letters of the two words.

(define (two-first-sent sent-arg)
  (word (first (first sent-arg))(first (last sent-arg))))