#lang planet dyoo/simply-scheme:2:2


(define (lookup filename wd)
  (let ((file (open-input-file filename)))
    (lookup-helper file wd)
    (close-input-port file)
    'done))


(define (lookup-helper file wd)
    (let ((line (read-string file)))
    (if (eof-object? line) 'done
      (let ((fixed-line (se (paren-remover line))))
      (begin (show fixed-line)
      (cond 
      ((member? wd fixed-line)
         (display fixed-line)
         (newline)
         (lookup-helper file wd))
      (else (lookup-helper file wd))))))))



(define (paren-remover line)
  (if (eof-object? line) 'done
   (if (and (equal? (first line) '\()
         (equal? (last line) '\)))
        (bf (bl line))
        line)))


;(trace lookup)
;(trace lookup-helper)
;(trace paren-remover)
 