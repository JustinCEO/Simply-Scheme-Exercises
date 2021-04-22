#lang planet dyoo/simply-scheme:2:2


; Write a program that carries on a conversation like the following example. What the user types is in boldface.

;> **(converse)**
;Hello, I'm the computer.  What's your name? **Brian Harvey**
;Hi, Brian.  How are you? **I'm fine.**
;Glad to hear it.


(define (converse)
  (display "Hello, I'm am iMac :) What's your name?")
  (let ((name (first (read-line))))
    (display "Hi, ")
    (display name)
    (display ". How are you?")
    (let ((condition (read-line)))
      (cond
        ((equal? condition '("I'm" good))
         (show "Glad to hear it."))
        ((equal? condition '("I'm" bad))
         (show "Sorry :( "))
         (else (show "I see.")
        )))))
