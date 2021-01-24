#lang planet dyoo/simply-scheme:2:2


(define (prepend-every letter sent)  
(if (empty? sent)
    '()

    
(se (word letter (first sent))
    (prepend-every letter (bf sent)))))

(define (prepend-sentence sent1 sent2)
  (if (empty? sent1) '()
     (se
      (prepend-every (first sent1) sent2) (prepend-sentence (bf sent1) sent2))))


(define (phone-letters digit)
 (item digit '("" abc def ghi jkl mno pqrs tuv wxyz)))

(define (phone-spell num)
    (if (= (count num) 1)
      (accumulate sentence (phone-letters num))
      (prepend-sentence (phone-letters (first num))
      (phone-spell (bf num)))
      ))




(trace prepend-every)
(trace prepend-sentence)

(trace phone-spell)



;(prepend-sentence '(a b c)'(d e f))

;(phone-spell 2235766)


(phone-spell 234)
