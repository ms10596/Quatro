similarPieces([ThisOne, ThisTwo,ThisThree],[ThatOne, ThatTwo, ThatThree]):-
	ThisOne = ThatOne ; ThisTwo = ThatTwo ; ThisThree = ThatThree.

completeFirstRow([FirstPiece, SecondPiece, ThirdPiece, _, _, _, _, _, _]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeSecondRow([_, _, _, FirstPiece, SecondPiece, ThirdPiece, _, _, _]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeThirdRow([_, _, _, _, _, _, FirstPiece, SecondPiece, ThirdPiece]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeFirstCol([FirstPiece, _, _, SecondPiece, _, _, ThirdPiece, _, _]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeSecondCol([_, FirstPiece, _, _, SecondPiece, _, _, ThirdPiece, _]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeThirdCol([_, _, FirstPiece, _, _, SecondPiece, _, _, ThirdPiece]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeNike([_, _, FirstPiece, _, SecondPiece, _, ThirdPiece, _, _]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeAntiNike([FirstPiece, _, _, _, SecondPiece, _, _, _, ThirdPiece]):-
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

winningCase(Grid):-
	completeFirstRow(Grid);
	completeSecondRow(Grid); 
	completeThirdRow(Grid); 
	
	completeFirstCol(Grid) ; 
	completeSecondCol(Grid);
	completeThirdCol(Grid);

	completeNike(Grid);
	completeAntiNike(Grid).
/*filledGrid(Grid):-
	filled(Grid, 1, 0, Cnt),
	Cnt = 8.
filled([], _, Cnt,Cnt):-!.
filled([H|T], Index, Cnt, Final):-
	H = Index,
	NewCnt is Cnt + 1,
	%write(NewCnt),nl,
	NewIndex is Index + 1,
	filled(T, NewIndex, NewCnt, Final).
filled([H|T], Index, Cnt, Final):-
	\+H = Index,
	NewIndex is Index + 1,
	filled(T, NewIndex, Cnt, Final).*/ 	

	
