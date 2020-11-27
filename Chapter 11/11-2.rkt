#lang planet dyoo/simply-scheme:2:2


(define (um-checker wd)
  (if (equal? 'um wd) 1 0))

(define (count-ums sent)
  (if (empty? sent) 0
     (+ (um-checker (first sent)) (count-ums (bf sent)))))

; all-in-one

;(define (count-ums sent)
;  (if (empty? sent) 0
;      (if (equal? 'um (first sent))
;          (+ 1 (count-ums (bf sent)))
;          (count-ums (bf sent)))))

(count-ums '(today um we are going to um talk about functional um programming))
;3

(count-ums '(um wtf um lol um idk um haha0))
;4

