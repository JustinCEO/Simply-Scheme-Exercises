#lang racket
(require "definitions/simply_redef.scm")

; these are the fixed versions

(define (sphere-volume r)
  (* (/ 4 3) 3.141592654
  (* r r r)))

(define (next x)
  (+ x 1))

(define (square x)
  (* x x))

(define (triangle-area base height)
  (* 0.5 base height))

(define (sum-of-squares x y)
  (+ (square x) (square y)))