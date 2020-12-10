#lang planet dyoo/simply-scheme:2:2

; Can we reduce the factorial base case argument from 0 to -1? If so, show the resulting procedure. If not, why not?

; We cannot. `factorial` will multiply the values together that are produced by the recursive case until arriving at the base case. So what happens if we take `factorial` and try to make it have a base case of -1?


(define (factorial n)
  (if (= n -1)
      1
      (* n (factorial (- n 1)))))


(factorial 5)

; `(factorial 5)` should produce 120 (5 x 4 x 3 x 2 x 1). What happens with our modified procedure, though, is that by trying to establish the base case at -1, we add a 0 into the mix. `factorial` winds up calculating 5 x 4 x 3 x 2 x 1 x 0 x 1 (the 1 at the end is from our base case). 0 multiplied by anything is zero, so all our factorial results become 0. Bad!
