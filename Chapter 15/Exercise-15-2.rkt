#lang planet dyoo/simply-scheme:2:2



(define (palindrome-helper wd)
  (cond ((<= (count wd) 1) #t)
        ((not (equal? (first wd)(last wd))) #f)
         (else (palindrome-helper (bl (bf wd))))))


(define (palindrome? sent)
  (palindrome-helper (accumulate word sent)))




(trace palindrome-helper)

(trace palindrome?)


(palindrome? '(flee to me remote elf))


(palindrome? '(flee to me remote control))

(palindrome? '())

(palindrome? '(e))
