#lang planet dyoo/simply-scheme:2:2

; **20.6** The procedure `ask-user` isn't robust. What happens if you type something that isn't a number, or isn't between 1 and 9? Modify it to check that what the user types is a number between 1 and 9. If not, it should print a message and ask the user to try again.


(define (ask-user position letter)
  (print-position position)
  (display letter)
  (display "'s move: ")
  (let ((playermove (read)))
    (cond
      ((or      (not (number? playermove))
                 (> playermove 9)
                 (< playermove 1))
       (show "Invalid selection. Try again!")
       (ask-user position letter))
      (else playermove))))

(define (print-position position)          
  (show position))

