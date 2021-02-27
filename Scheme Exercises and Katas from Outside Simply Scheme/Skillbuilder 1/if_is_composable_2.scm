#lang planet dyoo/simply-scheme:2:2

; I made up this exercise myself to work on internalizing the idea of the if procedure being composable that is discussed in chapter 6 of Simply Scheme.
; The program takes an amount of money and returns a message regarding the account's balance or the account being overdrawn, depending on the ammount


(define (bank-account-status amount)
 (se '(Your account)
     (if (< amount 0)
         (se '(is overdrawn by) (word amount) 'dollars)
         (se 'balance 'is (word "$" amount) 'dollars))))


(bank-account-status -50)
;'(Your account is overdrawn by -50 dollars)

(bank-account-status 200)
;'(Your account balance is $200 dollars)
