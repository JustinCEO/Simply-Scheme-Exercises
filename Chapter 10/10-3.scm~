#lang planet dyoo/simply-scheme:2:2


;;; ttt.scm
;;; Tic-Tac-Toe program

(define (ttt position me)
  (ttt-choose (find-triples position) me))

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

(define (ttt-choose triples me)
  (cond ((i-can-win? triples me))
        ((opponent-can-win? triples me))
        ((i-can-fork? triples me))
        ((i-can-advance? triples me))
        (else (best-free-square triples)) ))

(define (i-can-win? triples me)
  (choose-win
   (keep (lambda (triple) (my-pair? triple me))
         triples)))

(define (my-pair? triple me)
  (and (= (appearances me triple) 2)
       (= (appearances (opponent me) triple) 0)))

(define (opponent letter)
  (if (equal? letter 'x) 'o 'x))

(define (choose-win winning-triples)
  (if (empty? winning-triples)
      #f
      (keep number? (first winning-triples)) ))

(define (opponent-can-win? triples me)
  (i-can-win? triples (opponent me)) )

(define (i-can-fork? triples me)
  (first-if-any (pivots triples me)) )

(define (first-if-any sent)
  (if (empty? sent)
      #f
      (first sent) ))

(define (pivots triples me)
  (repeated-numbers (keep (lambda (triple) (my-single? triple me))
                          triples)))

(define (my-single? triple me)
  (and (= (appearances me triple) 1)
       (= (appearances (opponent me) triple) 0)))

(define (repeated-numbers sent)
  (every first
         (keep (lambda (wd) (>= (count wd) 2))
               (sort-digits (accumulate word sent)) )))

(define (sort-digits number-word)
  (every (lambda (digit) (extract-digit digit number-word))
         '(1 2 3 4 5 6 7 8 9) ))

(define (extract-digit desired-digit wd)
  (keep (lambda (wd-digit) (equal? wd-digit desired-digit)) wd))

(define (i-can-advance? triples me)
  (best-move (keep (lambda (triple) (my-single? triple me)) triples)
             triples
             me))

(define (best-move my-triples all-triples me)
  (if (empty? my-triples)
      #f
      (best-square (first my-triples) all-triples me) ))

(define (best-square my-triple triples me)
  (best-square-helper (pivots triples (opponent me))
		      (keep number? my-triple)))

(define (best-square-helper opponent-pivots pair)
  (if (member? (first pair) opponent-pivots)
      (first pair)
      (last pair)))

(define (best-free-square triples)
  (first-choice (accumulate word triples)
                '(5 1 3 7 9 2 4 6 8)))

(define (first-choice possibilities preferences)
  (first (keep (lambda (square) (member? square possibilities))
               preferences)))



; new stuff


(define (position-updater position me)
  (accumulate word (every (lambda (digit)
         (if (equal? digit (ttt position me)) me (item digit position)))
         '(1 2 3 4 5 6 7 8 9))))

(define (already-won? position letter)
  (member? (word letter letter letter)
           (find-triples position)))

;
;(define (triple-is-tie? triple me)
;  (and (not (empty? (keep number? triple)))
;       (<= (appearances me triple) 1)))




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


;version 4

;(define (tie-game? position me)
;(cond ((or (already-won? position me)
;           (already-won? position (opponent me))) #f)
;      ((and (equal? (appearances '_ position) 2)
;            (or (i-can-win? (find-triples position) me)
;                (opponent-can-win? (find-triples (position-updater position me)) me))) #f)
;     ((and (equal? (appearances '_ position) 1) (i-can-win? (find-triples position) me)) #f)
;     (else #t)))

; version 3

;(define (tie-game? position letter)
;(and (not (already-won? position letter))
;     (not (already-won? position (opponent letter)))
;     (and (equal? (appearances '_ position) 1) (not (already-won? (position-updater position letter) letter)))))



; newer version/version 2
;(define (tie-game? position letter)
;(and (not (already-won? position letter))
;     (not (already-won? position (opponent letter)))
;     (equal? 
;        (count (keep (lambda (triple) (free-space-is-present? triple letter))(find-triples position)))
;        (count (keep (lambda (triple) (triple-is-tie? triple letter)) (find-triples position))))))




  
; older version
;(define (tie-game? position letter)
;  (if (not (member? '_ position)) #t
;      (if (equal? (appearances '_ position) 1)
;        (equal? 
;        (count (keep (lambda (triple) (free-space-is-present? triple letter))(find-triples position)))
;        (count (keep (lambda (triple) (triple-is-tie? triple letter)) (find-triples position))))
;        #f)))

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


;(tie-game? 'xo_oox_xo 'x)
;#t
;(tie-game? 'xoxxooox_ 'x)
;#t
;(tie-game? 'xoxoooxxx 'x)
;#f
;(tie-game? 'xox_ooxx_ 'x)
;#f