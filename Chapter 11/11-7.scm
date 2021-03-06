#lang planet dyoo/simply-scheme:2:2

; Write a procedure copies that takes a number and a word as arguments and returns a sentence containing that many copies of the given word:

(define (valid-num? num)
  (and (integer? num)(>= num 0)))


(define (copies num wd)
  (if (not (valid-num? num)) '(valid non-negative integers only, friend!)
      (if (= num 0) '()
          (se wd (copies (- num 1) wd)))))

(copies 8 'spam)

;(SPAM SPAM SPAM SPAM SPAM SPAM SPAM SPAM)

(copies 0.5 'spam)
;'(valid non-negative integers only, friend!)

(copies 0 'spam)
;'()