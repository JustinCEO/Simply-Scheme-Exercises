(define (atleast wd)
  (lambda (sent-wd) (>= (count sent-wd) (count wd))))

(define (prepend-every letter sent)
(if (empty? sent)      '()
(se (word letter (first sent))
    (prepend-every letter (bf sent)))))

(define (prepend-sentence sent1 sent2)
  (if (empty? sent1) '()
     (se (prepend-every (first sent1) sent2) (prepend-sentence (bf sent1) sent2))))


(define (phone-letters digit)
  (cond ((equal? 2 digit) '(a b c))
        ((equal? 3 digit) '(d e f))
        ((equal? 4 digit) '(g h i))
        ((equal? 5 digit) '(j k l))
        ((equal? 6 digit) '(m n o))
        ((equal? 7 digit) '(p q r s))
        ((equal? 8 digit) '(t u v))
        ((equal? 9 digit) '(w x y z))
        (else "")))

(define (phone-spell-helper num)
    (if (empty? num) (se "")
  (se (phone-spell (bf num))
      (prepend-sentence (phone-letters (first num)) (phone-spell (bf num)))
      )))

(define (phone-spell num)
(keep (atleast num)(phone-spell-helper num)))


 
