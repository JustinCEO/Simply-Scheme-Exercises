#lang planet dyoo/simply-scheme:2:2


;> In some restaurants, the servers use computer terminals to keep track of what each table has ordered. Every time you order more food, the server enters your order into the computer. When you're ready for the check, the computer prints your bill.
;
;> You're going to write two procedures, `order` and `bill.` `Order` takes a table number and an item as arguments and adds the cost of that item to that table's bill. `Bill` takes a table number as its argument, returns the amount owed by that table, and resets the table for the next customers. (Your `order` procedure can examine a global variable `*menu*` to find the price of each item.)



(define (*menu* food)
  (cond ((equal? food 'potstickers) 6)
        ((equal? food 'wor-won-ton) 4)
        ((equal? food 'egg-rolls) 2.75)
        ((equal? food 'shin-shin-special-prawns) 3.85)
        (else 0)))


(define *table-vector* (make-vector 6 0))

(define (order table food)
  (let ((bill-so-far (vector-ref *table-vector* table)))
    (vector-set! *table-vector* table (+ (*menu* food) bill-so-far))))

(define (bill table)
  (let ((total (vector-ref *table-vector* table)))
  (vector-set! *table-vector* table 0)
  total))



;test

(order 3 'potstickers)

(order 3 'wor-won-ton)

(order 5 'egg-rolls)

(order 3 'shin-shin-special-prawns)

(bill 3)
;13.85

(bill 5)
;2.75
