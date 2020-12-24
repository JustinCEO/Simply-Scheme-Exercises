#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiou))

(define (contains-vowel? wd)
  (cond ((member? 'a wd) #t)
        ((member? 'e wd) #t)
        ((member? 'i wd) #t)
        ((member? 'o wd) #t)
        ((member? 'u wd) #t)
        (else #f)))


(define (pigl wd)
(if (or
     (not (contains-vowel? wd))
     (vowel? (first wd)))
     (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))




(pigl 'frzzmlpt)

(pigl 'hammer)