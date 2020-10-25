#lang racket
(require "definitions/simply_redef.scm")

;Write a procedure query that turns a statement into a question by swapping the first two words and adding a question mark to the last word:

;> (query '(you are experienced))
;(ARE YOU EXPERIENCED?)
;
;> (query '(i should have known better))
;(SHOULD I HAVE KNOWN BETTER?)


(define (query sent-arg)
  (se (first (butfirst sent-arg))
      (first sent-arg)
      (butfirst (butfirst (butlast sent-arg)))
      (word (last sent-arg) '?)))


(define (query-item sent-arg)
  (se (item 2 sent-arg)
      (item 1 sent-arg)
      (butfirst (butfirst (butlast sent-arg)))
      (word (last sent-arg) '?)))