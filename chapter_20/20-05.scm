#lang planet dyoo/simply-scheme:2:2

;Modify `name-table` so that it figures out the longest last name in its argument list, adds two for spaces, and uses that number as the width of the first column.


(define (name-table names)
  (name-table-helper names (+ 2 (longest-last 0 names))))

(define (name-table-helper names width)
    (if (null? names)
      'done
      (begin (display (align (cadar names) width))
	     (show (caar names))
	     (name-table-helper (cdr names) width))))


(define (longest-last countoflongest names)
  (cond
    ((null? names) countoflongest)
    ((> (count (cadar names)) countoflongest)
     (longest-last (count (cadar names)) (cdr names)))
    (else (longest-last countoflongest (cdr names)))))