#lang planet dyoo/simply-scheme:2:2

; Append may remind you of sentence. They’re similar, except that append works only with lists as arguments, whereas sentence will accept words as well as lists. Implement sentence using append. (Note: The built-in sentence can take any number of arguments. First write a version that accepts only two arguments. Then, optionally, try to write a version that takes any number. Also, you don’t have to worry about the error checking that the real sentence does.)



(define (sentence2 input1 input2)
(cond ((not (list? input1))
       (sentence2 (cons input1 '()) input2))
      ((not (list? input2))
       (sentence2 input1 (cons input2 '())))
(else (append input1 input2))))



(define (sentence3 first-input . rest-of-input)
(if (null? rest-of-input) first-input
    (apply sentence3 (sentence2 first-input (car rest-of-input)) (cdr rest-of-input))))
