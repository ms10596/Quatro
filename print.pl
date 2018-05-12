displayGrid([One, Two, Three, Four, Five, Six, Seven, Eight, Nine]):-

	write(*******************************************************),nl,	
 
	write(*), displayPiece(One), displayPiece(Two), displayPiece(Three),write(*),nl,
	write(*), displayPiece(Four), displayPiece(Five), displayPiece(Six),write(*),nl,
	write(*), displayPiece(Seven), displayPiece(Eight), displayPiece(Nine),write(*),nl,

	write(*******************************************************),nl.

displayPiece([Color, Shape, Length]):-
	Color = black,
	Shape = round,
	Length = tall,
	ansi_format([fg(black), bg(white)],'oo~w',['\t']). 
	
displayPiece([Color, Shape, Length]):-
	Color = black,
	Shape = round,
	Length = short,
	ansi_format([fg(black), bg(white)],'o~w',['\t']). 
displayPiece([Color, Shape, Length]):-
	Color = black,
	Shape = square,
	Length = tall,
	ansi_format([fg(black), bg(white)],'##~w',['\t']). 
displayPiece([Color, Shape, Length]):-
	Color = black,
	Shape = square,
	Length = short,
	ansi_format([fg(black), bg(white)],'#~w',['\t']). 
displayPiece([Color, Shape, Length]):-
	Color = white,
	Shape = round,
	Length = tall,
	ansi_format([fg(white), bg(black)],'oo~w',['\t']). 
displayPiece([Color, Shape, Length]):-
	Color = white,
	Shape = round,
	Length = short,
	ansi_format([fg(white), bg(black)],'o~w',['\t']). 
displayPiece([Color, Shape, Length]):-
	Color = white,
	Shape = square,
	Length = tall,
	ansi_format([fg(white), bg(black)],'##~w',['\t']). 
displayPiece([Color, Shape, Length]):-
	Color = white,
	Shape = square,
	Length = short,
	ansi_format([fg(white), bg(black)],'#~w',['\t']). 
displayPiece(Piece):-
	write(Piece),
	write('\t').
displayPieces([],_):-!.
displayPieces([H|T],I):-
	write(I), write("-"), displayPiece(H),nl,IPlus is I + 1,displayPieces(T, IPlus).
