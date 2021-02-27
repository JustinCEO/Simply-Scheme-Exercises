#lang planet dyoo/simply-scheme:2:2

(define (remove wd sent)
  (cond ((empty? sent) '())
        ((equal? wd (first sent)) (se (remove wd (bf sent))))
        (else (se (first sent) (remove wd (bf sent))))))

;test case
(remove 'the '(the song love of the loved by the beatles))
