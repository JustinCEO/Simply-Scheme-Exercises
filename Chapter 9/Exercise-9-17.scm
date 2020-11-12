#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

; In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

(define (keep1 pred inputs)
  (let ((stuff 
  (every (lambda (inputelem) (if (pred inputelem) inputelem '()
                                 )) inputs)))
    (if (word? inputs) (accumulate word stuff) stuff)))



