#lang racket
(require "definitions/simply_redef.scm")


;Write a procedure to compute the tip you should leave at a restaurant. It should take the total bill as its argument and return the amount of the tip. It should tip by 15%, but it should know to round up so that the total amount of money you leave (tip plus original bill) is a whole number of dollars. (Use the ceiling procedure to round up.)

;> (tip 19.98)
;3.02

;> (tip 29.23)
;4.77

;> (tip 7.54)
;1.46


(define (tip bill)
 (- (ceiling (* 1.15 bill)) bill)) ; This finds the diference between a rounded off number for 115% of the bill and 100% of the bill.
