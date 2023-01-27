#lang racket
(define (accumulate op initial sequence)
		(if (null? sequence)
			initial
			(op (car sequence)
				(accumulate op initial (cdr sequence)))))
(define (accumulate_n op start seqs)
		(if (null? (car seqs))
		    null
			(cons (accumulate op start (map car seqs))
				  (accumulate_n op start (map cdr seqs)))))
(accumulate_n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
