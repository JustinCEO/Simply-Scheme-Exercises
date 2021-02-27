#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

;Write a procedure choose-beatles that takes a predicate function as its argument and returns a sentence of just those Beatles (John, Paul, George, and Ringo) that satisfy the predicate. For example:

(define (ends-vowel? wd) (vowel? (last wd)))

(define (even-count? wd) (even? (count wd)))


(define (choose-beatles procedure)
  (keep procedure '(JOHN PAUL GEORGE RINGO)))

(choose-beatles ends-vowel?)
;(GEORGE RINGO)

(choose-beatles even-count?)
;(JOHN PAUL GEORGE)