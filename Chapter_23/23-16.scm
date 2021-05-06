#lang planet dyoo/simply-scheme:2:2

(define (vec-sentence arg1 . rest)
  (apply vector arg1 rest))


(define (vec-empty? vec)
  (equal? vec '#()))


(define (vec-first vec)
  (vector-ref vec 0))

(define (vec-butfirst vec)
  (butfirst-helper vec (make-vector (- (vector-length vec) 1)) 1))

(define (butfirst-helper vec newvec index)
  (if (= index (vector-length vec)) newvec
      (begin (vector-set! newvec (- index 1) (vector-ref vec index))
             (butfirst-helper vec newvec (+ 1 index)))))


(define (vec-last vec)
  (vector-ref vec (- (vector-length vec) 1)))



(define (vec-butlast vec)
  (butlast-helper vec (make-vector (- (vector-length vec) 1)) 0))


(define (butlast-helper vec newvec index)
  (if (= index (- (vector-length vec) 1)) newvec
      (begin (vector-set! newvec index (vector-ref vec index))
             (butlast-helper vec newvec (+ 1 index)))))


(define (vector-append vec1 vec2)
  (let ((combined-length (+ (vector-length vec1)(vector-length vec2))))
  (let ((newvec (make-vector combined-length)))
  (append-helper vec1 vec2 newvec combined-length))))

(define (append-helper vec1 vec2 newvec combined-length)
  (let ((vec1tonewvec (copy-vec vec1 newvec 0 0 (vector-length vec1)))
        (starting-index (- combined-length (vector-length vec2))))
    (copy-vec vec2 vec1tonewvec 0 starting-index (vector-length vec2))))


(define (copy-vec oldvec newvec oldvecindex newvecindex remaining)
  (if (= remaining 0) newvec
      (begin (vector-set! newvec newvecindex (vector-ref oldvec oldvecindex))
             (copy-vec oldvec newvec (+ 1 oldvecindex) (+ 1 newvecindex) (- remaining 1)))))

(define (praise1 stuff)
  (vector-append stuff '#(is good)))

(define (praise2 stuff)
  (vector-append stuff '#(rules)))


(define (vec-item n sent)
  (if (= n 1)
      (vec-first sent)
      (vec-item (- n 1)(vec-butfirst sent))))

(define (apply-fn-to-vec-elems vec fn index)
  (if (= index (vector-length vec)) vec
      (begin (vector-set! vec index (fn (vector-ref vec index)))
             (apply-fn-to-vec-elems vec fn (+ 1 index)))))

(define (vec-every fn vec)
  (apply-fn-to-vec-elems vec fn 0))
