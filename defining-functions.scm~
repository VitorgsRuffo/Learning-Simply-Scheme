;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))

;escape char: ' (this quote changes (escape) the meaning of a special symbol (e.g,"'+" means just "+" and not the definition of the function + )

;a lone value means itself (self-evaluating)
3

;+ is a function that takes number parameters and return their sum.
(+ 2 3)

;sqrt function takes one parameter and return its square root
(sqrt 16) 

;returns the definition of the function '+'
+

;will mean just "(+ 2 3)" (the function will not be executed)
'(+ 2 3)

; "(Vitor Gabriel)" (obs: this is a sentence)
'(Vitor Gabriel)

;means "Hello". if you type just the word Hello you'll get an error. (obs: this is a word)
'Hello  

;other built-in functions:

;returns the fist symbol of its argument
(first 247)
(first 'Vitor)

;both are the same. They return all the symbols but the first one.
(butfirst 247)
(bf 247)

;combining functions:
(first (bf 'Vitor))
(+ (first 333) (last 124))

;Defining a "variables":
(define pi 3.14159)
pi
'pi
(+ pi 2)

;Defining a function:
(define (cube x)   ;x is the "formal parameter" and is the name by which we'll reference the argument in the function body.
  (* x x x))       

(cube 2)
(cube (+ 4 1))     ;(+ 4 1) is the "actual argument expression" used in the function invocation
                   ;(5) is the result of the actual argument expression and is called "actual argument value".
