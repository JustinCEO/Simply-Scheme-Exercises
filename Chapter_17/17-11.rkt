#lang planet dyoo/simply-scheme:2:2

; Write `before-in-list?`, which takes a list and two elements of the list. It should return `#t` if the second argument appears in the list argument before the third argument:

(define (before-in-list? lst a b)
(> (length (member a lst))
    (length (member b lst))
    ))

(trace before-in-list?)


(before-in-list? '(back in the ussr) 'in 'ussr)

(before-in-list? '(back in the ussr) 'the 'back)
