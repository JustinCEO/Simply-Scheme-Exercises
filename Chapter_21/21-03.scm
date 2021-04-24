#lang planet dyoo/simply-scheme:2:2

;;21.3  Every time we want to know something about a function that the user typed in, such as its number of arguments or its domain-checking predicate, we have to do an assoc in *the-functions*. That's inefficient. Instead, rewrite the program so that get-fn returns a function's entry from the a-list, instead of just its name. Then rename the variable fn-name to fn-entry in the functions-loop procedure, and rewrite the selectors scheme-procedure, arg-count, and so on, so that they don't invoke assoc.


;note: see blog post about this chapter for some stuff my answer below doesn't address and the correct solution

(define (functions-loop)
  (let ((fn-entry (get-fn)))
    (if (equal? fn-entry 'exit)
	"Thanks for using FUNCTIONS!"
	(let ((args (get-args (arg-count fn-entry))))
	  (if (not (in-domain? args fn-entry))
	     (show "Argument(s) not in domain.")
	     (show-answer (apply (scheme-function fn-entry) args)))
	  (functions-loop)))))

(define (get-fn)
  (display "Function: ")
  (let ((line (read-line)))
    (cond ((empty? line)
	   (show "Please type a function!")
	   (get-fn))
	  ((not (= (count line) 1))
	   (show "You typed more than one thing!  Try again.")
	   (get-fn))
	  ((not (valid-fn-name? (first line)))
	   (show "Sorry, that's not a function.")
	   (get-fn))
	  (else (assoc (first line) *the-functions*)))))


(define (scheme-function fn-entry)
  (cadr fn-entry))

(define (arg-count fn-entry)
  (caddr fn-entry))

(define (type-predicate fn-entry)
  (cadddr fn-entry))

(define (in-domain? args fn-entry)
  (apply (type-predicate fn-entry) args))

