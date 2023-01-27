#lang racket
(define (accumulate op initial sequence)
		(if (null? sequence)
			initial
			(op (car sequence)
				(accumulate op initial (cdr sequence)))))
(define (enumerate-interval n m)
		(if (> n m)
			null
			(cons n (enumerate-interval (+ 1 n) m))))
(define (make_tri n)
  (accumulate append
		null
		(accumulate append
					null
					(map (lambda (i)
						   (map (lambda (k) 
									(map (lambda (l) (list i k l))
										   (enumerate-interval 1 (- k 1))))
								(enumerate-interval 1 (- i 1))))
						 (enumerate-interval 1 n)))))
