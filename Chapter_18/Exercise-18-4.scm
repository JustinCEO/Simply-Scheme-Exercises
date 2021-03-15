#lang planet dyoo/simply-scheme:2:2


;Write `count-nodes`, a procedure that takes a tree as argument and returns the total number of nodes in the tree. (Earlier we counted the number of *leaf* nodes.)


(define (count-nodes tree)
  (if (leaf? tree)
      1
      (+ 1 (reduce + (map count-nodes (children tree)))))
