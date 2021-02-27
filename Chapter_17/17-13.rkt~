#lang planet dyoo/simply-scheme:2:2

; Write a procedure called flatten that takes as its argument a list, possibly including sublists, but whose ultimate building blocks are words (not Booleans or procedures). It should return a sentence containing all the words of the list, in the order in which they appear in the original:


(define (flatten structure)
  (if (word? structure)  structure
      (reduce se (map (lambda (sublist) (flatten sublist))
		   structure))))

(trace flatten)

(flatten '(((a b) c (d e)) (f g) ((((h))) (i j) k)))

;(A B C D E F G H I J K)