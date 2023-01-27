#lang racket
(define (square_tree x)
		(map 
		(lambda (subtree) 
				(if (pair? subtree)
					(square_tree subtree)
					(* subtree subtree)))
		x))
(square_tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
