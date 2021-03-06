#lang planet dyoo/simply-scheme:2:2



;Write a predicate `true-for-all?` that takes two arguments, a predicate procedure and a sentence. It should return `#t` if the predicate argument returns true for *every* word in the sentence.

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))


(define (true-for-all? proc sent)
  (equal? (count (keep proc sent))(count sent)))



(true-for-all? even? '(2 4 6 8))
;#T

(true-for-all? even? '(2 6 3 4))
;#F
