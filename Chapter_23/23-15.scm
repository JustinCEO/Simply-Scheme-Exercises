#lang planet dyoo/simply-scheme:2:2


; > Generalize Exercise [[23.14]] by implementing an *array* structure that can have any number of dimensions. Instead of taking two numbers as index arguments, as the matrix procedures do, the array procedures will take one argument, a *list* of numbers. The number of numbers is the number of dimensions, and it will be constant for any particular array. For example, here is a three-dimensional array (4×5×6):

(define (make-array lst)
  (make-array-helper (make-vector (car lst)) (cdr lst)))

(define (make-array-helper vec lst)
  (if (null? lst) vec
      (make-array-helper (find-vec-elem-and-apply-fn vec (lambda (elem) (make-vector (car lst))) 0)
                          (cdr lst))))


(define (array-set! arr lst val)
  (array-set-helper (vector-ref arr (car lst)) (cdr lst) val))


(define (array-set-helper arr lst val)
  (if (null? (cdr lst)) (vector-set! arr (car lst) val)
      (array-set-helper (vector-ref arr (car lst)) (cdr lst) val)))


(define (array-ref arr lst)
  (array-ref-helper (vector-ref arr (car lst)) (cdr lst)))

(define (array-ref-helper arr lst)
  (if (null? (cdr lst)) (vector-ref arr (car lst))
      (array-ref-helper (vector-ref arr (car lst)) (cdr lst))))


(define (find-vec-elem-and-apply-fn vec fn index)
  (if (= index (vector-length vec)) vec
   (if (vector? (vector-ref vec index))
       (begin (find-vec-elem-and-apply-fn (vector-ref vec index) fn 0)
       (find-vec-elem-and-apply-fn vec fn (+ 1 index)))
       (apply-fn-to-vec-elems vec fn 0))))


(define (apply-fn-to-vec-elems vec fn index)
  (if (= index (vector-length vec)) vec
      (begin (vector-set! vec index (fn (vector-ref vec index)))
             (apply-fn-to-vec-elems vec fn (+ 1 index)))))


;test

(define a1 (make-array '(4 5 6)))
(array-set! a1 '(3 2 3) '(the end))
