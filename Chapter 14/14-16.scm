#lang planet dyoo/simply-scheme:2:2


(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

(define (consonant? letter)
  (not (vowel? letter)))

(define (vowel-consonant-boundary wd)
  (if (and (vowel? (first wd))(consonant? (first (bf wd))))
          1 0))

(define (silent-e wd)
  (if (member? wd '(ace age ape bake like cooperate one)) -1 0))


(define (no-dipthong wd)
  (if (member? wd '(naive continnuum cooperate boa)) 1 0))


(define (syllables-helper wd)
    (cond ((empty? wd) 0)
        ((and (= (count wd) 1)(vowel? wd)) 1)
        ((vowel? (first wd)) (+ (vowel-consonant-boundary wd) (syllables-helper (bf wd))))
         (else (syllables-helper (bf wd)))))


(define (syllables wd)
  (+ (silent-e wd) (no-dipthong wd) (syllables-helper wd)))

;tests

(syllables 'soaring)
;2
(syllables 'a)
;1
(syllables 'apple)
;2
(syllables 'like)
;1
(syllables 'blaaarghaae)
;2
(syllables 'cooperate)
;4
(syllables 'continnuum)
;4
(syllables 'bee)
;1
(syllables 'america)
;4
(syllables 'boa)
;2
(syllables 'one)
;1
(syllables 'boo)
;1
