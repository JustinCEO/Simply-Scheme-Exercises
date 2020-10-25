#lang racket
(require "definitions/simply_redef.scm")

;Try the following and explain the result:

;(define (ends word)
 ; (word (first word) (last word)))

;fixed:

(define (ends wd)
  (word (first wd) (last wd)))