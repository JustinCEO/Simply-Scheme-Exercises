#lang planet dyoo/simply-scheme:2:2

; Write `list-ref`.

(define (my-list-ref lst num)
(if (= num 0) (car lst)
    (my-list-ref (cdr lst) (- num 1))))

