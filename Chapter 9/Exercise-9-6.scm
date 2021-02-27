#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.


;  Write a procedure sentence-version that takes a function f as its argument and returns a function g. f should take a single word as argument. g should take a sentence as argument and return the sentence formed by applying f to each word of that argument.



(define (sentence-version func)
  (lambda (sent)
    (every (lambda (wd) (func wd)) sent)))
