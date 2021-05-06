#lang planet dyoo/simply-scheme:2:2

;Write a concatenate procedure that takes two arguments: a list of names of input files, and one name for an output file. The procedure should copy all of the input files, in order, into the output file.

(define (concatenate filenamelist outputname)
  (let ((outp (open-output-file outputname)))
    (concatenate-helper filenamelist outp)
    (close-output-port outp)
    'done))

(define (concatenate-helper filenamelist outp)
 (if (null? filenamelist) 'done
     (begin (add-single-file-to-outp (car filenamelist) outp)
     (concatenate-helper (cdr filenamelist) outp))))

(define (add-single-file-to-outp filename outp)
  (let ((file (open-input-file filename)))
    (lines-from-file-to-outp file outp)
    (close-input-port file)
    'done
    ))

(define (lines-from-file-to-outp file outp)
  (let ((line (read-line file)))
    (if (eof-object? line)
        'done
        (begin (show-line line outp)
        (lines-from-file-to-outp file outp))
        )))
  
  
  
