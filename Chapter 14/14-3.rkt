#lang planet dyoo/simply-scheme:2:2

(define (remdup sent)
  (cond ((empty? sent) '())
        ((member? (first sent) (bf sent))
         (remdup (bf sent)))
        (else (se (first sent) (remdup (bf sent))))))


(remdup '(ob la di ob la da))              ;; remove duplicates
;(OB LA DI DA)
;(It's okay if your procedure returns (DI OB LA DA) instead, as long as it removes all but one instance of each duplicated word.)

