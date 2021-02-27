#lang planet dyoo/simply-scheme:2:2


(define (remove-once wd sent)
  (cond ((empty? sent) '())
	((equal? wd (first sent)) (bf sent))
	(else (se (first sent) (remove-once wd (bf sent))))))


(define (earliest-helper so-far rest) ; so-far refers to the earliest word at this point in our analysis
  (cond ((empty? rest) so-far) ; if rest is empty then that means so-far was the earliest word in the sentence so we should return it
        ((before? so-far (first rest))
         (earliest-helper so-far (bf rest)))
        (else (earliest-helper (first rest) (bf rest)))))

(define (earliest-word sent)
  (earliest-helper (first sent) (bf sent)))

(define (sort sent)
  (if (empty? sent)
      '()
      (se (earliest-word sent) ; provides sentence with the first word in the current sentence as an argument
	  (sort (remove-once (earliest-word sent) sent))))) ; recursively calls sort with sentence with word that comes first removed




(sort '(i wanna be your man))
