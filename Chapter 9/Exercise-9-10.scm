#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

; In Chapter 2 we used a function called appearances that returns the number of times its first argument appears as a member of its second argument. Implement appearances.

(define (appearances2 arg1 arg2)
  (accumulate + (every (lambda (arg2-element) (if (equal? arg1 arg2-element) 1 0)) arg2)))


(appearances2 7 'potato7potato7potato7)
; 3

(appearances2 34 'potato34potato34potato34potato3)
;0

(appearances2 9 89989)
; 3

(appearances2 'p 'pppp)
;4

(appearances2 'd '(d d))
;2

(appearances2 'd '(dd d))
; 1