#lang racket
(define (accumulate op initial sequence)
		(if (null? sequence)
			initial
			(op (car sequence)
				(accumulate op initial (cdr sequence)))))
(define (flatmap func seq)
		(accumulate append null (map func seq)))
(define (enumerate-interval n m)
		(if (> n m)
			null
			(cons n (enumerate-interval (+ 1 n) m))))
(define (unique_pairs n)
		(accumulate append 
					null 
					(map (lambda (i)
							(map (lambda (j) (list i j))
									(enumerate-interval 1 (- i 1))))
					(enumerate-interval 1 n))))
(unique_pairs 4)
