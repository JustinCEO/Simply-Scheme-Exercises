#lang planet dyoo/simply-scheme:2:2


;  Write a procedure numbers that takes a sentence as its argument and returns another sentence containing only the numbers in the argument:


(define (numbers sent)
  (cond ((empty? sent) '())
        ((number? (first sent)) (se (first sent) (numbers (bf sent))))
        (else (numbers (bf sent)))))

;test case
(numbers '(76 trombones and 110 cornets))
;(76 110)
