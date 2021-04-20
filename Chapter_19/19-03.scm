#lang planet dyoo/simply-scheme:2:2

(define (three-arg-accumulate combiner identity input)
  (if (empty? input)
      identity
      (combiner (first input)
                (three-arg-accumulate combiner identity (bf input)))))

