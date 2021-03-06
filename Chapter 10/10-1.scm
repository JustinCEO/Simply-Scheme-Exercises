#lang planet dyoo/simply-scheme:2:2

;my own solution built on stuff from ttt.scm
; necessary procedures from ttt
(define (find-triples position)
  (every (lambda (comb) (substitute-triple comb position))
         '(123 456 789 147 258 369 159 357)))

(define (substitute-triple combination position)
  (accumulate word
	      (every (lambda (square)
		       (substitute-letter square position))
		     combination) ))

(define (substitute-letter square position)
  (if (equal? '_ (item square position))
      square
      (item square position) ))


;my hard, complicated procedure:

(define (already-won2? position me)
  (i-have-won (find-triples position) me))

(define (my-win? triple me)
  (and (= (appearances me triple) 3)))

(define (i-have-won triples me)
  (return-true-if-winner
   (keep (lambda (triple) (my-win? triple me))
         triples)))

(define (return-true-if-winner winning-triples)
  (if (not (empty? winning-triples))
      #t #f))


; mine wass bad enough that i present buntine's simple procedure for comparison:
(define (already-won? position letter)
  (member? (word letter letter letter)
           (find-triples position)))



(already-won? 'xxxoxooo_ 'x)
;#t
(already-won? 'xxxoxooo_ 'o)
;#f
(already-won? 'xoxxo____ 'x)
;#f
(already-won? 'xoxxo____ 'o)
;#f



(already-won2? 'xxxoxooo_ 'x)
;#t
(already-won2? 'xxxoxooo_ 'o)
;#f
(already-won2? 'xoxxo____ 'x)
;#f
(already-won2? 'xoxxo____ 'o)
;#f
