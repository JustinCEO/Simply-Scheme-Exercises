#lang planet dyoo/simply-scheme:2:2

(define (square number)
  (* number number))

(define (append-e wd)
  (word wd 'e))



; In the language APL, most arithmetic functions can be applied either to a number, with the usual result, or to a vector—the APL name for a sentence of numbers—in which case the result is a new vector in which each element is the result of applying the function to the corresponding element of the argument. For example, the function sqrt applied to 16 returns 4 as in Scheme, but sqrt can also be applied to a sentence such as (16 49) and it returns (4 7).

;Write a procedure aplize that takes as its argument a one-argument procedure whose domain is numbers or words. It should return an APLized procedure that also accepts sentences:
;
(define (aplize func)
  (lambda (arg) (if (or (number? arg)(word? arg)) (func arg) (every func arg))))   ; if the function is a number or word then apply func to it, otherwise apply func to whole sentence



(define (aplize func)
  (lambda (arg) (if (number? arg) (func arg) (every func arg))))



(define apl-append-e (aplize append-e))

(apl-append-e '(ab c def g ta))

(apl-append-e 'potato)

(define apl-sqrt (aplize sqrt))
;
(apl-sqrt 36)
;;6
;
(apl-sqrt '(1 100 25 16))
;;(1 10 5 4)
;
