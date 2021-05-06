#lang planet dyoo/simply-scheme:2:2


;Rewrite selection sort (from Chapter 15) to sort a vector. This can be done in a way similar to the procedure for shuffling a deck: Find the smallest element of the vector and exchange it (using vector-swap!) with the value in the first box. Then find the smallest element not including the first box, and exchange that with the second box, and so on. For example, suppose we have a vector of numbers:
;
;#(23 4 18 7 95 60)

;Your program should transform the vector through these intermediate stages:
;
;#(4 23 18 7 95 60)   ; exchange 4 with 23
;#(4 7 18 23 95 60)   ; exchange 7 with 23
;#(4 7 18 23 95 60)   ; exchange 18 with itself
;#(4 7 18 23 95 60)   ; exchange 23 with itself
;#(4 7 18 23 60 95)   ; exchange 60 with 95

(define (vector-sort vec)
  (vector-sort-helper vec (vector-length vec) 0))

(define (vector-sort-helper vec vlen index)
  (if (= index vlen) vec
      (begin (vector-swap! vec index (smallest-element vec index))
             (vector-sort-helper vec vlen (+ 1 index)))))


(define (smallest-element vec index)
  (smallest-element-helper vec index (vector-ref vec index) index))

(define (smallest-element-helper vec index current-champ-value current-champ-index)
  (if (= (+ 1 index) (vector-length vec)) current-champ-index
      (let ((new-contender-value (vector-ref vec (+ 1 index))))
        (cond
        ((< current-champ-value new-contender-value)
         (smallest-element-helper vec (+ 1 index) current-champ-value current-champ-index))
        (else (smallest-element-helper vec (+ 1 index) new-contender-value (+ 1 index)))))))

(define (vector-swap! vector index1 index2)
  (let ((temp (vector-ref vector index1)))
    (vector-set! vector index1 (vector-ref vector index2))
    (vector-set! vector index2 temp)))


(trace vector-sort-helper)
 

;test

(vector-sort (list->vector '(23 4 18 7 95 60)))




