#lang racket
(require "definitions/simply_redef.scm")


;Rewrite the following procedure using a cond instead of the ifs:

(define (sign number)
  (cond ((< number 0) 'negative)
        ((= number 0) 'zero)
	  (else 'positive)))