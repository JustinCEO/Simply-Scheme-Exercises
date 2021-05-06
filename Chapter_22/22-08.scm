#lang planet dyoo/simply-scheme:2:2


(define (join inputname1 inputname2 pos1 pos2 outputname)
  (let ((outputfile (open-output-file outputname))
        (file1 (open-input-file inputname1))
        )
    (join-helper file1 inputname2 pos1 pos2 outputfile)
    (close-output-port outputfile)
    (close-input-port file1)
    'done))


(define (join-helper file1 inputname2 pos1 pos2 outputfile)
  (let ((line1 (read file1)))
    (let ((lookup-value (lookup inputname2 (overlapword line1 pos1))))
    (cond ((eof-object? line1) 'done)
           ((equal? lookup-value '(no match found))
           (write line1 outputfile)
           (display " " outputfile)
           (write "ERROR: no matching merge data found in second file" outputfile)
           (newline outputfile)
           (join-helper file1 inputname2 pos1 pos2 outputfile))
    (else (begin (write (line-joiner line1 lookup-value pos1 pos2) outputfile)
           (newline outputfile)
           (join-helper file1 inputname2 pos1 pos2 outputfile)))))))
    
(define (lookup filename wd)
  (let ((file (open-input-file filename)))
    (let ((helper-value (lookup-helper file wd)))
    (close-input-port file)
    helper-value)))


(define (lookup-helper file wd)
    (let ((line (read file)))
    (cond
      ((eof-object? line) '(no match found))
      ((member? wd line)
         line)
      (else (lookup-helper file wd)))))

(define (overlapword line pos)
  (if (eof-object? line) 'done
  (item pos line)))

(define (line-joiner f1line f2line pos1 pos2)
  (append ((repeated bl (- (count f1line) pos1))
         f1line)
         ((repeated bf pos2)
          f2line)
         ))

