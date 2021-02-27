#lang planet dyoo/simply-scheme:2:2


; For each of the following examples, write a procedure of two arguments that, when applied to the sample arguments, returns the sample result. Your procedures may not include any quoted data.


;(f1 '(a b c) '(d e f))
;((B C D))

(define (f1 lst1 lst2)
(append (cdr lst1) (list (car lst2))))

(f1 '(a b c) '(d e f))


(define (f2 lst1 lst2)
(list (cdr lst1) (cadr lst2)))

(f2 '(a b c) '(d e f))
;((B C) E)

(define (f3 lst1 lst2)
(append lst1 lst1))


(f3 '(a b c) '(d e f))
;(A B C A B C)


(define (f4 lst1 lst2)
(list (list (car lst1) (car lst2))
      (append (cdr lst1) (cdr lst2))))

(f4 '(a b c) '(d e f))
;((A D) (B C E F))




