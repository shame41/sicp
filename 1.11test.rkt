#lang racket
(define (fr n)
		(if (< n 3)
			n
			(+ (fr (- n 1)) 
			   (* (fr (- n 2)) 2)
			   (* (fr (- n 3)) 3))))
(define (fi n)
	(define (fiter a b c cnt)
			(if (or (< cnt 3) (= cnt 3))
				(+ (* 3 a) (* 2 b) c)
				(fiter b c (+ c (* 2 b) (* 3 a)) (- cnt 1))))
	(if (< n 3)
		n
		(fiter 0 1 2 n)))
(fi 8)
