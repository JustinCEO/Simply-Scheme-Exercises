#lang planet dyoo/simply-scheme:2:2



(define (game)
  (show "Do you want to play x or o?")
  (let ((choice (read)))
  (cond
    ((equal? choice 'x)
     (play-ttt ask-user ttt))
    ((equal? choice 'o)
     (play-ttt ttt ask-user))
    (else (show "that's not a valid selection. Try again!")
          (game)))))

(define (games)
  (game)
  (show "Do you want to play again? y/n")
  (let ((answer (read)))
    (cond
      ((equal? answer 'y)
       (games))
      ((equal? answer 'n)
       (show "Ok. Thanks for playing!")))))