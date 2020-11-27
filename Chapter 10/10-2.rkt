#lang planet dyoo/simply-scheme:2:2

; necessary procedures from ttt
(define (opponent letter)
  (if (equal? letter 'x) 'o 'x))



(define (tie-game? position letter)
  (equal? (+ (appearances letter position)(appearances (opponent letter) position)) 9))


(define (tie-game2? position)
  (not (member? '_ position)))