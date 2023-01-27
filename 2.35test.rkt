#lang racket
(define (accumulate op initial sequence)
		(if (null? sequence)
			initial
			(op (car sequence)
				(accumulate op initial (cdr sequence)))))
(define (count_leaves t)
		(accumulate + 
					0 
					(map (lambda (i) 
								 (if (pair? i) 
								     (count_leaves i)
									 1))
						 t)))
