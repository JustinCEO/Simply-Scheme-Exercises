#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

; Write a procedure phone-unspell that takes a spelled version of a phone number, such as POPCORN, and returns the real phone number, in this case 7672676. You will need to write a helper procedure that uses an 8-way cond expression to translate a single letter into a digit.

(define (letter-digit letter)
(cond ((member? letter 'AaBbCc)	'2)
((member? letter 'DdEeFf) '3)
((member? letter 'GgHhIi) '4)
((member? letter 'JjKkLl) '5)
((member? letter 'MnNnOo) '6)
((member? letter 'PpQqRrSs) '7)
((member? letter 'TtUuVv) '8)
((member? letter 'WwXxYyZz) '9)))

(define (phone-unspell wd)
 (accumulate word (every letter-digit wd)))

(phone-unspell 'popcorn)
