#lang planet dyoo/simply-scheme:2:2

(define (char-counter filename)
  (let ((file (open-input-file filename)))
    (let ((total (char-counter-helper file)))
    (close-input-port file)
      total)))

(define (char-counter-helper file)
  (let ((element (read-string file)))
    (cond
      ((eof-object? element) 0)
      (else (+ (count element) (char-counter-helper file))))))
