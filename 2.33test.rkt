#lang racket
(define (accumulate op initial sequence)
		(if (null? sequence)
			initial
			(op (car sequence)
				(accumulate op initial (cdr sequence)))))
(accumulate cons (list 3 4) (list 1 2))
