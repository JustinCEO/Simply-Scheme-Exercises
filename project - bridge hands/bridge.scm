#lang planet dyoo/simply-scheme:2:2


(define (card-val card)
  (cond ((equal? (bf card) 'a) 4)
        ((equal? (bf card) 'k) 3)
        ((equal? (bf card) 'q) 2)
        ((equal? (bf card) 'j) 1)
        (else 0)))

(define (high-card-points hand)
  (accumulate + (every card-val hand)))


(define (count-suit suit sent)
(appearances suit (accumulate word sent)))

(define (suit-counts sent)
(se (count-suit 's sent)
    (count-suit 'h sent)
    (count-suit 'c sent)
    (count-suit 'd sent)))

(define (suit-dist-points cards_in_suit)
(cond ((equal? cards_in_suit 2) 1)
      ((equal? cards_in_suit 1) 2)
      ((equal? cards_in_suit 0) 3)
      (else 0)))

(define (hand-dist-points hand)
  (accumulate + (every suit-dist-points (suit-counts hand))))

(define (bridge-val hand)
  (+ (hand-dist-points hand)
     (high-card-points hand)))
