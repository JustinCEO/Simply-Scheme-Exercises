#lang planet dyoo/simply-scheme:2:2


;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.


;Write prepend-every:


(define (prepend-every prefix sent)
  (every (lambda (wd) (word prefix wd)) sent))

(prepend-every 's '(he aid he aid))
;(SHE SAID SHE SAID)

(prepend-every 'anti '(dote pasto gone body))
;(ANTIDOTE ANTIPASTO ANTIGONE ANTIBODY)

