#lang planet dyoo/simply-scheme:2:2

;Write a predicate `valid-infix?` that takes a list as argument and returns `#t` if and only if the list is a legitimate infix arithmetic expression (alternating operands and operators, with parentheses-that is, sublists-allowed for grouping).


(define (operator? value)
  (if (list? value) #f
  (member? value '(+ / * -))))

(define (flatten structure)
  (if (or (operator? structure)(word? structure))  structure
      (reduce se (map (lambda (sublist) (flatten sublist))
		   structure))))


(define (valid-infix-helper flat-lst)
(cond ((and (equal? (length flat-lst) 1)
            (number? (car flat-lst))) #t)
      ((and (number? (car flat-lst))
            (operator? (cadr flat-lst)))
       (valid-infix-helper (cddr flat-lst)))
      (else #f)))

(define (valid-infix? lst)
(valid-infix-helper (flatten lst)))

;tests

(valid-infix? '(4 + 3 * (5 - 2)))

(valid-infix? '(4 + 3 * (5 2)))

(trace flatten)
(valid-infix? '(9 + 8 * (7 / 6) - (5 * (4 / 3) - 2) * 1))
