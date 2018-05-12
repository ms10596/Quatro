<<<<<<< HEAD

computerPlay(Grid, Pieces):-
	nextPos(Grid, Pieces, NewGrid, NewPieces),
	computerController(NewGrid, NewPieces).
	
	
||||||| merged common ancestors
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

=======
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
	
	
>>>>>>> af34f0306da447a38b97461ded22647fb6544bb2
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
	
<<<<<<< HEAD
humanController(Grid,[]):-
	displayGrid(Grid),
	write("Draw").	
humanController(Grid,_):-
||||||| merged common ancestors
controller(Grid,_):-
=======
humanController(_,[]):-
	write("Draw").	
humanController(Grid,_):-
>>>>>>> af34f0306da447a38b97461ded22647fb6544bb2
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
<<<<<<< HEAD
computerController(Grid,[]):-
	displayGrid(Grid),
	write("Draw").	
||||||| merged common ancestors
	
=======
computerController(_,[]):-
	write("Draw").	
>>>>>>> af34f0306da447a38b97461ded22647fb6544bb2
main:-
<<<<<<< HEAD
	consult("Prolog/Quatro/win.pl"),
	consult("Prolog/Quatro/minimax.pl"),
	consult("Prolog/Quatro/print.pl"),
||||||| merged common ancestors
	consult("Prolog/Quarto/win.pl"),
=======
	consult("Prolog/Quarto/win.pl"),
	consult("Prolog/Quarto/minimax.pl"),
>>>>>>> af34f0306da447a38b97461ded22647fb6544bb2
	Grid = [1,2,3,4,5,6,7,8,9],
	Pieces = [[black, round, tall], [black, round, short], [black, square, tall], [black, square, short], [white, round, tall], [white, round, short], [white, square, tall], [white, square, short]],
	humanPlay(Grid, Pieces).

