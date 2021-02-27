#lang planet dyoo/simply-scheme:2:2

;Write a procedure `branch` that takes as arguments a list of numbers and a nested list structure.


(define (branch num lst)
(if (equal? (length num) 1)
    (list-ref lst (- (car num) 1))
    (branch (cdr num) (list-ref lst (- (car num) 1)))))



(branch '(3) '((a b) (c d) (e f) (g h)))
;(E F)


(branch '(3 2) '((a b) (c d) (e f) (g h)))
;F

(branch '(2 3 1 2) '((a b) ((c d) (e f) ((g h) (i j)) k) (l m)))

;H