#lang planet dyoo/simply-scheme:2:2


; Write a function vector-append that works just like regular append, but for vectors:

;> (vector-append '#(not a) '#(second time))


; #(not a second time)


(define (vector-append vec1 vec2)
  (let ((combined-length (+ (vector-length vec1)(vector-length vec2))))
  (let ((newvec (make-vector combined-length)))
  (append-helper vec1 vec2 newvec))))

(define (append-helper vec1 vec2 newvec)
  (let ((vec1tonewvec (copy-vec vec1 newvec 0 0 (vector-length vec1)))
        (combined-length (+ (vector-length vec2)(vector-length vec1))))
    (let ((starting-index (- combined-length (vector-length vec2))))
    (copy-vec vec2 vec1tonewvec 0 starting-index (vector-length vec2)))))

(define (copy-vec oldvec newvec oldvecindex newvecindex remaining)
  (if (= remaining 0) newvec
      (begin (vector-set! newvec newvecindex (vector-ref oldvec oldvecindex))
             (copy-vec oldvec newvec (+ 1 oldvecindex) (+ 1 newvecindex) (- remaining 1)))))
