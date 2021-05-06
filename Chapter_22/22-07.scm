#lang planet dyoo/simply-scheme:2:2

; Write a page procedure that takes a filename as argument and prints the file a screenful at a time. Assume that a screen can fit 24 lines; your procedure should print 23 lines of the file and then a prompt message, and then wait for the user to enter a (probably empty) line. It should then print the most recent line from the file again (so that the user will see some overlap between screenfuls) and 22 more lines, and so on until the file ends.




(define (page filename)
  (let ((file (open-input-file filename)))
    (page-helper file 23)
    (close-input-port file)
    'done))

(define (page-helper file lines-to-display)
  (let ((line (read-string file)))
  (cond
    ((eof-object? line) 'done)
    ((= lines-to-display 1)
     (end-of-page-helper line)
     (page-helper file 22))
    (else
     (display (word lines-to-display " "))
     (show line)
     (page-helper file (- lines-to-display 1))))))


(define (end-of-page-helper line)
     (display "1: ")
     (show line)
     (display "Type Enter to Continue: ")
     (read-line)
     (display "23: ")
     (show line))

