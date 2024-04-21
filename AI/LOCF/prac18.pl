merge([], L, L).
merge(L, [], L).
merge([X|R1], [Y|R2], [X|MergeRest]) :-
    X =< Y,
    merge(R1, [Y|R2], MergeRest).

merge([X|R1], [Y|R2], [Y|MergeRest]) :-
    X > Y,
    merge([X|R1], R2, MergeRest).