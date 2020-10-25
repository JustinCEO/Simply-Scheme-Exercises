#lang racket
(require "definitions/simply_redef.scm")

;Define a procedure to find somebody's middle names:
;
;> (middle-names '(james paul mccartney))
;(PAUL)
;
;> (middle-names '(john ronald raoul tolkien))
;(RONALD RAOUL)
;
;> (middle-names '(bugs bunny))
;()
;
;> (middle-names '(peter blair denis bernard noone))
;(BLAIR DENIS BERNARD)

(define (middle-names name)
  (bf (bl name)))