#lang racket
(require "definitions/simply_redef.scm")


(define (f1 arg1 arg2)
  (sentence (bf arg1)(bl arg2)))


(define (f2 arg1 arg2)
  (sentence (bf arg1)(bl arg2)(word (first arg1)(last arg2))))


(define (f3 arg1 arg2)
  (sentence arg1 arg1))


(define (f4 arg1 arg2)
  (word
   (first (bf arg1))
   (first (bf arg2))
   ))

(define (f4b arg1 arg2)
  (word
   (item 2 arg1)
   (item 2 arg2)))