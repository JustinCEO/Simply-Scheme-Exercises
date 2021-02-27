#lang planet dyoo/simply-scheme:2:2

(define (location wd sent)
  (cond ((not (member? wd sent)) #f)
        ((equal? wd (first sent)) 1)
        (else (+ 1 (location wd (bf sent))))))


;tests

(location 'me '(you never give me your money))
;4
(location 'me '(potato hammer))
;#f
(location 'me '(me me me))
;1
