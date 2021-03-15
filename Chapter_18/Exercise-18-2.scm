#lang planet dyoo/simply-scheme:2:2


; Suppose we change the definition of the tree constructor so that it uses `list` instead of `cons`:

(define (make-node datum children)
  (list datum children))


; How do we have to change the selectors so that everything still works?

; My answer:

(define (children node)
  (cadr node))