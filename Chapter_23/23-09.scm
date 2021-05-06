#lang planet dyoo/simply-scheme:2:2

; Write a procedure leader that says which car is in the lead right now.


;Justin's note: Note that I made this so that it could handle a lap-vector of any size.

(define (leader vector)
  (leader-helper vector (vector-length vector) 0 0))

(define (leader-helper vector vector-length index leader-index)
  (if (= index vector-length) (begin (show (se '(Car) leader-index '(is in the lead with) (vector-ref vector leader-index) '(laps))) leader-index)
      (let ((vec-val (vector-ref vector index))
            (leader-val (vector-ref vector leader-index)))
      (if (> vec-val leader-val)
          (leader-helper vector vector-length (+ 1 index) index)
          (leader-helper vector vector-length (+ 1 index) leader-index)))))



(define (leader)
  (leader-helper 0 1))

(define (leader-helper leader index)
  (cond ((= index 100) leader)
	((> (lap index) (lap leader))
	 (leader-helper index (+ index 1)))
	(else (leader-helper leader (+ index 1)))))