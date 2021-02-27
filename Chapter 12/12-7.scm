#lang planet dyoo/simply-scheme:2:2

; Write a procedure spell-number that spells out the digits of a number:

(define (spell-digit digit)
  (item (+ 1 digit)
	'(zero one two three four five six seven eight nine)))


(define (spell-number number)
  (if (empty? number) '()
      (se (spell-digit (first number)) (spell-number (bf number)))))



;test case


(spell-number 1971)
;(ONE NINE SEVEN ONE)
