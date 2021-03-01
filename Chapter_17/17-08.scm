#lang planet dyoo/simply-scheme:2:2

; Write member.

(define (member2 arg lst)
  (if (null? lst) #f
  (if (equal? arg (car lst)) lst
      (member2 arg (cdr lst)))))


;I wrote a variant using cond as well

(define (member3 arg lst)
  (cond ((null? lst) #f)
        ((equal? arg (car lst)) lst)
        (else (member3 arg (cdr lst)))))
