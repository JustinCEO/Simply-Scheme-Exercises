#lang planet dyoo/simply-scheme:2:2

; The following program doesn't work. Why not? Fix it.

;(define (superlative adjective word)
;  (se (word adjective 'est) word))


(define (superlative adjective wd)
  (se (word adjective 'est) wd))



;It's supposed to work like this:
(superlative 'dumb 'exercise)
;(DUMBEST EXERCISE)


