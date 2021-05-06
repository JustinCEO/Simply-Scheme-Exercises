#lang planet dyoo/simply-scheme:2:2

(define (line-counter filename)
  (let ((file (open-input-file filename)))
    (let ((total (line-counter-helper file)))
    (close-input-port file)
      total)))

(define (line-counter-helper file)
  (let ((line (read-line file)))
    (if (eof-object? line)
        0
        (+ 1 (line-counter-helper file)))))