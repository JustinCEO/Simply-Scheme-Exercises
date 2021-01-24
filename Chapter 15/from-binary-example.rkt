#lang planet dyoo/simply-scheme:2:2


;We want to take a word of ones and zeros, representing a binary number, and compute the numeric value that it represents. Each binary digit (or bit) corresponds to a power of two, just as ordinary decimal digits represent powers of ten. So the binary number 1101 represents (1×8)+(1×4)+(0×2)+(1×1) = 13. We want to be able to say


(define (from-binary num)
  (cond ((empty? num) 0)
        ((= 1 (first num))
          (+ (expt 2 (- (count num) 1))
             (from-binary (bf num))))
          (else (from-binary (bf num)))))


(from-binary 1101)
;13

(from-binary 111)
;7

(from-binary 1111100111)