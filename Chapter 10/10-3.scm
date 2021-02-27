#lang planet dyoo/simply-scheme:2:2


;;; you need to run in the context of ttt.scm procedures

; new stuff


(define (position-updater position me)
  (accumulate word (every (lambda (digit)
         (if (equal? digit (ttt position me)) me (item digit position)))
         '(1 2 3 4 5 6 7 8 9))))

(define (already-won? position letter)
  (member? (word letter letter letter)
           (find-triples position)))



;version 5

(define (tie-game? position me)
  (let ((underscores (appearances '_ position)))
  (cond
      ((or (already-won? position 'x)
           (already-won? position 'o)) #f)
      ((and (= underscores 2)
            (or (i-can-win? (find-triples position) me)
                (opponent-can-win? (find-triples (position-updater position me)) me))) #f)
      ((and (= underscores 1) (i-can-win? (find-triples position) me)) #f)
     (else #t))))



;tests
(tie-game? 'xoxoxoxo_ 'x)
;f - x won
;xox
;oxo
;xo_

(tie-game? 'xoxoxoo__ 'x)
;#f - x can win
;xox
;oxo
;o__


(tie-game? 'xoxxooox_ 'o)
;t - o can't win
;xox
;xoo
;ox_

(tie-game? 'oxoxoxxo_ 'o)
;f - o can win
;oxo
;xox
;xo_


(tie-game? 'oxoxoxoxo 'o)
;#f - o won
;oxo
;xox
;oxo


(tie-game? 'xoxoxoxo_ 'o)
;#f - opponent x won
;xox
;oxo
;xo_

(tie-game? 'xoxoox_x_ 'o)
;t

(tie-game? '_oxxxoox_ 'o)
;t
