#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

; Write a procedure unabbrev that takes two sentences as arguments. It should return a sentence that's the same as the first sentence, except that any numbers in the original sentence should be replaced with words from the second sentence. A number 2 in the first sentence should be replaced with the second word of the second sentence, a 6 with the sixth word, and so on.

(define (unabbrev sent1 sent2)
  (every (lambda (sent1-wd) (if (number? sent1-wd) (item sent1-wd sent2) sent1-wd)) sent1))


(unabbrev '(john 1 wayne fred 4) '(bill hank kermit joey))
;(JOHN BILL WAYNE FRED JOEY)

(unabbrev '(i 3 4 tell 2) '(do you want to know a secret?))
;(I WANT TO TELL YOU)
