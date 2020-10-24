#lang racket
(require "definitions/simply_redef.scm")


; Define a procedure discount that takes two arguments: an item's initial price and a percentage discount. It should return the new price:

;> (discount 10 5)
;9.50

;> (discount 29.90 50)
;14.95


(define (discount original-price percentage-reduction)
  (- original-price (* original-price (/ percentage-reduction 100))))