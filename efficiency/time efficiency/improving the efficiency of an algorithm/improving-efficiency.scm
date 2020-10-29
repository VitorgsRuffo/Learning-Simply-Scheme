;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '

;Pascal’s triangle:
;The nth row of Pascal’s triangle contains the constant coefficients of the terms of (a + b)^n . Each number
;in Pascal’s triangle is the sum of the two numbers above it.

;Let's see a bad algorithm for calculating an element of the triangle given its
;row and column (counting from 0):

(define (pascal row col)
  (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col) )) ))

(trace pascal)
(pascal 13 9)

;Obs: this will take 0(2^N), it's intractable. For larger inputs this algorithm will run forever.
;That happens because to find the number in the row and column passed we first must find
;the two numbers above it. And, to find those two we first must find the four above
;them, and so on...(check ./unefficient-pascal-algoritm.png image).

;Obs: the main reason why this algorithm is bad is that it is computing the same numbers in pascal's triangle a ton of times.


;This is an nicier algoritm for doing the job: 

(define (new-pascal row col)
  (nth col (pascal-row row)) )

(define (pascal-row row-num)
  (define (iter in out)
    (if (empty? (bf in))
        out
        (iter (bf in) (se (+ (first in) (first (bf in))) out)) ))
  (define (next-row old-row num)
    (if (= num 0)
        old-row
        (next-row (se 1 (iter old-row ’(1))) (- num 1)) ))
  (next-row ’(1) row-num) )


;Obs: it takes 0(N²) time. It calculates all the rows until the element-we-want's row and then
;the element in the specified column is returned. We do calculate some elements we'll not use
;but we just calculate each element once, thus, this algoritm is faster.


;Moral: always try to think hard about what might be making your program run slow and
;how you can get a better order of growth (refactor the algorithm so that it run faster
;in bad scenarios. In the previous example we could see that the fact we're calculating
;the same numbers a lot of times caused the algorithm to be slow. So, we changed the whole
;algorithm to make calculate all the rows until the row of the element we want, that way
;we would not calculate the same numbers more than once.

;Another Moral: we can write an algorithm that performs even better with the help of a mathematical
;formula that returns element in the nth row and mth column of the triangle (formula: ./pascal's-triangle-element-formula.png)
;With this new algorithm takes 0(N) time.
;So: "an once (~ 28.35 grams) of mathematics is worth a pound (~ 453.59 grams) of computer science", - Brian Harvey, 61A course at Berkeley.





