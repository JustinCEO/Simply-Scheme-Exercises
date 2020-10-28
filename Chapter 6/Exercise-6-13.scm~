#lang planet dyoo/simply-scheme:2:2

;Make plural handle correctly words that end in y but have a vowel before the y, such as boy. Then teach it about words that end in x (box). What other special cases can you find?

(define (plural wd)
  (cond 
        ((equal? (word (last (bl wd))(last wd)) 'is)(word (bl (bl wd))'es))  
        ((member? (word (last (bl wd))(last wd)) '(sh ch)) (word wd 'es))  
        ((member? (word (last (bl wd))(last wd)) '(ay ey iy oy)) (word wd 's))  
        ((equal? (last wd) 'y) (word (bl wd) 'ies))  
        ((member? (last wd) '(s x z)) (word wd 'es))  
        (else (word wd 's))))