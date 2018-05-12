<<<<<<< HEAD
humanUtitlity(Grid, -1).
computerUtility(Grid, 1).

terminal(Grid):-
	winningCase(Grid).

freeSpace(L, H):-
	member(H, L),
	number(H).

freePiece(L, H):-
	member(H, L).
nextPos(Grid, Pieces, NewGrid, NewPieces):-
	freeSpace(Grid, FreeSpace),
	freePiece(Pieces, FreePiece),
	delete(Pieces, FreePiece, NewPieces),
	select(FreeSpace, Grid, FreePiece, NewGrid). 

max-value(Grid, Pieces, Value):-
	terminal(Grid),
	computerUtility(Grid, Value).

max-value(Grid, Pieces, Value):-
	findall(NextState, nextPos(Grid, Pieces, NextState, NewPieces), NextStatesList),
	findall(RemainingPieces, nextPos(Grid, Pieces, _, RemainingPieces), RemainingPiecesList),
	max-value-list(NextStatesList,RemainingPiecesList, Value).

max-value-list([],Mx,MxGrid,RemainingPieces).

max-value-list([H|T],Mx,MxGrid,MxPieces):-
	max-value(H, Value),
	Value > Mx,
	NewMx is Value,
	max-value-list(T, NewMx,MxGrid,MxPieces).

max-value-list([H|T],Mx,MxGrid,MxPieces):-
	max-value(H, Value),
	\+Value > Mx,
	max-value-list(T, Mx).

min-value(Grid, Value):-
	terminal(Grid, Value),
	humanUtility(Grid, Value).

min-value-list([], Min).

min-value-list([H|T], Min):-
	min-value(H, Value),
	Value < Min,
	NewMin is Value,
	min-value-list(T, NewMin).

min-value-list([H|T], Min):-
	min-value(H, Value),
	\+Value < Min,
	min-value-list(T, Min).
%freeSpace(Grid, Index):-
	

	
||||||| merged common ancestors
=======

freeSpace(L, H):-
	member(H, L),
	number(H).
freePiece(L, H):-
	member(H, L).
nextPos(Grid, Pieces, NewGrid, FreePiece):-
	freeSpace(Grid, FreeSpace),
	freePiece(Pieces, FreePiece),
	select(FreeSpace, Grid, FreePiece, NewGrid),!. 

	
%freeSpace(Grid, Index):-
	

	
>>>>>>> af34f0306da447a38b97461ded22647fb6544bb2
