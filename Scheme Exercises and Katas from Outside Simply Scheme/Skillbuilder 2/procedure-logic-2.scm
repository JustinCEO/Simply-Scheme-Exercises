#lang planet dyoo/simply-scheme:2:2


; An exercise I made up to work on procedure logic

(define (amend-constitution1 house senate states)
  (if (or (< house 290)
          (< senate 67)
          (< states 38))
      #f #t))



(amend-constitution1 291 66 39)
;#f

(amend-constitution1 291 68 39)
;#t




(define (amend-constitution2 house senate states)
  (and (>= house 290)(>= senate 67)(>= states 38)))

(amend-constitution2 291 66 39)
;#f
(amend-constitution2 291 68 39)
;#t
