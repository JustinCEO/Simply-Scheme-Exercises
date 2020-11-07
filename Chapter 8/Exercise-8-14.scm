#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

; Write the procedure `subword` that takes three arguments: a word, a starting position number, and an ending position number. It should return the subword containing only the letters between the specified positions:


(define (subword wd start end)
  ((repeated bl (- (count wd) end)) ((repeated bf (- start 1)) wd)))

(subword 'polythene 5 8)
; THEN

