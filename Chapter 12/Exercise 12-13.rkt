#lang planet dyoo/simply-scheme:2:2

; Write a new version of the `describe-time` procedure from Exercise . Instead of returning a decimal number, it should behave like this:



(define (plural wd)
  (cond 
        ((equal? (word (last (bl wd))(last wd)) 'is)(word (bl (bl wd))'es)) ;words ending in is
        ((member? (word (last (bl wd))(last wd)) '(sh ch)) (word wd 'es)) ;words ending in sh or ch
        ((member? (word (last (bl wd))(last wd)) '(ay ey iy oy)) (word wd 's)) ;words ending in a vowel plus y, exlcuding uy, which is treated differently and covered under the general rule for words ending in y
        ((equal? (last wd) 'y) (word (bl wd) 'ies)) ;words ending in y
        ((member? (last wd) '(s x z)) (word wd 'es)) ; words ending in s, x, or z
        (else (word wd 's))))


(define (thismany num wd)
 (if (not (= num 1))
     (se num (plural wd))
      (se num wd)))


(define cent 3153600000)
(define dec 315360000)
(define yr 31536000)
(define mo 2628000)
(define wk 604800)
(define day 86400)
(define hr 3600)
(define min 60)



(define (number-helper x)
  (cond 
    ((>= x cent)(quotient x cent))
    ((>= x yr)(quotient x yr))
    ((>= x wk)(quotient x wk))
    ((>= x day)(quotient x day))
    ((>= x hr)(quotient x hr))
    ((>= x min)(quotient x min))))

(define (remainder-helper x)
  (cond 
    ((>= x  cent)(remainder x cent))
    ((>= x yr)(remainder x yr))
    ((>= x wk)(remainder x wk))
    ((>= x day)(remainder x day))
    ((>= x hr)(remainder x hr))
    ((>= x min)(remainder x min))))

(define (name-helper x)
 (cond 
 ((>= x cent)'century)
 ((>= x yr)'year)
 ((>= x wk)'week)
 ((>= x day)'day)
 ((>= x hr)'hour)
 ((>= x min)'minute)
 (else 'second)))


(define (describe-time-recursive x)
  (if (< x 60)(se (thismany x 'second))
  (se (thismany (number-helper x)(name-helper x))(describe-time-recursive(remainder-helper x)))))


;attempt 1

;(define (describe-time seconds)
;   (cond ((> seconds cent)
;         (se (thismany (floor (/ seconds cent))'century) (describe-time (- seconds (* (floor (/ seconds cent)) cent)))))
;        ((> seconds yr)
;         (se (thismany (floor (/ seconds yr))'year) (describe-time (- seconds (* (floor (/ seconds yr)) yr)))))
;        ((> seconds wk)
;         (se (thismany (floor (/ seconds wk))'week)  (describe-time (- seconds (* (floor (/ seconds wk)) wk)))))
;        ((> seconds day)
;         (se (thismany (floor (/ seconds day))'day) (describe-time (- seconds (* (floor (/ seconds day)) day)))))
;        ((> seconds hr)
;         (se (thismany (floor (/ seconds hr))'hour) (describe-time (- seconds (* (floor (/ seconds hr)) hr)))))
;        ((> seconds min)
;         (se (thismany (floor (/ seconds min))'minute) (describe-time (- seconds (* (floor (/ seconds min)) min)))))
;        (else (se (thismany (floor seconds) 'second)))))

(describe-time-recursive 22222)
;(6 HOURS 10 MINUTES 22 SECONDS)

(describe-time-recursive 4967189641)
;(1 CENTURIES 57 YEARS 20 WEEKS 6 DAYS 8 HOURS 54 MINUTES 1 SECONDS)

; Can you make the program smart about saying `1 CENTURY` instead of `1 CENTURIES`?


(describe-time-recursive 1)
;(1 second)
(describe-time-recursive 2)
;(2 seconds)
(describe-time-recursive 54677)
;(15 hours 11 minutes 17 seconds)
(describe-time-recursive 86402)
;(1 day 2 seconds)
(describe-time-recursive 31556952000)
;(1 millenium 0 seconds)
