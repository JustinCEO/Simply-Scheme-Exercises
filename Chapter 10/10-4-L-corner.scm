#lang planet dyoo/simply-scheme:2:2



; What if you could win a game by having three squares forming an L shape in a corner, such as squares 1, 2, and 4?

(define (find-triples position)
  (every (lambda (comb) (substitute-triple comb position))
         '(123 456 789 147 258 369 159 357 124 236 478 698)))
