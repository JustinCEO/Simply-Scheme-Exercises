#lang planet dyoo/simply-scheme:2:2


;Write a procedure phone-unspell that takes a spelled version of a phone number, such as POPCORN, and returns the real phone number, in this case 7672676. You will need a helper procedure that translates a single letter into a digit:

(define (unspell-letter letter)
  (cond ((member? letter 'abcABC) 2)
	((member? letter 'defDEF) 3)
	((member? letter 'ghiGHI) 4)
	((member? letter 'jklJKL) 5)
	((member? letter 'mnoMNO) 6)
	((member? letter 'prsPRS) 7)
	((member? letter 'tuvTUV) 8)
	((member? letter 'wxyWXY) 9)
	(else 0)))

;Here are some some special-case phone-unspell procedures:

(define (phone-unspell1 wd)
  (unspell-letter wd))

(define (phone-unspell2 wd)
  (word (unspell-letter (first wd))
	(unspell-letter (first (bf wd)))))

(define (phone-unspell3 wd)
  (word (unspell-letter (first wd))
	(unspell-letter (first (bf wd)))
	(unspell-letter (first (bf (bf wd))))))

;Write phone-unspell recursively.


(define (phone-unspell wd)
  (if (empty? wd) ""
      (word
       (unspell-letter (first wd))
       (phone-unspell (bf wd)))))


(phone-unspell 'POPCORN)
;7672676


