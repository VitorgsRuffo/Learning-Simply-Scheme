;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '


;in scheme the keyword "lambda" is used to build functions:

  ;this way of defining a function is the same as the one below it:
  (define (square x) (* x x))

  (define sqr (lambda (x) (* x x))) ;"assigning a procedure to a variable"


;lambda returns a procedure which formal parameter(s) is x and body is (* x x x)
(lambda (x) (* x x x))

;as lambda returns a procedure we're able to get that return value and use round brackets to invoke the function it represents:
((lambda (x) (+ x 1)) 5)


;The way lambda is usually used in scheme is when we wanna call a higher order procedure
;that takes a function as argument (in order to generalize a pattern). If that is the only
;moment where we use that function is would be great if we didn't need to define a new
;function solely for this situation. So, we pass the function value directly in the
;higher order function call with the help of lambda.

   ;So, instead of doing like this..
   (define (square x)
     (* x x))

    square

   (define (cube x)
     (* x x x))

    cube

   (define (sum fn a b)
     (if (> a b)
          0
          (+ (fn a) (sum fn (+ a 1) b) )))

    (sum square 5 10)

    ;we simply could:
    (define (sum fn a b)
     (if (> a b)
          0
          (+ (fn a) (sum fn (+ a 1) b) )))

    (sum (lambda(x) (* x x)) 5 10)

    (sum (lambda(x) (* x x x)) 6 8)
     