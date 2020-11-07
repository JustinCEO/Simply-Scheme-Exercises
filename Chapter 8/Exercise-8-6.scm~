#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

;Write a procedure transform-beatles that takes a procedure as an argument, applies it to each of the Beatles, and returns the results in a sentence:

(define (amazify name)
  (word 'the-amazing- name))

(define (transform-beatles procedure)
  (every procedure '(JOHN PAUL GEORGE RINGO)))

(transform-beatles amazify)
;(THE-AMAZING-JOHN THE-AMAZING-PAUL THE-AMAZING-GEORGE THE-AMAZING-RINGO)

(transform-beatles butfirst)
;(OHN AUL EORGE INGO)

