displayGrid(L):-
	nth1(1, L, One), nth1(2, L, Two), nth1(3, L, Three), 
	nth1(4, L, Four), nth1(5, L, Five), nth1(6, L, Six), 
	nth1(7, L, Seven), nth1(8, L, Eight), nth1(9, L, Nine),
	  
	write(One), write(" "), write(Two), write(" "), write(Three),nl,
	write(Four), write(" "), write(Five), write(" "), write(Six),nl,
	write(Seven), write(" "), write(Eight), write(" "), write(Nine),nl,!.
displayPieces([],_):-!.
displayPieces([H|T],I):-
	write(I), write("-"), write(H),nl,IPlus is I + 1,displayPieces(T, IPlus).
play(Grid, Pieces):-
	/*displayPieces(Pieces, 1),
	displayGrid(Grid),*/
	
	write("Please enter piece number! "),
	read(PieceNum),
	nth1(PieceNum ,Pieces, Piece, NewPieces),
	write("Please enter grid number! "),
	read(GridNum),
	select(GridNum, Grid, Piece, NewGrid),
	
	controller(NewGrid, NewPieces).
	
	
controller(Grid,_):-
	winningCase(Grid),
	write("You have won! ").
controller(Grid, Pieces):-
	\+winningCase(Grid),
	play(Grid, Pieces).
	

main:-
	consult("Prolog/Quarto/win.pl"),
	Grid = [1,2,3,4,5,6,7,8,9],
	Pieces = [[blk, rnd, tall], [blk, rnd, shrt], [blk, sqr, tall], [blk, rnd, shrt], 
		[whte, rnd, tall], [whte, rnd, shrt], [whte, sqr, tall], [whte, sqr, shrt]],
	play(Grid, Pieces).
input:-
	read(X),
	write(X).
