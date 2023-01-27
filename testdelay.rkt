#lang racket
(require sicp)
(define adder (delay (lambda (x) (+ x 1))))
((force adder) 2)
