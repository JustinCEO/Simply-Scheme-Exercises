#lang planet dyoo/simply-scheme:2:2

; Write deep-reduce, similar to tree-reduce, but for structured lists:


(define lat?
  (lambda (l)
   (cond
    ((null? l) #t)
    ((atom? (car l)) (lat? (cdr l)))
    (else #f))))

(define atom?
  (lambda (x)
    (and (not (pair? x))
         (not (null? x)))))


(define (deep-reduce fn lst)
  (cond
    ((atom? lst) lst)
    (else (fn (deep-reduce fn (car lst))
              (deep-reduce-helper fn (cdr lst))))))

(define (deep-reduce-helper fn lst)
  (cond
    ((lat? lst)(apply fn lst))
    (else (fn (deep-reduce fn (car lst))
              (deep-reduce-helper fn (cdr lst))))))


(trace deep-reduce)

(deep-reduce word '(r ((a (m b) (l)) (e (r)))))
;RAMBLER
