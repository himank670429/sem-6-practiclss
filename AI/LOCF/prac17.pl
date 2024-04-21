delete_nth(1, [_|Tail], Tail).
delete_nth(N, [Head|Tail], [Head|Result]) :-
N > 1,
NextN is N-1,
delete_nth(NextN, Tail, Result).