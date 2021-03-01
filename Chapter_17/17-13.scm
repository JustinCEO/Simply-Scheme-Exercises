#lang planet dyoo/simply-scheme:2:2

;Here is a procedure that counts the number of words anywhere within a structured list:

;(define (deep-count lst)
;  (cond ((null? lst) 0)
;	((word? (car lst)) (+ 1 (deep-count (cdr lst))))
;	(else (+ (deep-count (car lst))
;		 (deep-count (cdr lst))))))

;Although this procedure works, it's more complicated than necessary. Simplify it.



(define (deep-count structure)
  (if (word? structure)  1
      (reduce + (map (lambda (sublist) (deep-count sublist))
		   structure))))

(trace deep-count)


;test

(deep-count '(((a b) c (d e)) (f g) ((((h))) (i j) k)))
;11
