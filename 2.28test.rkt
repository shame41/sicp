#lang racket
(define (fringe x)
		(cond ((null? x) x)
			  ((not (pair? (car x))) x)
			  (else (append (fringe (car x)) (fringe (cdr x))))))
(fringe (list (list (list 1 2) (list 3 4)) (list (list 3 4) (list 1 2 4))))
