;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '

(define (sumsquare a b)
  (if (> a b)
      0
      (+ (* a a) (sumsquare (+ a 1) b))))

(sumsquare 5 6)

(define (sumcube a b)
  (if (> a b)
      0
      (+ (* a a a) (sumcube (+ a 1) b))))

(sumcube 5 6)

;generalizing the pattern: by analysing the two functions above we notice
;that that only thing different between them is the a²/a³ on the else part
;of the if statement. So we can create a generalized function that takes a
;function that calculates the square or cube.

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

(sum square 5 6) ;functions as data

(sum cube 5 6)

