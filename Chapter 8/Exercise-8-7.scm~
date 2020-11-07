#lang planet dyoo/simply-scheme:2:2

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

; When you're talking to someone over a noisy radio connection, you sometimes have to spell out a word in order to get the other person to understand it. But names of letters aren't that easy to understand either, so there's a standard code in which each letter is represented by a particular word that starts with the letter. For example, instead of "B" you say "bravo."
;Write a procedure `words` that takes a word as its argument and returns a sentence of the names of the letters in the word:**


(define (phonetic letter)
(cond ((member? letter 'Aa)	'Alpha)
((member? letter 'Bb)	'Bravo)
((member? letter 'Cc)	'Charlie)
((member? letter 'Dd)	'Delta)
((member? letter 'Ee)	'Echo)
((member? letter 'Ff)	'Foxtrot)
((member? letter 'Gg)	'Golf)
((member? letter 'Hh)	'Hotel)
((member? letter 'Ii)	'India)
((member? letter 'Jj)	'Juliet)
((member? letter 'Kk)	'Kilo)
((member? letter 'Ll)	'Lima)
((member? letter 'Mm)	'Mike)
((member? letter 'Nn)	'November)
((member? letter 'Oo)	'Oscar)
((member? letter 'Pp)	'Papa)
((member? letter 'Qq)	'Quebec)
((member? letter 'Rr)	'Romeo)
((member? letter 'Ss)	'Sierra)
((member? letter 'Tt)	'Tango)
((member? letter 'Uu)	'Uniform)
((member? letter 'Vv)	'Victor)
((member? letter 'Ww)	'Whiskey)
((member? letter 'Xx)	'X-ray)
((member? letter 'Yy)	'Yankee)
((member? letter 'Zz)	'Zulu)))

(define (words wd)
  (every phonetic wd))

(words 'cab)
;(CHARLIE ALPHA BRAVO)

;(You may make up your own names for the letters or look up the standard ones if you want.)
;Hint: Start by writing a helper procedure that figures out the name for a single letter.