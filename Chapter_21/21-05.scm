#lang planet dyoo/simply-scheme:2:2

;So I came up with a really ugly and tremendously inelegant solution for this, which I settled on after trying to do more elegant stuff involving procedures that take variable numbers of arguments and getting stuck. Basically, within `functions-loop`, I look to see if the `arg-count` for `fn-entry` is greater than 1. If it is, I go down one branch of the procedure involving two new procedures, `get-args-many` and `get-arg-many`, that are written to deal with a list of ordinal names, one of which is displayed before **Argument:** as appropriate.. If `arg-count` for `fn-entry` is not greater than 1, then the same `get-args` and `get-arg` procedures that were in use before get used with no list of ordinals, and so **Argument:** appears as before. 
;Here is the modified procedure in action:


(define (functions-loop)
  (let ((fn-entry (get-fn)))
    (if (equal? (car fn-entry) 'exit)
	"Thanks for using FUNCTIONS!"
        (cond
          ((> (arg-count fn-entry) 1)
           (let ((args (get-args-many (arg-count fn-entry) ordinal-list)))
                  (if (not (in-domain? args fn-entry))
	     (show "Argument(s) not in domain.")
	     (show-answer (apply (scheme-function fn-entry) args)))
	  (functions-loop)))
	(else (let ((args (get-args (arg-count fn-entry))))
	  (if (not (in-domain? args fn-entry))
	     (show "Argument(s) not in domain.")
	     (show-answer (apply (scheme-function fn-entry) args)))
	  (functions-loop)))))))


(define (get-arg-many ordinal)
  (display ordinal)
  (display " ")
  (display "Argument: ")
  (let ((line (read-line)))
    (cond ((empty? line)
	   (show "Please type an argument!")
	   (get-arg))
	  ((and (equal? "(" (first (first line)))
		(equal? ")" (last (last line))))
	   (let ((sent (remove-first-paren (remove-last-paren line))))
	     (if (any-parens? sent)
		 (begin
		  (show "Sentences can't have parentheses inside.")
		  (get-arg))
		 (map booleanize sent))))
	  ((any-parens? line)
	   (show "Bad parentheses")
	   (get-arg))
	  ((empty? (bf line)) (booleanize (first line)))
	  (else (show "You typed more than one argument!  Try again.")
		(get-arg)))))


(define ordinal-list '(First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth))


(define (get-args-many n ordinals)
  (if (= n 0)
      '()
      (let ((first (get-arg-many (car ordinals))))
	(cons first (get-args-many (- n 1) (cdr ordinals))))))