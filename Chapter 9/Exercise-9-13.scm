#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;Write a procedure compose that takes two functions f and g as arguments. It should return a new function, the composition of its input functions, which computes f(g(x)) when passed the argument x.


(define (compose f g)
  (lambda (arg) (f (g arg))))

((compose sqrt abs) -25)
;5

(define second (compose first bf))

(second '(higher order function))
;ORDER

    