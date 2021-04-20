#lang planet dyoo/simply-scheme:2:2

; Write a procedure true-for-any-pair? that takes a predicate and a sentence
; as arguments. The predicate must accept two words as its arguments. Your procedure
; should return #t if the argument predicate will return true for any two adjacent words
; in the sentence:
;
; > (true-for-any-pair? equal? '(a b c b a))
; #F
;
; > (true-for-any-pair? equal? '(a b c c d))
; #T
;
; > (true-for-any-pair? < '(20 16 5 8 6))
; #T


(define (true-for-any-pair? fn input)
  (if (empty? (cddr input))
      (fn (car input)(cadr input))
      (or (fn (car input)(cadr input))
          (true-for-any-pair? fn (cdr input)))))

