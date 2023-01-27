#lang racket
(define (last_pair mylist)
		(if (null? (cdr mylist))
			mylist
			(last_pair (cdr mylist))))
(last_pair (list 1 2 3 4))
