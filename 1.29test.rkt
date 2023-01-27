#lang racket
(define (Simpson a b f n)
		(define h (/ (- b a) n))
		(define (term k)
				(cond ((= k 0)
					   (f a))
					  ((odd? k)
					   (* 4 (f (+ a (* k h)))))
					  ((even? k)
					   (* 2 (f (+ a (* k h)))))
					  ((= k n)
					   (f (+ a (* k h))))))
		(define (sum down up func)
				(if (> down up)
					0
					(+ (func down)
					   (sum (+ 1 down) up func))))
		(define (iter_sum down up func)
				(define (iter got down up func)
						(if (> down up)
							got
							(iter (+ got (func down)) (+ down 1) up func)))
				(iter 0 down up func))
		(* (/ h 3) (iter_sum 0 n term)))
(define (cube x) (* x x x))
(Simpson 0 1 cube 1000)