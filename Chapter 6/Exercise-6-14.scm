#lang planet dyoo/simply-scheme:2:2

; Write a procedure describe-time that takes a number of seconds as its argument and returns a more useful description of that amount of time:

(define (describe-time seconds)
  (cond ((> seconds 3153600000)(se (/ seconds 3153600000)'centuries))
        ((> seconds  315360000)(se (/ seconds  315360000)'decades))
        ((> seconds   31536000)(se (/ seconds   31536000)'years))
        ((> seconds    2592000)(se (/ seconds    2592000)'months))
        ((> seconds     604800)(se (/ seconds     604800)'weeks))
        ((> seconds      86400)(se (/ seconds      86400)'days))
        ((> seconds       3600)(se (/ seconds       3600)'hours))
        ((> seconds         60)(se (/ seconds         60)'minutes))
        (else (se seconds 'seconds))))

(describe-time 45)
;(45 SECONDS)

(describe-time 930)
;(15.5 MINUTES)

(describe-time 30000000000)
; (9.506426344208686 CENTURIES)


