#lang planet dyoo/simply-scheme:2:2

;Write `expand`, which takes a sentence as its argument. It returns a sentence similar to the argument, except that if a number appears in the argument, then the return value contains that many copies of the following word:

(define (expand-helper num wd)
  (if (= num 0) '()
      (se wd (expand-helper (- num 1) wd))))


(define (expand sent)
  (cond ((empty? sent) '())
        ((number? (first sent))
         (se (expand-helper (first sent) (first (bf sent))) (expand (bf (bf sent)))))
        (else (se (first sent) (expand (bf sent))))))


;tests

(expand '(4 calling birds 3 french hens))
;(CALLING CALLING CALLING CALLING BIRDS FRENCH FRENCH FRENCH HENS)

(expand '(the 7 samurai))
;(THE SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI)
