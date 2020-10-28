#lang planet dyoo/simply-scheme:2:2

; Write a better greet procedure that understands as many different kinds of names as you can think of:

(define (remove-post-nominal-letters name)
  (if (member? (last name)'(jr Jr Junior junior Sr sr Senior senior II ii III iii IV iv ESQ Esq esq PHD Phd phd))
      (bl name)
      name))

(define (greet name)
  (cond 
        ((equal? name '(david livingstone))'(dr livingstone i presume?))
        ((equal? name '(donald trump))'(Hello Mr President))
        ((equal? (first name) 'queen)'(Hello your majesty))
        ((member? (first name)'(dr doctor Doctor Dr Professor professor senator Senator governor Governor))
         (se 'hello (first name) (last (remove-post-nominal-letters name))))
        (else (se 'hello (first name)))))


(greet '(john lennon))
; (HELLO JOHN)

(greet '(dr marie curie))
;(HELLO DR CURIE)

(greet '(dr martin luther king jr))
;(HELLO DR KING)

(greet '(queen elizabeth))
;(HELLO YOUR MAJESTY)

(greet '(david livingstone))
;(DR LIVINGSTONE I PRESUME?)

(greet '(Governor John Smith Esq))
 ;hello Governor Smith

(greet '(donald trump))