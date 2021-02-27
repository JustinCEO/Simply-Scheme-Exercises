#lang planet dyoo/simply-scheme:2:2

; > Implement `append` using `car`, `cdr`, and `cons`. (Note: The built-in `append` can take any number of arguments. First write a version that accepts only two arguments. Then, optionally, try to write a version that takes any number.)



(define (append2 L1 L2)
(if (null? L1) L2
(append2 (butlast L1) (cons (last L1) L2))))


(define (append3 lst . rest)
(if (null? rest) lst
    (apply append3 (append2 lst (car rest)) (cdr rest))))


