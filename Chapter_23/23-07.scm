#lang planet dyoo/simply-scheme:2:2

(define (vector-filter fn vec)
  (let ((truecount (true-counter fn vec 0 (vector-length vec) 0)))
    (filter-helper fn vec 0 0 (vector-length vec) (make-vector truecount))))


(define (filter-helper fn oldvec oldvecindex newvecindex vlen newvec)
  (cond ((= oldvecindex vlen) newvec)
        ((fn (vector-ref oldvec oldvecindex))
         (vector-set! newvec newvecindex (vector-ref oldvec oldvecindex))
         (filter-helper fn oldvec (+ 1 oldvecindex) (+ 1 newvecindex) vlen newvec))
        (else (filter-helper fn oldvec (+ 1 oldvecindex) newvecindex vlen newvec))))
        
 
(define (true-counter fn vec index vlen truecount)
  (if (= index vlen) truecount
     (if (fn (vector-ref vec index))
         (true-counter fn vec (+ 1 index) vlen (+ 1 truecount))
         (true-counter fn vec (+ 1 index) vlen truecount))))



;test vector and function


(define z (make-vector 5 2))
(vector-set! z 1 0)