#lang planet dyoo/simply-scheme:2:2

(define (charsel wd count)
(if (= count 0) ""
    (word (first wd)(charsel (bf wd)(- count 1)))))

(define (chunk wd chunksize place)
(if (> (+ place chunksize)(count wd)) '()
    (se
     (charsel ((repeated bf place) wd) chunksize)
        (chunk wd chunksize (+ 1 place)))))


(define (substring-helper wd chunksize)
  (if (= chunksize 0) '()
      (se (chunk wd chunksize 0)
          (substring-helper wd (- chunksize 1)))))


(define (substrings wd)
  (substring-helper wd (count wd)))

(define (substring? sub wd)
  (member? sub (substrings wd)))

;tests

(substring? 'ssip 'mississippi)
;T

(substring? 'misip 'mississippi)
;F
