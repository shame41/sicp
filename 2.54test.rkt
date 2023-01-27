#lang racket
(define (myequal? a b)
		(cond ((and (pair? a) (pair? b)) 
			   (and (eq? (car a) (car b)) (myequal? (cdr a) (cdr b))))
			  ((and (not (pair? a)) (not (pair? b))) 
			   (eq? a b))
			  (else #f)))
(myequal? `(this (is a) list) `(this is a list))
