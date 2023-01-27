#lang racket
(define (same_parity x . y)
		(define (odd_iter mylist)
				(if (null? mylist)
					mylist
					(if (odd? (car mylist))
						(append (list (car mylist)) (odd_iter (list (cdr mylist))))
						(list (odd_iter (cdr mylist))))))
		(odd_iter y))
(same_parity (list 1 2 3))
