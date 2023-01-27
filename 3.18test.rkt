#lang racket
(require sicp)
(define (loop? lst)
    (let ((identity (cons '() '())))
        (define (iter remain-list)
            (cond ((null? remain-list)
                    #f)
                  ((eq? identity (car remain-list))
                    #t)
                  (else
                    (set-car! remain-list identity)
                    (iter (cdr remain-list)))))
        (iter lst)))
(define (last-pair x)
		(if (null? (cdr x))
			x
			(last-pair (cdr x))))
(define (cycle? x)
		(define p (cons x (cdr x)))
		(define (finder x) 
				(if (eq? `() (cdr p))
					true
					(if (eq? (car p) (cdr p))
						false
						(begin
							(set-car! p (cadr p))
							(set-cdr! p (cadar p))
							(finder x)))))
		(finder x))
(define (make-cycle x)
		(set-cdr! (last-pair x) x)
		x)
(define z (make-cycle (list `a `b `c)))
z
