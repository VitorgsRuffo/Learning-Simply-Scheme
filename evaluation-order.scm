;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '

(define (g x) (* 3 x))
g

(define (f a b) (+ (g a) b))
f

;Applicative order: evaluating actual argument expressions then passing the actual argument value to the procedure formal parameter.

(applic (f (+ 2 3) (- 15 6)))

 ;evaluation:
   ;(f (+ 2 3) (- 15 6))
   ;(+ 2 3) ==> 5
   ;(- 15 6) ==> 9
   ;(f 5 9) ---->
   ;(+ (g 5) 9)
   ;(g 5) ---->
   ;(* 3 5) ==> 15
   ;(+ 15 9) ==> 24
   ;24


;Normal order: passing the actual argument expressions to the formal parameters.

(normal (f (+ 2 3) (- 15 6)))

  ;evaluation:
     ;(f (+ 2 3) (- 15 6)) ---->
     ;(+ (g (+ 2 3)) (- 15 6))
     ;(g (+ 2 3)) ---->
     ;(* 3 (+ 2 3))
     ;(+ 2 3) ==> 5
     ;(* 3 5) ==> 15
     ;(- 15 6) ==> 9
     ;(+ 15 9) ==> 24
     ;24

;by analysing this scenario it doesn't matter which order of evaluation we choose, we're gonna get the same result at the end.
;but, there is some cases, like the following one, that it actually does matther.

(def (zero x) (- x x))

;applicative order:
(applic (zero (random 10)))  ;(random x) returns a random number between 0 and x (not including x)
                             ;random is not a function because if you call it with the same argument different times you may get different outputs. 
  ;evaluation:
    ;(zero (random 10))
    ;(random 10) ==> 5
    ;(zero 5) ---->
    ;(- 5 5) ==>  0
    ;0

;normal order:
(normal (zero (random 10)))

  ;evaluation:
    ;(zero (random 10)) ---->
    ;(- (random 10) (random 10))
    ;(random 10) ==> 4
    ;(random 10) ==> 8
    ;(- 4 8) ==> -4
    ;-4
