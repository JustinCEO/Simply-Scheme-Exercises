#lang planet dyoo/simply-scheme:2:2

(define (remdup sent)
  (cond ((empty? sent) '())
        ((member? (first sent) (bf sent))
         (remdup (bf sent)))
        (else (se (first sent) (remdup (bf sent))))))

;test

(remdup '(ob la di ob la da))
