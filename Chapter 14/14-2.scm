#lang planet dyoo/simply-scheme:2:2

(define (up wd)
(if (empty? wd) '()
   (se (up (bl wd)) wd)))

;test

(up 'town)
