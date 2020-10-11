;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '


;Let's estimate the efficiency of the following algorithm (in terms of time): insertion sort
;Tip: it's better to thing about the worst case when estimating the running time of an algorithm

(define (sort sent)
  (if (empty? sent)
      '()
      (insert (first sent)
              (sort (bf sent)))) )

(define (insert num sent)   ;the domain of this function is number AND a sentence of numbers ; the range of it is a sentence of numbers
  (cond ((empty? sent) (se num sent))
        ((< num (first sent)) (se num sent))
        (else (se (first sent) (insert num (bf sent)))) ))

(trace sort)
(trace insert)

(sort '(3 2 1))

;the recursive calls: 28:15
    ;sort (3 2 1): returns (insert (3) (sort (2 1))
    ;                          |            |
    ;                          |            v
    ;                          |        sort (2 1): returns (insert (2) (sort (1))
    ;                          |                                |            |
    ;                          |                                |            v
    ;                          |                                |        sort (1): returns (insert (1) (sort ())
    ;                          |                                |                                  |         |
    ;                          |                                |                                  |         v
    ;                          |                                |                                  |     sort (): returns ()
    ;                          |                                |                                  v
    ;                          |                                |                           (insert (1) ()): returns (1)
    ;                          |                                |
    ;                          |                                v
    ;                          |                            (insert (2) (1)): returns (1 insert 2 ())
    ;                          |                                                            |
    ;                          |                                                            |
    ;                          v                                                            v
    ;                        (insert (3) (sort (2 1))                                  (insert 2 ()): returns (2)
    ;                                         |
    ;                                         |
    ;                                         v
    ;                                        ...


;time taken on the worst scenario (numbers in descending order) for the above algorithm is: N(4 + (7N)/2 + 5) + 2 = (7N²)/2 + 9N + 2 
;obs: we usually don't care about constant factors in the function that tells us the running time of an algoritm

;Obs: in functional programming we don't change the value of anything. We don't use data structures, for example.
;     What we do is to simply write functions that will take inputs and produce an output without changing the value of anything.