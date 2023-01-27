#lang racket
(define (make-monitored f)
		(define counter 0)
		(define (dispatch m)
				(cond ((eq? m `how-many-calls) counter)
					  ((eq? m `reset-count) (set! counter 0))
					  (else (set! counter (+ 1 counter))
							(f m))))
		dispatch)
(define s (make-monitored sqrt))
(s 100)
(random 50 100)
(s `how-many-calls)