#lang planet dyoo/simply-scheme:2:2

; I switched to #lang planet dyoo/simply-scheme:2:2 because the Scheme file I was using did not work correctly for the sentence? procedure

(define (type-of input)
  (cond ((number? input) 'NUMBER)
        ((sentence? input) 'SENTENCE)
        ((word? input) 'WORD)
        ((boolean? input) 'BOOLEAN)
        (else '(WHAT ARE YOU?!))))

(type-of '(getting better))
(type-of 'revolution)
(type-of (= 3 3))
(type-of 5)
(type-of #t)
(type-of empty?)