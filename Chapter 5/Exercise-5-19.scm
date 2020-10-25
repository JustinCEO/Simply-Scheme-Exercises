#lang racket
(require "definitions/simply_redef.scm")

;Write a procedure insert-and that takes a sentence of items and returns a new sentence with an "and" in the right place:

;> (insert-and '(john bill wayne fred joey))
;(JOHN BILL WAYNE FRED AND JOEY)


(define (insert-and input-sent)
  (se (butlast input-sent) 'and (last input-sent)))
