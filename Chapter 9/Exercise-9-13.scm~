#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

; Write a procedure first-last whose argument will be a sentence. It should return a sentence containing only those words in the argument sentence whose first and last letters are the same:


(define (first-last sent)
  (keep (lambda (wd) (if (equal? (first wd)(last wd)) #t #f)) sent))


(first-last '(california ohio nebraska alabama alaska massachusetts))
; (OHIO ALABAMA ALASKA)
