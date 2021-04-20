#lang planet dyoo/simply-scheme:2:2

;Write a procedure true-for-all-pairs? that takes a predicate and a sentence as arguments. The predicate must accept two words as its arguments. Your procedure should return #t if the argument predicate will return true for every two adjacent words in the sentence:

;(true-for-all-pairs? equal? '(a b c c d))
;#F

;(true-for-all-pairs? equal? '(a a a a a))
;#T

;(true-for-all-pairs? < '(20 16 5 8 6))
;#F

;(true-for-all-pairs? < '(3 7 19 22 43))
;#T


(define (true-for-all-pairs? fn input)
  (if (empty? (cddr input))
      (fn (car input)(cadr input))
      (and (fn (car input)(cadr input))
          (true-for-all-pairs? fn (cdr input)))))

