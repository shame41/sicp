#lang racket
(define (cont_frac_iter n d k)
		(define (iter n d k last_result)
				(if (<= k 0)
					last_result
					(iter n d (- k 1) (/ (n k) (+ (d k) last_result)))))
		(iter n d k (/ (n k) (d k))))
(define (tan_cd x k)
		(cont_frac_iter (lambda (i)
								(if (= i 1)
									x
									(- (* x x))))
						(lambda (i)
								(- (* 2 i) 1))
						k))
(tan_cd 3.7 1000)

