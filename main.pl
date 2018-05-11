displayGrid(L):-
	nth1(1, L, One), nth1(2, L, Two), nth1(3, L, Three), 
	nth1(4, L, Four), nth1(5, L, Five), nth1(6, L, Six), 
	nth1(7, L, Seven), nth1(8, L, Eight), nth1(9, L, Nine),
	
	write(*******************************************************),nl,	
 
	write(*), write(One), write("\t"), write(Two), write("\t"), write(Three),write(*),nl,
	write(*), write(Four), write("\t"), write(Five), write("\t"), write(Six),write(*),nl,
	write(*), write(Seven), write("\t"), write(Eight), write("\t"), write(Nine),write(*),nl,

	write(*******************************************************),nl.

displayPieces([],_):-!.
displayPieces([H|T],I):-
	write(I), write("-"), write(H),nl,IPlus is I + 1,displayPieces(T, IPlus).

humanPlay(Grid, Pieces):-
	displayGrid(Grid),
	displayPieces(Pieces, 1),
	
	
	write("Please enter piece number! "),nl,
	get_single_char(X),
	PieceNum is X - 48,
	nth1(PieceNum ,Pieces, Piece, NewPieces),
	write(Piece),nl,

	write("Please enter grid number! "),nl,
	get_single_char(Y),
	GridNum is Y - 48,
	write(GridNum),nl,
	select(GridNum, Grid, Piece, NewGrid),
	
	controller(NewGrid, NewPieces).
	
	
controller(Grid,_):-
	winningCase(Grid),
	displayGrid(Grid),
	write("You have won! ").
controller(Grid, Pieces):-
	\+winningCase(Grid),
	humanPlay(Grid, Pieces).
	
main:-
	consult("Prolog/Quarto/win.pl"),
	Grid = [1,2,3,4,5,6,7,8,9],
	Pieces = [[blk, rnd, tall], [blk, rnd, shrt], [blk, sqr, tall], [blk, rnd, shrt], 
		[whte, rnd, tall], [whte, rnd, shrt], [whte, sqr, tall], [whte, sqr, shrt]],
	humanPlay(Grid, Pieces).

