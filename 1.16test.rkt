#lang racket
(define (even? n) 
  (= (remainder n 2) 0))
(define (square x) (* x x))
(define (fast_expt x m) 
  (define (iter a b n) 
	(cond ((= n 0) a)
		  ((even? n) (iter a 
						   (square b)
						   (/ n 2)))
		  (else (iter (* a b)
					  b
					  (- n 1)))))
  (iter 1 x m))
(fast_expt 7 9)
