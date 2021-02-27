#lang planet dyoo/simply-scheme:2:2

(define (differences num-sent)
  (if (= (count num-sent) 2)
      (- (first (bf num-sent)) (first num-sent))
      (se (- (first (bf num-sent)) (first num-sent))
          (differences (bf num-sent)))))

;test

(differences '(4 23 9 87 6 12))
