#lang planet dyoo/simply-scheme:2:2


(define (divisible? big small)
  (= (remainder big small) 0))

(define (valid-year? year)
  (and
   (integer? year)
   (> year 0)

(define (valid-day? year month day)
  (cond
    ((and (member? month '(4 6 9 11))(<= day 30)) #t)
    ((and (member? month '(1 3 5 7 8 10 12))(<= day 31)) #t)
    ((and (= month 2)
          (and          
              (< day 29)                                               
              (and (= day 29)(divisible? year 100) (not (divisible? year 400))) 
              (and (= day 29)(not (divisible? year 4)) 
              (and (> day 28))))) 
  


        ((and (= month 2)  
              (or          
              (> day 29)                                               
              (and (= day 29)(divisible? year 100) (not (divisible? year 400))) 
              (and (= day 29)(not (divisible? year 4))) 
              (and (> day 28))))) 
        #f)
       ((< year 0) #f)
       (else #t)))


(define (valid-date? month day year)
  (and (valid-year? year)
       (and (>= month 1)(<= month 12))
       (valid-day? 
        
        ((and (member? month '(4 6 9 11))(> day 30)) #f)  
        ((not (and (>= month 1)(<= month 12))) #f) 
        (else #t)))


(valid-date? 10 4 1949)
;#T

(valid-date? 20 4 1776)
;#F

(valid-date? 5 0 1992)
;#F

(valid-date? 2 29 1900)
;#F

(valid-date? 2 29 2000) 
;#T