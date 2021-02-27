#lang racket
(require "definitions/simply_redef.scm")

;"Scientific notation" is a way to represent very small or very large numbers by combining a medium-sized number with a power of 10. For example, 5×107 represents the number 50000000, while 3.26×10-9 represents 0.00000000326 in scientific notation. Write a procedure scientific that takes two arguments, a number and an exponent of 10, and returns the corresponding value:

;> (scientific 7 3)
;7000

;> (scientific 42 -5)
;0.00042
;Some versions of Scheme represent fractions in a/b form, and some use scientific notation, so you might see 21/50000 or 4.2E-4 as the result of the last example instead of 0.00042, but these are the same value.

;(A harder problem for hotshots: Can you write procedures that go in the other direction? So you'd have

;> (sci-coefficient 7000)
;7

;> (sci-exponent 7000)
;3
;You might find the primitive procedures log and floor helpful.)

(define (log10 n)
  (/ (log n) (log 10)))

(define (sci-exponent number)
  (floor (log10 number)))

(define (sci-coefficient number)
(/ number (expt 10 (sci-exponent number))))

  



; test cases

(sci-coefficient 0.00042)
; should return 4.2 or 42. PASSES

(sci-coefficient 0.034)
;should return 3.4 or 34. PASSES with caveat that it's returning some extra precision in the number for some reason

(sci-coefficient 7300)
; should return 7.3 or 73. PASSES

(sci-coefficient 1.05)
; should return the same value, 1.05. PASSES

(sci-exponent 7000)
; should return 3. PASSES

(sci-exponent 7300)
; should return 3. PASSES

(sci-exponent 1.05)
; should return 0. PASSES

(sci-exponent 15)
; should return 1. PASSES

(sci-exponent 0.00042)
; should return -4. PASSES
