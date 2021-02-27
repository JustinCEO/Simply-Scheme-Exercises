#lang planet dyoo/simply-scheme:2:2

(define (match pattern sent)
  (match-using-known-values pattern sent '()))

(define (match-using-known-values pattern sent known-values)
  (cond ((empty? pattern)
	 (if (empty? sent) known-values 'failed))
	((special? (first pattern))
	 (let ((placeholder (first pattern)))
	   (match-special (first placeholder)
			  (bf placeholder)
			  (bf pattern)
			  sent
			  known-values)))
	((empty? sent) 'failed)
	((equal? (first pattern) (first sent))
	 (match-using-known-values (bf pattern) (bf sent) known-values))
	(else 'failed)))


(define (special? wd)
  (member? (first wd) '(* & ? ! +)))

(define (match-special howmany name pattern-rest sent known-values)
  (let ((old-value (lookup name known-values)))
    (cond ((not (equal? old-value 'no-value))
	   (if (length-ok? old-value howmany)
	       (already-known-match
		  old-value pattern-rest sent known-values)
	       'failed))
	  ((equal? howmany '?)
	   (longest-match name pattern-rest sent 0 #t known-values))
          ((equal? howmany '+)
	   (if (and (not (empty? sent))
                    (number? (first sent)))
                    (longest-match name pattern-rest sent 1 #t known-values)
                    'failed))
	  ((equal? howmany '!)
	   (longest-match name pattern-rest sent 1 #t known-values))
	  ((equal? howmany '*)
	   (longest-match name pattern-rest sent 0 #f known-values))
	  ((equal? howmany '&)
	   (longest-match name pattern-rest sent 1 #f known-values)))))

(define (length-ok? value howmany)
  (cond ((empty? value) (member? howmany '(? *)))
  ((not (empty? (bf value))) (member? howmany '(* &)))
	(else #t)))

;
(define (already-known-match value pattern-rest sent known-values)
  (let ((unmatched (chop-leading-substring value sent)))
    (if (not (equal? unmatched 'failed))
	(match-using-known-values pattern-rest unmatched known-values)
	'failed)))



(define (chop-leading-substring value sent)
  (cond ((empty? value) sent)
	((empty? sent) 'failed)
	((equal? (first value) (first sent))
	 (chop-leading-substring (bf value) (bf sent)))
	(else 'failed)))


(define (longest-match name pattern-rest sent min max-one? known-values)
  (cond ((empty? sent)
	 (if (= min 0)
	     (match-using-known-values pattern-rest
				       sent
				       (add name '() known-values))
	     'failed))
	(max-one?
	 (lm-helper name pattern-rest (se (first sent))
		    (bf sent) min known-values))
	(else (lm-helper name pattern-rest
			 sent '() min known-values))))

(define (lm-helper name pattern-rest
		   sent-matched sent-unmatched min known-values)
  (if (< (length sent-matched) min)
      'failed
      (let ((tentative-result (match-using-known-values
			       pattern-rest
			       sent-unmatched
			       (add name sent-matched known-values))))
	(cond ((not (equal? tentative-result 'failed)) tentative-result)
	      ((empty? sent-matched) 'failed)
	      (else (lm-helper name
			       pattern-rest
			       (bl sent-matched)
			       (se (last sent-matched) sent-unmatched)
			       min
			       known-values))))))

;;; Known values database abstract data type

(define (lookup name known-values)
  (cond ((empty? known-values) 'no-value)
	((equal? (first known-values) name)
	 (get-value (bf known-values)))
	(else (lookup name (skip-value known-values)))))

(define (get-value stuff)
  (if (equal? (first stuff) '!)
      '()
      (se (first stuff) (get-value (bf stuff)))))

(define (skip-value stuff)
  (if (equal? (first stuff) '!)
      (bf stuff)
      (skip-value (bf stuff))))

(define (add name value known-values)
  (if (empty? name)
      known-values
      (se known-values name value '!)))

;
;(trace already-known-match)
;(trace chop-leading-substring)
;(trace match-using-known-values)
;(trace match-special)
;(trace lookup)
;(trace get-value)
;(trace skip-value)
;(trace longest-match)
;(trace lm-helper)
;(trace add)
;(trace length-ok?)

;test suite
(match '(*start me *end) '(love me do))
;(START LOVE ! END DO !)
(match '(* me *) '(love me do))
;'()
(match '(*start me *end) '(love me do ninjstars))
;'(start love ! end do ninjstars !)
(match '(*start me *end) '(please please me))
;(START PLEASE PLEASE ! END !)
(match '(mean mr mustard) '(mean mr mustard))
;()
(match '(!twice !other !twice) '(cry baby cry))
;(TWICE CRY ! OTHER BABY !)
(match '(!twice !other !twice) '(please please me))
;FAILED
(match '(*front *back) '(your mother should know))
;(front your mother should know ! back !)
(match '(* c * c * c)'(potato c tomato c hatato c))
;'()
(match '(!this !that !this !that)'(a b a b))
;'(this a ! that b !)
(match '(? ? ?)'(c c c))
;'()
(match '(& & &)'(c c c))
;'()
(match '(*x *y *y *x)'(potato tomato tomato potato))
;'(x potato ! y tomato !)
(match '(*x *y *y *x)'(a a))
;'(x a ! y !)
(match '(*x *y &y &x)'(a b b a))
;'(x a ! y b !)
(match '(*x *y *z) '(a b c a b))
;'(x a b c a b ! y ! z !)
(match '(*x a b c d e f) '(a b c d e f))
;'(x !)
(match '(a b c d e f *x) '(a b c d e f))
;'(x !)
(match '(*x *x) '(the beatles the beatles))
;(x the beatles !)


