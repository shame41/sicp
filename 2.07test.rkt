#lang racket
(define (make_interval a b) (cons a b))
(define (upper_bound interval) (cdr interval))
(define (lower_bound interval) (car interval))
(define (sub_interval x y)
		(make_interval (- (lower_bound x) (upper_bound y))
					   (- (upper_bound x) (lower_bound y))))
(lower_bound (sub_interval (make_interval 4 5) (make_interval 1 3)))
