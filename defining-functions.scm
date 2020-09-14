;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '

;plural function:
(define (plural wd)
  (word wd 's))

(plural 'vitor)


;improved plural function (that works for words like study (studies))
(define (improvedPlural wd)
  (if (equal? (last wd) 'y)    ;(equal? (x) (y)): test the equality of expressions x and y.
      (word (butlast wd) 'ies)
      (word wd 's)))

(improvedPlural 'fly)
(improvedPlural 'Vitor)


;Remember how to play Buzz? You go around the circle counting, but if your number is
;divisible by 7 or has a digit 7 you have to say “buzz” instead:
(define (buzz n)
  (cond ((equal? (remainder n 7) 0) 'buzz) ;cond is a condition testing structure just like if ; (remainder x y) returns the remainder of the division of x and y.
        ((member? 7 n) 'buzz)              ;(member? y x) checks if y is a subpart of x.
        (else n)))

(buzz 7)
(buzz 15)
(buzz 17)