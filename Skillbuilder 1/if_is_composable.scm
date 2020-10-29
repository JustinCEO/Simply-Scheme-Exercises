#lang planet dyoo/simply-scheme:2:2

; I made up this exercise myself to work on internalizing the idea of the if procedure being composable that is discussed in chapter 6 of Simply Scheme.
; the program figures out whether it is election day based on user input


(define (election-day month day year)
  (se 'It
      (if (and (= 11 month)(= 3 day)(= 2020 year))
              '(is Election Day)
              '(is not Election Day))))



(election-day 11 3 2020)
;It is Election Day

(election-day 11 4 2020)
;It is not Election Day