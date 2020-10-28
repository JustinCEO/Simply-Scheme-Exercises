#lang racket
(require "definitions/simply_redef.scm")


;Write a procedure european-time to convert a time from American AM/PM notation into European 24-hour notation. Also write american-time, which does the opposite:
;
;> (european-time '(8 am))
;8
;
;> (european-time '(4 pm))
;16
;
;> (american-time 21)
;(9 PM)
;
;> (american-time 12)
;(12 PM)
;
;> (european-time '(12 am))
;24


(define (european-time us-time)
  (cond ((equal? us-time '(12 am)) '24)
        ((equal? us-time '(12 pm)) '12)
        ((equal? (first (bf us-time)) 'am) (first us-time))
        (else (+ 12 (first us-time)))))

(define (american-time euro-time)
  (cond ((= euro-time 24)'(12 AM))
        ((= euro-time 12)'(12 PM))
        ((< euro-time 12)(se euro-time 'AM))
        (else (se (- euro-time 12) 'PM))))
