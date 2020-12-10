#lang planet dyoo/simply-scheme:2:2

;Fix the bug in the following definition:

(define (acronym sent)                       ;; wrong
  (if (= (count sent) 1)
      (first sent)
      (word (first (first sent))
	    (acronym (bf sent)))))

(acronym '(Grand Old Party))


(define (acronym2 sent)                       ;; fixed
  (if (= (count sent) 1)
      (first (first sent))
      (word (first (first sent))
	    (acronym2 (bf sent)))))

(acronym2 '(Grand Old Party))