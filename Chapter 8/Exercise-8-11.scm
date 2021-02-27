#lang planet dyoo/simply-scheme:2:2

; Write a GPA procedure. It should take a sentence of grades as its argument and return the corresponding grade point average:

; Hint: write a helper procedure `base-grade` that takes a grade as argument and returns 0, 1, 2, 3, or 4, and another helper procedure `grade-modifier` that returns −.33, 0, or .33, depending on whether the grade has a minus, a plus, or neither.*

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))



(define (base-grade grade)
  (cond ((equal? (first grade) 'A) (+ (grade-modifier grade) 4))
        ((equal? (first grade) 'B) (+ (grade-modifier grade) 3))
        ((equal? (first grade) 'C) (+ (grade-modifier grade) 2))
        ((equal? (first grade) 'D) (+ (grade-modifier grade) 1))
        ((equal? (first grade) 'F) 0)))

(define (grade-modifier grade)
  (cond ((equal? (last grade) '+) .33)
        ((equal? (last grade) '-) -.33)
        (else 0)))

(define (gpa grade-sent)
  (/ (accumulate + (every base-grade grade-sent)) (count grade-sent)))

(gpa '(A A+ B+ B))
; 3.67

(gpa '(B+ B B-))
; 3
