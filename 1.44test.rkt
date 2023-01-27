#lang racket
(define (smooth func)
		(define dx 0.0000001)
		(average (func (- x dx)) (func x) (func (+ x dx))))
(define (average x y z)
		(/ (+ x y z) 3))
(define (compose f g)
		(lambda(x) (f (g x))))
(define (repeated func n)
		(if (<= n 1)
			func
			(repeated (compose func func) (- n 1))))
