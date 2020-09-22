;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '


;let is a scheme tool for defining and invoking an anonymous/unnamed function at the same time:

  ;the usual way to do that:
  ((lambda (x) (* x x)) 10)

  ((lambda (x y) (+ x y)) 15 20)

  ;the "let way":
  (let ((x 10)) (* x x))

  (let ((x 15)
        (y 20))
       (+ x y))

;Situation where let would be pretty useful: calculation the roots of a quadratic polynomial.

(define (roots a b c)
  (se (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
      (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)) )
)

(roots 1 -5 6)

   ;but there is a problem: we're calculating the discriminant twice. We should compute it once then use that value twice.
   (define (roots a b c)
     (define (roots-helper d)
       (se (/ (+ (- b) d) (* 2 a))
           (/ (- (- b) d) (* 2 a)) ))
     (roots-helper (sqrt (- (* b b) (* 4 a c)))) ) ;here we're defining a function that defines and invokes a function inside of itself.
                                                   ;in other words, we first calculate the discriminant then we invoke a function to do the two other needed computations.


    ;that led us to another problem: we're not using the roots-helper function later on our code. So, we can use lambda as we've seen.
    (define (roots a b c)
      ((lambda (d)
         (se (/ (+ (- b) d) (* 2 a))
             (/ (- (- b) d) (* 2 a))) )
       (sqrt (- (* b b) (* 4 a c)))) )

    ;but that is very defficult to read right? So we use the let construct to simplify that to us
    

   
   
