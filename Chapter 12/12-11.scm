#lang planet dyoo/simply-scheme:2:2

(define (count2 thing)
  (if (empty? thing) 0
      (+ 1 (count2 (bf thing)))))

;test cases
(count2 '(potato ninja hatface))

(count2 'america)

(count2 "")

(count2 '())
