#lang racket
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
		(and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num)
		(and (number? exp) (= exp num)))
(define (make-sum a1 a2) 
		(cond ((=number? a1 0) a2)
			  ((=number? a2 0) a1)
			  ((and (number? a1) (number? a2)) (+ a1 a2))
			  (else (list `+ a1 a2))))
(define (make-product m1 m2) 
		(cond ((or (=number? m1 0) (=number? m2 0)) 0)
			  ((=number? m1 1) m2)
			  ((=number? m2 1) m1)
			  ((and (number? m1) (number? m2)) (* m1 m2))
			  (else (list `* m1 m2))))
(define (sum? x);是和式吗
		(and (pair? x) (eq? (car x) `+)))
(define (addend s) (cadr s));和式的被加数
(define (augend s) (caddr s));和式的加数
(define (product? x);是乘式吗
		(and (pair? x) (eq? (car x) `*)))
(define (multiplier p) (cadr p));乘式的被乘数
(define (multiplicand p) (caddr p));乘式的乘数
(define (exponentiation? x);是乘幂式吗
		(and (pair? x) (eq? (car x) `**)))
(define (base x) (cadr x));底
(define (exponent x) (caddr x));指数
(define (make-exponentiation x y)
		(cond ((=number? x 0) 0)
			  ((=number? y 0) 1)
			  ((=number? y 1) x)
			  (else (list `** x y))))
(define (deriv myexp var)
		(cond ((number? myexp) 0)
			  ((variable? myexp)
			   (if (same-variable? myexp var) 1 0))
			  ((sum? myexp)
					 (make-sum (deriv (addend myexp) var)
							   (deriv (augend myexp) var)))
			  ((product? myexp)
						 (make-sum
						   (make-product (multiplier myexp)
										 (deriv (multiplicand myexp) var))
						   (make-product (deriv (multiplier myexp) var)
										 (multiplicand myexp))))
			  ((exponentiation? myexp)
						(make-product 
							(make-product (exponent myexp) 
										  (make-exponentiation (base myexp) (make-sum (exponent myexp) -1)))
							(deriv (base myexp) var)))
			  (else 
				(error "error!"))))
(deriv `(** x 8) `x)
