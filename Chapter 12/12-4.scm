#lang planet dyoo/simply-scheme:2:2

(define (f sent)
  (if (empty? sent) sent
      (sentence (f (bf sent)) (first sent))))

(f '(four score and seven years ago))

;the procedure reverses sentences!
