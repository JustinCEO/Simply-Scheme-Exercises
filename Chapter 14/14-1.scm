#lang planet dyoo/simply-scheme:2:2

(define (remove-once wd-to-remove sent)
  (cond ((empty? sent) '())
        ((equal? wd-to-remove (first sent)) (bf sent))
        (else (se (first sent) (remove-once wd-to-remove (bf sent))))))

;tests

(remove-once 'morning '(good morning good morning))
;(good good morning)


(remove-once 'marning '(good morning good morning))
;'(good morning good morning)
