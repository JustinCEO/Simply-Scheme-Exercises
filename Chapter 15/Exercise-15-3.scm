#lang planet dyoo/simply-scheme:2:2

(define (remdup sent)
  (cond ((empty? sent) '())
        ((member? (first sent) (bf sent))
         (remdup (bf sent)))
        (else (se (first sent) (remdup (bf sent))))))


(define (substrings-helper wd)
  (if (empty? wd) '()
      (se wd (substrings (bf wd))(substrings (bl wd)))))


(define (substrings wd)
  (remdup (substrings-helper wd)))
