#lang planet dyoo/simply-scheme:2:2

(define (plural wd)
  (cond
        ((equal? (word (last (bl wd))(last wd)) 'is)(word (bl (bl wd))'es))
        ((member? (word (last (bl wd))(last wd)) '(sh ch)) (word wd 'es))
        ((member? (word (last (bl wd))(last wd)) '(ay ey iy oy)) (word wd 's))
        ((equal? (last wd) 'y) (word (bl wd) 'ies))
        ((member? (last wd) '(s x z)) (word wd 'es))
        (else (word wd 's))))

(define (pf sent)
  (plural (first sent)))

(define (second input)
  (first (bf input)))

(define (third input)
  (first (bf (bf input))))

(define (fourth input)
  (first (bf (bf (bf input)))))

(define (before-num? num1 num2)
  (< num1 num2))

(define (remove-once wd sent)
  (cond ((empty? sent) '())
((equal? wd (first sent)) (bf sent))
(else (se (first sent) (remove-once wd (bf sent))))))

(define (earliest-helper so-far rest) ; so-far refers to the earliest word at this point in our analysis
  (cond ((empty? rest) so-far) ; if rest is empty then that means so-far was the earliest word in the sentence so we should return it
    ((before-num? so-far (first rest))
     (earliest-helper so-far (bf rest)))
    (else (earliest-helper (first rest) (bf rest)))))

(define (earliest-word sent)
  (earliest-helper (first sent) (bf sent)))

(define (sort sent)
  (if (empty? sent)
  '()
  (se (earliest-word sent) ; provides sentence with the first word in the current sentence as an argument
  (sort (remove-once (earliest-word sent) sent))))) ; recursively calls sort with sentence with word that comes first removed


(define (count-suit suit hand)
(appearances suit (accumulate word hand)))

(define (count-suits hand)
      (every (lambda (suit) (count-suit suit hand)) '(s h c d)) )




(define (get-flush-suit suit-counts)
  (cond ((= (first suit-counts) 5) 'spades)
        ((= (second suit-counts) 5) 'hearts)
        ((= (third suit-counts) 5) 'clubs)
        ((= (fourth suit-counts) 5) 'diamonds)
        (else "")))



(define (flush? flush-name)
  (not (empty? flush-name)))


(define (num-to-word num)
 (item num '(one two three four)))


(define (computed-ranks-to-sent computed-ranks list-of-ranks)
  (cond ((empty? list-of-ranks) '())
        ((equal? 0 (first computed-ranks)) (computed-ranks-to-sent (bf computed-ranks) (bf list-of-ranks)))
        (else (se (num-to-word (first computed-ranks)) (first list-of-ranks)
                  (computed-ranks-to-sent (bf computed-ranks) (bf list-of-ranks))))))

(define (compute-rank rank handranks)
  (appearances rank (accumulate word handranks)))

(define (compute-ranks-helper hand)
(every (lambda (rank) (compute-rank rank hand))'(a 2 3 4 5 6 7 8 9 10 j q k)))

(define (compute-ranks hand)
  (computed-ranks-to-sent
  (compute-ranks-helper hand)
  '(a 2 3 4 5 6 7 8 9 10 j q k)))

(define (card-rank-to-name letter)
  (cond ((member? letter '(a 1 14)) 'ace)
        ((equal? letter '2) 'two)
        ((equal? letter '3) 'three)
        ((equal? letter '4) 'four)
        ((equal? letter '5) 'five)
        ((equal? letter '6) 'six)
        ((equal? letter '7) 'seven)
        ((equal? letter '8) 'eight)
        ((equal? letter '9) 'nine)
        ((equal? letter '10) 'ten)
        ((member? letter '(j 11)) 'jack)
        ((member? letter '(q 12)) 'queen)
        ((member? letter '(k 13)) 'king)
        (else 'idk)))


(define (computed-ranks-names number computed-ranks)
  (cond
    ((empty? computed-ranks) '())
     ((equal? number (first computed-ranks))
      (se (card-rank-to-name (second computed-ranks))
          (computed-ranks-names number (bf (bf computed-ranks)))))
     (else (se (computed-ranks-names number (bf (bf computed-ranks)))))))


(define (convert-rank rank)
(cond ((equal? rank 'a) '(1 14))
      ((equal? rank 'k) 13)
      ((equal? rank 'q) 12)
      ((equal? rank 'j) 11)
      (else rank)))


(define (convert-all-ranks ranks)
(every convert-rank ranks))

(define (hand-ranks hand)
  (se (every (lambda (card) (bf card)) hand)))


(define (sort-ranks hand)
(sort (convert-all-ranks (hand-ranks hand))))


(define (five-in-a-row? five-cards)
  (= (item 1 five-cards)
     (- (item 2 five-cards) 1)
     (- (item 3 five-cards) 2)
     (- (item 4 five-cards) 3)
     (- (item 5 five-cards) 4)))


(define (straight? sorted-ranks) ;semipredicate
  (cond ((< (count sorted-ranks) 5) #f)
        ((five-in-a-row? ((repeated bl (- (count sorted-ranks) 5)) sorted-ranks)) ((repeated bl (- (count sorted-ranks) 5)) sorted-ranks))
        (else (straight? (bf sorted-ranks)))))


(define (broadway? sorted-ranks)
  (and
    (equal? (last sorted-ranks) 14)
    (equal? (last (bl sorted-ranks)) 13)
    (equal? (last (bl (bl sorted-ranks))) 12)
    (equal? (last (bl (bl (bl sorted-ranks)))) 11)
    (equal? (last (bl (bl (bl (bl sorted-ranks))))) 10)))


(define (full-house? 3cards 2cards)
  (and (equal? (count 3cards) 1)
       (equal? (count 2cards) 1)))

(define (highcard straight)
  (word (card-rank-to-name (last straight)) '-high))


(define (poker-value hand)
(let ((sorted-ranks (sort-ranks hand))
     (suit-counts (count-suits hand))
     (computed-ranks (compute-ranks hand))
      )
  (let ((flush-suit (get-flush-suit suit-counts))
        (4cards (computed-ranks-names 'four computed-ranks))
        (3cards (computed-ranks-names 'three computed-ranks))
        (2cards (computed-ranks-names 'two computed-ranks))
        (straighthand (straight? sorted-ranks)))
(cond
      ((and (flush? flush-suit)      ;royal flush
           (broadway? sorted-ranks))
        (se '(royal flush -) flush-suit))
      ((and (straight? sorted-ranks)  ;straight flush
            (flush? flush-suit))
      (se (highcard straighthand)
                '(straight flush)))
      ((equal? (count 4cards) 1) ;four-of-a-kind
       (se '(four of a kind -) (pf 4cards)))
      ((full-house? 3cards 2cards)  ;full house
       (se '(full house -)
           (pf 3cards)
           'over
           (pf 2cards)))
      ((flush? flush-suit);flush
       (se '(flush - )
                         flush-suit))
      ((straight? sorted-ranks)            ;straight
       (se (highcard straighthand) 'straight))
      ((equal? (count 3cards) 1) ;three-of-a-kind
       (se '(three of a kind -) (pf 3cards)))
      ((equal? (count 2cards) 2)    ;two-pair
       (se '(two pair - )
           (se (pf 2cards)
               'and
               (plural (second 2cards))
               )))
      ((equal? (count 2cards) 1) ;pair
       (se '(pair of) (pf 2cards)))
      (else '(nothing))))))

;tests

(poker-value '(dq d10 dj da dk))
;royal flush - diamonds
(poker-value '(h2 h3 h4 h6 h5))
;six-high straight flush
(poker-value '(ha ca sa da hq))
;four of a kind - aces
(poker-value '(h2 d2 c2 h3 d3))
;full house - twos over threes
(poker-value '(h3 d3 c3 h2 d2))
;full house - threes over twos
(poker-value '(ha da ca hq cq))
;full house - aces over queens
(poker-value '(h2 h3 h5 h6 h7))
;flush - hearts
(poker-value '(ca h2 d3 s4 c5))
;five-high straight
(poker-value '(h4 c4 d4 d5 d6))
;three of a kind - fours
(poker-value '(h4 c4 d3 h6 d6))
;two pair - fours and sixes
(poker-value '(h2 c2 c3 c4 c5))
; pair of twos
(poker-value '(c2 h4 h6 h8 hj))
