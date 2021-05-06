#lang planet dyoo/simply-scheme:2:2

; Write `vector->list`.

(define (myvector->list vec)
  (v2lst-helper vec 0 '()))


(define (v2lst-helper vec index lst)
  (if (= index (vector-length vec)) lst
      (v2lst-helper vec (+ 1 index) (cons (vector-ref vec index) lst))))

;test vector

(define v (make-vector 3))

(vector-set! v 0 'shoe)
(vector-set! v 1 'potato)
(vector-set! v 2 'tomato)
