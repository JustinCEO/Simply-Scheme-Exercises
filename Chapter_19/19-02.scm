#lang planet dyoo/simply-scheme:2:2


; Don't forget that keep has to return a sentence if its second argument is a sentence, and a word if its second argument is a word.

;(Hint: it might be useful to write a combine procedure that uses either word or sentence depending on the types of its arguments.)

;first answer, no combine:


(define (real-keep2 fn input)
  (cond ((empty? input)
         input)
        ((fn (first input))
         (if (word? input)
           (word (first input) (real-keep2 fn (bf input)))
           (se (first input) (real-keep2 fn (bf input)))))
        (else (real-keep2 fn (bf input)))))

(define (keep2 fn input)
  (if (empty? input)
         '(you have provided no input for the second argument)
         (real-keep2 fn input)))


;second answer, with combine:

(define (combine arg1 arg2)
  (if (sentence? arg2)
      (se arg1 arg2)
      (word arg1 arg2)
      ))


(define (real-keep3 fn input)
  (cond ((empty? input)
         input)
        ((fn (first input))
           (combine (first input) (real-keep3 fn (bf input))))
        (else (real-keep3 fn (bf input)))))

(define (keep3 fn input)
  (if (empty? input)
         '(you have provided no input for the second argument)
         (real-keep3 fn input)))


