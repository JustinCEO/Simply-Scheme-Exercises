#lang planet dyoo/simply-scheme:2:2

;> Write `repeated`. (This is a hard exercise!)

;
(define (repeated2 fn copies)
  (cond ((= copies 0) (lambda (arg) arg))
        ((= copies 1) (lambda (arg) (fn arg)))
        (else (compose fn (repeated2 fn (- copies 1))))))
