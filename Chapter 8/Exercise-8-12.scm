#lang planet dyoo/simply-scheme:2:2



;When you teach a class, people will get distracted if you say "um" too many times. Write a count-ums that counts the number of times "um" appears in a sentence:


(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

(define (um? wd)
  (if (equal? wd 'um) 1 0))

(define (count-ums sent)
  (accumulate + (every um? sent)))


(count-ums '(today um we are going to um talk about functional um programming))

;3
