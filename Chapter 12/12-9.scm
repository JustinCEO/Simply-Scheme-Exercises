#lang planet dyoo/simply-scheme:2:2


; Write a procedure real-words that takes a sentence as argument and returns all the "real" words of the sentence, using the same rule as the real-word? procedure from Chapter 1.


(define (real-word? wd)
  (not (member? wd '(a the an in of and for to with))))

(define (real-words sent)
  (cond ((empty? sent) '())
        ((real-word? (first sent)) (se (first sent) (real-words (bf sent))))
        (else (real-words (bf sent)))))

;test case

(real-words '(United States of America))
