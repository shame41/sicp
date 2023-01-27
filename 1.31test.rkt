#lang racket
(define	(product down up func)
		(if (>= down up)
			1
			(* (func down)
			   (product (+ down 1) up func))))
(define (factorial a)
		(define (dec_to_1 n)
				(- a (- n 1)))
		(product 1 a dec_to_1))
(factorial 1)
