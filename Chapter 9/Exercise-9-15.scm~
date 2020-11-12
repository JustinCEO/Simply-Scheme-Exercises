#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;Write a procedure substitute that takes three arguments, two words and a sentence. It should return a version of the sentence, but with every instance of the second word replaced with the first word:



(define (substitute wd1 wd2 sent)
  (every (lambda (sent-wd) (if (equal? sent-wd wd2) wd1 sent-wd)) sent))


(substitute 'maybe 'yeah '(she loves you yeah yeah yeah))
;(SHE LOVES YOU MAYBE MAYBE MAYBE)
