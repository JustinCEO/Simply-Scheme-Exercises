#lang racket
(require "definitions/simply_redef.scm")

; Write a procedure to convert a temperature from Fahrenheit to Celsius, and another to convert in the other direction. The two formulas are F=9⁄5C+32 and C=5⁄9(F-32).

(define (fahrenheit-to-celsius fahrenheit-temp)
  (* 5/9 (- fahrenheit-temp 32)))

(define (celsius-to-fahrenheit celsius-temp)
  (+ 32 (* 9/5 celsius-temp)))

