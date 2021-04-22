#lang planet dyoo/simply-scheme:2:2



;At the end of the game, if the computer wins or ties, you never find out which square it chose for its final move. Modify the program to correct this. (Notice that this exercise requires you to make play-ttt-helper non-functional.)


(define (play-ttt-helper x-strat o-strat position whose-turn)
  (cond ((already-won? position (opponent whose-turn))
           (print-position position)
	 (list (opponent whose-turn) 'wins!))
	((tie-game? position)
           (print-position position)
         '(tie game))
	(else (let ((square (if (equal? whose-turn 'x)
				(x-strat position 'x)
				(o-strat position 'o))))
		(play-ttt-helper x-strat
				 o-strat
				 (add-move square whose-turn position)
				 (opponent whose-turn))))))

