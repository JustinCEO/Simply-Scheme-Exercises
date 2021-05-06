#lang planet dyoo/simply-scheme:2:2

(define (word-counter filename)
  (let ((file (open-input-file filename)))
    (let ((total (word-counter-helper file)))
    (close-input-port file)
      total)))

(define (word-counter-helper file)
  (let ((element (read file)))
    (cond
      ((eof-object? element) 0)
      ((sentence? element) (+ (count element) (word-counter-helper file)))
      (else (+ 1 (word-counter-helper file))))))
