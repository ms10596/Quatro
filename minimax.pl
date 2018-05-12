
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
	

	
