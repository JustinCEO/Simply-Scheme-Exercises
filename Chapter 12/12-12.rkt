#lang planet dyoo/simply-scheme:2:2

;Write a procedure `arabic` which converts Roman numerals into Arabic numerals

; > You will probably find the `roman-value` procedure from Chapter 6 helpful. Don't forget that a letter can *reduce* the overall value if the letter that comes after it has a larger value, such as the `C` in `MCM`.


(define (roman-value letter)
  (cond ((member? letter 'iI) 1)
        ((member? letter 'vV) 5)
        ((member? letter 'xX) 10)
        ((member? letter 'lL) 50)
        ((member? letter 'cC) 100)
        ((member? letter 'dD) 500)
        ((member? letter 'mM) 1000)
        (else 'huh?)))





(define (arabic number)
  (if (= 1 (count number)) (roman-value number)
    (let ((num1 (roman-value (first number)))
          (num2 (roman-value (first (bf number)))))
    (cond ((= 1 (count number)) (roman-value number))
          ((< num1 num2) (+ (* -1 num1) (arabic (bf number))))
          (else (+ num1 (arabic (bf number))))))))


(arabic 'MCMLXXI)
;1971

(arabic 'MLXVI)
;1066

(arabic 'i)
;1
(arabic 'vi)
;6
(arabic 'iv)
;4
(arabic 'xii)
;12
(arabic 'xiv)
;14
(arabic 'mcmlii)
;1952