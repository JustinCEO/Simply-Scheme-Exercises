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

(define (reciprocal number)
  (/ 1 number))

(define (scientific number power-of-ten)
  (* number (expt 10 power-of-ten)))

(define (sci-coefficient number)
  (if (>= number 1) ; based on the examples they used, I thought something like "well for the stuff I want to use a sci-coefficient function on that's greater than 1, it'll probably be a big number, so I want to do one kind of thing to it, and then for the stuff less than 1, that may be something like 0.00042, so I'll want to do something else)
      (/ number (expt 10 (- (count number) 1))) ; for numbers greater than 1, this divides the actual argument number by 10 raised to power of (the number of characters in the actual argument number minus 1). So e.g. for 7300 it divides 7300 by 10^(4-1), or (10^3), or 1000. This generates the desired coefficient.
      (* number (expt 10 (- (count number) 2))))) ; For numbers less than 1, this multiplies the actual argument number by 10 raised to the power of (the number of characters in the actual argument number minus 2). So e.g. 0.00042 has 7 characters, so it gets multiplied by 10^(7-2) or (10^5) or 100000, producing 42.

(define (sci-exponent number)
  (if (> (reciprocal number) 1)
      (- (expt 10 (count number)) (/ number (sci-coefficient number)) 1)
      (- (* -1 (appearances 0 number)) 1)))


; test cases
; (sci-coefficient 0.00042) ; should return 4.2 or 42. PASSES

; (sci-coefficient 0.034) ; should return 3.4 or 34. PASSES

; (sci-coefficient 7300) ; should return 7.3 or 73. PASSES

; (sci-coefficient 1.05) ; should return the same value, 1.05. FAILS

; (sci-exponent 7000) ; should return 3

; (sci-exponent 7300) ; should return

; (sci-exponent 1.05) ; should return 1


(define (sci-exponent n)

