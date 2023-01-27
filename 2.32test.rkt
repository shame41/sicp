#lang racket
(define (subsets s)
		(if (null? s)
			(list null)
			(let ((my_rest (subsets (cdr s))))
				 (append my_rest (map (lambda (i) (cons (car s) i)) my_rest)))))
(subsets (list 1 2 3))
