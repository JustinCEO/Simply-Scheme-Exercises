#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))




(define (letter-count sent-arg)
  (accumulate + (every count sent-arg)))


; Write a procedure `letter-count` that takes a sentence as its argument and returns the total number of letters in the sentence:
 (letter-count '(fixing a hole))
; 11


