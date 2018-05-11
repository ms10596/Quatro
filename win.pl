similarPieces(This, That):-
	nth1(1, This, ThisOne), nth1(2, This, ThisTwo), nth1(3, This, ThisThree),
	nth1(1, That, ThatOne), nth1(2, That, ThatTwo), nth1(3, That, ThatThree),
	(ThisOne = ThatOne ; ThisTwo = ThatTwo ; ThisThree = ThatThree).

completeFirstRow(Grid):-
	nth(1, Grid, FirstPiece), nth(2, Grid, SecondPiece), nth(3, Grid, ThirdPiece),
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeSecondRow(Grid):-
	nth(4, Grid, FirstPiece), nth(5, Grid, SecondPiece), nth(6, Grid, ThirdPiece),
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeThirdRow(Grid):-
	nth(7, Grid, FirstPiece), nth(8, Grid, SecondPiece), nth(9, Grid, ThirdPiece),
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeFirstCol(Grid):-
	nth(1, Grid, FirstPiece), nth(4, Grid, SecondPiece), nth(7, Grid, ThirdPiece),
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeSecondCol(Grid):-
	nth(2, Grid, FirstPiece), nth(5, Grid, SecondPiece), nth(8, Grid, ThirdPiece),
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeThirdCol(Grid):-
	nth(3, Grid, FirstPiece), nth(6, Grid, SecondPiece), nth(9, Grid, ThirdPiece),
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeNike(Grid):-
	nth(3, Grid, FirstPiece), nth(5, Grid, SecondPiece), nth(7, Grid, ThirdPiece),
	similarPieces(FirstPiece, SecondPiece),
	similarPieces(FirstPiece, ThirdPiece), 
	similarPieces(SecondPiece, ThirdPiece).	

completeAntiNike(Grid):-
	nth(1, Grid, FirstPiece), nth(5, Grid, SecondPiece), nth(9, Grid, ThirdPiece),
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
