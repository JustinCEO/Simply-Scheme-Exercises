#lang planet dyoo/simply-scheme:2:2

(define (letter-count sent)
  (if (empty? sent) 0
      (+ (count (first sent)) (letter-count (bf sent)))))


(letter-count '(fixing a hole))

(letter-count "")