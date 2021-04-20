#lang planet dyoo/simply-scheme:2:2

;19.8  Rewrite true-for-all-pairs? (Exercise 19.7) using true-for-any-pair? (Exercise 19.6) as a helper procedure. Don't use recursion in solving this problem (except for the recursion you've already used to write true-for-any-pair?). Hint: You'll find the not procedure helpful.




(define (true-for-any-pair? fn input)
  (if (empty? (cddr input))
      (fn (car input)(cadr input))
      (or (fn (car input)(cadr input))
          (true-for-any-pair? fn (cdr input)))))


(define (not-empty? input)
  (not (empty? input)))

(define (remove-empty lst)
  (filter not-empty? lst))

(define (make-pair arg1 arg2)
  (if (empty? arg2) '()
      (list arg1 arg2)))


(define (true-for-all-pairs? fn input)
  (let ((secondlist (append (cdr input) '(()))))
  (andmap (lambda (arg) (true-for-any-pair? fn arg))
          (remove-empty (map make-pair input secondlist)
                             ))))


