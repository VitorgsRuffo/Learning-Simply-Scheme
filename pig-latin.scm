;header for running simply-scheme on DrRacket:
#lang racket
(require (planet dyoo/simply-scheme:2:2))
;escape character: '


;Pig Latin: Move initial consonants to the end of the word and append “ay”; SCHEME becomes EMESCHAY.
;Pig Latin will use recursion to perform its task. (recursion: a function that invokes itself)

(define (pigl wd)
  (if (is-next-word-vowel? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (is-next-word-vowel? wd)
  (member? (first wd) '(a e i o u)))

(pigl 'scheme)
(pigl 'vitor)