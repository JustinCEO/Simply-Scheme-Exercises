#lang planet dyoo/simply-scheme:2:2

(define (member2? element list)
  (cond ((empty? list) #f)
        ((equal? element (first list)) #t)
        (else (member2? element (bf list)))))

;tests

(member? 'a '(a b c d e f))

(member2? 'a '(a b c d e f))

(member? 'a 'apple)

(member2? 'a 'apple)

(member? 'a '(bed apple banana))

(member2? 'a '(bed apple banana))
