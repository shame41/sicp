#lang racket
(require sicp)
(define-syntax cons-stream
	(syntax-rules ()
				  ((cons-stream a b)
					(cons a (delay b)))))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))
(define (integers-starting-from n)
		(cons-stream n (integers-starting-from (+ n 1))))
(define (average a b)
		(/ (+ a b) 2))
(define (stream-map proc . argstreams)
		(if (null? (car argstreams))
			'()
			(cons-stream
			  (apply proc (map stream-car argstreams))
			  (apply stream-map 
					 (cons proc (map stream-cdr argstreams))))))
(define (sqrt-improve guess x)
		(average guess (/ x guess)))
(define (sqrt-stream x)
		(define guesses
		  (cons-stream 1.0
					   (stream-map (lambda (guess)
									 (sqrt-improve guess x))
								   guesses)))
		guesses)
(define (stream-for-each proc s)
		(if (null? s)
			`done
			(begin (proc (stream-car s))
				   (stream-for-each proc (stream-cdr s)))))
(define (display-stream s)
		(stream-for-each display-line s))
(define (display-line x)
		(newline)
		(display x))
(define (make-tableau transform s);加速级数
		(cons-stream s
					 (make-tableau transform
								   (transform s))))
(define (accelerated-sequence transform s)
		(stream-map stream-car
					(make-tableau transform s)))
(define (scale-stream stream factor)
		(stream-map (lambda (x) (* x factor))
					stream))
(define (partial-sums s)
		(cons-stream
		  (stream-car s)
		  (stream-map (lambda (x) (+ x (stream-car s)))
					  (partial-sums (stream-cdr s)))))
(define (ln2-summands n)
		(cons-stream (/ 1.0 n)
					 (stream-map - (ln2-summands (+ n 1)))))
(define ln2-stream
  (partial-sums (ln2-summands 1)))
(define (interleave s1 s2)
		(if (null? s1)
			s2
			(cons-stream (stream-car s1)
						 (interleave s2 (stream-cdr s1)))))
(define integers (integers-starting-from 1))
(define (pairs s t)
		(cons-stream
		  (list (stream-car s) (stream-car t))
		  (interleave
				(stream-map (lambda (x) (list (stream-car s) x))
							(stream-cdr t))
				(pairs (stream-cdr s) (stream-cdr t)))))
(ln2-summands 3)
