#lang planet dyoo/simply-scheme:2:2

(define (log2 x)
(/ (log x) (log 2)))

(define (p2 num)
  (inexact->exact (floor (log2 num))))

(define (binary-generator num power)
  (cond ((= power -1) "")
        ((<= (expt 2 power) num)
         (word 1 (binary-generator (- num (expt 2 power))
                                   (- power 1))))
         (else (word 0 (binary-generator num (- power 1))))))

(define (to-binary num)
  (if (= num 0) 0
(binary-generator num (p2 num))))

(to-binary 9)
;1001
(to-binary 23)

(to-binary 16)


(to-binary 0)
