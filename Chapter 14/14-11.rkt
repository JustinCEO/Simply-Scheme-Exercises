#lang planet dyoo/simply-scheme:2:2





(define (is-dupe wd1 wd2)
  (if (equal? wd1 wd2) '() wd1))

(define (remove-adjacent-duplicates sent)
  (if (<= (count sent) 1) sent
      (se (is-dupe (first sent) (first (bf sent))) (remove-adjacent-duplicates (bf sent)))))


(remove-adjacent-duplicates '(y a b b a d a b b a d o o))
;(Y A B A D A B A D O)

(remove-adjacent-duplicates '(yeah yeah yeah))
;(YEAH)


(remove-adjacent-duplicates '())