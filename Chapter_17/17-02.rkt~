#lang planet dyoo/simply-scheme:2:2



(define (deep-pigl structure)
  (cond ((word? structure) (pigl structure))
	((null? structure) '())
	(else (cons (deep-pigl (car structure))
		    (deep-pigl (cdr structure))))))