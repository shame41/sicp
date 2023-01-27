#lang racket
(define (make_center_percent c p) (cons c p))
(define (percent num) (cdr num))
(define (center num) (car num))
