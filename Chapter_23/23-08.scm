#lang planet dyoo/simply-scheme:2:2

; Modify the lap procedure to print "Car 34 wins!" when car 34 completes its 200th lap.


(define *lap-vector* (make-vector 100))

(define (initialize-lap-vector index)
  (if (< index 0)
      'done
      (begin (vector-set! *lap-vector* index 0)
	     (initialize-lap-vector (- index 1)))))

(define (lap car-number)
  (if (and (none-200-or-greater? *lap-vector* 0 (vector-length *lap-vector*))
       (= (vector-ref *lap-vector* car-number) 199))
      (begin (vector-set! *lap-vector*
	       car-number
	       (+ (vector-ref *lap-vector* car-number) 1))
      (show (se "Car" car-number "wins!")))
  (begin (vector-set! *lap-vector*
	       car-number
	       (+ (vector-ref *lap-vector* car-number) 1))
  (vector-ref *lap-vector* car-number))))


(define (none-200-or-greater? vector index vlen)
  (cond ((= vlen index) #t)
        ((>= (vector-ref vector index) 200) #f)
        (else (none-200-or-greater? vector (+ 1 index) vlen))))

