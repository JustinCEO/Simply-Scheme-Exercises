#lang planet dyoo/simply-scheme:2:2

(define (sum-vector vector-num)
  (sum-vector-helper vector-num (vector-length vector-num) 0))

(define (sum-vector-helper vector-num vec-length index)
  (if (= index vec-length) 0
      (+ (vector-ref vector-num index)
         (sum-vector-helper vector-num vec-length (+ 1 index)))))

;test
(sum-vector '#(6 7 8))

