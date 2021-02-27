#lang planet dyoo/simply-scheme:2:2


; What if the diagonals didn’t win?


(define (find-triples position)
  (every (lambda (comb) (substitute-triple comb position))
         '(123 456 789 147 258 369)))
