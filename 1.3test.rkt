#lang racket
(define (max_sum x y z)
		(cond ((and (< x y) (< x z)) (+ y z))
			  ((and (< y x) (< y z)) (+ x z))
			  ((and (< z x) (< z y)) (+ x y))))
(max_sum 3 4 5)
