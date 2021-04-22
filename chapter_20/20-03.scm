#lang planet dyoo/simply-scheme:2:2

; Define show in terms of newline and display.

(define (myshow input)
  (display input) (newline))
