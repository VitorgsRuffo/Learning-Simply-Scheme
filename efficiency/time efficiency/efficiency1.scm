;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '


;Let's estimate the efficiency of the following algorithm (in terms of time):
(define (square x) (* x x))

(define (squares numbers)
  (if (empty? numbers)
     '()
      (se (square (first numbers))
          (squares (bf numbers))) )) ;returns the square of the first number + the squares of all the numbers in front of it.


(trace squares) ;this will show us all the recursive calls to squares

(squares '(1 2 3))
;the recursive calls of squares:
    ;squares(1 2 3): returns 1² + squares(2 3)
    ;                                |
    ;                                v
    ;                             squares(2 3): returns 2² + squares(3)
    ;                                                           |
    ;                                                           v
    ;                                                        squares(3): returns 3² + squares()
    ;                                                                                    |
    ;                                                                                    v
    ;                                                                                 squares(): returns ()

;operations in squares:
  ;primitive ones: 5
    ;if: constant time
    ;empty? function: constant time
    ;first: constant time
    ;bf: costant time
    ;se: in this particular case which we have word + sentence as arguments we have constant time for se.

  ;not primitive ones: 1
    ;square: constant time

  ;obs: there will be N recursive calls to squares.
  ;obs: in the last recursive call (where numbers is empty) we only perform two operations (if and empty?)

;time taken by the above algorithm: 6*N + 2 (this amount of time is proportinal to the length of the input)
    ;6*N: tells us that if we have an input (list of numbers) of size N (N numbers) we are gonna run the
    ;     above 6 operations N times (that's because we run squares N times) (obs: actually we run it N + 1 times but in the last time we only perform 2 operations - and thats the meaning of the plus 2)
    ;
    ;2: in the last recursive call we don't run the 6 operations, just the first 2 (if and empty?)

