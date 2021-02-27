#lang planet dyoo/simply-scheme:2:2

;  Here is a definition of a procedure that returns the sum of the numbers in its argument sentence:

(define (addup nums)
  (if (empty? (bf nums))
      (first nums)
      (+ (first nums) (addup (bf nums)))))

; Although this works, it could be simplified by changing the base case. Do that.



(define (addup2 nums)
  (if (empty? nums) 0
      (+ (first nums) (addup2 (bf nums)))))


;test cases

;(addup2 '(5 4 3))

;(addup2 '(5))

;(addup2 '3)

;(addup2 "")

;(addup2 'potato)
