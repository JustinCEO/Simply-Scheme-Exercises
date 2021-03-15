#lang planet dyoo/simply-scheme:2:2

; Write `prune`, a procedure that takes a tree as argument and returns a copy of the tree, but with all the leaf nodes of the original tree removed. (If the argument to `prune` is a one-node tree, in which the root node has no children, then `prune` should return `#f` because the result of removing the root node wouldn't be a tree.)

(define (not-null? input)
  (not (null? input)))

(define (prune tree)
(if (leaf? tree)
    #f
    (prune-tree tree)))

(define (prune-tree tree)
  (if (leaf? tree) '()
  (cons (datum tree)
   (prune-forest (children tree)))))

(define (prune-forest forest)
  (if (null? forest) '()
      (filter not-null? 
      (cons (prune-tree (car forest))
            (prune-forest (cdr forest))))))

