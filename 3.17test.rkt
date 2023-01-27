#lang racket
(define have-been `())
(define (count-pairs x)
		(if (or (not (pair? x)) (memq x have-been))
			0
			(begin
			  (set! have-been (cons x have-been))
			  (+ (count-pairs (car x))
				 (count-pairs (cdr x))
				 1))))
(count-pairs (cons (list `a `b) (list `a `b)))
