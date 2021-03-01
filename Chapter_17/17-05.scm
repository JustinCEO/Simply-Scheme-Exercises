#lang planet dyoo/simply-scheme:2:2

; Here's a procedure that takes two numbers as arguments and returns whichever number is larger:

(define (max2 a b)
  (if (> b a) b a))

;Use max2 to implement max, a procedure that takes one or more numeric arguments and returns the largest of them.



(define (max number . rest-of-numbers)
(cond ((null? rest-of-numbers) number)
      (else (apply max (max2 number (car rest-of-numbers)) (cdr rest-of-numbers)))))
