#lang planet dyoo/simply-scheme:2:2

(define (odds sent)
  (cond ((= (count sent) 0) '())
        ((= (count sent) 1) sent)
        (else (se (first sent) (odds (bf (bf sent)))))))



(odds '(i lost my little girl))

(odds '(i lost my potato))