#lang planet dyoo/simply-scheme:2:2

;> Another problem with `ask-user` is that it allows a user to request a square that isn't free. If the user does this, what happens?  Fix `ask-user` to ensure that this can't happen.




(define (ask-user position letter)
  (print-position position)
  (display letter)
  (display "'s move: ")
  (let ((playermove (read)))
    (cond
      ((or       (not (number? playermove))
                 (> playermove 9)
                 (< playermove 1))
       (show "Invalid selection. Try again!")
              (ask-user position letter))
      ((not (number? (substitute-letter playermove position)))
       (show "That board space is occupied! Try again!")
              (ask-user position letter))
      (else playermove))))

(define (print-position position)          
  (show position))
