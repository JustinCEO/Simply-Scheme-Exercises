#lang planet dyoo/simply-scheme:2:2

;Write a procedure countdown that works like this:

(define (valid-num? num)
  (and (integer? num)(>= num 0)))


(define (countdown num)
  (if (not (valid-num? num)) 'ack!
      (if (= num 0) 'BLASTOFF!
          (se num (countdown (- num 1))))))


(countdown 10)
;(10 9 8 7 6 5 4 3 2 1 BLASTOFF!)

(countdown 3)
;(3 2 1 BLASTOFF!)

(countdown -2)
;'ack!

(countdown 0.0002)
;'ack!