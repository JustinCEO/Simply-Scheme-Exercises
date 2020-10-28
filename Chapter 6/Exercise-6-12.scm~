#lang planet dyoo/simply-scheme:2:2

;6.11  Write a predicate valid-date? that takes three numbers as arguments, representing a month, a day of the month, and a year. Your procedure should return #t if the numbers represent a valid date (e.g., it isn't the 31st of September). February has 29 days if the year is divisible by 4, except that if the year is divisible by 100 it must also be divisible by 400.

; my notes
; months are 1 through 12
; deal with number of days in months - general case and specific restrictions (group the specific stuff into categories)
; deal with leap years

(define (divisible? big small)
  (= (remainder big small) 0))

(define (valid-date? month day year)
  (cond
        ((and (= month 2)  ; this first cond is February logic, which is the most complex. if month = 2...
              (or          ; ...and any of the following are true...
              (> day 29)                                               ; ... day > 29, which should never be the case, or...
              (and (= day 29)(divisible? year 100) (not (divisible? year 400))) ; ...day = 29 AND year is divisible by 100 but NOT divisible by 400, which is a situation prohibited by a special leap year rule or....
              (and (= day 29)(not (divisible? year 4)) ; ....day is = 29 and year is NOT divisible by 4, which is prohibited by the general leap year rule, or....
              (and (> day 28))))) ; ....day > 28, which is prohibited by the rule for February in general
        #f) ; ... then return false
        ((and (member? month '(4 6 9 11))(> day 30)) #f)  ; if month is 4, 6, 9, or 11 AND day is greater than 30 return false.
        ((not (and (>= day 1)(<= day 31))) #f) ; day should always be greater than or equal to 1 and less than or equal to 31, regardless of month or year (some months are more restrictive on the number of days, but those are addressed above). If that is NOT the case, return false. This line imposes the limit of 31 days for the 31-day months.
        ((not (and (>= month 1)(<= month 12))) #f) ; month should always be greater than or equal to 1 and less than or equal to 12. If that is NOT the case, return false.
        (else #t)))

(valid-date? 10 4 1949)
;#T

(valid-date? 20 4 1776)
;#F

(valid-date? 5 0 1992)
;#F

(valid-date? 2 29 1900)
;#F

(valid-date? 2 29 1964)
;#t

(valid-date? 2 29 2000)
;#T

(valid-date? 2 30 2000)
;#f

(valid-date? 2 29 1963)
; #f

(valid-date? 3 32 1936)
;#f

(valid-date? 9 31 1937)
;#f