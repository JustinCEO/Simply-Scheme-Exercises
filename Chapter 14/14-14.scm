#lang planet dyoo/simply-scheme:2:2

(define (same-shape? sent1 sent2)
  (cond ((and (empty? sent1) (empty? sent2)) #t)
        ((or (empty? sent1) (empty? sent2)) #f)
        ((not (equal? (count (first sent1)) (count (first sent2)))) #f)
        (else (same-shape? (bf sent1) (bf sent2)))))


;tests

(same-shape? '(the fool on the hill) '(you like me too much))
;#T

(same-shape? '(the fool on the hill) '(and your bird can sing))
;#F


(same-shape? '(potato) '())
