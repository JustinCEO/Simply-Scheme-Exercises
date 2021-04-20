#lang planet dyoo/simply-scheme:2:2

 ;Rewrite the `true-for-all?` procedure from Exercise 8.10. Do not use `every`, `keep`, or `accumulate`.

(define (true-for-all? fn input)
  (if (empty? (cdr input))
      (fn (car input))
      (and (fn (car input))
           (true-for-all? fn (cdr input)))))


