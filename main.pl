displayGrid([One, Two, Three, Four, Five, Six, Seven, Eight, Nine]):-

	write(*******************************************************),nl,	
 
	write(*), write(One), write("\t\t"), write(Two), write("\t\t"), write(Three),write(*),nl,
	write(*), write(Four), write("\t\t"), write(Five), write("\t\t"), write(Six),write(*),nl,
	write(*), write(Seven), write("\t\t"), write(Eight), write("\t\t"), write(Nine),write(*),nl,

	write(*******************************************************),nl.

displayPieces([],_):-!.
displayPieces([H|T],I):-
	write(I), write("-"), write(H),nl,IPlus is I + 1,displayPieces(T, IPlus).
computerPlay(Grid, Pieces):-
	nextPos(Grid, Pieces, NewGrid, UsedPiece),
	delete(Pieces, UsedPiece, NewPieces),
	computerController(NewGrid, NewPieces).
	
	
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
	
	humanController(NewGrid, NewPieces).
	
humanController(_,[]):-
	write("Draw").	
humanController(Grid,_):-
	winningCase(Grid),
	displayGrid(Grid),
	write("Human has won! ").
humanController(Grid, Pieces):-
	\+winningCase(Grid),
	computerPlay(Grid, Pieces).

computerController(Grid,_):-
	winningCase(Grid),
	displayGrid(Grid),
	write("Computer has won! ").
computerController(Grid, Pieces):-
	\+winningCase(Grid),
	humanPlay(Grid, Pieces).
computerController(_,[]):-
	write("Draw").	
main:-
	consult("Prolog/Quarto/win.pl"),
	consult("Prolog/Quarto/minimax.pl"),
	Grid = [1,2,3,4,5,6,7,8,9],
	Pieces = [[blk, rnd, tall], [blk, rnd, shrt], [blk, sqr, tall], [blk, rnd, shrt], 
		[whte, rnd, tall], [whte, rnd, shrt], [whte, sqr, tall], [whte, sqr, shrt]],
	humanPlay(Grid, Pieces).

