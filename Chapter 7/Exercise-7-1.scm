#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiou))

;The following procedure does some redundant computation.
;
;(define (gertrude wd)
;  (se (if (vowel? (first wd)) 'an 'a)
;      wd
;      'is
;      (if (vowel? (first wd)) 'an 'a)
;      wd
;      'is
;      (if (vowel? (first wd)) 'an 'a)
;      wd))
;


(define (gertrude wd)
  (let ((article-word
        (se (if (vowel? (first wd)) 'an 'a) wd)))
        (se article-word 'is article-word 'is article-word)))



(gertrude 'rose)
;(A ROSE IS A ROSE IS A ROSE)
;
(gertrude 'iguana)
;(AN IGUANA IS AN IGUANA IS AN IGUANA)
;Use let to avoid the redundant work.
