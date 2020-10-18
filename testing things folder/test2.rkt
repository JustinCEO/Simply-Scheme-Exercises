#lang racket
(require "definitions/simply_redef.scm")

(map (lambda (item) (prepend-every item smaller))
		     (car menu))