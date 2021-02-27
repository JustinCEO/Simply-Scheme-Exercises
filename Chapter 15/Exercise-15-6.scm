#lang planet dyoo/simply-scheme:2:2

(define (bfn n input)
  ((repeated bf n) input))

(define (second input)
  (first (bf input)))

(define (third input)
  (first (bf (bf input))))

(define (fourth input)
  (first (bf (bf (bf input)))))

(define (unscramble sent)
  (cond ((= (count sent) 0) '())
        ((and
          (equal? (first sent) 'this)
          (equal? (second sent) 'is))
         (se '(this is) (unscramble (bfn 4 sent)) (third sent) (fourth sent)))
        ((equal? (first sent) 'the)
         (se (unscramble (bl (bfn 2 sent))) (first sent) (second sent) 'that (last sent) ))))

;tests

(unscramble '(this is the roach the gladiator killed))

(unscramble '(this is the rat the cat the dog the boy the
                     girl saw owned chased bit))
