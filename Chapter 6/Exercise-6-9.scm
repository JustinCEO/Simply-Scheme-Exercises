#lang planet dyoo/simply-scheme:2:2

;Sometimes you must choose the singular or the plural of a word: 1 book but 2 books. Write a procedure thismany that takes two arguments, a number and a singular noun, and combines them appropriately:


; I greatly improved plural in the course of solving this. It's not comprehensive but covers many cases


(define (plural wd)
  (cond 
        ((equal? (word (last (bl wd))(last wd)) 'is)(word (bl (bl wd))'es)) ;words ending in is
        ((member? (word (last (bl wd))(last wd)) '(sh ch)) (word wd 'es)) ;words ending in sh or ch
        ((member? (word (last (bl wd))(last wd)) '(ay ey iy oy)) (word wd 's)) ;words ending in a vowel plus y, exlcuding uy, which is treated differently and covered under the general rule for words ending in y
        ((equal? (last wd) 'y) (word (bl wd) 'ies)) ;words ending in y
        ((member? (last wd) '(s x z)) (word wd 'es)) ; words ending in s, x, or z
        (else (word wd 's))))


(define (thismany num wd)
  (if (> num 1)
      (se num (plural wd))
      (se num wd)))

(thismany 1 'partridge)
;(1 PARTRIDGE)

(thismany 2 'wish)

(thismany 1 'wish)

(thismany 2 'watch)

(thismany 1 'watch)

(thismany 2 'boy)

(thismany 1 'boy)


(thismany 2 'hex)

(thismany 1 'hex)

(thismany 2 'bus)

(thismany 1 'bus)

(thismany 2 'buzz)

(thismany 1 'buzz)

(thismany 2 'partridge)

(thismany 3 'french-hen)


(thismany 2 'axis)

(thismany 3 'oasis)

(thismany 4 'crisis)
;crises

(thismany 1 'beatle)
(thismany 2 'beatle)

(thismany 1 'fly)
(thismany 2 'fly)
(thismany 1 'baby)
(thismany 2 'baby)
(thismany 1 'journey)
(thismany 2 'journey)
(thismany 1 'cowboy)
(thismany 2 'cowboy)
(thismany 1 'play)
(thismany 2 'play)
(thismany 1 'soliloquy)
(thismany 2 'soliloquy)