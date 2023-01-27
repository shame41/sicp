#lang racket
(define (cont_frac n d k)
		(define (iter n d i k)
				(if (>= i k)
					(/ (n i) (d i))
					(/ (n i) (+ (d i) (iter n d (+ i 1) k)))))
		(iter n d 1 k))
(define (cont_frac_iter n d k)
		(define (iter n d k last_result)
				(if (<= k 0)
					last_result
					(iter n d (- k 1) (/ (n k) (+ (d k) last_result)))))
		(iter n d k (/ (n k) (d k))))
	
(cont_frac_iter (lambda (i) 1.0)
		   (lambda (i) 1.0)
		   1000)
