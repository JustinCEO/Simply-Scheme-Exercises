#lang planet dyoo/simply-scheme:2:2

(define (divisible? big small)
  (= (remainder big small) 0))
 
(define (valid-date? month day year)
  (cond
        ((and (= month 2)  
              (or          
                (> day 29)                                               
                (and (= day 29)(divisible? year 100) (not (divisible? year 400))) 
                (and (= day 29)(not (divisible? year 4))))) 
        #f)
        ((and (member? month '(4 6 9 11))(> day 30)) #f)  
        ((not (and (>= day 1)(<= day 31))) #f) 
        ((not (and (>= month 1)(<= month 12))) #f) 
        (else #t)))

(valid-date? 2 29 1964)
;#t

(valid-date? 2 29 2000)
;#T

(valid-date? 10 4 1949)
;#T

(valid-date? 2 29 1963)
;#f

(valid-date? 20 4 1776)
;#F

(valid-date? 5 0 1992)
;#F

(valid-date? 2 29 1900)
;#F

(valid-date? 2 30 2000)
;#f

(valid-date? 3 32 1936)
;#f

(valid-date? 9 31 1937)
;#f