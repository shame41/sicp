#lang racket
(define zero 
		(lambda (f) 
				(lambda (x) x)))
(define (add_one n)
		(lambda (f) 
				(lambda (x) (f ((n f) x)))))
(define one
		(lambda (f)
				(lambda (x) (f x))))
(define two
		(lambda (f)
				(lambda (x) (f (f x)))))
