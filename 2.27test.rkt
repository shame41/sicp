#lang racket
(define (my_reverse mylist)
		(if (null? (cdr mylist))
			mylist
			(append (my_reverse (cdr mylist)) (list (car mylist)))))
(define (deep_reverse mylist)
		(if (not (pair? mylist))
			mylist
			(map deep_reverse (my_reverse mylist))))
(deep_reverse (list ((1 2) (3 4))))
