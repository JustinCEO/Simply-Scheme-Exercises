#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

;> In each of the following exercises, write the procedure in terms of lambda and higher-order functions. Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

; > Suppose we're writing a program to play hangman. In this game one player has to guess a secret word chosen by the other player, one letter at a time. You're going to write just one small part of this program: a procedure that takes as arguments the secret word and the letters guessed so far, returning the word in which the guessing progress is displayed by including all the guessed letters along with underscores for the not-yet-guessed ones:

(define (hang-letter letter guesses)  (if (member? letter guesses)      letter      '_))


;Hint: You'll find it helpful to use the following procedure that determines how to display a single letter:


;hang is a fixed version of my initial guess and hang2 is a version similar to AnneB's approach with no separate helper function


(define (hang wd guesses)
  (accumulate word (every (lambda (letter) (hang-letter letter guesses)) wd)))

(define (hang2 wd guesses)
  (accumulate word (every (lambda (letter) (if (member? letter guesses)
      letter
      '_)) wd)))


(hang 'potsticker 'etaoi)
;_OT_TI__E_


(hang2 'potsticker 'etaoi)
;_OT_TI__E_



