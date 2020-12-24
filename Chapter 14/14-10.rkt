#lang planet dyoo/simply-scheme:2:2

;Write the procedure count-adjacent-duplicates that takes a sentence as an argument and returns the number of words in the sentence that are immediately followed by the same word:

(define (is-dupe wd1 wd2)
  (if (equal? wd1 wd2) 1 0))

(define (count-adjacent-duplicates sent)
  (if (= (count sent) 1) 0
      (+ (is-dupe (first sent) (first (bf sent))) (count-adjacent-duplicates (bf sent)))))

(count-adjacent-duplicates '(y a b b a d a b b a d o o))
;3

(count-adjacent-duplicates '(yeah yeah yeah))
;2
