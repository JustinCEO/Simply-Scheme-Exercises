#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

; Write a procedure called letterwords that takes as its arguments a letter and a sentence. It returns a sentence containing only those words from the argument sentence that contain the argument letter:

(define (letterwords letter sent)
 (keep (lambda (wd) (if (member? letter wd) #t #f)) sent))

(letterwords 'o '(got to get you into my life))
;(GOT TO YOU INTO)

