version 4

;(define (tie-game? position me)
;(cond ((or (already-won? position me)
;           (already-won? position (opponent me))) #f)
;      ((and (equal? (appearances '_ position) 2)
;            (or (i-can-win? (find-triples position) me)
;                (opponent-can-win? (find-triples (position-updater position me)) me))) #f)
;     ((and (equal? (appearances '_ position) 1) (i-can-win? (find-triples position) me)) #f)
;     (else #t)))

; version 3

;(define (tie-game? position letter)
;(and (not (already-won? position letter))
;     (not (already-won? position (opponent letter)))
;     (and (equal? (appearances '_ position) 1) (not (already-won? (position-updater position letter) letter)))))



; newer version/version 2
;(define (tie-game? position letter)
;(and (not (already-won? position letter))
;     (not (already-won? position (opponent letter)))
;     (equal?
;        (count (keep (lambda (triple) (free-space-is-present? triple letter))(find-triples position)))
;        (count (keep (lambda (triple) (triple-is-tie? triple letter)) (find-triples position))))))





; older version
;(define (tie-game? position letter)
;  (if (not (member? '_ position)) #t
;      (if (equal? (appearances '_ position) 1)
;        (equal?
;        (count (keep (lambda (triple) (free-space-is-present? triple letter))(find-triples position)))
;        (count (keep (lambda (triple) (triple-is-tie? triple letter)) (find-triples position))))
;        #f)))
