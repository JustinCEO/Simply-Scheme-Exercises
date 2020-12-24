#lang planet dyoo/simply-scheme:2:2

(define (square num)
  (* num num))

(define (is-square? num1 num2)
  (if (equal? (square num1) num2) #t #f))

(define (progressive-squares? sent)
  (if (<= (count sent) 1) #t
  (and (is-square? (first sent) (first (bf sent))) (progressive-squares? (bf sent)))))

(progressive-squares? '(3 9 81 6561))
;#T

(progressive-squares? '(25 36 49 64))
;#F

(progressive-squares? '())