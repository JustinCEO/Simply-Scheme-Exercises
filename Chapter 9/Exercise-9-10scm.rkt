#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

;Write a procedure common-words that takes two sentences as arguments and returns a sentence containing only those words that appear both in the first sentence and in the second sentence.

(define (common-words sent1 sent2)
  (keep (lambda (sent1-wd) (member? sent1-wd sent2)) sent1))



(common-words '(potato ninja hatface) '(tomato hockeypuck ninja))
; '(ninja)


(common-words '(kirby pokemon soccer wrestling laserswords)'(knights dalinar potato kirby wrestling fencing))
;'(kirby wrestling)