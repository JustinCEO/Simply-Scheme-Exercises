#lang planet dyoo/simply-scheme:2:2

;(define (substring-helper currsub origsub wd)
;  (cond ((empty? currsub) #t)
;        ((empty? wd) #f)
;        ((equal? (first currsub)
;                 (first wd))
;         (substring-helper (bf currsub) origsub (bf wd)))
;        (else (substring-helper origsub origsub (bf wd)))))


(define (charsel wd count)
(if (= count 0) ""
    (word (first wd)(charsel (bf wd)(- count 1)))))


(define (substring-helper sub wd)
  (cond ((> (count sub) (count wd)) #f)
        ((equal?
          (charsel wd (count sub))
          sub) #t)
        (else (substring-helper sub (bf wd)))))


(define (substring? sub wd)
  (substring-helper sub wd))


;(trace substring-helper)

;(trace charsel)

;(trace substring-helper)

;(substring? 'ssip 'mississippi)
;T

;(substring? 'misip 'mississippi)
;F

(substring? 'ab 'abc)
;#t
(substring? 'ab 'a)
;#f
(substring? 'ab 'ac)
;#f
(substring? 'ab 'xyzabc)
;#t
(substring? 'ssip 'mississippi)
;#t
(substring? 'misip 'mississippi)
;#f
