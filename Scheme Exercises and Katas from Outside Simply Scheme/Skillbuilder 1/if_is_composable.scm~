#lang planet dyoo/simply-scheme:2:2

;> Write a procedure `indef-article` that works like this:

;	> (indef-article 'beatle)
;	(A BEATLE)
;
;	> (indef-article 'album)
;	(AN ALBUM)
;
;> Don't worry about silent initial consonants like the `h` in `hour`.

(define (vowel? x) (member? x '(a e i o u)))

(define (indef-article wd)
  (if (vowel? (first wd)) (se 'an wd) (se 'a wd)))

(indef-article 'beatle)

(indef-article 'album)