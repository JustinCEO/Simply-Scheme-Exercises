#lang planet dyoo/simply-scheme:2:2


(define (single-digits number)
  (item number '(one two three four five six seven eight nine)))

(define (tens number)
  (item (- number 9) '(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)))

(define (tens-place number)
  (item (- number 1) '(twenty thirty forty fifty sixty seventy eighty ninety)))


(define (large-number-name large-number-count)
  (if (> large-number-count 0) (item large-number-count '(thousand million billion trillion quadrillion quintillion
  sextillion septillion octillion nonillion decillion)) '()))

(define (triple-number-accumulator number)
(if (<= (count number) 3) (se number)
      (se (triple-number-accumulator (bl (bl (bl number)))) (word (last (bl (bl number))) (last (bl number)) (last number)))))

(define (triple-helper number)
  (cond ((empty? number) '())
        ((equal? (first number) 0) (triple-helper (bf number)))
        ((>= number 100) (se (single-digits (first number)) 'hundred (triple-helper (bf number))))
        ((>= number 20) (se (tens-place (first number)) (triple-helper (bf number))))
        ((and (> number 9)(< number 20))(se (tens number)))
        (else (se (single-digits number)))))

(define (number-name-helper triple-sent large-number-count)
(if (empty? triple-sent) '()
       (se
              (number-name-helper (bl triple-sent) (+ large-number-count 1))
              (triple-helper (last triple-sent))
              (if (not (equal? (last triple-sent) "000"))
                  (large-number-name large-number-count)
                  '()
                  ))))

(define (negative? number)
  (equal? (first number) '-))

(define (number-name number)
 (cond ((not (number? number)) '(Erroneous Input There Buddy This Program Only Takes Numbers))
       ((not (integer? number)) '(Erroneous Input There Buddy This Program Only Takes Integers))
       ((equal? number 0) '(zero))
       ((negative? number) (se 'negative (number-name-helper (triple-number-accumulator (bf number)) 0)))
       (else (number-name-helper (triple-number-accumulator number) 0))))




;tests

(number-name 12)
(number-name 10)
(number-name 19)
(number-name 20)
(number-name 30)
(number-name 99)
(number-name -1)
(number-name -500000002)
(number-name 131212120301912607891)
(number-name 00010000)
(number-name 1000529)
(number-name 1000000)
(number-name 100050000770050000200000)
(number-name 0)
(number-name -0000)
(number-name '-1234a456)
(number-name 1.2)
