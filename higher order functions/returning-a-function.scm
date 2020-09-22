;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '

;Here we define a function named "make-adder" that has a formal parameter called "num" an its body simply returns a function (this function adds num to an x took as parameter).
(define (make-adder num)
  (lambda(x) (+ x num)))

((make-adder 10) 5) ;make-adder returns (lambda(x) (+ x 10)), which is invoked with the actual argument value of 5 and return 5 + 10.

(define plus5 (make-adder 5)) ;plus5 will take an argument value and return that value plus 5.

(plus5 20)


;Another example: returning the composition of f and g - f(g(x))

(define (compose f g)
  (lambda (x)(f (g x)))) ;compose takes two functions (f and g) and returns a function that will take an x, invoke g passing that x, then invoke f with the return value of g, and finally return the return value of f. 

(define secondword (compose first bf))

(secondword '(good morning you all!))

