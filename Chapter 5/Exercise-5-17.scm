#lang racket
(require "definitions/simply_redef.scm")

;Write a procedure knight that takes a person's name as its argument and returns the name with "Sir" in front of it.

(define (knight name)
  (se 'sir name))