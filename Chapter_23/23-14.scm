#lang planet dyoo/simply-scheme:2:2

(define (make-matrix a b)
  (make-for-each (make-vector a) b 0))


(define (make-for-each vec vec-depth index)
  (if (= index (vector-length vec))
      vec
      (begin (vector-set! vec index (make-vector vec-depth))
             (make-for-each vec vec-depth (+ 1 index)))))

(define (matrix-set! mat a b val)
  (vector-set! (vector-ref mat a) b val))

(define (matrix-ref mat a b)
  (vector-ref (vector-ref mat a) b))

;test
(define m (make-matrix 3 5))

(matrix-set! m 2 1 '(her majesty))

(matrix-ref m 2 1)


