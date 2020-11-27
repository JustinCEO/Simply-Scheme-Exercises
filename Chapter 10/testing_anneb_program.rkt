#lang planet dyoo/simply-scheme:2:2

 (define (full-squares? position)
      (empty? (keep (lambda (square) (equal? square '_)) position)) )

(define (find-triples position)
  (every (lambda (comb) (substitute-triple comb position))
         '(123 456 789 147 258 369 159 357)))

(define (substitute-triple combination position)
  (accumulate word
	      (every (lambda (square)
		       (substitute-letter square position))
		     combination) ))

(define (already-won? position me)
      (not (empty? (keep (lambda (triple) (equal? (word me me me) triple)) (find-triples position)))) )



 (define (full-squares-tie-game? position)
      (and (not (already-won? position 'x))
                 (not (already-won? position 'o))
                 (full-squares? position) ))

(define (one-empty-square-tie-game? position)
      (and (equal? 1 (count (keep (lambda (square) (equal? square '_)) position)))
                 (full-squares-tie-game? (every (lambda (square) (if (equal? square '_) 'x square)) position))
                 (full-squares-tie-game? (every (lambda (square) (if (equal? square '_) 'o square)) position)) ))


(define (numbers-of-empty-squares position)
      (keep number? (substitute-position position)))

(define (finish-last-two-OX position)
      (accumulate word (every (lambda (square)
          (cond ((equal? (item (first (numbers-of-empty-squares position)) position) square) 'o)
                       ((equal? (item (last (numbers-of-empty-squares position)) position) square) 'x)
                       (else square) ))
                                              position) ))


(define (substitute-letter square position)
  (if (equal? '_ (item square position))
      square
      (item square position) ))

 (define (substitute-position position)
      (accumulate word (every (lambda (square) (substitute-letter square position)) '123456789)) )



(define (two-empty-squares-tie-game? position)
      (and (equal? 2 (count (keep (lambda (square) (equal? square '_)) position)))
                 (tie-game? (finish-last-two-XO (substitute-position position)))
                 (tie-game? (finish-last-two-OX (substitute-position position))) ))




(define (finish-last-two-XO position)
      (accumulate word (every (lambda (square)
          (cond ((equal? (item (first (numbers-of-empty-squares position)) position) square) 'x)
                       ((equal? (item (last (numbers-of-empty-squares position)) position) square) 'o)
                       (else square) ))
                                             position) ))







(define (tie-game? position)
      (or (full-squares-tie-game? position)
             (one-empty-square-tie-game? position)
             (two-empty-squares-tie-game? position) ))


(tie-game? 'xoxoox_x_)
;xox
;oox
;_x_