#lang racket
(define (my_reverse mylist)
		(if (null? (cdr mylist))
			mylist
			(append (my_reverse (cdr mylist)) (list (car mylist)))))
(my_reverse (list 1 4 9 16 25))
