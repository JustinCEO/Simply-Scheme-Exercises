#lang planet dyoo/simply-scheme:2:2

; Rewrite either of the sort procedures from Chapter 15 to take two arguments, a list and a predicate. It should sort the elements of that list according to the given predicate:
;
;> (sort '(4 23 7 5 16 3) <)
;(3 4 5 7 16 23)
;
;> (sort '(4 23 7 5 16 3) >)
;(23 16 7 5 4 3)
;
;> (sort '(john paul george ringo) before?)
;(GEORGE JOHN PAUL RINGO)

;two solutions


;first solution: editing sort

(define (remove-once wd sent)
  (cond ((empty? sent) '())
	((equal? wd (first sent)) (bf sent))
	(else (se (first sent) (remove-once wd (bf sent))))))

(define (earliest-helper so-far rest fn)
  (cond ((empty? rest) so-far)
	((fn so-far (first rest))
	 (earliest-helper so-far (bf rest) fn))
	(else (earliest-helper (first rest) (bf rest) fn))))

(define (earliest-word sent fn)
  (earliest-helper (first sent) (bf sent) fn))


(define (sort2 sent fn)
  (if (empty? sent)
      '()
      (se (earliest-word sent fn)
	  (sort2 (remove-once (earliest-word sent fn) sent) fn))))

(sort2 '(4 23 7 5 16 3) <)
;(3 4 5 7 16 23)

(sort2 '(4 23 7 5 16 3) >)
;(23 16 7 5 4 3)

(sort2 '(john paul george ringo) before?)
;(GEORGE JOHN PAUL RINGO)

;second solution: editing mergesort

(define (other-half sent)
  (if (<= (count sent) 1)
      '()
      (se (first (bf sent)) (other-half (bf (bf sent))))))

(define (one-half sent)
  (if (<= (count sent) 1)
      sent
      (se (first sent) (one-half (bf (bf sent))))))

(define (merge fn left right)
  (cond ((empty? left) right)
    ((empty? right) left)
    ((fn (first left) (first right))
     (se (first left) (merge fn (bf left) right)))
    (else (se (first right) (merge fn left (bf right))))))

(define (mergesort sent fn)
  (if (<= (count sent) 1)
      sent
      (merge fn (mergesort (one-half sent) fn)
             (mergesort (other-half sent) fn))))


(mergesort '(4 23 7 5 16 3) <)
;(3 4 5 7 16 23)

(mergesort '(4 23 7 5 16 3) >)
;(23 16 7 5 4 3)

(mergesort '(john paul george ringo) before?)
;(GEORGE JOHN PAUL RINGO)
