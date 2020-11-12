#lang planet dyoo/simply-scheme:2:2


(define (who sent)
  (every (lambda (person) (se person sent)) '(pete roger john keith)))

(who '(sells out))
;(pete sells out roger sells out john sells out keith sells out)





