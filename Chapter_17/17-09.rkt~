#lang planet dyoo/simply-scheme:2:2

; > Implement `append` using `car`, `cdr`, and `cons`. (Note: The built-in `append` can take any number of arguments. First write a version that accepts only two arguments. Then, optionally, try to write a version that takes any number.)

(define (member2 arg lst)
  (if (null? lst) #f 
  (if (equal? arg (car lst)) lst
      (member2 arg (cdr lst)))))


;I wrote a variant using cond as well

(define (member3 arg lst)
  (cond ((null? lst) #f)
        ((equal? arg (car lst)) lst)
        (else (member3 arg (cdr lst)))))
