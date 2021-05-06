#lang planet dyoo/simply-scheme:2:2

(define (delete-if-exists filename)
  (if (file-exists? filename) (delete-file filename) 'nada))

(define (remove-dupe-lines filename outputname)
  (delete-if-exists outputname)
  (let ((outp (open-output-file outputname))
        (file (open-input-file filename)))
    (remove-dupes-helper file outp)
    (close-output-port outp)
    (close-input-port file)
    'done))


(define (remove-dupes-helper file outp . last-line)
    (let ((line (read-string file)))
    (cond
      ((eof-object? line) 'done)
      ((equal? (se line) (se last-line))
       (remove-dupes-helper file outp line))
      (else (begin (write-string line outp)
                   (newline outp)
            (remove-dupes-helper file outp line))))))
  