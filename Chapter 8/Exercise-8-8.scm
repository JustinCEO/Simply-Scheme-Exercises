#lang planet dyoo/simply-scheme:2:2

; Write an `exaggerate` procedure which exaggerates sentences:


;It should double all the numbers in the sentence, and it should replace "good" with "great," "bad" with "terrible," and anything else you can think of.

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))


(define (hyperbole wd)
  (cond ((number? wd) (* 2 wd))
        ((equal? wd 'good) 'great)
        ((equal? wd 'bad) 'terrible)
        (else wd)))


(define (exaggerate sent)
  (every hyperbole sent))



(exaggerate '(i ate 3 potstickers))
;(I ATE 6 POTSTICKERS)

(exaggerate '(the chow fun is good here))
;(THE CHOW FUN IS GREAT HERE)
