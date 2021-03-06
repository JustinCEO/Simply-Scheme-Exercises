#lang planet dyoo/simply-scheme:2:2

; An exercise I made up to work on procedure logic

(define (logical-power-level x y z)
  (cond ((and x y z)'(Logical power level over 9000!))
        ((or
              (and x y)
              (and x z)
              (and y z))
         '(Logical power level is only 8000))
        ((or x y z)'(Logical power level a very weak 3000 - Sad!))
        (else '(Low logical energy!))))


         
(logical-power-level #f #f #f)
; '(Low logical energy!)

(logical-power-level #f #t #f)
; '(Logical power level a very weak 3000 - Sad!)

(logical-power-level #f #t #t)
;'(Logical power level is only 8000)

(logical-power-level #t #t #t)
; '(Logical power level over 9000!)