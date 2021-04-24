#lang planet dyoo/simply-scheme:2:2


(define (in-domain? args fn-entry)
  (let ((domain-status (apply (type-predicate fn-entry) args))
        (out-of-domain (cadddr (cdr fn-entry))))
  (if (not domain-status)
      (begin (show out-of-domain))
      domain-status)
      domain-status))

;; The list itself
          
(define *the-functions*
  (list (list '* * 2 two-numbers? "Both arguments must be numbers")
	(list '+ + 2 two-numbers? "Both arguments must be numbers")
	(list '- - 2 two-numbers? "Both arguments must be numbers")
	(list '/ / 2 can-divide? "The second argument cannot be equal to zero")
	(list '< < 2 two-reals? "Both arguments must be real numbers")
	(list '<= <= 2 two-reals? "Both arguments must be real numbers")
	(list '= = 2 two-numbers? "Both arguments must be numbers")
	(list '> > 2 two-reals? "Both arguments must be real numbers")
	(list '>= >= 2 two-reals? "Both arguments must be real numbers")
	(list 'abs abs 1 real? "The argument must be a real number")
	(list 'acos acos 1 trig-range? "The argument must be between 1 and -1")
	(list 'and (lambda (x y) (and x y)) 2 
	      (lambda (x y) (and (boolean? x) (boolean? y)))
              "Both arguments must be true or false")
	(list 'appearances appearances 2 member-types-ok? "The first argument must be a word, and the second argument must either 1) be a sentence OR 2) be a word IF AND ONLY IF the first argument is a word of exactly 1 character")
	(list 'asin asin 1 trig-range? "The argument must be between 1 and -1")
	(list 'atan atan 1 number? "The argument must be a number")
	(list 'bf bf 1 not-empty? "The argument cannot be empty")
	(list 'bl bl 1 not-empty? "The argument cannot be empty")
	(list 'butfirst butfirst 1 not-empty? "The argument cannot be empty")
	(list 'butlast butlast 1 not-empty? "The argument cannot be empty")
	(list 'ceiling ceiling 1 real? "The argument must be a real number")
	(list 'cos cos 1 number? "The argument must be a number")
	(list 'count count 1 word-or-sent? "The argument must be a word or a sentence")
	(list 'equal? equal? 2 (lambda (x y) #t) "This is a placeholder string for a procedure with a very broad domain")
	(list 'even? even? 1 integer? "The argument must be an integer")
	(list 'every named-every 2
	      (lambda (fn stuff)
		(hof-types-ok? fn stuff word-or-sent?))
              "The first argument must be a one argument function and each element of the second argument must be an acceptable argument to the function used as the first argument")
	(list 'exit '() 0 '())
	   ; in case user applies number-of-arguments to exit
	(list 'exp exp 1 number? "The argument must be a number")

	(list 'expt expt 2
	      (lambda (x y)
		(and (number? x) (number? y)
		     (or (not (real? x)) (>= x 0) (integer? y))))
                "Both arguments must be numbers, and AT LEAST one of the following three things must also be true for the arguments to be in the domain of the function:
1) the first argument is not a real number (i.e. the argument is an imaginary number), 2) the first argument is greater or equal to zero, 3) the second argument is an integer")

	(list 'first first 1 not-empty? "The argument cannot be empty")
	(list 'floor floor 1 real? "The argument must be a real number")
	(list 'gcd gcd 2 two-integers? "Both arguments must be integers")
	(list 'if (lambda (pred yes no) (if pred yes no)) 3
	      (lambda (pred yes no) (boolean? pred))
              "The first argument must be #t or #f")
	(list 'item item 2
	      (lambda (n stuff)
		(and (integer? n) (> n 0)
		     (word-or-sent? stuff) (<= n (count stuff))))
              "The first argument must be a positive integer with a value no greater than the number of characters in the second argument, and the second argument must be a word or sentence")
	(list 'keep named-keep 2
	      (lambda (fn stuff)
		(hof-types-ok? fn stuff boolean?))
              "The first argument must be a one argument function and each element of the second argument must be an acceptable argument to the function used as the first argument"
              )
	(list 'last last 1 not-empty? "The argument cannot be empty")
	(list 'lcm lcm 2 two-integers? "Both arguments must be integers")
	(list 'log log 1 (lambda (x) (and (number? x) (not (= x 0))))
              "The argument must be a non-zero number")
	(list 'max max 2 two-reals? "Both arguments must be real numbers")
	(list 'member? member? 2 member-types-ok? "The first argument must be a word, and the second argument must either 1) be a sentence OR 2) be a word IF AND ONLY IF the first argument is a word of exactly 1 character")
	(list 'min min 2 two-reals? "Both arguments must be real numbers")
	(list 'modulo modulo 2 dividable-integers? "Both arguments must be integers and the second argument cannot be zero")
	(list 'not not 1 boolean? "The argument must be #t or #f")
	(list 'number-of-arguments arg-count 1 valid-fn-name? "The argument must be the name of a valid function")
	(list 'odd? odd? 1 integer? "The argument must be an integer")
	(list 'or (lambda (x y) (or x y)) 2
	      (lambda (x y) (and (boolean? x) (boolean? y))) "Both arguments must be #t or #f")
	(list 'quotient quotient 2 dividable-integers? "Both arguments must be integers and the second argument cannot be zero")
	(list 'random random 1 (lambda (x) (and (integer? x) (> x 0))) "The argument must be a positive integer")
	(list 'remainder remainder 2 dividable-integers? "Both arguments must be integers and the second argument cannot be zero")
	(list 'round round 1 real? "The argument must be a real number")
	(list 'se se 2
	      (lambda (x y) (and (word-or-sent? x) (word-or-sent? y))) "Both arguments must be words or sentences")
	(list 'sentence sentence 2
	      (lambda (x y) (and (word-or-sent? x) (word-or-sent? y))) "Both arguments must be words or sentences")
	(list 'sentence? sentence? 1 (lambda (x) #t) "This is a placeholder string for a procedure with a very broad domain")
	(list 'sin sin 1 number? "The argument must be a number")
	(list 'sqrt sqrt 1 (lambda (x) (and (real? x) (>= x 0))) "The argument must be a positive real number")
	(list 'tan tan 1 number? "The argument must be a number")
	(list 'truncate truncate 1 real? "The argument must be a real number")
	(list 'vowel? (lambda (x) (member? x '(a e i o u))) 1
	      (lambda (x) #t) "This is a placeholder string for a procedure with a very broad domain")
	(list 'word word 2 (lambda (x y) (and (word? x) (word? y))) "both arguments must be words")
	(list 'word? word? 1 (lambda (x) #t) "This is a placeholder string for a procedure with a very broad domain")))
