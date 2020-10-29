;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '

;Let's see the difference between using an linear RECURSIVE process (the one we've been using so far),
;and and ITERATIVE process in terms of space efficiency:


;counting the number of words in a sentence:


;linear RECURSIVE process:

;(it takes 0(N) time.
;it takes 0(N) space, not counting space for the input sentence, since we've got a stackframe for each recursive call (and we have N recursive calls). )

(define (count sent)
  (if (empty? sent)
      0
      (+ 1 (count (bf sent))) ))

(trace count) ;this will show us all the recursive calls to count

(count '(Good morning you all !))

;the thing here is: Scheme has to keep track of N pending computations
;during the processing and that takes memory.
;When we get halfway through this process and compute (count ’()), we aren’t finished with the entire
;problem. We have to remember to add 1 to the result six times. Each of those remembered tasks requires
;some space in memory until it’s finished.


;ITERATIVE process:


(define (count2 sent)
  (define (iter words result)
    (if (empty? words)
        result
        (iter (bf words) (+ result 1)) )) ;the recursive call is the last thing done (applicative order)
  (trace iter) ;tracing iter
  (iter sent 0 ))


(count2 '(Good morning you all !))

;as we can see, with the help of trace function, we have we've got recursive calls
;to iter, BUT, as we pass the current result when calling another instance of iter
;we don't need to keep track of where each call should return control to since once we
;reach the base case the final result will already be in "result" and we just need to
;return it back to the count2 caller. That makes us save memory as we don't push stackframes
;to the stack.


;in these situations where the recursive call is the last thing to do the Scheme interpreter
;don't see it as a recursive chaining as it does with the count function, it sees it as just being
;an iteration where calling iter is the same as just going back to the top and execute the next iteration (like a while loop).
;(obs: go back to count function. you'll see that the recursive call is not the last thing to be done.
;what actually is the last thing is the addition, so, scheme deals with that as a recursive chain as usual.




