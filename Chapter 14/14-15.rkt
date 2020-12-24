#lang planet dyoo/simply-scheme:2:2


(define (smaller-num-first? num1 num2)
  (if (< num1 num2) #t #f))


(define (merge sent1 sent2)
  (cond ((and (empty? sent1) (empty? sent2)) '())
        ((empty? sent1) sent2)
        ((empty? sent2) sent1)
        ((smaller-num-first? (first sent1) (first sent2)) (se (first sent1) (merge (bf sent1) sent2)))
        (else (se (first sent2) (merge sent1 (bf sent2))))))

(trace merge)
(trace smaller-num-first?)



(merge '(4 7 18 40 99) '(3 6 9 12 24 36 50))
;(3 4 6 7 9 12 18 24 36 40 50 99)

(merge '(4 7 18 40 99) '(3 6 9 12 24 36 50 100))
;(3 4 6 7 9 12 18 24 36 40 50 99)

(merge '() '())