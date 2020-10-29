#lang planet dyoo/simply-scheme:2:2

; I made up this exercise myself to work on the idea of using nested ifs.




(define (election-result trump-evs house-state-delegation-control)
  (if (< trump-evs 269)
      '(Trump loses)
      (if (= trump-evs 269)
          (if (not (equal? house-state-delegation-control 'gop))
              '(Trump loses)
              '(Trump wins!))
          '(Trump wins!))))





(election-result 268 'gop)
;'(Trump loses)

(election-result 269 'gop)
;'(Trump wins!)

(election-result 269 'dem)
;'(Trump loses)

(election-result 270 'dem)
;'(Trump wins!)

(election-result 270 'gop)
;'(Trump wins!)