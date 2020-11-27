#lang planet dyoo/simply-scheme:2:2

; Write downup4 using only the word and sentence primitive procedures.

(define (downup4 wd)
 (se wd
     (bl wd)
     (bl (bl wd))
     (first wd)
     (bl (bl wd))
     (bl wd)
     wd))