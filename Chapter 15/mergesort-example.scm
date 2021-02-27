#lang planet dyoo/simply-scheme:2:2


(define (merge sent1 sent2)
  (cond ((and (empty? sent1) (empty? sent2)) '())
        ((empty? sent1) sent2)
        ((empty? sent2) sent1)
        ((< (first sent1) (first sent2)) (se (first sent1) (merge (bf sent1) sent2)))
        (else (se (first sent2) (merge sent1 (bf sent2))))))


(define (mergesort sent)
  (if (<= (count sent) 1)
      sent
      (merge (mergesort (one-half sent))
             (mergesort (other-half sent)))))


