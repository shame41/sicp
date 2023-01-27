#lang racket
(define (compose f g)
		(lambda(x) (f (g x))))
(define (repeated func n)
		(if (<= n 1)
			func
			(repeated (compose func func) (- n 1))))
(define (square x) (* x x))
((repeated square 2) 5)
