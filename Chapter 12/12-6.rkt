#lang planet dyoo/simply-scheme:2:2


(define (base-grade grade)
      (cond
         ((equal? (first grade) 'A) 4)
         ((equal? (first grade) 'B) 3)
         ((equal? (first grade) 'C) 2)
         ((equal? (first grade) 'D) 1)
         (else 0) ))

(define (grade-modifier grade)
      (cond
         ((equal? (last grade) '+) .33)
         ((equal? (last grade) '-) -.33)
         (else 0) ))


(define (grade-adder grades)
  (if (empty? grades) 0
  (+ (base-grade (first grades)) (grade-modifier (first grades))
     (grade-adder (bf grades)))))


(define (gpa grades)
  (/ (grade-adder grades)
     (count grades)))
  

(gpa '(A A+ B+ B))
(gpa '(zero A+ B+ B))
(gpa '(D- A+))
